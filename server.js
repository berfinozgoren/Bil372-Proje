const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');

const app = express();
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'tugberk',
    database: 'otel'
});

db.connect(err => {
    if (err) {
        throw err;
    }
    console.log('MySQL Bağlantısı Başarılı');
});

// Müşteri listesi endpoint'i
app.get('/api/musteriler', (req, res) => {
    const query = 'SELECT * FROM musteriler';
    db.query(query, (err, results) => {
        if (err) {
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
            res.json({ success: false, error: err });
        } else {
            res.json(results);
        }
    });
});

// Oda durumu sorgulama endpoint'i
app.get('/api/odadurumu', (req, res) => {
    const odaNumarasi = req.query.odaNumarasi;
    const query = 'SELECT dolu FROM odalar WHERE oda_numarasi = ?';
    db.query(query, [odaNumarasi], (err, results) => {
        if (err) {
            res.json({ success: false, error: err });
        } else if (results.length > 0) {
            const durum = results[0].dolu ? 'Dolu' : 'Boş';
            res.json({ success: true, durum: durum });
        } else {
            res.json({ success: false, error: 'Oda bulunamadı' });
        }
    });
});

// Rezervasyon listesi endpoint'i
app.get('/api/rezervasyonlar', (req, res) => {
    const query = 'SELECT r.*, m.ad AS musteri_ad, m.soyad AS musteri_soyad FROM rezervasyonlar r JOIN musteriler m ON r.musteri_id = m.id';
    db.query(query, (err, results) => {
        if (err) {
            res.json({ success: false, error: err });
        } else {
            res.json(results);
        }
    });
});

// Sunucuyu dinleme
app.listen(3000, () => {
    console.log('Sunucu 3000 portunda çalışıyor');
});
