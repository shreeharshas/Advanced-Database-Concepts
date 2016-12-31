SELECT * FROM Player P
	INNER JOIN(
SELECT MAX(rating), pid
  	FROM Camps
  	WHERE name = 'Shooting’ ) N
ON P.pid = N.pid
