/*
Pete Coutros
CMSC 320 6380
Feb 17, 2024

SQL script to Populate the Database
*/

DELETE FROM Rental_Agreement;
DELETE FROM Movie_Copy;
DELETE FROM Actor_Academy_Award;
DELETE FROM Actor_Movie_Association;
DELETE FROM Actor;
DELETE FROM Director_Academy_Award;
DELETE FROM Director_Movie_Association;
DELETE FROM Director;
DELETE FROM Movie_Academy_Award;
DELETE FROM Purchase_Detail;
DELETE FROM Purchase;
DELETE FROM Catalog_Movie_Association;
DELETE FROM Catalog_Movie;
DELETE FROM Catalog;
DELETE FROM Distributor;
DELETE FROM Movie;
DELETE FROM Customers;

INSERT ALL 
    INTO Customers(CustomerID, CustomerLastName, CustomerFirstName, CustomerAddress, CustomerCity, CustomerState, CustomerZIP, CustomerPhoneNum) VALUES ('1', 'Smith', 'Jerry', '123 Colorado Ave', 'Ocala', 'FL', '34470', '897-345-6698')
    INTO Customers(CustomerID, CustomerLastName, CustomerFirstName, CustomerAddress, CustomerCity, CustomerState, CustomerZIP, CustomerPhoneNum) VALUES ('2', 'Jones', 'Jane', '3 Fairfield Lane', 'Birmingham', 'AL', '32305', '234-563-3325')
    INTO Customers(CustomerID, CustomerLastName, CustomerFirstName, CustomerAddress, CustomerCity, CustomerState, CustomerZIP, CustomerPhoneNum) VALUES ('3', 'Washington', 'George', '1 Revolutionary Way', 'Brentwood', 'TN', '37214', '354-789-0031')
    INTO Customers(CustomerID, CustomerLastName, CustomerFirstName, CustomerAddress, CustomerCity, CustomerState, CustomerZIP, CustomerPhoneNum) VALUES ('4', 'Castle', 'Thad', '45 Blue Mountain Road', 'Manalapan', 'NJ', '07726', '124-432-2234')
    INTO Customers(CustomerID, CustomerLastName, CustomerFirstName, CustomerAddress, CustomerCity, CustomerState, CustomerZIP, CustomerPhoneNum) VALUES ('5', 'White', 'Walter', '55 Uppers Way', 'Scottsdale', 'AZ', '85054', '345-554-3456')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Movie(MovieID, MovieTitle, Duration, Rating, DistributorMovieID, ReleaseDate, Genre) VALUES ('1', 'Shutter Island', '139', '4.1', '101', '19-FEB-10', 'Suspense')
    INTO Movie(MovieID, MovieTitle, Duration, Rating, DistributorMovieID, ReleaseDate, Genre) VALUES ('2', 'The Uninvited', '87', '3.2', '102', '30-JAN-09', 'Psychological Thriller')
    INTO Movie(MovieID, MovieTitle, Duration, Rating, DistributorMovieID, ReleaseDate, Genre) VALUES ('3', 'Know1ng ', '121', '3.1', '103', '20-MAR-09', 'Sci-Fi Thriller')
    INTO Movie(MovieID, MovieTitle, Duration, Rating, DistributorMovieID, ReleaseDate, Genre) VALUES ('4', '2001: A Space Odyssey', '139', '4.3', '104', '02-APR-68', 'Sci-Fi Adventure')
    INTO Movie(MovieID, MovieTitle, Duration, Rating, DistributorMovieID, ReleaseDate, Genre) VALUES ('5', 'Step Brothers', '98', '4.0', '105', '25-JUL-08', 'Suspense')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Distributor(DistributorID, CompanyName, CompanyAddress, CompanyCity, CompanyState, CompanyZIP, CompanyPhoneNum) VALUES ('1', 'LonePeak', '23 Films Way', 'San Francisco', 'CA', '09230', '394-234-5999')
    INTO Distributor(DistributorID, CompanyName, CompanyAddress, CompanyCity, CompanyState, CompanyZIP, CompanyPhoneNum) VALUES ('2', 'RockStar', '4 Reel Blvd', 'Lexington', 'KY', '43234', '787-333-2394')
    INTO Distributor(DistributorID, CompanyName, CompanyAddress, CompanyCity, CompanyState, CompanyZIP, CompanyPhoneNum) VALUES ('3', 'DareDevil', '677 Blockbuster Blvd', 'Nashville', 'TN', '37201', '615-666-9369')
    INTO Distributor(DistributorID, CompanyName, CompanyAddress, CompanyCity, CompanyState, CompanyZIP, CompanyPhoneNum) VALUES ('4', 'CenturyFilms', '55 Tesla Drive', 'Spokane', 'WA', '77283', '334-093-1255')
    INTO Distributor(DistributorID, CompanyName, CompanyAddress, CompanyCity, CompanyState, CompanyZIP, CompanyPhoneNum) VALUES ('5', 'EntertainmentNow', '3499 Touchdown Way', 'Boston', 'MA', '33451', '832-458-9923')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Catalog(CatalogID, DistributorID, PublicationDate) VALUES ('1', '5', '16-FEB-24')
    INTO Catalog(CatalogID, DistributorID, PublicationDate) VALUES ('2', '3', '13-AUG-23')
    INTO Catalog(CatalogID, DistributorID, PublicationDate) VALUES ('3', '2', '20-JUN-23')
    INTO Catalog(CatalogID, DistributorID, PublicationDate) VALUES ('4', '1', '31-OCT-23')
    INTO Catalog(CatalogID, DistributorID, PublicationDate) VALUES ('5', '4', '10-JAN-24')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Catalog_Movie(CatalogMovieID, MovieTitle, Genre, Price, Format) VALUES ('1', 'Zombie Land', 'Sci-Fi Comedy', 2, 'VHS')
    INTO Catalog_Movie(CatalogMovieID, MovieTitle, Genre, Price, Format) VALUES ('2', 'Fast And Furious', 'Action', 4, 'DVD')
    INTO Catalog_Movie(CatalogMovieID, MovieTitle, Genre, Price, Format) VALUES ('3', 'The Grudge', 'Horror', 5, 'DVD')
    INTO Catalog_Movie(CatalogMovieID, MovieTitle, Genre, Price, Format) VALUES ('4', 'Star Wars', 'Sci-Fi', 1, 'VHS')
    INTO Catalog_Movie(CatalogMovieID, MovieTitle, Genre, Price, Format) VALUES ('5', 'Avatar', 'Sci-Fi', 4.5, 'DVD')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Catalog_Movie_Association(CatalogMovieID, CatalogID) VALUES ('1', '4')
    INTO Catalog_Movie_Association(CatalogMovieID, CatalogID) VALUES ('4', '3')
    INTO Catalog_Movie_Association(CatalogMovieID, CatalogID) VALUES ('2', '1')
    INTO Catalog_Movie_Association(CatalogMovieID, CatalogID) VALUES ('3', '5')
    INTO Catalog_Movie_Association(CatalogMovieID, CatalogID) VALUES ('5', '2')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Purchase(PurchaseID, PurchaseDate, Discount) VALUES ('1', '10-JAN-24', 0)
    INTO Purchase(PurchaseID, PurchaseDate, Discount) VALUES ('2', '13-DEC-23', 0.3)
    INTO Purchase(PurchaseID, PurchaseDate, Discount) VALUES ('3', '09-NOV-23', 0.1)
    INTO Purchase(PurchaseID, PurchaseDate, Discount) VALUES ('4', '21-OCT-23', 0.9)
    INTO Purchase(PurchaseID, PurchaseDate, Discount) VALUES ('5', '12-SEP-23', 0.2)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Purchase_Detail(CatalogMovieID, PurchaseID, OrderQuantity) VALUES ('1', '4', 25)
    INTO Purchase_Detail(CatalogMovieID, PurchaseID, OrderQuantity) VALUES ('2', '3', 50)
    INTO Purchase_Detail(CatalogMovieID, PurchaseID, OrderQuantity) VALUES ('3', '1', 30)
    INTO Purchase_Detail(CatalogMovieID, PurchaseID, OrderQuantity) VALUES ('4', '5', 45)
    INTO Purchase_Detail(CatalogMovieID, PurchaseID, OrderQuantity) VALUES ('5', '2', 10)
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Movie_Academy_Award(MovieAwardID, MovieID, Category, AwardDate) VALUES ('1', '4', 'Best in Sci-FI', '1969')
    INTO Movie_Academy_Award(MovieAwardID, MovieID, Category, AwardDate) VALUES ('2', '1', 'Best in Suspense', '2010')
    INTO Movie_Academy_Award(MovieAwardID, MovieID, Category, AwardDate) VALUES ('3', '2', 'Best in Psy-Thrill', '2009')
    INTO Movie_Academy_Award(MovieAwardID, MovieID, Category, AwardDate) VALUES ('4', '4', 'Best in Future', '1969')
    INTO Movie_Academy_Award(MovieAwardID, MovieID, Category, AwardDate) VALUES ('5', '5', 'Best in Comedy', '2008')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Director(DirectorID, DirectorFirstName, DirectorLastName) VALUES ('1', 'John', 'Sesto')
    INTO Director(DirectorID, DirectorFirstName, DirectorLastName) VALUES ('2', 'Phil', 'Martin')
    INTO Director(DirectorID, DirectorFirstName, DirectorLastName) VALUES ('3', 'Mike', 'Perry')
    INTO Director(DirectorID, DirectorFirstName, DirectorLastName) VALUES ('4', 'Juan', 'Deihl')
    INTO Director(DirectorID, DirectorFirstName, DirectorLastName) VALUES ('5', 'Joe', 'Burgett')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Director_Movie_Association(DirectorID, MovieID, DirectorRole) VALUES ('1', '4', 'Primary')
    INTO Director_Movie_Association(DirectorID, MovieID, DirectorRole) VALUES ('2', '5', 'Primary')
    INTO Director_Movie_Association(DirectorID, MovieID, DirectorRole) VALUES ('3', '1', 'Primary')
    INTO Director_Movie_Association(DirectorID, MovieID, DirectorRole) VALUES ('4', '3', 'Primary')
    INTO Director_Movie_Association(DirectorID, MovieID, DirectorRole) VALUES ('5', '2', 'Primary')
    INTO Director_Movie_Association(DirectorID, MovieID, DirectorRole) VALUES ('3', '2', 'Secondary')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Director_Academy_Award(DirectorAwardID, DirectorID, Category, AwardDate, MovieTitle) VALUES ('1', '1', 'Best Director - Comedy', '2014', 'Super Bad')
    INTO Director_Academy_Award(DirectorAwardID, DirectorID, Category, AwardDate, MovieTitle) VALUES ('2', '2', 'Best Director - SciFi', '2016', 'Aliens')
    INTO Director_Academy_Award(DirectorAwardID, DirectorID, Category, AwardDate, MovieTitle) VALUES ('3', '2', 'Best Director - Horror', '2004', 'Zombies 2')
    INTO Director_Academy_Award(DirectorAwardID, DirectorID, Category, AwardDate, MovieTitle) VALUES ('4', '4', 'Best Director - Action', '2009', 'Mission Impossible')
    INTO Director_Academy_Award(DirectorAwardID, DirectorID, Category, AwardDate, MovieTitle) VALUES ('5', '5', 'Best Director - Drama', '2019', 'Notebook')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Actor(ActorID, ActorFirstName, ActorLastName, DOB, Gender) VALUES ('1', 'Jerry', 'Osbourne', '13-JUN-58', 'M')
    INTO Actor(ActorID, ActorFirstName, ActorLastName, DOB, Gender) VALUES ('2', 'Alice', 'Bell', '28-FEB-73', 'M')
    INTO Actor(ActorID, ActorFirstName, ActorLastName, DOB, Gender) VALUES ('3', 'Mike', 'Justice', '03-JAN-81', 'M')
    INTO Actor(ActorID, ActorFirstName, ActorLastName, DOB, Gender) VALUES ('4', 'Gus', 'Edwards', '27-JUL-69', 'M')
    INTO Actor(ActorID, ActorFirstName, ActorLastName, DOB, Gender) VALUES ('5', 'Jennifer', 'Lawrence', '23-APR-94', 'M')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Actor_Movie_Association(ActorID, MovieID, ActorRole) VALUES ('1', '1', 'Main Character')
    INTO Actor_Movie_Association(ActorID, MovieID, ActorRole) VALUES ('2', '2', 'Supporting Character')
    INTO Actor_Movie_Association(ActorID, MovieID, ActorRole) VALUES ('3', '3', 'Main Character')
    INTO Actor_Movie_Association(ActorID, MovieID, ActorRole) VALUES ('4', '4', 'Main Character')
    INTO Actor_Movie_Association(ActorID, MovieID, ActorRole) VALUES ('5', '5', 'Main Character')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Actor_Academy_Award(ActorAwardID, ActorID, Category, AwardDate, MovieRole, MovieTitle) VALUES ('1', '1', 'Best Actor', '1994', 'Main Character', 'Titanic')
    INTO Actor_Academy_Award(ActorAwardID, ActorID, Category, AwardDate, MovieRole, MovieTitle) VALUES ('2', '1', 'Best Actor', '2003', 'Main Character', 'The Mayans')
    INTO Actor_Academy_Award(ActorAwardID, ActorID, Category, AwardDate, MovieRole, MovieTitle) VALUES ('3', '2', 'Best Actress', '2014', 'Main Character', 'Mars Attacks')
    INTO Actor_Academy_Award(ActorAwardID, ActorID, Category, AwardDate, MovieRole, MovieTitle) VALUES ('4', '3', 'Best Actor', '2001', 'Main Character', 'The Departed')
    INTO Actor_Academy_Award(ActorAwardID, ActorID, Category, AwardDate, MovieRole, MovieTitle) VALUES ('5', '5', 'Best Actress', '2021', 'Supporting Character', 'The Nun')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Movie_Copy(CopyID, MovieID, DistributorID, DistributorSerialNum, Price, Format, Available) VALUES ('1', '1', '1', '5', 20, 'DVD', 'Y')
    INTO Movie_Copy(CopyID, MovieID, DistributorID, DistributorSerialNum, Price, Format, Available) VALUES ('2', '2', '5', '2', 12, 'VHS', 'Y')
    INTO Movie_Copy(CopyID, MovieID, DistributorID, DistributorSerialNum, Price, Format, Available) VALUES ('3', '3', '3', '1', 15.5, 'DVD', 'Y')
    INTO Movie_Copy(CopyID, MovieID, DistributorID, DistributorSerialNum, Price, Format, Available) VALUES ('4', '4', '2', '3', 13, 'DVD', 'Y')
    INTO Movie_Copy(CopyID, MovieID, DistributorID, DistributorSerialNum, Price, Format, Available) VALUES ('5', '5', '4', '4', 9, 'VHS', 'Y')
