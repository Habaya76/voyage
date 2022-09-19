CREATE TABLE Compagnie(
   id_compagnie INT,
   nom_compagnie VARCHAR(255),
   PRIMARY KEY(id_compagnie)
);

CREATE TABLE Client(
   id_client INT,
   nom VARCHAR(255),
   prenom VARCHAR(255),
   date_naissance DATE,
   email VARCHAR(255),
   PRIMARY KEY(id_client)
);

CREATE TABLE Ville(
   id_Ville INT,
   nom_ville VARCHAR(50),
   PRIMARY KEY(id_Ville)
);

CREATE TABLE Reservation(
   id_Reservation INT,
   date_reservation DATETIME,
   num_passport VARCHAR(255),
   email VARCHAR(255),
   nom VARCHAR(255),
   prenom VARCHAR(255),
   tel VARCHAR(255),
   id_client INT NOT NULL,
   PRIMARY KEY(id_Reservation),
   FOREIGN KEY(id_client) REFERENCES Client(id_client)
);

CREATE TABLE Aeroport(
   id_Aeroport INT,
   nom_aeroport VARCHAR(255),
   id_Ville INT NOT NULL,
   PRIMARY KEY(id_Aeroport),
   FOREIGN KEY(id_Ville) REFERENCES Ville(id_Ville)
);

CREATE TABLE Passager(
   id_passager INT,
   nom VARCHAR(255),
   email VARCHAR(255),
   prenom VARCHAR(255),
   date_naissance VARCHAR(255),
   id_Reservation INT NOT NULL,
   PRIMARY KEY(id_passager),
   FOREIGN KEY(id_Reservation) REFERENCES Reservation(id_Reservation)
);

CREATE TABLE Vol(
   id_Vol INT,
   num_vol VARCHAR(255),
   jour_Depart DATETIME,
   jour_Arrivee DATETIME,
   id_Reservation INT NOT NULL,
   id_Aeroport INT NOT NULL,
   id_Aeroport_1 INT NOT NULL,
   id_compagnie INT,
   PRIMARY KEY(id_Vol),
   FOREIGN KEY(id_Reservation) REFERENCES Reservation(id_Reservation),
   FOREIGN KEY(id_Aeroport) REFERENCES Aeroport(id_Aeroport),
   FOREIGN KEY(id_Aeroport_1) REFERENCES Aeroport(id_Aeroport),
   FOREIGN KEY(id_compagnie) REFERENCES Compagnie(id_compagnie)
);

CREATE TABLE Escale(
   id_Vol INT,
   id_Aeroport INT,
   jour_depart DATE,
   heure_Depart TIME,
   jour_Arrivee DATE,
   heure_Arrivee TIME,
   PRIMARY KEY(id_Vol, id_Aeroport),
   FOREIGN KEY(id_Vol) REFERENCES Vol(id_Vol),
   FOREIGN KEY(id_Aeroport) REFERENCES Aeroport(id_Aeroport)
);
