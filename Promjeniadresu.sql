-- Define the procedure to update the address
CREATE PROCEDURE UpdateAddressByName
    @Ime NVARCHAR(100),
    @Prezime NVARCHAR(100),
    @NovaAdresa NVARCHAR(255)
AS
BEGIN
    UPDATE Klijent
    SET Adresa = @NovaAdresa
    WHERE Ime = @Ime AND Prezime = @Prezime;
END
GO

-- Call the procedure to update the address
EXEC UpdateAddressByName 'Ana', 'Anic', 'Bjelave';
