/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT([Commodity]), Sum(T.Quantity) OVER (PARTITION BY Commodity) --- T.Quantity
  FROM [AdvancedDB_Assignment].[dbo].[Trade] T
  WHERE T.price>100000
  AND T.Commodity IN
  (SELECT T2.Commodity FROM [AdvancedDB_Assignment].[dbo].[Trade] T2
   WHERE T.Commodity = T2.Commodity)