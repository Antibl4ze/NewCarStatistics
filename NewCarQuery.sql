--CHECKING THE DATA
select *
from [dbo].[car data]

--SEEMS LIKE THERE ARE EMPTY ROWS.
Delete from [dbo].[car data]
where Country IS NULL;

--select *
--from [dbo].[car data]

--FIXING NULL VALUES
UPDATE [dbo].[car data]
SET Liquefied_petroleum_gases_LPG = NULLIF(Liquefied_petroleum_gases_LPG, ':'),
	Natural_gas = NULLIF(Natural_gas, ':'),
	Petrol_excluding_hybrids = NULLIF(Petrol_excluding_hybrids, ':'),
	Hybrid_electric_petrol = NULLIF(Hybrid_electric_petrol, ':'),
	Diesel_excluding_hybrids = NULLIF(Diesel_excluding_hybrids, ':'),
	Hybrid_diesel_electric = NULLIF(Hybrid_diesel_electric, ':'),
	Plug_in_hybrid_diesel_electric = NULLIF(Plug_in_hybrid_diesel_electric, ':'),
	Bioethanol = NULLIF(Bioethanol, ':'),
	Biodiesel = NULLIF(Biodiesel, ':'),
	Bi_fuel = NULLIF(Bi_fuel, ':'),
	Other = NULLIF(Other, ':');

UPDATE [dbo].[car data]
SET Liquefied_petroleum_gases_LPG = ISNULL(Liquefied_petroleum_gases_LPG, 0),
    Natural_gas = ISNULL(Natural_gas, 0),
    Petrol_excluding_hybrids = ISNULL(Petrol_excluding_hybrids, 0),
    Hybrid_electric_petrol = ISNULL(Hybrid_electric_petrol, 0),
    Diesel_excluding_hybrids = ISNULL(Diesel_excluding_hybrids, 0),
    Hybrid_diesel_electric = ISNULL(Hybrid_diesel_electric, 0),
    Plug_in_hybrid_diesel_electric = ISNULL(Plug_in_hybrid_diesel_electric, 0),
    Bioethanol = ISNULL(Bioethanol, 0),
    Biodiesel = ISNULL(Biodiesel, 0),
    Bi_fuel = ISNULL(Bi_fuel, 0),
    Other = ISNULL(Other, 0);



--FIXING THE SPACES IN ALL THE COLUMN


UPDATE [dbo].[car data]
SET 
    year = REPLACE(year, ' ', ''),
    total = REPLACE(total, ' ', ''),
    Liquefied_petroleum_gases_LPG = REPLACE(Liquefied_petroleum_gases_LPG, ' ', ''),
    Natural_gas = REPLACE(Natural_gas, ' ', ''),
    Petrol_excluding_hybrids = REPLACE(Petrol_excluding_hybrids, ' ', ''),
    Hybrid_electric_petrol = REPLACE(Hybrid_electric_petrol, ' ', ''),
    Diesel_excluding_hybrids = REPLACE(Diesel_excluding_hybrids, ' ', ''),
    Hybrid_diesel_electric = REPLACE(Hybrid_diesel_electric, ' ', ''),
    Plug_in_hybrid_diesel_electric = REPLACE(Plug_in_hybrid_diesel_electric, ' ', ''),
    Bioethanol = REPLACE(Bioethanol, ' ', ''),
    Biodiesel = REPLACE(Biodiesel, ' ', ''),
    Bi_fuel = REPLACE(Bi_fuel, ' ', ''),
    Other = REPLACE(Other, ' ', ''),
	Petroleum_products = REPLACE(Petroleum_products, ' ', ''),
	Alternative_energy = REPLACE(Alternative_energy, ' ', ''),
	Electricity = REPLACE(Electricity, ' ', ''),
	Diesel = REPLACE(Diesel, ' ', ''),
	Plug_in_hybrid_petrol_electric = REPLACE(Plug_in_hybrid_petrol_electric, ' ', '')

--CONVERTING COLUMNS INTO NUMERIC

ALTER TABLE [dbo].[car data]
ALTER COLUMN year NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN total NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Liquefied_petroleum_gases_LPG NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Diesel NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Natural_gas NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Electricity NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Alternative_energy NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Petrol_excluding_hybrids NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Hybrid_electric_petrol NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Plug_in_hybrid_petrol_electric NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Diesel_excluding_hybrids NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Hybrid_diesel_electric NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Plug_in_hybrid_diesel_electric NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Hydrogen_and_fuel_cells NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Bioethanol NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Biodiesel NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Bi_fuel NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Other NUMERIC;

ALTER TABLE [dbo].[car data]
ALTER COLUMN Petroleum_products NUMERIC;


--CHECK COLUMN TYPEs
SELECT COLUMN_NAME,DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'car data';

--TOTAL ELECTRIC CARS BY COUNTRIES
SELECT Country,YEAR,Electricity,Total
FROM [dbo].[car data]
ORDER BY Country,YEAR


-- PERCENTAGE OF ELECTRIC CARS BY COUNTRY FROM TOTAL CARS SOLD

SELECT Country,YEAR,Electricity,Total,(Electricity/Total)*100 AS ELECTRIC_CAR_PERCENTAGE_BY_YEAR
FROM [dbo].[car data]
ORDER BY Country,YEAR



-- TOTAL HYBRID CARS BY COUNTRIES
SELECT Country,YEAR,Hybrid_electric_petrol,Hybrid_diesel_electric,Plug_in_hybrid_diesel_electric,Plug_in_hybrid_petrol_electric,Total
FROM [dbo].[car data]
ORDER BY Country,YEAR

