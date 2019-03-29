--- *******************************************************************************************************************************
---  RECORDS INSERTION SCRIPTS
--- *******************************************************************************************************************************
--- Group Members 
--- *******************************************************************************************************************************
--- Member 1:
--  Name: Damirkhon Yodgorov
--  Student Id: 108364175
--- *******************************************************************************************************************************
--- Member 2:
--  Name: Gayane Babayan 
--  Student Id: 107061160
--- *******************************************************************************************************************************
--- *******************************************************************************************************************************
--- Member 3:
--  Name: Mohammed Suleiman Mohamed Al-Falahy 
--  Student Id: 121083176
--- *******************************************************************************************************************************
--- *******************************************************************************************************************************
--- Member 4:
--  Name: Daniel Altunyuzuk
--  Student Id: 057242125
-- ********************************************************************************************************************************
-- INSERTING INTO AGENCY TABLE
INSERT INTO AGENCY VALUES(301,'416-000-0000','Manikind');
INSERT  ALL
INTO AGENCY VALUES(302,'416-000-0001','Onoppono')
INTO AGENCY VALUES(303,'416-000-0002','DewDrop')
INTO AGENCY VALUES(304,'416-000-0003','Workshape')
INTO AGENCY VALUES(305,'416-000-0004','Uproar')
INTO AGENCY VALUES(306,'416-000-0005','Aplomb')
INTO AGENCY VALUES(307,'416-000-0006','Pink Pixel')
INTO AGENCY VALUES(308,'416-000-0007','Endust')
INTO AGENCY VALUES(309,'416-000-0008','Langoor')
INTO AGENCY VALUES(310,'416-000-0009','Tilboroo')
SELECT * FROM AGENCY;


-- ***********************************************************************************************************************************                     
-- INSERTING INTO SCHOOLS TABLE
INSERT  
INTO SCHOOLS VALUES(101,'Burnley School','Elementary');
INSERT  ALL
INTO SCHOOLS VALUES(102,'Holy Trinity School','Middle')
INTO SCHOOLS VALUES(103,'Chetwynde School','High')
INTO SCHOOLS VALUES(104,'Dixons Free School','Elementary')
INTO SCHOOLS VALUES(105,'Eden School','Middle')
INTO SCHOOLS VALUES(106,'Essa Primary School','High')
INTO SCHOOLS VALUES(107,'Gladstone School','Middle')
INTO SCHOOLS VALUES(108,'Island Free School','Elementary')
INTO SCHOOLS VALUES(109,'Marylebone Boys School','High')
INTO SCHOOLS VALUES(110,'Seva School','Middle')
SELECT * FROM SCHOOLS;


-- ***********************************************************************************************************************************                     
-- INSERTING INTO CLIENTS TABLE
INSERT INTO CLIENTS VALUES(201,'liam@yahoo.com','647-000-0000','Liam','Smith','active',2.5);
INSERT ALL 
INTO CLIENTS VALUES (202,'william@yahoo.com','647-000-0001','William','Carvaliho','inactive',7.1)
INTO CLIENTS VALUES (203,'mike_tyson@gmail.com','647-000-0002','Mike','Tyson','active',2.7)
INTO CLIENTS VALUES (204,'khabib@mail.ru','647-000-0003','Khabib','Nurmagomedov','inactive',2.5)
INTO CLIENTS VALUES (205,'tony@yahoo.com','647-000-0004','Tony','Ferguson','active',1.0)
INTO CLIENTS VALUES (206,'kevin@yahoo.com','647-000-0005','Kevin','Lee','inactive',4.5)
INTO CLIENTS VALUES (207,'mark@yahoo.com','647-000-0006','Mark','Hunt','active',1.5)
INTO CLIENTS VALUES (208,'fedor@yahoo.com','647-000-0007','Fedor','Emelianenko','active',9)
INTO CLIENTS VALUES (209,'edson@yahoo.com','647-000-0008','Edson','Barboza','inactive',9.5)
INTO CLIENTS VALUES (210,'al@gmail.com','647-000-0009','Al','Iaquinta','active',8.5)
SELECT * FROM CLIENTS;


-- ***********************************************************************************************************************************                         
-- INSERTING DATA INTO AREA TABLE

INSERT INTO AREA VALUES(401,101,'Old Toronto','no comment');
INSERT ALL 
INTO AREA VALUES(402,102,'East York','nice area')
INTO AREA VALUES(403,101,'North York','perfect area')
INTO AREA VALUES(404,106,'Richmond Hill','no comment')
INTO AREA VALUES(405,104,'Etobike','nice area')
INTO AREA VALUES(406,101,'Don Mills','needs more research')
INTO AREA VALUES(407,102,'Jane','bad area')
INTO AREA VALUES(408,101,'Finch West','nice area')
INTO AREA VALUES(409,104,'Downtown','busy area')
INTO AREA VALUES(410,109,'Thornhill','no comment')
SELECT * FROM AREA;


