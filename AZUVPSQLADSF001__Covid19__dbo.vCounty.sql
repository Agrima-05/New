SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




CREATE VIEW [dbo].[vCounty]
AS
SELECT        Id, FipsCodeNum, FIPSCode, [County Name], c.State, [State ANSI], [County ANSI], [ANSI Cl], Latitude, Longitude, s.StateName
FROM            Global.dbo.County c left join Global.dbo.StateNames s on c.State = s.State
UNION ALL
SELECT        Id, FipsCodeNum, FIPSCode, [County Name], c.State, [State ANSI], [County ANSI], null [ANSI Cl], null Latitude, null Longitude, s.StateName
FROM            CountySup c left join Global.dbo.StateNames s on c.State = s.State





