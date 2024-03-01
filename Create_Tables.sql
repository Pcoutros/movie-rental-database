/*
Pete Coutros
CMSC 320 6380
Feb 17, 2024

SQL script to Create the Tables
*/

DROP TABLE Rental_Agreement CASCADE CONSTRAINTS;
DROP TABLE Movie_Copy CASCADE CONSTRAINTS;
DROP TABLE Actor_Academy_Award CASCADE CONSTRAINTS;
DROP TABLE Actor_Movie_Association CASCADE CONSTRAINTS;
DROP TABLE Actor CASCADE CONSTRAINTS;
DROP TABLE Director_Academy_Award CASCADE CONSTRAINTS;
DROP TABLE Director_Movie_Association CASCADE CONSTRAINTS;
DROP TABLE Director CASCADE CONSTRAINTS;
DROP TABLE Movie_Academy_Award CASCADE CONSTRAINTS;
DROP TABLE Purchase_Detail CASCADE CONSTRAINTS;
DROP TABLE Purchase CASCADE CONSTRAINTS;
DROP TABLE Catalog_Movie_Association CASCADE CONSTRAINTS;
DROP TABLE Catalog_Movie CASCADE CONSTRAINTS;
DROP TABLE Catalog CASCADE CONSTRAINTS;
DROP TABLE Distributor CASCADE CONSTRAINTS;
DROP TABLE Movie CASCADE CONSTRAINTS;
DROP TABLE Customers CASCADE CONSTRAINTS;

CREATE TABLE Customers (
    CustomerID              VARCHAR2(10) NOT NULL,
    CustomerLastName        VARCHAR2(20),
    CustomerFirstName       VARCHAR2(20),
    CustomerAddress         VARCHAR2(10),
    CustomerCity            VARCHAR2(20),
    CustomerState           VARCHAR2(20),
    CustomerZIP             VARCHAR2(20),
    CustomerPhoneNum        VARCHAR2(20),
    CONSTRAINT CustID_PK PRIMARY KEY (CustomerID)
);
COMMIT;

CREATE TABLE Movie (
    MovieID                 VARCHAR2(10) NOT NULL,
    MovieTitle              VARCHAR2(30),
    Duration                VARCHAR2(10),
    Rating                  CHAR(3) CHECK (TO_NUMBER(Rating) BETWEEN 0.0 and 5.0),
    DistributorMovieID      VARCHAR2(10),
    ReleaseDate             DATE,
    Genre                   VARCHAR2(30),
    CONSTRAINT MovieID_PK PRIMARY KEY (MovieID)
);
COMMIT;

CREATE TABLE Distributor (
    DistributorID           VARCHAR2(20) NOT NULL,
    CompanyName             VARCHAR2(20),
    CONSTRAINT DistributorID_PK PRIMARY KEY (DistributorID)
);
COMMIT;

CREATE TABLE Catalog (
    CatalogID               VARCHAR2(10) NOT NULL,
    DistributorID           VARCHAR2(10),
    PublicationDate         DATE,
    CONSTRAINT CatalogID_PK PRIMARY KEY (CatalogID),
    CONSTRAINT DistributorID_FK FOREIGN KEY (DistributorID) REFERENCES Distributor (DistributorID)
);
COMMIT;

CREATE TABLE Catalog_Movie (
    CatalogMovieID          VARCHAR2(10) NOT NULL,
    MovieTitle              VARCHAR2(30),
    Genre                   VARCHAR2(30),
    Price                   NUMBER,
    Format                  CHAR(3) CHECK(Format IN ('DVD','VHS')),
    CONSTRAINT CatalogMovieID_PK PRIMARY KEY (CatalogMovieID)
);
COMMIT;

CREATE TABLE Catalog_Movie_Association (
    CatalogMovieID          VARCHAR2(10) NOT NULL,
    CatalogID               VARCHAR2(10) NOT NULL,
    CONSTRAINT CatMovieID_PK PRIMARY KEY (CatalogMovieID, CatalogID),
    CONSTRAINT CatalogMovieID_PF FOREIGN KEY (CatalogMovieID) REFERENCES Catalog_Movie (CatalogMovieID),
    CONSTRAINT CatalogID_PF FOREIGN KEY (CatalogID) REFERENCES Catalog (CatalogID)
);
COMMIT;

CREATE TABLE Purchase (
    PurchaseID              VARCHAR2(10) NOT NULL,
    PurchaseDate            DATE,
    Discount                NUMBER,
    CONSTRAINT PurchaseID_PK PRIMARY KEY (PurchaseID)
);
COMMIT;

CREATE TABLE Purchase_Detail (
    CatalogMovieID          VARCHAR2(10) NOT NULL,
    PurchaseID              VARCHAR2(10) NOT NULL,
    OrderQuantity           NUMBER(10),
    CONSTRAINT PurchaseCatalog_PK PRIMARY KEY (CatalogMovieID, PurchaseID),
    CONSTRAINT CatalogPurchase_PF FOREIGN KEY (CatalogMovieID) REFERENCES Catalog_Movie (CatalogMovieID),
    CONSTRAINT PurchaseID_PF FOREIGN KEY (PurchaseID) REFERENCES Purchase (PurchaseID)
);
COMMIT;

