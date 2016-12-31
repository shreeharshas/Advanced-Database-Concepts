CREATE VIEW vw_MxShoot
(
SELECT MAX(rating), pid
  	FROM Camps
  	WHERE name = 'Shooting’
)

SELECT P.pid, P.name, P.height, P.age, P.university, P.ARP 
FROM Players P, vw_MxShoot M
WHERE P.pid = M.pid
