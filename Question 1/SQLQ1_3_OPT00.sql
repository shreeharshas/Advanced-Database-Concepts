/****** Script for SelectTopNRows command from SSMS  ******/
SELECT P.[pid],P.[name], P.ARP
  FROM	[AdvancedDB_Assignment].[dbo].[Players] P
  WHERE P.pid IN 
		(SELECT T.pid              --, SUM(C.credit) AS TotalCredit
			FROM [AdvancedDB_Assignment].[dbo].[Take] T, [AdvancedDB_Assignment].[dbo].[Camps] C
			WHERE T.cid = C.cid
			GROUP BY T.pid
			HAVING SUM(C.credit) >= 90
		)		
  AND P.ARP > 5
  AND P.university = ALL
		(
		 SELECT R.university FROM [AdvancedDB_Assignment].[dbo].[RequiredCamps] R--, [AdvancedDB_Assignment].[dbo].[Players] P2
		 --WHERE R.university = P2.university
		 )