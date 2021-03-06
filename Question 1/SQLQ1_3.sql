/****** Script for SelectTopNRows command from SSMS  ******/
SELECT P.[pid],P.[name]
  FROM	[AdvancedDB_Assignment].[dbo].[Players] P
  WHERE P.pid IN 
		(SELECT T.pid
			FROM [AdvancedDB_Assignment].[dbo].[Take] T, [AdvancedDB_Assignment].[dbo].[Camps] C
			WHERE T.cid = C.cid AND T.pid = P.pid
			GROUP BY T.pid
			HAVING SUM(C.credit) >= 90
		)		
  AND P.ARP > 5
  AND P.pid != ALL
		(
		 SELECT T.pid FROM [AdvancedDB_Assignment].[dbo].[Take] T
		 WHERE T.cid != ALL (SELECT R.cid FROM [AdvancedDB_Assignment].[dbo].[RequiredCamps] R WHERE T.cid = R.cid AND T.pid = P.pid)
		 )