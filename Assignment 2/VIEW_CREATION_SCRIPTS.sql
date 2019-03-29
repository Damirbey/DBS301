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
---  View creation SCRIPTS
--- *******************************************************************************************************************************

--- *****************************************VIEW 1********************************************************
CREATE VIEW PROPERTY_ADDRESS as( 
                                  SELECT p.Property_id, p.Postal_code, p.price,a.province,
                                  a.city FROM PROPERTY p JOIN ADDRESS a 
                                  ON p.Postal_code=a.Postal_code);
                                  
--- *****************************************VIEW 2********************************************************
CREATE VIEW AREA_ADDRESS as(
                          SELECT a.Area_name, a.comments, d.Street, d.city,d.province
                          FROM AREA a JOIN ADDRESS d
                          ON a.Area_id=d.Area_id);

--- *****************************************VIEW 3********************************************************

CREATE VIEW PROPERTY_AGENCY as (
                               SELECT p.PROPERTY_ID, p.POSTAL_CODE, p.Price, p.SQUARE_AREA, a.AGENCY_ID, a.AGENCY_NAME
                               FROM PROPERTY p JOIN AGENCY a
                               ON p.AGENCY_ID=a.AGENCY_ID);

--- *****************************************VIEW 4********************************************************

CREATE VIEW PROPERTY_ADVERTISEMENTS as (
                                    SELECT pa.PROPERTY_ID, p.POSTAL_CODE, p.Price, p.SQUARE_AREA, pa.ADVERTISEMENT_ID, a.ADVERTISEMENT_NAME
                                    FROM PROPERTY p , ADVERTISEMENT a, PROPERTY_ADVERTISEMENT pa
                                    WHERE  pa.Property_id=p.Property_id AND pa.ADVERTISEMENT_ID=a.ADVERTISEMENT_ID);
                               
                               
                               