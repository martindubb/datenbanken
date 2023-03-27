CREATE TABLE Schule.Lehrer(
  Personal_Nr INT NOT NULL PRIMARY KEY,
  Name VARCHAR(30) NOT NULL,
  Vorname VARCHAR(30) NOT NULL
);

CREATE TABLE Schule.Zeugnis(
  Zeugnis_ID INT NOT NULL PRIMARY KEY,
  Ausgabedatum DATE NOT NULL
);

CREATE TABLE Schule.Klasse(
  Klassenbezeichnung VARCHAR(3) NOT NULL PRIMARY KEY,
  Raum INT NOT NULL
);

CREATE TABLE Schule.Schüler(
  Schüler_Nr INT NOT NULL PRIMARY KEY,
  Name VARCHAR(30) NOT NULL,
  Vorname VARCHAR(30) NOT NULL,
  Zeugnis_ID INT,
  Klassenbezeichnung VARCHAR(3) NOT NULL,
  FOREIGN KEY (Zeugnis_ID) REFERENCES Zeugnis(Zeugnis_ID),
  FOREIGN KEY (Klassenbezeichnung) REFERENCES Klasse(Klassenbezeichnung)
);

CREATE TABLE Schule.Unterrichtet(
  Schüler_Nr INT NOT NULL,
  Personal_Nr INT NOT NULL,
  FOREIGN KEY (Schüler_Nr) REFERENCES Schüler(Schüler_Nr),
  FOREIGN KEY (Personal_Nr) REFERENCES Lehrer(Personal_Nr)
);

CREATE TABLE Schule.Fachgebiet(
  Fachgebiet_Nr INT NOT NULL PRIMARY KEY,
  Name VARCHAR(20) NOT NULL
);

CREATE TABLE Schule.Spezialisierung(
  Fachgebiet_Nr INT NOT NULL,
  Personal_Nr INT NOT NULL,
  FOREIGN KEY (Fachgebiet_Nr) REFERENCES Fachgebiet(Fachgebiet_Nr),
  FOREIGN KEY (Personal_Nr) REFERENCES Lehrer(Personal_Nr)
);