-- PERCENTAGE OF HYBRID CARS by Country from Total Cars Sold
SELECT Country,YEAR,(Hybrid_electric_petrol + Hybrid_diesel_electric + Plug_in_hybrid_diesel_electric + Plug_in_hybrid_petrol_electric) AS HYBRIDS,Total,
    (Hybrid_electric_petrol + Hybrid_diesel_electric + Plug_in_hybrid_diesel_electric + Plug_in_hybrid_petrol_electric) * 100 / Total AS HYBRID_CAR_PERCENTAGE_BY_YEAR
FROM [dbo].[car data]
ORDER BY Country, YEAR;

--TOTAL PETROL CARS BY COUNTRIES
SELECT Country,YEAR,Petrol_excluding_hybrids,Total
FROM [dbo].[car data]
ORDER BY Country,YEAR

--PERCENTAGE OF PETROL CARS BY Country from Total Cars Sold
SELECT Country,YEAR,Petrol_excluding_hybrids,Total,(Petrol_excluding_hybrids/Total)*100 AS PETROL_CAR_PERCENTAGE_BY_YEAR
FROM [dbo].[car data]
ORDER BY Country, YEAR;


--TOTAL DIESEL CARS BY COUNTRIES
SELECT Country,YEAR,Diesel_excluding_hybrids,Total
FROM [dbo].[car data]
ORDER BY Country,YEAR

--PERCENTAGE OF DIESEL CARS by Country from Total Cars Sold
SELECT Country,YEAR,Diesel_excluding_hybrids,Total,(Diesel_excluding_hybrids/Total)*100 AS DIESEL_CAR_PERCENTAGE_BY_YEAR
FROM [dbo].[car data]
ORDER BY Country, YEAR;



---TOTAL OTHER CARS BY COUNTRIES
SELECT Country,YEAR,(Natural_gas+Hydrogen_and_fuel_cells+Bioethanol+Biodiesel+Bi_fuel+Other) AS OTHER_FUELS
FROM [dbo].[car data]
ORDER BY Country,YEAR



--PERCENTAGE OF OTHER FUEL CARS by Country from Total Cars Sold
SELECT Country,YEAR,(Natural_gas+Hydrogen_and_fuel_cells+Bioethanol+Biodiesel+Bi_fuel+Other) * 100 / Total AS OTHER_FUEL_CAR_PERCENTAGE_BY_YEAR
FROM [dbo].[car data]
ORDER BY Country,YEAR


--TOTAL CARS SOLD BY COUNTRY (ALL YEARS COMBINED)
SELECT Country, SUM(Total) AS TOTAL_CARS_SOLD
FROM [dbo].[car data]
GROUP BY Country
ORDER BY TOTAL_CARS_SOLD DESC;




-- ELECTRIC VS HYBRID VS PETROL VS DIESEL COMPARISON BY COUNTRY AND YEAR
SELECT Country,Year,Total,Electricity AS EV,(Hybrid_electric_petrol + Hybrid_diesel_electric + Plug_in_hybrid_diesel_electric + Plug_in_hybrid_petrol_electric) AS HYBRIDS,
    Petrol_excluding_hybrids AS PETROL,Diesel_excluding_hybrids AS DIESEL
FROM [dbo].[car data]
ORDER BY Country, Year;




--SUMMARY OF THE QUERIES
WITH CountryTotals AS (
    SELECT 
        Country, 
        SUM(Total) AS TOTAL_CARS_SOLD
    FROM [dbo].[car data]
    GROUP BY Country
)

SELECT 
    cd.Country,   
    YEAR,        
    
    -- Total Cars
    Total AS Total_Cars_Sold,   
    -- Electric Cars
    Electricity AS Electric_Cars,
    (Electricity/Total)*100 AS ELECTRIC_CAR_PERCENTAGE_BY_YEAR,
    
    -- Hybrid Cars (all types)
    (Hybrid_electric_petrol + Hybrid_diesel_electric + Plug_in_hybrid_diesel_electric + Plug_in_hybrid_petrol_electric) AS HYBRID_CARS,
    (Hybrid_electric_petrol + Hybrid_diesel_electric + Plug_in_hybrid_diesel_electric + Plug_in_hybrid_petrol_electric) * 100 / Total AS HYBRID_CAR_PERCENTAGE_BY_YEAR,
    
    
    -- Petrol Cars
    Petrol_excluding_hybrids AS PETROL_CARS,
    (Petrol_excluding_hybrids/Total)*100 AS PETROL_CAR_PERCENTAGE_BY_YEAR,
    
    -- Diesel Cars
    Diesel_excluding_hybrids AS DIESEL_CARS,
    (Diesel_excluding_hybrids/Total)*100 AS DIESEL_CAR_PERCENTAGE_BY_YEAR,
    
    -- Other Fuel Types
    (Natural_gas + Hydrogen_and_fuel_cells + Bioethanol + Biodiesel + Bi_fuel + Other) AS OTHER_FUEL_CARS,
    (Natural_gas + Hydrogen_and_fuel_cells + Bioethanol + Biodiesel + Bi_fuel + Other) * 100 / Total AS OTHER_FUEL_PERCENTAGE_BY_YEAR
    

FROM [dbo].[car data] cd
INNER JOIN CountryTotals ct ON cd.Country = ct.Country
ORDER BY cd.Country, YEAR;

--diesel,natural gas,electricity,petrol excluding hybrid, petro  hybrid
SELECT *
from [dbo].[car data]