CREATE TABLE Movie_Academy_Award (
    MovieAwardID            VARCHAR2(10) NOT NULL,
    MovieID                 VARCHAR2(10),
    Category                VARCHAR2(30),
    AwardDate               CHAR(4),
    CONSTRAINT MovieAwardID_PK PRIMARY KEY (MovieAwardID),
    CONSTRAINT MovieAAMovie_FK FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);
COMMIT;

CREATE TABLE Director (
    DirectorID              VARCHAR2(10) NOT NULL,
    DirectorFirstName       VARCHAR2(10),
    DirectorLastName        VARCHAR2(10),
    CONSTRAINT DirectorID_PK PRIMARY KEY (DirectorID)
);
COMMIT;

CREATE TABLE Director_Movie_Association (
    DirectorID              VARCHAR2(10) NOT NULL,
    MovieID                 VARCHAR2(10) NOT NULL,
    DirectorRole            VARCHAR2(10),
    CONSTRAINT DirectorMovie_PK PRIMARY KEY (DirectorID, MovieID),
    CONSTRAINT DirectorID_PF FOREIGN KEY (DirectorID) REFERENCES Director (DirectorID),
    CONSTRAINT MovieID_PF FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);
COMMIT;

CREATE TABLE Director_Academy_Award (
    DirectorAwardID         VARCHAR2(10) NOT NULL,
    DirectorID              VARCHAR2(10),
    Category                VARCHAR2(30),
    AwardDate               CHAR(4),
    MovieTitle              VARCHAR2(30),
    CONSTRAINT DirectorAwardID_PK PRIMARY KEY (DirectorAwardID),
    CONSTRAINT DirectorAADirector_FK FOREIGN KEY (DirectorID) REFERENCES Director (DirectorID)
);
COMMIT;

CREATE TABLE Actor (
    ActorID                 VARCHAR2(10) NOT NULL,
    ActorFirstName          VARCHAR2(10),
    ActorLastName           VARCHAR2(10),
    DOB                     DATE,
    Gender                  CHAR(1) CHECK (Gender IN ('M','F')),
    CONSTRAINT ActorID_PK PRIMARY KEY (ActorID)
);
COMMIT;

CREATE TABLE Actor_Movie_Association (
    ActorID                 VARCHAR2(10) NOT NULL,
    MovieID                 VARCHAR2(10) NOT NULL,
    ActorRole               VARCHAR2(30),
    CONSTRAINT ActorMovie_PK PRIMARY KEY (ActorID, MovieID),
    CONSTRAINT ActorID_PF FOREIGN KEY (ActorID) REFERENCES Actor (ActorID),
    CONSTRAINT ActorMovie_PF FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);
COMMIT;

CREATE TABLE Actor_Academy_Award (
    ActorAwardID            VARCHAR2(10) NOT NULL,
    ActorID                 VARCHAR2(10),
    Category                VARCHAR2(30),
    AwardDate               CHAR(4),
    MovieRole               VARCHAR2(30),
    MovieTitle              VARCHAR2(30),
    CONSTRAINT ActorAwardID_PK PRIMARY KEY (ActorAwardID),
    CONSTRAINT ActorAAActor_FK FOREIGN KEY (ActorID) REFERENCES Actor (ActorID)
);
COMMIT;


CREATE TABLE Movie_Copy (
    CopyID                  VARCHAR2(10) NOT NULL,
    MovieID                 VARCHAR2(10),
    DistributorID           VARCHAR2(10),
    DistributorSerialNum    VARCHAR2(10),
    Price                   NUMBER(10),
    Format                  CHAR(3) CHECK (Format IN ('DVD','VHS')),
    Available               CHAR(1) CHECK (Available IN ('Y','N')),
    CONSTRAINT CopyID_PK PRIMARY KEY (CopyID),
    CONSTRAINT CopyMovie_FK FOREIGN KEY (MovieID) REFERENCES Movie (MovieID),
    CONSTRAINT CopyDist_FK FOREIGN KEY (DistributorID) REFERENCES Distributor (DistributorID)
);
COMMIT;

CREATE TABLE Rental_Agreement (
    RentalAgreementID       VARCHAR2(20) NOT NULL,
    CopyID                  VARCHAR2(10),
    CustomerID              VARCHAR2(10),
    RentalDate              DATE,
    ExpectedReturnDate      DATE,
    ReturnDate              DATE,
    Tax                     NUMBER(10),
    LateFee                 NUMBER(10),
    DamageFee               NUMBER(10),
    RewindFee               NUMBER(10),
    Discount                NUMBER(10),
    CONSTRAINT RentID_PK PRIMARY KEY (RentalAgreementID),
    CONSTRAINT RentCust_FK FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) ON DELETE CASCADE,
    CONSTRAINT RentCopy_FK FOREIGN KEY (CopyID) REFERENCES Movie_Copy (CopyID)
);
COMMIT;

ALTER TABLE Customers
MODIFY CustomerAddress VARCHAR2(30);

ALTER TABLE Distributor
ADD (CompanyAddress     VARCHAR2(30),
    CompanyCity         VARCHAR2(20),
    CompanyState        VARCHAR2(20),
    CompanyZIP          VARCHAR2(20),
    CompanyPhoneNum     VARCHAR2(20));    