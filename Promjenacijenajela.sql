CREATE PROCEDURE PromjenaCijeneJela
    @kategorija VARCHAR(100),
    @novaCijena DECIMAL(10, 2)
AS
BEGIN
    UPDATE Jelo
    SET Cijena = @novaCijena
    FROM Jelo
    INNER JOIN KategorijaJela ON Jelo.IDKategorije = KategorijaJela.IDKategorije
    WHERE KategorijaJela.Opis = @kategorija;
END;
GO

-- Izvršavanje procedure za promjenu cijena jela u kategoriji 'Predjelo'
EXEC PromjenaCijeneJela @kategorija = 'Desert', @novaCijena = 6.50;
