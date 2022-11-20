DROP TABLE Captain;
DROP TABLE Licenses;
DROP TABLE Crew;
DROP TABLE Person;
DROP TABLE Tide1;
DROP TABLE TideDepth;
DROP TABLE Catch1;
DROP TABLE Conservation1;
DROP TABLE FishingHours;
DROP TABLE TidalChanges;
DROP TABLE ProtectedSpecies;
DROP TABLE FishSpecies;
DROP TABLE Boats;

CREATE TABLE Boats
       (BoatName varchar(15) PRIMARY KEY,
        CompanyName varchar(20) NOT NULL,
        WOF DATE NOT NULL,
        BoatSize int NOT NULL,
        BoatDepth int NOT NULL
);

INSERT INTO Boats VALUES('THE BLACK PEARL', 'Far North Fisheries', TO_DATE('12-04-2023', 'dd-m\
m-yyyy'), 10 , 12);
INSERT INTO Boats VALUES('THE NAUGHTILLUS', 'Far North Fisheries', TO_DATE('12-04-2023', 'dd-m\
m-yyyy'), 20, 14);

CREATE TABLE Person
       (FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
        DOB DATE NOT NULL,
        Hire_Date DATE,
        PID varchar(10) PRIMARY KEY
);

INSERT INTO Person VALUES('Jack', 'Gold', TO_DATE('21-05-2001', 'dd-mm-yyyy'), TO_DATE('25-12-\
2005', 'dd-mm-yyyy'), '12344');
INSERT INTO Person VALUES('Jacques', 'Custeau', TO_DATE('21-05-1954', 'dd-mm-yyyy'), TO_DATE('\
12-03-1998' , 'dd-mm-yyyy'), 'FHJEF34');
INSERT INTO Person VALUES('Richie', 'McCaw', TO_DATE('15-02-1967', 'dd-mm-yyyy'), TO_DATE('24-\
07-1954','dd-mm-yyyy'), 'AOEKDMI');
INSERT INTO Person VALUES('Rango', 'Gold', TO_DATE('21-05-2001', 'dd-mm-yyyy'), TO_DATE('25-12\
-2005', 'dd-mm-yyyy'), 'YBHUE21');
INSERT INTO Person VALUES('John', 'Smith', TO_DATE('21-05-1990', 'dd-mm-yyyy'), TO_DATE('20-11\
-1999', 'dd-mm-yyyy'), 'FUBNDF4');
INSERT INTO Person VALUES('Pikachu', 'Random', TO_DATE('10-09-1999', 'dd-mm-yyyy'), TO_DATE('0\
1-02-2004', 'dd-mm-yyyy'), 'AMSD5MI');

CREATE TABLE Crew
       (Crew_Qualification char(1) DEFAULT 'F',
        CrewID varchar(8) PRIMARY KEY,
        CPID varchar(10),
        HoursWorked int,
        CONSTRAINT fk_WorksOn
                   FOREIGN KEY(CPID)
                   REFERENCES Person(PID)
);

INSERT INTO Crew(Crew_Qualification, CrewID, CPID, HoursWorked) VALUES('T', '34TG42G@', '12344\
', 500);
INSERT INTO Crew(Crew_Qualification, CrewID, CPID, HoursWorked) VALUES('T', '6#RD##ED', 'FHJEF\
34', 1289);
INSERT INTO Crew(Crew_Qualification, CrewID, CPID, HoursWorked) VALUES('F', 'HSHFEWAD', 'AOEKD\
MI', 3000);
INSERT INTO Crew(Crew_Qualification, CrewID, CPID, HoursWorked) VALUES('T', '3432GRS@', 'YBHUE\
21', 750);
INSERT INTO Crew(Crew_Qualification, CrewID, CPID, HoursWorked) VALUES('T', 'JNIEUF!@', 'FUBND\
F4', 1349);
INSERT INTO Crew(Crew_Qualification, CrewID, CPID, HoursWorked) VALUES('F', '@2GHFAA1', 'AMSD5\
MI', 2040);

