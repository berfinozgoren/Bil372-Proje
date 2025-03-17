document.addEventListener('DOMContentLoaded', () => {
    // Müşteri ekleme formunu işleme
    const musteriForm = document.getElementById('musteriForm');
    if (musteriForm) {
        musteriForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const musteriData = {
                ad: document.getElementById('ad').value,
                soyad: document.getElementById('soyad').value,
                eposta: document.getElementById('eposta').value,
                telefon: document.getElementById('telefon').value,
                adres: document.getElementById('adres').value,
                sehir: document.getElementById('sehir').value,
                ulke: document.getElementById('ulke').value
            };

            fetch('/api/musteri-ekle', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(musteriData)
            })
            .then(response => response.json())
            .then(data => {
                alert(data.message || 'Müşteri eklenirken hata oluştu: ' + data.error);
                if (data.message) loadMusteriler();
            })
            .catch(error => console.error('Müşteri ekleme hatası:', error));
        });
    }

    // Rezervasyon ekleme formunu işleme
    const rezervasyonForm = document.getElementById('rezervasyonForm');
    if (rezervasyonForm) {
        rezervasyonForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const rezervasyonData = {
                musteri_id: document.getElementById('musteriId').value,
                oda_id: document.getElementById('odaId').value,
                giris_tarihi: document.getElementById('girisTarihi').value,
                cikis_tarihi: document.getElementById('cikisTarihi').value,
                toplam_ucret: document.getElementById('toplamUcret').value
            };

            fetch('/api/rezervasyon-ekle', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(rezervasyonData)
            })
            .then(response => response.json())
            .then(data => {
                alert(data.message || 'Rezervasyon eklenirken hata oluştu: ' + data.error);
                if (data.success) loadRezervasyonlar();
            })
            .catch(error => console.error('Rezervasyon ekleme hatası:', error));
        });
    }

    // Müşterileri yükle ve listele
    function loadMusteriler() {
        fetch('/api/musteriler')
            .then(response => response.json())
            .then(data => {
                const musteriList = document.getElementById('musteriList');
                if (musteriList) {
                    musteriList.innerHTML = '';
                    data.forEach(musteri => {
                        const listItem = document.createElement('li');
                        listItem.textContent = `${musteri.ad} ${musteri.soyad}`;
                        musteriList.appendChild(listItem);
                    });
                }
            })
            .catch(error => console.error('Müşteriler yüklenirken hata:', error));
    }

    // Rezervasyonları yükle ve listele
    function loadRezervasyonlar() {
        fetch('/api/rezervasyonlar')
            .then(response => response.json())
            .then(data => {
                const rezervasyonList = document.getElementById('rezervasyonList');
                if (rezervasyonList) {
                    rezervasyonList.innerHTML = '';
                    data.forEach(rezervasyon => {
                        const listItem = document.createElement('li');
                        listItem.textContent = `Müşteri ID: ${rezervasyon.musteri_id}, Oda ID: ${rezervasyon.oda_id}, Giriş: ${rezervasyon.giris_tarihi}, Çıkış: ${rezervasyon.cikis_tarihi}, Toplam Ücret: ${rezervasyon.toplam_ucret}`;
                        rezervasyonList.appendChild(listItem);
                    });
                }
            })
            .catch(error => console.error('Rezervasyonlar yüklenirken hata:', error));
    }

    // Sayfa yüklendiğinde verileri yükle
    loadMusteriler();
    loadRezervasyonlar();
});
