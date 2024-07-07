document.addEventListener('DOMContentLoaded', () => {
    const musteriForm = document.getElementById('musteriForm');
    const musteriListesi = document.getElementById('musteriListesi');
    const hizmetListesi = document.getElementById('hizmetListesi');
    const odaForm = document.getElementById('odaForm');
    const odaDurumu = document.getElementById('odaDurumu');
    const rezervasyonListesi = document.getElementById('rezervasyonListesi');

    // Müşteri ekleme formu submit işlemi
    musteriForm.addEventListener('submit', (event) => {
        event.preventDefault(); // Sayfa yenilemesini engelle

        // Formdaki verileri al
        const ad = document.getElementById('ad').value;
        const soyad = document.getElementById('soyad').value;
        const eposta = document.getElementById('eposta').value;
        const telefon = document.getElementById('telefon').value;
        const adres = document.getElementById('adres').value;
        const sehir = document.getElementById('sehir').value;
        const ulke = document.getElementById('ulke').value;

        // POST isteği oluştur
        fetch('/api/musteriler', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                ad,
                soyad,
                eposta,
                telefon,
                adres,
                sehir,
                ulke
            }),
        })
            .then(response => response.json())
            .then(result => {
                if (result.success) {
                    // Başarıyla eklendiğinde listeleye ekle
                    const yeniMusteri = document.createElement('li');
                    yeniMusteri.textContent = `${ad} ${soyad}`;
                    musteriListesi.appendChild(yeniMusteri);

                    // Formu sıfırla
                    musteriForm.reset();
                } else {
                    alert('Müşteri eklenirken hata oluştu.');
                }
            })
            .catch(error => {
                console.error('Müşteri ekleme hatası:', error);
                alert('Müşteri eklenirken bir hata oluştu. Lütfen tekrar deneyin.');
            });
    });

    // Hizmetleri getir ve listele
    fetch('/api/hizmetler')
        .then(response => response.json())
        .then(hizmetler => {
            hizmetListesi.innerHTML = ''; // Önce içeriği temizle
            hizmetler.forEach(hizmet => {
                const li = document.createElement('li');
                li.textContent = `${hizmet.hizmet_adi} - ${hizmet.aciklama} - ${hizmet.fiyat}`;
                hizmetListesi.appendChild(li);
            });
        })
        .catch(error => console.error('Hizmet listesi getirme hatası:', error));

    // Müşterileri getir ve listele
    fetch('/api/musteriler')
        .then(response => response.json())
        .then(musteriler => {
            musteriListesi.innerHTML = ''; // Önce içeriği temizle
            musteriler.forEach(musteri => {
                const li = document.createElement('li');
                li.textContent = `${musteri.ad} ${musteri.soyad}`;
                musteriListesi.appendChild(li);
            });
        })
        .catch(error => console.error('Müşteri listesi getirme hatası:', error));

    // Oda doluluk sorgulama formu submit işlemi
    odaForm.addEventListener('submit', (event) => {
        event.preventDefault(); // Sayfa yenilemesini engelle

        const odaNumarasi = document.getElementById('odaNumarasi').value;

        // GET isteği oluştur
        fetch(`/api/odadurumu?odaNumarasi=${odaNumarasi}`)
            .then(response => response.json())
            .then(result => {
                if (result.success) {
                    odaDurumu.textContent = `Oda Durumu: ${result.durum}`;
                } else {
                    odaDurumu.textContent = 'Oda durumu sorgularken hata oluştu.';
                }
            })
            .catch(error => {
                console.error('Oda durumu sorgulama hatası:', error);
                odaDurumu.textContent = 'Oda durumu sorgularken bir hata oluştu. Lütfen tekrar deneyin.';
            });
    });

    // Rezervasyonları getir ve listele
    fetch('/api/rezervasyonlar')
        .then(response => response.json())
        .then(rezervasyonlar => {
            rezervasyonListesi.innerHTML = ''; // Önce içeriği temizle
            rezervasyonlar.forEach(rezervasyon => {
                const li = document.createElement('li');
                li.textContent = `Oda No: ${rezervasyon.oda_numarasi}, Müşteri: ${rezervasyon.musteri_ad} ${rezervasyon.musteri_soyad}, Giriş Tarihi: ${rezervasyon.giris_tarihi}, Çıkış Tarihi: ${rezervasyon.cikis_tarihi}`;
                rezervasyonListesi.appendChild(li);
            });
        })
        .catch(error => console.error('Rezervasyon listesi getirme hatası:', error));
});