CREATE TABLE Licenses
       (LicenseHolder varchar(20) NOT NULL,
       LicensesType varchar(1) NOT NULL,
       SerialNumber varchar(10) NOT NULL UNIQUE,
       ExpiryDate DATE  NOT NULL,
       IssueDate DATE NOT NULL,
       BoatName varchar(15),
       PRIMARY KEY(LicensesType, IssueDate),
       CONSTRAINT fk_manages
                  FOREIGN KEY(BoatName)
                  REFERENCES Boats(BoatName)
);

INSERT INTO Licenses VALUES('Jack Sparrow', 'A', 'QWERT123', TO_DATE('12-04-2023', 'dd-mm-yyyy'), TO_DATE('12-04-2022', 'dd-mm-yyyy'), 'THE BLACK PEARL');
INSERT INTO Licenses VALUES('Nemo Finding', 'A', '792A@WR', TO_DATE('12-04-2023', 'dd-mm-yyyy'), TO_DATE('12-04-2023', 'dd-mm-yyyy'), 'THE NAUGHTILLUS');
INSERT INTO Licenses VALUES('Jack Gold', 'C', 'DFHBE123', TO_DATE('12-04-2023', 'dd-mm-yyyy'), TO_DATE('12-04-2023', 'dd-mm-yyyy'), 'THE BLACK PEARL');

CREATE TABLE Captain
       (DOB varchar(10) NOT NULL,
        CapID varchar(8) PRIMARY KEY,
        FirstName varchar(10) NOT NULL,
        LastName varchar(10) NOT NULL,
        SerialNumber varchar(10),
        CONSTRAINT fk_licenses
                   FOREIGN KEY(SerialNumber)
                   REFERENCES Licenses(SerialNumber)
);

INSERT INTO Captain(DOB, CAPID, FirstName, LastName) VALUES(TO_DATE('12-05-1942', 'dd-mm-yyyy'),'792A@WR', 'Nemo', 'Finding');
INSERT INTO Captain(DOB, CAPID, FirstName, LastName) VALUES(TO_DATE('12-05-1968', 'dd-mm-yyyy'),'QWERT123', 'Jack', 'Sparrow');

CREATE TABLE FishingHours
       (FStartTime DATE,
        FEndTime DATE,
        Czone int PRIMARY KEY
);

INSERT INTO FishingHours VALUES(TO_DATE('08:00:00','HH24:MI:SS'),TO_DATE('15:00:00','HH24:MI:SS'), 1);
INSERT INTO FishingHours VALUES(TO_DATE('19:15:00','HH24:MI:SS'),TO_DATE('03:20:00','HH24:MI:SS'), 3);
INSERT INTO FishingHours VALUES(TO_DATE('12:10:43','HH24:MI:SS'),TO_DATE('19:19:00','HH24:MI:SS'), 2);

CREATE TABLE TidalChanges
       (TStartTime DATE,
        TEndTime DATE,
        Czone int PRIMARY KEY
);

INSERT INTO TidalChanges VALUES(TO_DATE('09:36:10','HH24:MI:SS'),TO_DATE('19:36:10','HH24:MI:SS'), 1);
INSERT INTO TidalChanges VALUES(TO_DATE('14:19:50','HH24:MI:SS'),TO_DATE('03:19:19','HH24:MI:SS'), 2);
INSERT INTO TidalChanges VALUES(TO_DATE('22:00:00','HH24:MI:SS'),TO_DATE('12:00:','HH24:MI:SS'), 3);

CREATE TABLE ProtectedSpecies
       (Czone int,
        FishName varchar(25),
        FishID int PRIMARY KEY
);

INSERT INTO ProtectedSpecies VALUES(1,'Marlin',1);
INSERT INTO ProtectedSpecies VALUES(1,'Starfish',2);
INSERT INTO ProtectedSpecies VALUES(2,'Starfish',3);
INSERT INTO ProtectedSpecies VALUES(3,'Blue Cod',4);
INSERT INTO ProtectedSpecies VALUES(2,'Dolphin',5);

