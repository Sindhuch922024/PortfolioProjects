Select *
From PortfolioProject..CovidDeaths
Where continent is not null
order by 3,4

Select *
From PortfolioProject..CovidVaccinations
order by 3,4

Select location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
order by 1,2
--Total cases vs Total Deaths

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Deathpercentage
From CovidDeaths
Where location like '%United%'
order by 1,2

----Total cases vs Population 
---Shows what % of population are affected by Covid
Select location, date, total_cases, population, (total_cases/population)*100 as Deathpercentage
From CovidDeaths
order by 1,2

-----Countries with highest cases per population
Select location, population, MAX(total_cases) as Highest_Infected_Count, MAX((total_cases/population))*100 as Highest_Infected_percentage
From CovidDeaths
Group by location,population
order by Highest_Infected_percentage desc

--Countries with hishest death count per population

Select location, MAX(cast(total_deaths as int)) as Highest_Death_Count
From CovidDeaths
Where continent is not null
Group by location
order by Highest_Death_Count desc

---Calculating Global values
Select SUM(new_cases) as Total_cases, SUM(cast(new_deaths as int)) as Total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases) *100 as DeathPercentage
From CovidDeaths
Where continent is not null
--Group by location
order by 1,2

------------------------------------------------------
--Total Population Vs Vaccination

Select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
From CovidDeaths dea 
Join CovidVaccinations vac 
     on dea.location = vac.location 
	 and dea.date = vac.date
Where dea.continent is not null
order by 3

