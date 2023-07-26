SELECT * FROM CovidDea1
ORDER BY 3,4

SELECT * FROM CovidVaccinations
ORDER BY 3,4

SELECT location,date,total_cases,new_cases,total_deaths,population
FROM CovidDea1
ORDER BY 1,2

SELECT location, date,total_cases,total_deaths,(CAST(total_deaths AS FLOAT)/CAST(total_cases AS FLOAT))*100 AS DeathPercentage
 FROM CovidDea1
 WHERE location like '%states'
 ORDER BY 1,2
 
-- Looking at total cases versus total deaths 
SELECT location, date,total_cases,total_deaths,(CAST(total_deaths AS FLOAT)/CAST(total_cases AS FLOAT))*100 AS DeathPercentage
 FROM CovidDea1
 WHERE location like 'Ind%'
 ORDER BY 1,2

--  LOOKING AT TOTAL CASES VS POPULATION
-- WHAT PERCENTAGE OF POPULATION GOT COVID
SELECT location, date,population,total_cases,(CAST(total_cases AS FLOAT)/CAST(population AS FLOAT))*100 AS CasePercentage
 FROM CovidDea1
 WHERE location like 'Ind%'
 ORDER BY 1,2
 
--  LOOKING AT COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POPULATION
SELECT location,population,MAX(total_cases) AS HighestinfectionCount,MAX((CAST(total_cases AS FLOAT)/CAST(population AS FLOAT))*100) AS Percentpopulationinfected
 FROM CovidDea1
--  WHERE location like 'Ind%'
 GROUP BY location,population
 ORDER BY Percentpopulationinfected DESC
 
--  showing countries with highest death count per population
SELECT location, max(total_deaths) as Total_death_count
FROM CovidDea1
GROUP BY location
ORDER BY total_death_count DESC


 
 
 