-- ***********************************************************************************************************************************                          
-- INSERTING DATA INTO ADDRESS TABLE
INSERT INTO ADDRESS VALUES('M4E1H5','Bay Str','TORONTO','ON','404');
INSERT ALL 
INTO ADDRESS VALUES('M4E1H7','Steeles Avenue','TORONTO','ON','401')
INTO ADDRESS VALUES('M4E1H6','Eglington West','TORONTO','ON','405')
INTO ADDRESS VALUES('M4E1H8','Front Str','TORONTO','ON','408')
INTO ADDRESS VALUES('M4E1H2','Bathurst Str','TORONTO','ON','402')
INTO ADDRESS VALUES('M4E1H1','Wilson Avenue','TORONTO','ON','401')
INTO ADDRESS VALUES('M4E1H3','Hilda Avenue','TORONTO','ON','401')
INTO ADDRESS VALUES('M4E1H4','Emerald Lane','TORONTO','ON','410')
INTO ADDRESS VALUES('M4E1H9','Danforth Avenue','TORONTO','ON','409')
INTO ADDRESS VALUES('M4E1B6','Dundas Street','TORONTO','ON','403')
SELECT * FROM ADDRESS;


-- ***********************************************************************************************************************************                                          
-- INSERTING DATA INTO PROPERTY TABLE

INSERT INTO PROPERTY VALUES(501,'M4E1H6',307,2,300,480000,600,1,'Residential');
INSERT ALL
INTO PROPERTY VALUES(502,'M4E1H4',306,3,600,780000,1000,2,'Residential')
INTO PROPERTY VALUES(503,'M4E1H3',310,1,100,680000,600,3,'Residential')
INTO PROPERTY VALUES(504,'M4E1H2',301,4,700,580000,1500,4,'Residential')
INTO PROPERTY VALUES(505,'M4E1H1',303,2,200,580000,1200,5,'Residential')
INTO PROPERTY VALUES(506,'M4E1H5',304,1,150,80000,600,6,'Residential')
INTO PROPERTY VALUES(507,'M4E1H7',305,3,300,580000,1700,7,'Residential')
INTO PROPERTY VALUES(508,'M4E1H8',308,3,400,380000,1800,8,'Residential')
INTO PROPERTY VALUES(509,'M4E1H9',309,1,100,80000,600,9,'Residential')
INTO PROPERTY VALUES(510,'M4E1B6',301,3,800,880000,1600,10,'Residential')
SELECT * FROM PROPERTY;


-- ***********************************************************************************************************************************                         
-- INSERTING DATA INTO ADVERTISEMENT TABLE 
INSERT INTO ADVERTISEMENT VALUES(601,504,'416-111-2220','Emma',300,'TV');
INSERT ALL 
INTO ADVERTISEMENT VALUES (602,505,'416-111-2222','Kevin',600,'Radio')
INTO ADVERTISEMENT VALUES (603,506,'416-111-2221','Tony',1300,'Internet')
INTO ADVERTISEMENT VALUES (604,507,'416-111-2223','Amanda',1500,'Mobile')
INTO ADVERTISEMENT VALUES (605,508,'416-111-2224','Chris',300,'out-of-home')
INTO ADVERTISEMENT VALUES (606,509,'416-111-2225','Emily',800,'TV')
INTO ADVERTISEMENT VALUES (607,510,'416-111-2226','Ava',900,'radio')
INTO ADVERTISEMENT VALUES (608,501,'416-111-2227','Samantha',600,'internet')
INTO ADVERTISEMENT VALUES (609,502,'416-111-2228','Maria',700,'radio')
INTO ADVERTISEMENT VALUES (610,503,'416-111-2229','Isabella',300,'mobile')
SELECT * FROM ADVERTISEMENT;



-- ***********************************************************************************************************************************                     
-- INSERTING DATA INTO PROPERTY_CLIENT TABLE
INSERT INTO PROPERTY_CLIENT VALUES(201,501);
INSERT ALL
INTO PROPERTY_CLIENT VALUES(204,510)
INTO PROPERTY_CLIENT VALUES(205,509)
INTO PROPERTY_CLIENT VALUES(206,508)
INTO PROPERTY_CLIENT VALUES(207,507)
INTO PROPERTY_CLIENT VALUES(208,506)
INTO PROPERTY_CLIENT VALUES(209,505)
INTO PROPERTY_CLIENT VALUES(210,504)
INTO PROPERTY_CLIENT VALUES(202,503)
INTO PROPERTY_CLIENT VALUES(203,502)
SELECT * FROM PROPERTY_CLIENT;


-- ***********************************************************************************************************************************                                    
-- INSERTING DATA INTO PROPERTY_ADVERTISEMENT TABLE

INSERT INTO PROPERTY_ADVERTISEMENT VALUES(601,510);
INSERT ALL 
INTO PROPERTY_ADVERTISEMENT VALUES(602,509)
INTO PROPERTY_ADVERTISEMENT VALUES(603,508)
INTO PROPERTY_ADVERTISEMENT VALUES(604,507)
INTO PROPERTY_ADVERTISEMENT VALUES(605,506)
INTO PROPERTY_ADVERTISEMENT VALUES(606,505)
INTO PROPERTY_ADVERTISEMENT VALUES(607,504)
INTO PROPERTY_ADVERTISEMENT VALUES(608,503)
INTO PROPERTY_ADVERTISEMENT VALUES(609,502)
INTO PROPERTY_ADVERTISEMENT VALUES(610,501)
SELECT * FROM PROPERTY_ADVERTISEMENT;
          
-- ***********************************************************************************************************************************


