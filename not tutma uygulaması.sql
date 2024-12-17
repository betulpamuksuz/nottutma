CREATE TABLE kullanicilar (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    sifre VARCHAR(255) NOT NULL,
    kayit_tarihi DATETIME NOT NULL,
    aktif BIT NOT NULL DEFAULT 1
);

CREATE TABLE notlar (
    id INT IDENTITY(1,1) PRIMARY KEY,
    kullanici_id INT NOT NULL,
    baslik VARCHAR(100) NOT NULL,
    icerik TEXT NOT NULL,
    olusturma_tarihi DATETIME NOT NULL,
    guncelleme_tarihi DATETIME NULL,
    aktif BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id)
);

CREATE TABLE etiketler (
    id INT IDENTITY(1,1) PRIMARY KEY,
    not_id INT NOT NULL,
    etiket_adi VARCHAR(50) NOT NULL,
    aktif BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (not_id) REFERENCES notlar(id)
);

CREATE TABLE yorumlar (
    id INT IDENTITY(1,1) PRIMARY KEY,
    not_id INT NOT NULL,
    kullanici_id INT NOT NULL,
    yorum TEXT NOT NULL,
    tarih DATETIME NOT NULL,
    aktif BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (not_id) REFERENCES notlar(id),
    FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id)
);

CREATE TABLE favoriler (
    id INT IDENTITY(1,1) PRIMARY KEY,
    kullanici_id INT NOT NULL,
    not_id INT NOT NULL,
    eklenme_tarihi DATETIME NOT NULL,
    FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id),
    FOREIGN KEY (not_id) REFERENCES notlar(id)
);

ALTER TABLE notlar
ADD CONSTRAINT FK_kullanici_notlar FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id);

ALTER TABLE etiketler
ADD CONSTRAINT FK_not_etiketler FOREIGN KEY (not_id) REFERENCES notlar(id);

ALTER TABLE yorumlar
ADD CONSTRAINT FK_kullanici_yorumlar FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id);

ALTER TABLE yorumlar
ADD CONSTRAINT FK_not_yorumlar FOREIGN KEY (not_id) REFERENCES notlar(id);

ALTER TABLE favoriler
ADD CONSTRAINT FK_kullanici_favoriler FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id);

ALTER TABLE favoriler
ADD CONSTRAINT FK_not_favoriler FOREIGN KEY (not_id) REFERENCES notlar(id);
