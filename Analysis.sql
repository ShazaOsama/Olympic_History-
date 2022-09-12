-- Olympic History General Information:
--the beginning and ending years
Select Min(Year) AS Beginning_years,MAX(Year) AS Ending_year 
From Athlete_Events;

--How many Olympics have been held in 120 years?
Select Count(Distinct Games)
From Athlete_Events;

--total number of medals by season
Select Season,Count(medal) AS total_num_of_medals
From Athlete_Events
Where medal <> 'NA'
Group By Season;

--Gender In Olympic Games:
--gender ratio over seasons
SELECT 100*sum(case when Sex = 'M' then 1 else 0 end)/count(*) as male_ratio,
100*sum(case when Sex = 'F' then 1 else 0 end)/count(*) as female_ratio
FROM Athlete_Events;

--gender number over medal?
SELECT Medal,sum(case when Sex = 'M' then 1 else 0 end) as male
,sum(case when Sex = 'F' then 1 else 0 end) as female
FROM Athlete_Events 
WHERE Medal<>'NA' 
Group By Medal;

--Region Analyze:
--Which country has the most athletes?
Select NOC_Regions.region,
Count(Distinct Athlete_Events.Name) AS num_of_athletes
From Athlete_Events 
INNER JOIN NOC_Regions ON NOC_Regions.NOC = Athlete_Events.NOC
Group By NOC_Regions.region
ORDER BY num_of_athletes DESC
Limit 1;

--medal count by country
Select NOC_Regions.region,Count(Medal) AS medal_count
From Athlete_Events
Inner JOIN NOC_Regions ON NOC_Regions.NOC = Athlete_Events.NOC
Where Medal<>'NA'
Group By NOC_Regions.region;

--Athlete Performance:
--Who has participated in the most Olympic Games?
Select Name,Count(Distinct Games) AS no_of_Games
From Athlete_Events
Group By Name 
Order By no_of_Games DESC
Limit 1;

Who are top athletes by medal?
select name, gender, sport, count (medal) as Medal_Count
from olympic_history
group by name, gender, sport
order by Medal_Count desc;
--top athletes by medal
Select Name,Count(Medal) AS count_medal
From Athlete_Events
Group By Name 
Order By count_medal DESC
Limit 1;