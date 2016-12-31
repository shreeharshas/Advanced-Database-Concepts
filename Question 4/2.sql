CREATE TABLE Outcomes (
ship varchar (50) REFERENCES Ship(name) CHECK ( ship IN (SELECT name from Ships S WHERE ship = S.name AND S.launched NOT NULL),
battle varchar(50) REFERENCES Battle(name)
)
CREATE UNIQUE INDEX Ship_Battle_unique on Outcomes(ship, battle)
