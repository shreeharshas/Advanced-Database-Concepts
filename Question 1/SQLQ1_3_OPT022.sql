SELECT P.pid, P.name, P.university, R.[cid]
  FROM	[AdvancedDB_Assignment].[dbo].[Players] P,
		[AdvancedDB_Assignment].[dbo].[Take] T,
		[AdvancedDB_Assignment].[dbo].[RequiredCamps] R
  WHERE P.pid = T.pid AND R.cid = T.cid
  AND EXISTS (SELECT R.university
									 FROM [AdvancedDB_Assignment].[dbo].[RequiredCamps] R 
									 WHERE T.cid = R.cid AND P.university = R.university AND P.pid = T.pid)
									  AND EXISTS(SELECT R.cid
													   FROM [AdvancedDB_Assignment].[dbo].[RequiredCamps] R 
													   WHERE T.cid = R.cid AND P.university = R.university AND P.pid = T.pid
												)
  GROUP BY P.pid, P.name, P.university, R.[cid]
  ORDER BY P.university, R.[cid], P.pid, P.name

--SELECT * FROM [AdvancedDB_Assignment].[dbo].[RequiredCamps] R, [AdvancedDB_Assignment].[dbo].[Take] T2,[AdvancedDB_Assignment].[dbo].[Players] P WHERE T2.cid = R.cid AND P.university= R.university AND P.pid = T2.pid
  
--SELECT concat(R.cid,R.university) FROM [AdvancedDB_Assignment].[dbo].[RequiredCamps] R

  --SELECT P.pid, P.name, P.height, P.age, P.university, P.ARP, T.cid, T.season, T.year, T.rating
  --FROM	[AdvancedDB_Assignment].[dbo].[Players] P,
		--[AdvancedDB_Assignment].[dbo].[Take] T
  --WHERE P.pid = T.pid
  --GROUP BY P.pid, P.name, P.height, P.age, P.university, P.ARP, T.cid, T.season, T.year, T.rating
  --ORDER BY P.pid, P.name, P.height, P.age, P.university, P.ARP, T.cid, T.season, T.year, T.rating

  --  SELECT *
  --FROM	[AdvancedDB_Assignment].[dbo].[Take] T,
		--[AdvancedDB_Assignment].[dbo].[Camps] C
  --WHERE T.cid = C.cid
  --GROUP BY P.pid, P.name, P.height, P.age, P.university, P.ARP, T.cid, T.season, T.year, T.rating
  --ORDER BY P.pid, P.name, P.height, P.age, P.university, P.ARP, T.cid, T.season, T.year, T.rating