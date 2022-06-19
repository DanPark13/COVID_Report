---- Show rows and columns of table
--SELECT TOP(5) *
--FROM [COVID-19_Analysis]..CovidDeaths;

-- Infection Rate vs Population
-- Shows what percentage of population infected with COVID 
SELECT Location, Population, MAX(total_cases) AS highest_infected_count,  Max((total_cases/population))*100 AS population_infected_percentage
FROM COVID19_Analysis..['covid-deaths']
GROUP BY Location, Population
ORDER BY population_infected_percentage DESC;

-- Death vs Infection Rate
-- Shows what percentage of population passed due to COVID Infection 
SELECT Location, Population, MAX(total_cases) AS highest_infected_count, MAX(total_deaths) AS total_deaths,  ((Max(total_deaths)/Max(total_cases)))*100 AS infected_death_percentage
FROM COVID19_Analysis..['covid-deaths']
WHERE continent IS NOT NULL and location != 'North Korea'
GROUP BY Location, Population
ORDER BY infected_death_percentage DESC;

-- Shows total death count by continent
SELECT continent, MAX(cast(Total_deaths as int)) as total_death_count
FROM COVID19_Analysis..['covid-deaths']
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count DESC;

-- Shows the percentage of total deaths and cases
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as death_percentage
FROM COVID19_Analysis..['covid-deaths']
WHERE continent IS NOT NULL;
