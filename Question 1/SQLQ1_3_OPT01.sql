/****** Script for SelectTopNRows command from SSMS  ******/
SELECT P.name, P.height, P.age, P.university, P.ARP
  FROM	[AdvancedDB_Assignment].[dbo].[Players] P, [AdvancedDB_Assignment].[dbo].[Take] T, [AdvancedDB_Assignment].[dbo].[RequiredCamps] R
  WHERE 
		P.pid = T.pid
		AND NOT EXISTS
			(
				SELECT DISTINCT(C.cid)
				FROM [AdvancedDB_Assignment].[dbo].[Camps] C, [AdvancedDB_Assignment].[dbo].[Players] P2, 
				[AdvancedDB_Assignment].[dbo].[Take] T2
				WHERE T2.pid = P2.pid
				AND T2.cid = c.cid
				AND T.pid = P2.pid
				AND T2.cid = ALL(
					SELECT DISTINCT(R2.cid) 
					FROM [AdvancedDB_Assignment].[dbo].[RequiredCamps] R2
					WHERE C.cid = R2.cid AND P2.university = R2.university
				)
			)
  GROUP BY P.name, P.height, P.age, P.university, P.ARP