CREATE TABLE Conservation1
       (Czone int PRIMARY KEY,
        ContactNumber varchar(10),
        FishID int,
        CONSTRAINT creatingFishingHours
                   FOREIGN KEY(Czone)
                   REFERENCES FishingHours(Czone),
        CONSTRAINT creatingTidalChanges
                   FOREIGN KEY(Czone)
                   REFERENCES TidalChanges(Czone),
        CONSTRAINT creatingProtectedSpecies
                   FOREIGN KEY(FishID)
                   REFERENCES ProtectedSpecies(FishID)
);

INSERT INTO Conservation1 VALUES(1,'080090800',1);
INSERT INTO Conservation1 VALUES(2,'080090801',1);
INSERT INTO Conservation1 VALUES(3,'080090802',2);


CREATE TABLE FishSpecies
       (FishName varchar(25),
        BinNumber int PRIMARY KEY
);

INSERT INTO FishSpecies VALUES('Squid',1);
INSERT INTO FishSpecies VALUES('Starfish',2);
INSERT INTO FishSpecies VALUES('Squid',3);
INSERT INTO FishSpecies VALUES('Marlin',4);

CREATE TABLE Catch1
       (CatchID varchar(6) PRIMARY KEY,
        Fsize int,
        Czone int NOT NULL,
        BoatName varchar(15),
        Amount float DEFAULT NULL,
        BinNumber int DEFAULT NULL UNIQUE,
        CONSTRAINT fk_controls
                   FOREIGN KEY(Czone)
                   REFERENCES Conservation1(Czone),
        CONSTRAINT fk_fishing
                   FOREIGN KEY(BoatName)
                   REFERENCES Boats(BoatName),
        CONSTRAINT fk_species
                   FOREIGN KEY(BinNumber)
                   REFERENCES FishSpecies(BinNumber)
);

INSERT INTO Catch1 VALUES('abc123', 12, 1, 'THE BLACK PEARL', 19.8, 1);
INSERT INTO Catch1 VALUES('aabb19', 8, 2, 'THE BLACK PEARL', 15.8, 2);
INSERT INTO Catch1 VALUES('12naii', 1, 3, 'THE NAUGHTILLUS', 17.1, 4);
INSERT INTO Catch1 VALUES('acc123', 3, 3, 'THE NAUGHTILLUS', 10.3, 3);

CREATE TABLE TideDepth
       (Tday DATE PRIMARY KEY,
        Lowest float NOT NULL,
        Highest float NOT NULL
);

INSERT INTO TideDepth VALUES(TO_DATE('19-01-2020','DD-MM-YYYY'),0.3,2.8);
INSERT INTO TideDepth VALUES(TO_DATE('03-12-2020','DD-MM-YYYY'),3.0,6.1);
INSERT INTO TideDepth VALUES(TO_DATE('29-05-2020','DD-MM-YYYY'),1.8,4.3);
INSERT INTO TideDepth VALUES(TO_DATE('08-03-2020','DD-MM-YYYY'),0.2,3.1);

CREATE TABLE Tide1
       (Tday DATE PRIMARY KEY,
        StartTime DATE,
        EndTime DATE,
        Czone int,
        CONSTRAINT creatingTideDepth
                   FOREIGN KEY(Tday)
                   REFERENCES TideDepth(Tday),
        CONSTRAINT fk_Dependent_On
                   FOREIGN KEY(Czone)
                   REFERENCES Conservation1(Czone)
);

INSERT INTO Tide1 VALUES(TO_DATE('19-01-2020','DD-MM-YYYY'), TO_DATE('12:30:20','HH24:MI:SS'), TO_DATE('01:40:10','HH24:MI:SS'),1);
INSERT INTO Tide1 VALUES(TO_DATE('03-12-2020','DD-MM-YYYY'), TO_DATE('10:30:20','HH24:MI:SS'), TO_DATE('23:19:00','HH24:MI:SS'),1);
INSERT INTO Tide1 VALUES(TO_DATE('29-05-2020','DD-MM-YYYY'), TO_DATE('19:12:00','HH24:MI:SS'), TO_DATE('09:01:00','HH24:MI:SS'),3);
INSERT INTO Tide1 VALUES(TO_DATE('08-03-2020','DD-MM-YYYY'), TO_DATE('10:30:20','HH24:MI:SS'), TO_DATE('23:19:00','HH24:MI:SS'),2);

COMMIT;
