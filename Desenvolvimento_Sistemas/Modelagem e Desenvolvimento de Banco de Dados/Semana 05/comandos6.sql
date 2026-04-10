-- database: ./db6.sqlite

CREATE TABLE Hospedes (
    HospedeID INT PRIMARY KEY,
    NomeHospede TEXT
);

CREATE TABLE Quartos (
    QuartoID INT PRIMARY KEY,
    Tipo_Quarto TEXT,
    Preco_Diaria DECIMAL(10,2) CHECK(Preco_Diaria >= 0)
);

CREATE TABLE Reservas (
    ReservaID INT PRIMARY KEY,
    Data DATE,
    HospedeID INT,
    QuartoID INT,
    Data_Checkin TEXT,
    Data_Checkout TEXT,
    FOREIGN KEY(HospedeID) REFERENCES Hospedes (HospedeID),
    FOREIGN KEY(QuartoID) REFERENCES Quartos (QuartoID)
)



 





