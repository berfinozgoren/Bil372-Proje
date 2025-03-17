const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');

const app = express();
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

const adminCredentials = {
    username: 'admin',
    password: 'admin123'
};

// Admin login endpoint
app.post('/api/admin-login', (req, res) => {
    const { username, password } = req.body;
    if (username === adminCredentials.username && password === adminCredentials.password) {
        res.json({ success: true });
    } else {
        res.json({ success: false, message: 'Geçersiz kullanıcı adı veya şifre' });
    }
});

// MySQL bağlantısı
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'tugberk',
    database: 'otel'
});

// MySQL bağlantısını kontrol etme
db.connect(err => {
    if (err) {
        console.error('MySQL bağlantı hatası:', err);
        return;
    }
    console.log('MySQL bağlantısı başarılı');
});

// Müşteri listesi endpoint'i
app.get('/api/musteriler', (req, res) => {
    const query = 'SELECT * FROM musteriler';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Müşteri listeleme hatası:', err);
            res.json({ success: false, error: err });
        } else {
            res.json(results);
        }
    });
});

// Hizmetleri getiren endpoint
app.get('/api/hizmetler', (req, res) => {
    const query = 'SELECT * FROM hizmetler';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Hizmet listeleme hatası:', err);
            res.json({ success: false, error: err });
        } else {
            res.json(results);
        }
    });
});

// Müşteri ekleme endpoint'i
app.post('/api/musteri-ekle', (req, res) => {
    const { ad, soyad, eposta, telefon, adres, sehir, ulke } = req.body;

    db.query('SELECT MAX(musteri_id) AS max_id FROM musteriler', (err, results) => {
        if (err) {
            console.error('Maksimum ID sorgulama hatası:', err);
            return res.status(500).json({ error: 'Müşteri eklenirken hata oluştu' });
        }

        const newId = (results[0].max_id || 0) + 1;

        const sql = 'INSERT INTO musteriler (musteri_id, ad, soyad, eposta, telefon, adres, sehir, ulke) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
        db.query(sql, [newId, ad, soyad, eposta, telefon, adres, sehir, ulke], (err, result) => {
            if (err) {
                console.error('Müşteri ekleme hatası:', err);
                return res.status(500).json({ error: 'Müşteri eklenirken hata oluştu' });
            }
            res.status(200).json({ message: 'Müşteri başarıyla eklendi' });
        });
    });
});

// Oda sorgulama endpoint'i
app.get('/api/oda-sorgula', (req, res) => {
    const { odaNo } = req.query;
    const query = 'SELECT * FROM odalar WHERE oda_numarasi = ?';
    db.query(query, [odaNo], (err, results) => {
        if (err) {
            console.error('Oda sorgulama hatası:', err);
            res.json({ success: false, error: err });
        } else {
            if (results.length > 0) {
                const odaDurumu = results[0].durum === 'dolu' ? 'Oda dolu' : 'Oda boş';
                res.json({ success: true, message: odaDurumu });
            } else {
                res.json({ success: true, message: 'Oda bulunamadı' });
            }
        }
    });
});


app.get('/api/fetch-rooms', (req, res) => {
    const query = 'SELECT oda_numarasi, oda_tipi, durum, gecelik_ucret FROM odalar';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Oda listesi getirme hatası:', err);
            res.json({ success: false, error: err });
        } else {
            res.json({ success: true, rooms: results });
        }
    });
});


// Rezervasyon listesi endpoint'i
app.get('/api/rezervasyonlar', (req, res) => {
    const query = 'SELECT * FROM rezervasyonlar';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Rezervasyonları çekme hatası:', err);
            return res.status(500).json({ error: 'Rezervasyonları çekme hatası' });
        }
        res.json(results);
    });
});

app.post('/api/rezervasyon-ekle', (req, res) => {
    const { musteri_id, oda_id, giris_tarihi, cikis_tarihi, toplam_ucret } = req.body;

    // Eksik bilgi kontrolü
    if (!musteri_id || !oda_id || !giris_tarihi || !cikis_tarihi || !toplam_ucret) {
        return res.status(400).json({ success: false, message: 'Eksik bilgi gönderildi.' });
    }

    // Yeni rezervasyon ID'sini belirleme
    db.query('SELECT MAX(rezervasyon_id) AS max_id FROM rezervasyonlar', (err, results) => {
        if (err) {
            console.error('Maksimum ID sorgulama hatası:', err);
            return res.status(500).json({ success: false, message: 'Rezervasyon ekleme hatası.' });
        }

        const newId = (results[0].max_id || 0) + 1; // ID'yi bir artırarak belirle

        // Rezervasyon ekleme SQL sorgusu
        const query = `
            INSERT INTO rezervasyonlar (rezervasyon_id, musteri_id, oda_id, giris_tarihi, cikis_tarihi, toplam_ucret)
            VALUES (?, ?, ?, ?, ?, ?)
        `;

        db.query(query, [newId, musteri_id, oda_id, giris_tarihi, cikis_tarihi, toplam_ucret], (err, results) => {
            if (err) {
                console.error('Rezervasyon ekleme hatası:', err);
                return res.status(500).json({ success: false, message: 'Rezervasyon ekleme hatası.' });
            }
            res.status(201).json({ success: true, message: 'Rezervasyon başarıyla eklendi.' });
        });
    });
});


app.post('/api/update-room-status', (req, res) => {
    const { oda_numarasi, durum } = req.body;
    // Oda durumunu güncelle
    const sql = 'UPDATE odalar SET durum = ? WHERE oda_numarasi = ?';
    db.query(sql, [durum, oda_numarasi], (err, result) => {
        if (err) {
            console.error('Oda durumu güncelleme hatası:', err);
            return res.status(500).json({ error: 'Oda durumu güncellenirken hata oluştu' });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Oda bulunamadı' });
        }

        res.status(200).json({ success: true, message: 'Oda durumu başarıyla güncellendi' });
    });
});





// Sunucuyu başlat
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Sunucu http://localhost:${PORT} adresinde çalışıyor`);
});
