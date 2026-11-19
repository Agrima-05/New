SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


 CREATE view [dbo].[AgentsDRE_DirectDiv] 
 as
Select UPPER(ltrim(rtrim(a.[State]))) as State
,UPPER(ltrim(rtrim([License_Type]))) as License_Type
,UPPER(ltrim(rtrim(a.[License_Number]))) as License_Number
,UPPER(ltrim(rtrim([License_Status]))) as License_Status
,CAST([Original_License_Date] as DATE) as Original_License_Date
,CAST([Expiration_License_Date] as DATE) as Expiration_License_Date
,UPPER(ltrim(rtrim([License_First]))) as License_First
,UPPER(ltrim(rtrim([License_Middle]))) as License_Middle
,UPPER(ltrim(rtrim([License_Last]))) as License_Last
,UPPER(ltrim(rtrim([License_suffix]))) as License_suffix
,UPPER(ltrim(rtrim([License_FullName]))) as License_FullName
,UPPER(ltrim(rtrim([License_Email]))) as License_Email
,UPPER(ltrim(rtrim([License_Telephone]))) as License_Telephone
,UPPER(ltrim(rtrim([Telephone_Type]))) as Telephone_Type
,UPPER(ltrim(rtrim([2nd_License_Telephone]))) as [2nd_License_Telephone]
,UPPER(ltrim(rtrim([2nd__Telephone_Type]))) as [2nd_Telephone_Type]
,UPPER(ltrim(rtrim([3rd_License_Telephone]))) as [3rd_License_Telephone]
,UPPER(ltrim(rtrim([3rd__Telephone_Type]))) as [3rd_Telephone_Type]
,UPPER(ltrim(rtrim([License_Address_1]))) as License_Address_1
,UPPER(ltrim(rtrim([License_Address_2]))) as License_Address_2
,UPPER(ltrim(rtrim([License_City]))) as License_City
,UPPER(ltrim(rtrim([License_State]))) as License_State
,UPPER(ltrim(rtrim([License_Zip]))) as License_Zip
,UPPER(ltrim(rtrim([License_County]))) as License_County
,UPPER(ltrim(rtrim([License_Full_Address]))) as License_Full_Address
,UPPER(ltrim(rtrim([Office_Name]))) as Office_Name
,UPPER(ltrim(rtrim([Office_Address_1]))) as Office_Address_1
,UPPER(ltrim(rtrim([Office_Address_2]))) as Office_Address_2
,UPPER(ltrim(rtrim([Office_City]))) as Office_City
,UPPER(ltrim(rtrim([Office_State]))) as Office_State
,UPPER(ltrim(rtrim([Office_Zip]))) as Office_Zip
,UPPER(ltrim(rtrim([Office_County]))) as Office_County
,UPPER(ltrim(rtrim([Office_Full_Address]))) as Office_Full_Address
,UPPER(ltrim(rtrim([Office_License_Number]))) as Office_License_Number
,UPPER(ltrim(rtrim([Office_License_Status]))) as Office_License_Status
,[Office_Original_License_Date] as Office_Original_License_Date
,UPPER(ltrim(rtrim(CAST([Office_ Expiration_License_Date] as date)))) as Office_Expiration_License_Date
,UPPER(ltrim(rtrim([Office_License_Type]))) as Office_License_Type
,UPPER(ltrim(rtrim([Office_Broker_License]))) as Office_Broker_License
,LoadDate
 From AgentKey.dbo.MasterDRE a with(NOLOCK) JOIN (
SELECT [state],License_Number, row_number() OVER (PARTITION BY [state] ORDER BY NewID()) as rn
FROM AgentKey.dbo.MasterDRE with(NOLOCK)
Where [state] is not null and License_Number is not null) b
on a.[state] = b.[state]
and a.License_Number = b.License_Number
Where a.License_Number NOT LIKE '%E%'



