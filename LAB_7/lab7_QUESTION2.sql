-- Name: Damirkhon Yodgorov
-- Student id: 108364175
-- Date: 15.11.2018

-- creating Retail_Center table

CREATE TABLE Retail_Center 
(retail_id  NUMBER(4) NOT NULL,    
 type_name  VARCHAR2(25) NOT NULL,    
 address VARCHAR2(25)

);

	
-- creating Transportation table

CREATE TABLE Transportation  
(scheduleNumber  NUMBER(4) NOT NULL,    
 type_name VARCHAR2(25) NOT NULL,    
 deliveryRoute VARCHAR2(25) 
   
);

-- creating Items table	

CREATE TABLE Items
(Item_number  NUMBER(4) NOT NULL,    
weight VARCHAR2(25) NOT NULL,    
dimensions VARCHAR2(25),    
insurance_amount  VARCHAR2(8),    
destination  NUMBER(9,2),
delivery_date CHAR(10),
retail_id  NUMBER(4) NOT NULL );

-- Creating bridge table items_transportation	

CREATE TABLE  items_transportation  
(item_number NUMBER(4) NOT NULL,
 scheduleNumber NUMBER(4) NOT NULL );
 
-- ******************************************************************
-- ADDING CONSTRAINTS to the CREATED TABLES 
-- ******************************************************************

-- Primary Key for Retail_Center table
ALTER TABLE Retail_Center 
ADD CONSTRAINT PK1 Primary key(retail_id);

-- Primary Key for Transportation table 
ALTER TABLE Transportation
ADD CONSTRAINT PK_T Primary key(scheduleNumber);

-- Primary Key for Items table
ALTER TABLE Items
ADD CONSTRAINT PK_I Primary key(Item_number);

--  Adding Foreign keys for the tables 
ALTER TABLE ITEMS
ADD FOREIGN KEY(retail_id) REFERENCES Retail_Center(retail_id);
-- Adding Joined Primary key for the items_transportation

ALTER TABLE items_transportation 
ADD CONSTRAINT JOINED_PRIMARY_KEY Primary key(Item_number, scheduleNumber);

--  Adding Foreign keys items_transportation bridge table
ALTER TABLE items_transportation 
ADD FOREIGN KEY(scheduleNumber) REFERENCES Transportation(scheduleNumber);

ALTER TABLE items_transportation 
ADD FOREIGN KEY(item_number) REFERENCES Items(Item_number);

