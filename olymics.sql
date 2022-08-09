SELECT * FROM testdb.athlete_events;

SELECT * FROM testdb.noc_regions;

-- Number of Olypics

select count(distinct Year) from testdb.athlete_events;

-- total males

select count(sex) as males from testdb.athlete_events
where sex = 'm';

-- total females

select count(sex) as females from testdb.athlete_events
where sex = 'f';

-- gender ritios

-- males ratio
select (select count(sex) from testdb.athlete_events
where sex = 'm') / (select count(sex) from testdb.athlete_events);

-- females ratio

select (select count(sex) from testdb.athlete_events
where sex = 'f') / (select count(sex) from testdb.athlete_events);

-- youngest gold medalist 

Select * From testdb.athlete_events 
Where Age < 18
and Medal = 'gold'
Order By age asc;

-- oldest gold medalist

Select * From testdb.athlete_events 
Where Age > 50
and Medal = 'gold'
Order By age desc;

-- top 5 athletes to win most gold medals

select name, team, count(1) as gold_medals
from testdb.athlete_events
where medal = 'Gold'
group by name, team
order by gold_medals desc
limit 17;

-- USA top 10 most medals by sport

SELECT oh.sport as sport,count(1) as total_medals
FROM testdb.athlete_events oh
JOIN testdb.noc_regions nr 
ON nr.noc=oh.noc
where medal <> 'NA'And oh.NOC = 'USA'
GROUP BY oh.sport order BY total_medals desc
limit 10