SELECT * FROM Jelo;

-- A�uriranje cijene jela
UPDATE Jelo 
SET Cijena = 11.00
WHERE IDJela = 2;

-- Brisanje jela
DELETE FROM Jelo 
WHERE IDJela = 1;