--Select * from PortfolioProject..[CovidDeaths(csv)]
--Select * from PortfolioProject..[CovidVaccinations(csv)]

select location,date,total_cases, new_cases,total_deaths,population
from PortfolioProject..[CovidDeaths(csv)]
order by 1,2

--likeliness of death
select location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as deaths_percent_per_case
from PortfolioProject..[CovidDeaths(csv)]
--where location like '%states' --only ending in states
-- group by location --cant, either all cols in group by or in aggregate functions in select statement (see below eg.)
order by 1,2

--SELECT 
--    location, 
--    AVG(total_cases) AS avg_cases, 
--    AVG(total_deaths) AS avg_deaths, 
--    (AVG(total_deaths) / AVG(total_cases)) * 100 AS deaths_percent_per_case
--FROM PortfolioProject..[CovidDeaths(csv)]
--GROUP BY location
--ORDER BY 1;


--percentage of population with covid 
select location,date,total_cases, population,(total_cases/population)*100
from PortfolioProject..[CovidDeaths(csv)]
order by 1,2

--select location, max(total_cases) from PortfolioProject..[CovidDeaths(csv)] group by location
--max infected countries
select location, max(total_cases) as max_total_cases,population, (max((total_cases/population)*100)) as infected_maximum_percentage
from PortfolioProject..[CovidDeaths(csv)]
group by location, population
order by infected_maximum_percentage desc

--highest death count by country/continent
select continent, max(cast(total_deaths as int)) as death_count
from PortfolioProject..[CovidDeaths(csv)]
where continent is not null
group by continent
order by death_count desc

--global deaths percent everyday
select date, SUM(cast(new_deaths as int)) as new_death_sum, SUM(cast(new_cases as int)) as new_cases_sum, (SUM(cast(new_deaths as int))*100)/SUM((new_cases)) as death_percentage --either dont case new cases as int or use float or *100 in numerator
from PortfolioProject..[CovidDeaths(csv)]
where continent is not null
group by date
order by 1 desc

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select * from PortfolioProject..[CovidVaccinations(csv)]


--join on date,loc
select * from PortfolioProject..[CovidVaccinations(csv)] as vacc
join PortfolioProject..[CovidDeaths(csv)] as death
on vacc.location=death.location and death.date=vacc.date
 
 --population vs vaccinations

 select death.continent,death.location,death.date, death.population,vacc.new_vaccinations from PortfolioProject..[CovidVaccinations(csv)] as vacc
join PortfolioProject..[CovidDeaths(csv)] as death
on vacc.location=death.location and death.date=vacc.date
where death.continent is not null
order by 2,3


--running total
 select death.continent,death.location,death.date, death.population,vacc.new_vaccinations, SUM(CONVERT(float,new_vaccinations)) OVER (PARTITION BY death.location ORDER BY death.date) as running_total_daily_cases --ORDER BY date)
 from PortfolioProject..[CovidVaccinations(csv)] as vacc
join PortfolioProject..[CovidDeaths(csv)] as death
on vacc.location=death.location and death.date=vacc.date
where death.continent is not null
order by 2,3


--using cte for a newly made col
with xyz_cte(Continent, Loc, Date, Pop, New_Vacc, Running_total_daily_cases) --dont specify col for window functions but do include any possible col you are going to use later
as(
 select death.continent,death.location,death.date, death.population,vacc.new_vaccinations, SUM(CONVERT(float,new_vaccinations)) OVER (PARTITION BY death.location ORDER BY death.date) as running_total_daily_cases --ORDER BY date)
 --(running_total_daily_cases)/(death.population)*100 as percent_cases_vacc
 from PortfolioProject..[CovidVaccinations(csv)] as vacc
join PortfolioProject..[CovidDeaths(csv)] as death
on vacc.location=death.location and death.date=vacc.date
where death.continent is not null
--order by 2,3 --cant use order by in cte 
)
select * from xyz_cte 

--same as bove using temp table 
create table #temp_name (Continent nvarchar(50), Loc nvarchar(50), Date nvarchar(50), Pop numeric, New_Vacc numeric, Running_total_daily_cases numeric)

insert into #temp_name 
select death.continent,death.location,death.date, death.population,vacc.new_vaccinations, SUM(CONVERT(float,new_vaccinations)) OVER (PARTITION BY death.location ORDER BY death.date) as running_total_daily_cases --ORDER BY date)
 --(running_total_daily_cases)/(death.population)*100 as percent_cases_vacc
 from PortfolioProject..[CovidVaccinations(csv)] as vacc
join PortfolioProject..[CovidDeaths(csv)] as death
on vacc.location=death.location and death.date=vacc.date
where death.continent is not null
order by 2,3

select (running_total_daily_cases)/(Pop)*100 as percent_cases_vacc from #temp_name

