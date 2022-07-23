select * from africa..afro
select *from africa..apro

--looking at african countries by highest population

select * 
from africa..afro
where country is not null
order by population desc

--looking at african countries by subregion 

select distinct subregion, country, population
from africa..afro
where country is not null
order by subregion,population desc

--looking at population by subregion

select distinct subregion, population
from africa..afro
where POPULATION is not null

--looking at male and female population compare to the total population

select COUNTRY, SUBREGION,POPULATION, [MALE POP], [FEMALE POP],
([MALE POP]/POPULATION)*100 as MaleRate, 
([FEMALE POP]/POPULATION)*100 as FemaleRate
from africa..afro
where country is not null
order by SUBREGION



-- looking at total population by subregion

select SUBREGION,max(POPULATION) as SubPop
from africa..afro
where country is not null
group by SUBREGION
order by SubPop

-- looking at total population of africa

select sum(POPULATION) as PopAfri
from africa..afro


--looking at population density

select COUNTRY, SUBREGION,POPULATION, [ EREA M®],POPULATION/[ EREA M®] as Density
from africa..afro
where country is not null
order by SUBREGION

--joining tables

select * 
from africa..afro fa
join africa..apro pa
on fa.COUNTRY=pa.COUNTRY
and fa.POPULATION=pa.POPULATION

-- LOOKING at african country by colony and official language spoken

select fa.COUNTRY,pa.COLONY,pa.[OFFICIAL LANG]
from africa..afro fa
join africa..apro pa
on fa.COUNTRY=pa.COUNTRY
and fa.POPULATION=pa.POPULATION
order by COLONY asc,[OFFICIAL LANG]

-- LOOKING at african country with france colony only

select fa.COUNTRY,pa.COLONY,pa.[OFFICIAL LANG]
from africa..afro fa
join africa..apro pa
on fa.COUNTRY=pa.COUNTRY
and fa.POPULATION=pa.POPULATION
where pa.COLONY like '%France%'

-- LOOKING at african country with britain colony only

select fa.COUNTRY,pa.COLONY,pa.[OFFICIAL LANG]
from africa..afro fa
join africa..apro pa
on fa.COUNTRY=pa.COUNTRY
and fa.POPULATION=pa.POPULATION
where pa.COLONY like '%Britain%'

-- LOOKING at african country that never got colonized

select fa.COUNTRY,pa.COLONY,pa.[OFFICIAL LANG]
from africa..afro fa
join africa..apro pa
on fa.COUNTRY=pa.COUNTRY
and fa.POPULATION=pa.POPULATION
where pa.COLONY like '%never%'



--looking at african country with the highest GDP

select fa.COUNTRY,fa.POPULATION,pa.GDP,pa.[OFFICIAL LANG]
from africa..afro fa
join africa..apro pa
on fa.COUNTRY=pa.COUNTRY
and fa.POPULATION=pa.POPULATION
order by pa.GDP desc 

--looking at african country by dominant religion

select fa.COUNTRY,fa.POPULATION,pa.GDP,pa.[OFFICIAL LANG], pa.[DOMINANT RELIGION]
from africa..afro fa
join africa..apro pa
on fa.COUNTRY=pa.COUNTRY
and fa.POPULATION=pa.POPULATION
order by pa.[DOMINANT RELIGION]

--looking at african countries and number of language spoken

select fa.COUNTRY,fa.POPULATION,pa.GDP,pa.[OFFICIAL LANG], pa.[DOMINANT RELIGION], pa.[LANG SPOKEN]
from africa..afro fa
join africa..apro pa
on fa.COUNTRY=pa.COUNTRY
and fa.POPULATION=pa.POPULATION
order by pa.[LANG SPOKEN] desc

--looking at  total number of language spoken in african countries

select sum(pa.[LANG SPOKEN])
from africa..afro fa
join africa..apro pa
on fa.COUNTRY=pa.COUNTRY
and fa.POPULATION=pa.POPULATION

--cretaing view to store data for later visualization

create view maleRate as
select COUNTRY, SUBREGION,POPULATION, [MALE POP], [FEMALE POP],
([MALE POP]/POPULATION)*100 as MaleRate, 
([FEMALE POP]/POPULATION)*100 as FemaleRate
from africa..afro
where country is not null


