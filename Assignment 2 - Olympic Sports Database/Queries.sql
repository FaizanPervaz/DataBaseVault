--20I-0565
--Faizan Pervaz

--a
SELECT DISTINCT s.sport_name
FROM sport s;

--b
SELECT e.event_name from sport as s
JOIN event as e on e.sport_id=s.id
WHERE s.sport_name='Alpine Skiing';

--c
SELECT DISTINCT c.city_name
FROM games_city g
JOIN city c ON g.city_id = c.id;

--d
SELECT g.games_name
FROM games g 
WHERE g.games_year>=1896
ORDER by g.games_year ASC;

--e
SELECT g.games_year
FROM Games g
GROUP BY g.games_year
HAVING COUNT(DISTINCT g.season) = 2;

--f
SELECT DISTINCT g.games_name
FROM olympics.dbo.games_city gc
JOIN olympics.dbo.Games g ON gc.games_id = g.id
GROUP BY g.games_name
HAVING COUNT(DISTINCT gc.city_id) > 1;

--g
select noc as 'NOC', region_name as 'Country Name' from noc_region;

--h 
SElECT p.full_name, p.gender, p.height, p.weight_
FROM person as p

--i
SELECT p.full_name,COUNT(pr.region_id) as 'No Of Countries Represented'
FROM person p
JOIN person_region as pr 
ON pr.person_id = p.id
GROUP BY p.full_name
HAVING COUNT(pr.region_id)>1;

--j
SELECT e.event_name, p.full_name, m.medal_name
FROM competitor_event as ce 
JOIN Event as e on ce.event_id = e.id 
JOIN medal as m on m.id = ce.medal_id
JOIN games_competitor as gc on gc.id = ce.competitor_id
JOIN person as p on p.id = gc.person_id
WHERE ce.medal_id = '1' or ce.medal_id = '2' or ce.medal_id = '3';

--k
SELECT top(3) nr.region_name, COUNT(*) as count
FROM noc_region as nr
JOIN person_region as pr ON pr.region_id = nr.id
JOIN person as p ON p.id = pr.person_id
JOIN games_competitor as gc ON gc.person_id = p.id
JOIN games as g ON g.id = gc.games_id
JOIN competitor_event as ce ON gc.id = ce.competitor_id
JOIN medal as m ON ce.medal_id = m.id
WHERE m.medal_name = 'Gold' AND g.season = 'Summer'
GROUP BY nr.region_name
ORDER BY count DESC;

--l
SELECT gender, AVG(height) as 'AVG Height'
FROM person
GROUP BY gender;

--m 

-- Most Medals Collectively
SELECT top(1) p.full_name, COUNT(*) as most_medals
FROM noc_region as nr
JOIN person_region as pr ON pr.region_id = nr.id
JOIN person as p ON p.id = pr.person_id
JOIN games_competitor as gc ON gc.person_id = p.id
JOIN games as g ON g.id = gc.games_id
JOIN competitor_event as ce ON gc.id = ce.competitor_id
JOIN medal as m ON ce.medal_id = m.id
WHERE ce.medal_id = '1' or ce.medal_id = '2' or ce.medal_id = '3'
GROUP BY p.full_name
ORDER by most_medals DESC;

--Most Medals Indvidually
SELECT top(1) p.full_name, COUNT(*) as most_golds
FROM noc_region as nr
JOIN person_region as pr ON pr.region_id = nr.id
JOIN person as p ON p.id = pr.person_id
JOIN games_competitor as gc ON gc.person_id = p.id
JOIN games as g ON g.id = gc.games_id
JOIN competitor_event as ce ON gc.id = ce.competitor_id
JOIN medal as m ON ce.medal_id = m.id
WHERE ce.medal_id = '1'
GROUP BY p.full_name
ORDER by most_golds DESC;

SELECT top(1) p.full_name, COUNT(*) as most_silvers
FROM noc_region as nr
JOIN person_region as pr ON pr.region_id = nr.id
JOIN person as p ON p.id = pr.person_id
JOIN games_competitor as gc ON gc.person_id = p.id
JOIN games as g ON g.id = gc.games_id
JOIN competitor_event as ce ON gc.id = ce.competitor_id
JOIN medal as m ON ce.medal_id = m.id
WHERE ce.medal_id = '2' 
GROUP BY p.full_name
ORDER by most_silvers DESC;

SELECT top(1) p.full_name, COUNT(*) as most_bronze
FROM noc_region as nr
JOIN person_region as pr ON pr.region_id = nr.id
JOIN person as p ON p.id = pr.person_id
JOIN games_competitor as gc ON gc.person_id = p.id
JOIN games as g ON g.id = gc.games_id
JOIN competitor_event as ce ON gc.id = ce.competitor_id
JOIN medal as m ON ce.medal_id = m.id
WHERE ce.medal_id = '3'
GROUP BY p.full_name
ORDER by most_bronze DESC;

