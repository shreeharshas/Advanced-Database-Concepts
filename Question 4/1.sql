CREATE TABLE Classes(
	class varchar(50) NOT NULL,
	type int NULL,
	country varchar(50) NULL,
	numGuns int NULL,
	bore int null,
	displacement int NULL
) ON PRIMARY

ALTER TABLE Classes WITH CHECK ADD CONSTRAINT CK_Classes CHECK  ((numGuns > 9 and bore <= 14) OR (numGuns <= 9 and bore > 14))
ALTER TABLE Classes CHECK CONSTRAINT CK_Classes
