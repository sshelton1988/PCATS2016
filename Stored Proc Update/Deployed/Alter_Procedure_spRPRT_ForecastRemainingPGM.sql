USE [RSManpowerSchDb]
GO
/****** Object:  StoredProcedure [dbo].[spRPRT_ForecastRemainingPGM]    Script Date: 3/21/2016 12:59:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dbo].[spRPRT_ForecastRemainingPGM]
AS





/*
EXEC [dbo].[spRPRT_ForecastRemaining]
*/


SELECT 
	p.ID as project_id
	, v.project
	, v.ftc
	, v.GroupCode
INTO #temp FROM vwFTCForProjecGroups v
JOIN DT_Projects p on v.project = p.Number AND p.Deleted = 0 AND p.IsActive = 1
 where ftc > 0




SELECT * FROM (


SELECT 

	proj.Number
	,cust.[Name] AS [Customer]
	,proj.[Description]

	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 11000), 0) as ftc11000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 12000), 0) as ftc12000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 13000), 0) as ftc13000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 14000), 0) as ftc14000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 15000), 0) as ftc15000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 16000), 0) as ftc16000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 17000), 0) as ftc17000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 18000), 0) as ftc18000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 19000), 0) as ftc19000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 20000), 0) as ftc20000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 21000), 0) as ftc21000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 22000), 0) as ftc22000
	, ISNULL( (SELECT SUM(ROUND( ftc ,0,0 )) FROM #temp where project_id = proj.ID and GroupCode = 50000), 0) as ftc50000
		
	,[Status] = CASE
		WHEN proj.[ReportingStatus] = 1 THEN 'IA'
		WHEN proj.[ReportingStatus] = 2 THEN 'H'
		ELSE 'A'
	END
	,proj.ID as [ProjectID]
	

FROM DT_Projects proj
LEFT JOIN DT_Customers cust ON proj.[CustomerID] = cust.[ID]
WHERE
	CHARINDEX('X',proj.Number) < 1
	AND proj.[Deleted] = 0
	
	-- only 0.* and 7.*
	AND ( LEFT(proj.[Number],2) = '3.' OR LEFT(proj.[Number],2) = '6.' OR LEFT(proj.[Number],3) = '5.M') -- Added 8/27

	
) sums
WHERE ftc11000 + ftc12000 + ftc13000 + ftc14000 + ftc15000 + ftc16000 + ftc17000 + ftc18000 + ftc19000 + ftc20000 + ftc21000 + ftc22000 + ftc50000  > 0
ORDER BY [Number] ASC


DROP Table #temp





