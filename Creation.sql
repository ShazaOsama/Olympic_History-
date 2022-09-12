Create table Athlete_Events
(
	ID numeric,
	Name text,
	Sex varchar,
	Age int,
	Height float,
	Weight float,
	Team text,
	NOC varchar,
	Games text,
	Year int,
	Season varchar,
	City text,
	Sport text,
	Event text,
	Medal varchar	
);
COPY Athlete_Events FROM 'C:\athlete_events.csv' DELIMITER ',' CSV HEADER null 'NA';

Create table NOC_Regions
(
	NOC varchar,
	region text,
	notes text
);
COPY NOC_Regions FROM 'C:\noc_regions.csv' DELIMITER ',' CSV HEADER null '';