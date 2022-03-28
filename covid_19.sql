
--Total cases recorded worldwide as at 14-01-2022
select convert(date,(max(date))) as 'Current date',sum(distinct(population)) as 'world population',sum(new_cases) as 'total cases', 
sum(new_deaths) as 'total deaths', sum(new_Cases)/sum(distinct(population))*100 as 'Infection rate',
sum(new_deaths)/sum(distinct(population))*100  as 'death rate' from covidDeath where continent not in ('')

--cases recorded by each continents
select continent,sum(distinct(population)) as population,sum(new_Cases) as 'total cases', sum(new_deaths) as 'total deaths',
sum(new_Cases)/sum(distinct(population))*100 as 'Infection rate',sum(new_deaths)/sum(distinct(population))*100  as 'death rate'
from covidDeath where continent not in ('') group by continent order by continent

--cases recorded per countries
select continent,location, population,sum(new_Cases) as 'total cases',sum(new_deaths) as 'total deaths', 
sum(new_cases)/nullif(population,0)*100 as 'Infection rate',sum(new_deaths)/nullif(population,0)*100 as 'Death rate'
from covidDeath where continent not in ('')
group by location,population,continent order by location

--Top 10 countrie with highest record of covid 19
select top 10 continent, location, max(population) as 'population', sum(new_cases) as 'Total cases' from coviddeath
where continent not in ('') group by continent, location order by [Total cases] desc

--countries with no recorded case of covid 19
select continent, location, max(population) as 'population' from covidDeath where continent not in ('')
group by location, continent having sum(new_cases) <= 0 and sum(population) > 0

-- top 10 countries with highest rate of infection
select top 10 continent,location, population,sum(new_Cases) as 'total cases', sum(new_cases)/nullif(population,0)*100 as 'Infection rate'
from covidDeath where continent not in ('') group by location,population,continent order by [Infection rate] desc

--Top 10 countries with highest death rate
select top 10 continent,location,population,sum(new_deaths) as 'total deaths',sum(new_deaths)/nullif(population,0)*100 as 'Death rate'
from covidDeath where continent not in ('') group by location,continent,population order by [Death rate] desc


--AFRICA
--Total cases recorded in Africa
select convert(date,max(date)) as 'Current date',sum(distinct(population)) as 'Africa population',sum(new_cases) as 'total cases', 
sum(new_deaths) as 'total deaths', sum(new_Cases)/sum(distinct(population))*100 as 'Infection rate',
sum(new_deaths)/sum(distinct(population))*100  as 'death rate' from covidDeath where continent = 'Africa'

--Top 10 African country with highest record of covid19
select top 10 location, population, sum(new_cases) as 'total cases', sum(new_deaths) as 'total deaths',
sum(new_cases)/nullif(population,0)*100 as 'infection rate', sum(new_deaths)/nullif(population,0)*100 as 'death rate'
from coviddeath where continent = 'africa' group by location, population order by [total cases] desc

--top 10 african countries with highest rate of infection
select top 10 location, population, sum(new_cases) as 'total cases', sum(new_cases)/nullif(population,0)*100 as 'infection rate'
from coviddeath where continent = 'africa' group by location, population order by [infection rate] desc

--Top 10 African countries with highest death rate
select top 10 location, population, sum(new_deaths) as 'total deaths', sum(new_deaths)/nullif(population,0)*100 as 'death rate'
from coviddeath where continent = 'africa' group by location, population order by [death rate] desc

--percentage of population vaccinated 
select location,max(population) as 'population', max(people_vaccinated) as 'people vaccinated',
round((max(people_vaccinated)/MAX(population)*100),2) as 'percentage of people vaccinated' from covidVaccinated11
where continent = 'africa' group by location order by location





