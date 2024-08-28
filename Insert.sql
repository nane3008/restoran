-- Insert data into KategorijaJela table
INSERT INTO KategorijaJela (IDKategorije, Opis) VALUES (1, 'Predjelo');
INSERT INTO KategorijaJela (IDKategorije, Opis) VALUES (2, 'Glavno jelo');
INSERT INTO KategorijaJela (IDKategorije, Opis) VALUES (3, 'Desert');

-- Insert data into Jelo table
INSERT INTO Jelo (IDJela, Naziv, Opis, Cijena, IDKategorije) VALUES (1, 'Juha', 'Juha od povrća', 5.00, 1);
INSERT INTO Jelo (IDJela, Naziv, Opis, Cijena, IDKategorije) VALUES (2, 'Salata', 'Miješana salata', 4.00, 1);
INSERT INTO Jelo (IDJela, Naziv, Opis, Cijena, IDKategorije) VALUES (3, 'Bruschetta', 'Bruschetta s rajčicama', 6.00, 1);

INSERT INTO Jelo (IDJela, Naziv, Opis, Cijena, IDKategorije) VALUES (4, 'Piletina', 'Piletina s roštilja', 10.00, 2);
INSERT INTO Jelo (IDJela, Naziv, Opis, Cijena, IDKategorije) VALUES (5, 'Ćevapi', 'Ćevapi sa somunom', 8.00, 2);
INSERT INTO Jelo (IDJela, Naziv, Opis, Cijena, IDKategorije) VALUES (6, 'Musaka', 'Musaka sa krompirom', 9.00, 2);

INSERT INTO Jelo (IDJela, Naziv, Opis, Cijena, IDKategorije) VALUES (7, 'Torta', 'Čokoladna torta', 4.00, 3);
INSERT INTO Jelo (IDJela, Naziv, Opis, Cijena, IDKategorije) VALUES (8, 'Baklava', 'Baklava s orasima', 5.00, 3);
INSERT INTO Jelo (IDJela, Naziv, Opis, Cijena, IDKategorije) VALUES (9, 'Kolač', 'Voćni kolač', 3.50, 3);

-- Insert data into Klijent table
INSERT INTO Klijent (IDKlijenta, Ime, Prezime, Adresa, KontaktBroj) VALUES (1, 'Ivan', 'Ivić', 'Bajazita Kešetovića 109', '123-456');
INSERT INTO Klijent (IDKlijenta, Ime, Prezime, Adresa, KontaktBroj) VALUES (2, 'Ana', 'Anić', 'Bjelave', '789-012');
INSERT INTO Klijent (IDKlijenta, Ime, Prezime, Adresa, KontaktBroj) VALUES (3, 'Emir', 'Emić', 'Ferhadija 10', '555-1234');
INSERT INTO Klijent (IDKlijenta, Ime, Prezime, Adresa, KontaktBroj) VALUES (4, 'Lejla', 'Karić', 'Titova 15', '555-5678');
INSERT INTO Klijent (IDKlijenta, Ime, Prezime, Adresa, KontaktBroj) VALUES (5, 'Selma', 'Delić', 'Maršala Tita 21', '555-8765');
INSERT INTO Klijent (IDKlijenta, Ime, Prezime, Adresa, KontaktBroj) VALUES (6, 'Amar', 'Hadžić', 'Baščaršija 5', '555-4321');

-- Insert data into Narudzba table
INSERT INTO Narudzba (IDNarudzbe, DatumNarudzbe, VrijemeNarudzbe, IDKlijenta) VALUES (1, '2024-06-28', '12:00:00', 1);
INSERT INTO Narudzba (IDNarudzbe, DatumNarudzbe, VrijemeNarudzbe, IDKlijenta) VALUES (2, '2024-06-29', '13:00:00', 2);
INSERT INTO Narudzba (IDNarudzbe, DatumNarudzbe, VrijemeNarudzbe, IDKlijenta) VALUES (3, '2024-06-30', '14:00:00', 3);
INSERT INTO Narudzba (IDNarudzbe, DatumNarudzbe, VrijemeNarudzbe, IDKlijenta) VALUES (4, '2024-07-01', '15:00:00', 4);
INSERT INTO Narudzba (IDNarudzbe, DatumNarudzbe, VrijemeNarudzbe, IDKlijenta) VALUES (5, '2024-07-02', '16:00:00', 5);
INSERT INTO Narudzba (IDNarudzbe, DatumNarudzbe, VrijemeNarudzbe, IDKlijenta) VALUES (6, '2024-07-03', '17:00:00', 6);

-- Insert data into StavkaNarudzbe table
INSERT INTO StavkaNarudzbe (IDNarudzbe, IDJela, Kolicina, Cijena) VALUES (1, 1, 1, 10.00);
INSERT INTO StavkaNarudzbe (IDNarudzbe, IDJela, Kolicina, Cijena) VALUES (2, 3, 2, 12.00);
INSERT INTO StavkaNarudzbe (IDNarudzbe, IDJela, Kolicina, Cijena) VALUES (3, 4, 3, 8.00);
INSERT INTO StavkaNarudzbe (IDNarudzbe, IDJela, Kolicina, Cijena) VALUES (4, 5, 4, 14.00);
INSERT INTO StavkaNarudzbe (IDNarudzbe, IDJela, Kolicina, Cijena) VALUES (5, 6, 3, 20.00);
INSERT INTO StavkaNarudzbe (IDNarudzbe, IDJela, Kolicina, Cijena) VALUES (6, 7, 1, 20.00);
