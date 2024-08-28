SELECT DISTINCT
    Narudzba.IDNarudzbe,
    Klijent.Ime,
    Klijent.Prezime,
    Jelo.Naziv AS NazivJela,
    StavkaNarudzbe.Kolicina,
    StavkaNarudzbe.Cijena AS CijenaStavke
FROM Narudzba
JOIN Klijent ON Narudzba.IDKlijenta = Klijent.IDKlijenta
JOIN StavkaNarudzbe ON Narudzba.IDNarudzbe = StavkaNarudzbe.IDNarudzbe
JOIN Jelo ON StavkaNarudzbe.IDJela = Jelo.IDJela
ORDER BY Narudzba.IDNarudzbe;
