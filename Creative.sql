-- Check and create KategorijaJela table if not exists
CREATE TABLE IF NOT EXISTS KategorijaJela (
    IDKategorije INT PRIMARY KEY,
    Opis VARCHAR(100) NOT NULL
);

-- Check and create Jelo table if not exists
CREATE TABLE IF NOT EXISTS Jelo (
    IDJela INT PRIMARY KEY,
    Naziv VARCHAR(100) NOT NULL,
    Opis VARCHAR(255),
    Cijena DECIMAL(10, 2) NOT NULL,
    IDKategorije INT,
    FOREIGN KEY (IDKategorije) REFERENCES KategorijaJela(IDKategorije) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Check and create Klijent table if not exists
CREATE TABLE IF NOT EXISTS Klijent (
    IDKlijenta INT PRIMARY KEY,
    Ime VARCHAR(100) NOT NULL,
    Prezime VARCHAR(100) NOT NULL,
    Adresa VARCHAR(255) NOT NULL,
    KontaktBroj VARCHAR(50) NOT NULL
);

-- Check and create Narudzba table if not exists
CREATE TABLE IF NOT EXISTS Narudzba (
    IDNarudzbe INT PRIMARY KEY,
    DatumNarudzbe DATE NOT NULL,
    VrijemeNarudzbe TIME NOT NULL,
    IDKlijenta INT,
    FOREIGN KEY (IDKlijenta) REFERENCES Klijent(IDKlijenta) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Check and create StavkaNarudzbe table if not exists
CREATE TABLE IF NOT EXISTS StavkaNarudzbe (
    IDNarudzbe INT,
    IDJela INT,
    Kolicina INT NOT NULL,
    Cijena DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IDNarudzbe) REFERENCES Narudzba(IDNarudzbe) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IDJela) REFERENCES Jelo(IDJela) ON DELETE CASCADE ON UPDATE CASCADE
);