SELECT * FROM DUAL;
COMMIT;

INSERT ALL
    INTO Rental_Agreement(RentalAgreementID, CopyID, CustomerID, RentalDate, ExpectedReturnDate, ReturnDate, Tax, LateFee, DamageFee, RewindFee, Discount) VALUES ('1', '1', '5', '04-SEP-23', '04-OCT-23', '08-OCT-23', 0.2, 5, 2, 3, 0)
    INTO Rental_Agreement(RentalAgreementID, CopyID, CustomerID, RentalDate, ExpectedReturnDate, ReturnDate, Tax, LateFee, DamageFee, RewindFee, Discount) VALUES ('2', '2', '3', '24-JUN-23', '24-JUL-23', '24-JUL-23', 0.15, 0, 0, 1, 0)
    INTO Rental_Agreement(RentalAgreementID, CopyID, CustomerID, RentalDate, ExpectedReturnDate, ReturnDate, Tax, LateFee, DamageFee, RewindFee, Discount) VALUES ('3', '3', '1', '28-APR-23', '28-MAY-23', '08-MAY-23', 0.19, 0, 1.2, 0, 0)
    INTO Rental_Agreement(RentalAgreementID, CopyID, CustomerID, RentalDate, ExpectedReturnDate, ReturnDate, Tax, LateFee, DamageFee, RewindFee, Discount) VALUES ('4', '4', '2', '18-MAR-23', '18-APR-23', '08-APR-23', 0.22, 0, 3, 0, 2)
    INTO Rental_Agreement(RentalAgreementID, CopyID, CustomerID, RentalDate, ExpectedReturnDate, ReturnDate, Tax, LateFee, DamageFee, RewindFee, Discount) VALUES ('5', '5', '4', '11-FEB-24', '11-MAR-24', NULL, 0, 0, 0, 0, 0)
    INTO Rental_Agreement(RentalAgreementID, CopyID, CustomerID, RentalDate, ExpectedReturnDate, ReturnDate, Tax, LateFee, DamageFee, RewindFee, Discount) VALUES ('6', '1', '5', '28-JAN-24', '28-FEB-24', NULL, 0, 0, 0, 0, 0)
    INTO Rental_Agreement(RentalAgreementID, CopyID, CustomerID, RentalDate, ExpectedReturnDate, ReturnDate, Tax, LateFee, DamageFee, RewindFee, Discount) VALUES ('7', '1', '5', '03-FEB-24', '03-MAR-24', '05-FEB-24', 2, 0, 0, 0, 1)
SELECT * FROM DUAL;
COMMIT;