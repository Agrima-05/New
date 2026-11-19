SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

 CREATE view [dbo].[HW_Agents_Refresh] 
 as
		SELECT [SrcAgentID]
			  ,[SrcOfficeID]
			  ,[SrcMLSID]
			  ,[SrcMLSAgentID]
			  ,[FirstName]
			  ,[MiddleInitial]
			  ,[LastName]
			  ,[Email]
			  ,[Phone1]
			  ,[PhoneType1]
			  ,[Phone2]
			  ,[PhoneType2]
			  ,[Phone3]
			  ,[PhoneType3]
			  ,[Fax]
			  ,[LastModifiedDate]
			  ,[DW_TimeStamp]
			  ,[DateCreated]
			  ,[FASTContactAddrBookID]
			  ,[FormerOfficeID]
			  ,[OfficeChangedDate]
			  ,[Website]
			  ,[IsActive]
			  ,[LicenseNumber]
			  ,[ID]
			  ,l.[LoadDate]
			  ,[Platlabs_uid]
			  ,[Platlabs_mls_id]
			  ,[SrcMLSOfficeID]
			  ,z.FullStreetAddress as AgentStandardizedAddress
				,z.City	as AgentStandardizedCity
				,z.State as AgentStandardizedState
				,z.zip as AgentStandardizedZip

		  FROM [Platlabs].[dbo].[Platlabs_src_agents] l with(NOLOCK)
		  LEFT OUTER JOIN ASP_Offcycle.addr.StandardizedAddress_Agent z 
				ON l.SrcMLSID = z.mls_id
					and l.SrcMLSAgentID = z.dp_member_id

			WHERE l.[SrcMLSID] in(Select mls_id from src_platlabs.dbo.platlabs_update_config with(NOLOCK) where code like '%_39' and active = '1')


