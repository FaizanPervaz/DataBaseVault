DROP DATABASE IF EXISTS olympics;
CREATE DATABASE olympics;

CREATE TABLE olympics.dbo.medal (
    id INT PRIMARY KEY,
    medal_name VARCHAR(255)
);

--Noc_Region data
CREATE TABLE olympics.dbo.noc_region (
    id INT PRIMARY KEY,
    noc VARCHAR(255),
    region_name VARCHAR(255)
);

--sports data
Create Table olympics.dbo.sport(
	id Int Primary Key,
	sport_name VARCHAR(255)
);

-- City data
CREATE TABLE olympics.dbo.city (
    id INT PRIMARY KEY,
    city_name VARCHAR(255)
);

-- Event data
CREATE TABLE olympics.dbo.Event (
    id INT PRIMARY KEY,
    sport_id INT,
    event_name VARCHAR(255),
    FOREIGN KEY (sport_id) REFERENCES olympics.dbo.sport(id) 
);

-- Games data
CREATE TABLE olympics.dbo.Games (
    id INT PRIMARY KEY,
    games_year INT,
    games_name VARCHAR(255),
    season VARCHAR(50)
);

--games_city data
CREATE TABLE olympics.dbo.games_city(
	games_id INT,
	city_id INT,
	Foreign Key (games_id) REFERENCES olympics.dbo.Games(id),
	Foreign Key (city_id) REFERENCES olympics.dbo.city(id)
);

--person data
CREATE TABLE olympics.dbo.person(
	id INT PRIMARY KEY,
	full_name VARCHAR(255),
	gender VARCHAR(255),
	height INT,
	weight_ INT
);

--person_region data
CREATE TABLE olympics.dbo.person_region(
	person_id int,
	region_id int,
	Foreign Key (person_id) REFERENCES olympics.dbo.person(id),
	Foreign Key (region_id) REFERENCES olympics.dbo.noc_region(id)
);

--games_competitor data
CREATE TABLE olympics.dbo.games_competitor(
	id int Primary Key,
	games_id int,
	person_id int,
	age int,
	Foreign Key (games_id) REFERENCES olympics.dbo.Games(id),
	Foreign Key (person_id) REFERENCES olympics.dbo.person(id)
);

--competitor_event data
CREATE TABLE olympics.dbo.competitor_event(
	event_id int,
	competitor_id int,
	medal_id int,
	Foreign Key (event_id) REFERENCES olympics.dbo.Event(id),
	Foreign Key (competitor_id) REFERENCES olympics.dbo.games_competitor(id),
	Foreign Key (medal_id) REFERENCES olympics.dbo.medal(id)
);
