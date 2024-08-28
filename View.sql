SELECT 
    n.IDNarudzbe,
    n.DatumNarudzbe,
    n.VrijemeNarudzbe,
    k.Ime,
    k.Prezime,
    k.Adresa,
    k.KontaktBroj,
    j.Naziv AS JeloNaziv,
    j.Opis AS JeloOpis,
    j.Cijena AS JeloCijena,
    kj.Opis AS KategorijaOpis,
    sn.Kolicina,
    sn.Cijena AS StavkaCijena
FROM 
    Narudzba n
INNER JOIN 
    Klijent k ON n.IDKlijenta = k.IDKlijenta
INNER JOIN 
    StavkaNarudzbe sn ON n.IDNarudzbe = sn.IDNarudzbe
INNER JOIN 
    Jelo j ON sn.IDJela = j.IDJela
INNER JOIN 
    KategorijaJela kj ON j.IDKategorije = kj.IDKategorije;