--n	
SELECT e.event_name
FROM event AS e
JOIN competitor_event AS ce1 ON e.id = ce1.event_id
JOIN competitor_event AS ce2 ON e.id = ce2.event_id
JOIN games_competitor AS gc1 ON ce1.competitor_id = gc1.id
JOIN games_competitor AS gc2 ON ce2.competitor_id = gc2.id
JOIN person_region AS pr1 ON gc1.person_id = pr1.person_id
JOIN person_region AS pr2 ON gc2.person_id = pr2.person_id
JOIN noc_region AS nr1 ON pr1.region_id = nr1.id
JOIN noc_region AS nr2 ON pr2.region_id = nr2.id
WHERE
    ce1.medal_id = (SELECT id FROM medal WHERE medal_name = 'Gold') 
	AND	ce2.medal_id = (SELECT id FROM medal WHERE medal_name = 'Silver') 
	AND nr1.region_name = nr2.region_name;

--o
SELECT distinct p.full_name, COUNT(p.full_name) as competed
FROM noc_region as nr
JOIN person_region as pr ON pr.region_id = nr.id
JOIN person as p ON p.id = pr.person_id
JOIN games_competitor as gc ON gc.person_id = p.id
JOIN games as g ON g.id = gc.games_id
GROUP BY p.full_name
Order by competed DESC;

--p No Result Showing
SELECT c.city_name,g.season
FROM noc_region as nr
JOIN person_region as pr ON pr.region_id = nr.id
JOIN person as p ON p.id = pr.person_id
JOIN games_competitor as gc ON gc.person_id = p.id
JOIN games as g ON g.id = gc.games_id
JOIN games_city as gcity ON g.id = gcity.city_id
JOIN city as c ON c.id = gcity.city_id
JOIN competitor_event as ce ON gc.id = ce.competitor_id
GROUP BY c.city_name,g.season
HAVING COUNT(distinct g.season) = 2

--q
SELECT e.event_name
FROM olympics.dbo.competitor_event ce
JOIN olympics.dbo.Event e ON ce.event_id = e.id
JOIN olympics.dbo.games_competitor gc ON ce.competitor_id = gc.id
JOIN olympics.dbo.Games g ON gc.games_id = g.id
JOIN olympics.dbo.games_city gc2 ON g.id = gc2.games_id
JOIN olympics.dbo.city c ON gc2.city_id = c.id
WHERE g.season = 'Summer' AND c.city_name = 'Sydney';

--r
SELECT distinct p.full_name, nr.region_name 
FROM  games as g 
JOIN games_competitor as gc on g.id = gc.games_id
JOIN competitor_event as ce on ce.competitor_id = gc.id
JOIN person as p on p.id = gc.person_id
JOIN person_region as pr on pr.person_id = p.id
JOIN noc_region as nr on nr.id = pr.region_id
WHERE g.season = 'Summer' AND g.games_year = 2016 AND ce.medal_id IN ('1','2','3');

--s
SELECT nr.region_name,COUNT(*) as Total_Gold_Medals
FROM noc_region as nr
JOIN person_region as pr ON pr.region_id = nr.id
JOIN person as p ON p.id = pr.person_id
JOIN games_competitor as gc ON gc.person_id = p.id
JOIN games as g ON g.id = gc.games_id
JOIN competitor_event as ce ON gc.id = ce.competitor_id
JOIN medal as m ON ce.medal_id = m.id
WHERE m.medal_name = 'Gold' AND g.season = 'Winter'
GROUP BY nr.region_name
ORDER BY Total_Gold_Medals DESC;

--t
Select p.full_name, COUNT(distinct g.season) as Season
From person as p
Join games_competitor as gc on gc.person_id = p.id
Join games as g on g.id = gc.games_id
Group by p.full_name
Having COUNT(distinct Season) > 1; 

--u
SELECT e.event_name, c.city_name
FROM city as c
JOIN games_city as gc on gc.city_id = c.id
JOIN games as g on g.id = gc.games_id
JOIN games_competitor g_comp ON g.id = g_comp.games_id
JOIN competitor_event as ce ON ce.competitor_id = g_comp.id
JOIN event as e on e.id = ce.event_id
WHERE g.games_year = 2012 AND g.season = 'Summer'

--v
SELECT top(5) nr.region_name, COUNT(*) as No_Of_Females
From person as p
JOIN person_region as pr ON pr.person_id = p.id
JOIN noc_region as nr ON nr.id = pr.region_id
JOIN games_competitor as gc on gc.person_id = p.id
JOIN games as g on g.id= gc.games_id
WHERE p.gender='F' AND g.season = 'Winter'
GROUP BY nr.region_name
Order By No_Of_Females DESC;

--Bonus Query
--List all the unique sports that were part of the 2016 Summer Olympics.
SELECT distinct(s.sport_name), g.games_year, g.season
FROM sport as s
JOIN event as e on e.sport_id = s.id
JOIN competitor_event as ce on ce.event_id = e.id
JOIN games_competitor as gc on gc.id = ce.competitor_id
JOIN games as g on g.id = gc.games_id
WHERE g.games_year = 2016 AND g.season = 'Summer';


--top 5 countries jinki avg age of participants sabse zyada
SELECT TOP 5 nr.noc, avg(gc.age) AS avgage
FROM noc_region as nr
JOIN person_region as pr ON nr.id = pr.region_id
JOIN games_competitor gc ON pr.person_id = gc.person_id
GROUP BY nr.noc
ORDER BY avgage DESC;

