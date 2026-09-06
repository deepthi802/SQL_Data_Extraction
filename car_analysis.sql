-- ==========================================
-- TASK 2: SQL FOR DATA EXTRACTION
-- Car Market Trends Analysis
-- ==========================================


-- 1. Display all cars
SELECT *
FROM cars;


-- 2. Select important columns
SELECT Car_Name, Year, Selling_Price, Fuel_Type, Transmission
FROM cars;


-- 3. Cars manufactured after 2018
SELECT Car_Name, Year, Selling_Price
FROM cars
WHERE Year > 2018;


-- 4. Cars sorted by selling price
SELECT Car_Name, Year, Selling_Price
FROM cars
ORDER BY Selling_Price DESC;


-- 5. Top 5 most expensive cars
SELECT Car_Name, Year, Selling_Price
FROM cars
ORDER BY Selling_Price DESC
LIMIT 5;


-- 6. Number of cars by fuel type
SELECT Fuel_Type, COUNT(*) AS Total_Cars
FROM cars
GROUP BY Fuel_Type;


-- 7. Average selling price by fuel type
SELECT Fuel_Type,
       AVG(Selling_Price) AS Average_Selling_Price
FROM cars
GROUP BY Fuel_Type;


-- 8. Highest and lowest selling price
SELECT
    MAX(Selling_Price) AS Highest_Price,
    MIN(Selling_Price) AS Lowest_Price
FROM cars;


-- 9. Fuel types having more than 20 cars
SELECT Fuel_Type,
       COUNT(*) AS Total_Cars
FROM cars
GROUP BY Fuel_Type
HAVING COUNT(*) > 20;


-- 10. Different fuel types
SELECT DISTINCT Fuel_Type
FROM cars;


-- 11. Search for Honda cars
SELECT Car_Name, Year, Selling_Price
FROM cars
WHERE Car_Name LIKE '%Honda%';


-- 12. Cars manufactured between 2017 and 2019
SELECT Car_Name, Year, Selling_Price
FROM cars
WHERE Year BETWEEN 2017 AND 2019;


-- 13. Cars above average selling price
SELECT Car_Name, Year, Selling_Price
FROM cars
WHERE Selling_Price > (
    SELECT AVG(Selling_Price)
    FROM cars
);


-- 14. CTE: Cars above average price
WITH AveragePrice AS (
    SELECT AVG(Selling_Price) AS Avg_Price
    FROM cars
)
SELECT Car_Name, Year, Selling_Price
FROM cars, AveragePrice
WHERE Selling_Price > Avg_Price;


-- 15. ROW_NUMBER window function
SELECT
    Car_Name,
    Year,
    Selling_Price,
    ROW_NUMBER() OVER (
        ORDER BY Selling_Price DESC
    ) AS Price_Rank
FROM cars;


-- 16. RANK window function
SELECT
    Car_Name,
    Year,
    Selling_Price,
    RANK() OVER (
        ORDER BY Selling_Price DESC
    ) AS Price_Rank
FROM cars;


-- 17. Create reusable VIEW
CREATE VIEW IF NOT EXISTS expensive_cars AS
SELECT
    Car_Name,
    Year,
    Selling_Price,
    Fuel_Type,
    Transmission
FROM cars
WHERE Selling_Price > 500000;


-- 18. Use the VIEW
SELECT *
FROM expensive_cars;


-- 19. Count expensive cars
SELECT COUNT(*) AS Total_Expensive_Cars
FROM expensive_cars;