CREATE TABLE incident_data_subset(
id SERIAL PRIMARY KEY,
Date DATE,
TABuilding VARCHAR(7),
Latitude double precision,
Longitude double precision,
JobTitle VARCHAR (40),
Factors1 VARCHAR (40),
Factors2 VARCHAR (40),
BodyParts VARCHAR (40),
Description TEXT
)