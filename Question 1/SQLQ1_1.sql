/****** Script for SelectTopNRows command from SSMS  ******/
SELECT P.name,P.height,P.ARP
  FROM AdvancedDB_Assignment.dbo.Players P, AdvancedDB_Assignment.dbo.[Take] T,[AdvancedDB_Assignment].[dbo].[Squad] S
  WHERE P.pid = T.pid AND T.cid = S.cid
  AND S.qid IN(
			SELECT I.qid 
			FROM [AdvancedDB_Assignment].[dbo].[InSquad] I, AdvancedDB_Assignment.dbo.Players P2
			WHERE P2.pid = I.pid AND P2.university=P.university AND P2.name = 'Karl')
  GROUP BY P.name, P.height,P.ARP