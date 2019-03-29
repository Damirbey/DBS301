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
--- *******************************************************************************************************************************
--- Table Creation Scripts
--- *******************************************************************************************************************************


CREATE TABLE SCHOOLS(School_Id NUMBER,
                     School_Name VARCHAR(255),
                     School_Type VARCHAR(255),
                     
                     CONSTRAINT Schools_PK
                     PRIMARY KEY(School_Id));
-- ***********************************************************************************************************************************                     
CREATE TABLE CLIENTS(Client_ID NUMBER,
                     Email VARCHAR(255),
                     Phone_Number VARCHAR(255),
                     First_Name VARCHAR(255),
                     Last_Name VARCHAR(255),
                     Seller_Status VARCHAR(255),
                     Ownership_pct NUMBER,
                     CONSTRAINT PK
                     PRIMARY KEY(Client_ID));
-- ***********************************************************************************************************************************                     
CREATE TABLE Agency( Agency_Id NUMBER,
                     Phone_Number VARCHAR(255),
                     Agency_Name VARCHAR(255),
                     
                     CONSTRAINT AGENCY_PK
                     PRIMARY KEY(Agency_Id));
                     
-- ***********************************************************************************************************************************                         
CREATE TABLE Property(Property_Id NUMBER,
                     Postal_Code VARCHAR(255),
                     Agency_Id NUMBER,
                     Number_of_rooms NUMBER,
                     Square_Area NUMBER,
                     Price NUMBER,
                     Maintenance_fees NUMBER,
                     Unit# NUMBER,
                     Type_of_estate VARCHAR(255),
                     CONSTRAINT Property_PK
                     PRIMARY KEY(Property_Id)  ); 
                     
-- ***********************************************************************************************************************************                          
CREATE TABLE Address(Postal_Code VARCHAR(255),
                     Street VARCHAR(255),
                     City VARCHAR(255),
                     Province VARCHAR(255),
                     Area_Id NUMBER,
                    
                     CONSTRAINT Address_PK
                     PRIMARY KEY(Postal_Code));
-- ***********************************************************************************************************************************                                          
CREATE TABLE Area(Area_Id NUMBER,
                     School_id VARCHAR(255),
                     Area_Name VARCHAR(255),
                     Comments VARCHAR(255),
                    
                    
                     CONSTRAINT Area_PK
                     PRIMARY KEY(Area_Id));        
                     
-- ***********************************************************************************************************************************                         
CREATE TABLE Advertisement(Advertisement_Id NUMBER,
                     Property_Id NUMBER,
                     Phone_Number NUMBER,
                     Advertisement_Name VARCHAR(255),
                     Price NUMBER,                     
                     Outlet_Type VARCHAR(255),
                     CONSTRAINT Ad_PK
                     PRIMARY KEY(Advertisement_Id)
                     
                     );   
                     
-- ***********************************************************************************************************************************                     
CREATE TABLE Property_Advertisement(Advertisement_Id NUMBER,
                                    Property_Id NUMBER, 
                                    CONSTRAINT pr_ad_PK PRIMARY KEY(Advertisement_Id,Property_id));
-- ***********************************************************************************************************************************                                    
CREATE TABLE Property_Client(Client_ID NUMBER,
                                    Property_Id NUMBER, 
                                    CONSTRAINT Property_CLient_PK PRIMARY KEY(Client_ID,Property_id));  
           
-- ***********************************************************************************************************************************
-- ADDING FOREIGN KEY CONSTRAINTS TO THE TABLES 
                                   
ALTER TABLE Property ADD CONSTRAINT FK_postal_code 
FOREIGN KEY (Postal_Code) REFERENCES Address(Postal_Code);

ALTER TABLE Property ADD CONSTRAINT FK_agency_id 
FOREIGN KEY (Agency_Id) REFERENCES Agency(Agency_id);

ALTER TABLE Address ADD CONSTRAINT FK_area_id 
FOREIGN KEY (Area_Id) REFERENCES Area(Area_Id);

ALTER TABLE Area ADD CONSTRAINT FK_Area 
FOREIGN KEY (School_Id) REFERENCES Schools(School_Id);

