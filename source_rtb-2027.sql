
replace view COE_PRD_ALLVM.FPAS_KPI_STORE_PLAN_DATA_NONCUBE_V as 
With WD_4 as (select min(day_dt ) as day_dt FROM  COE_PRD_TBLS.KPI_STORE_TIME_DIM--mdr_dw.time_dim
where bus_day_count = (
select max(bus_day_count) from COE_PRD_TBLS.KPI_STORE_TIME_DIM--mdr_dw.time_dim


--where day_dt between CAST('2025-01-01' AS DATE) - EXTRACT(DAY FROM CAST('2025-01-01' AS DATE))+1 and TD_MONTH_END(CAST('2025-01-01' AS DATE))) - 3
--and day_dt between CAST('2025-01-01' AS DATE) - EXTRACT(DAY FROM CAST('2025-01-01' AS DATE))+1 and TD_MONTH_END(CAST('2025-01-01' AS DATE))),



--where day_dt between CAST('2025-01-27' AS DATE) - EXTRACT(DAY FROM CAST('2025-01-27' AS DATE))+1 and TD_MONTH_END(CAST('2025-01-27' AS DATE))) - 3
--and day_dt between CAST('2025-01-27' AS DATE) - EXTRACT(DAY FROM CAST('2025-01-27' AS DATE))+1 and TD_MONTH_END(CAST('2025-01-27' AS DATE))),



--where day_dt between CAST('2025-01-28' AS DATE) - EXTRACT(DAY FROM CAST('2025-01-28' AS DATE))+1 and TD_MONTH_END(CAST('2025-01-28' AS DATE))) - 3
--and day_dt between CAST('2025-01-28' AS DATE) - EXTRACT(DAY FROM CAST('2025-01-28' AS DATE))+1 and TD_MONTH_END(CAST('2025-01-28' AS DATE))),



--where day_dt between CAST('2025-01-29' AS DATE) - EXTRACT(DAY FROM CAST('2025-01-29' AS DATE))+1 and TD_MONTH_END(CAST('2025-01-29' AS DATE))) - 3
--and day_dt between CAST('2025-01-29' AS DATE) - EXTRACT(DAY FROM CAST('2025-01-29' AS DATE))+1 and TD_MONTH_END(CAST('2025-01-29' AS DATE))),



where day_dt between current_date - EXTRACT(DAY FROM current_date)+1 and TD_MONTH_END(current_date)) - 3
and day_dt between current_date - EXTRACT(DAY FROM current_date)+1 and TD_MONTH_END(current_date)),

YR AS
(SELECT DAY_DT,EXTRACT(MONTH FROM DAY_DT) CMONTH ,
CASE WHEN CMONTH =1 AND  
current_date<WD_4.DAY_DT 
--CAST('2025-01-29' AS DATE)<WD_4.DAY_DT 
THEN  WD_4.DAY_DT-INTERVAL '1' YEAR ELSE WD_4.DAY_DT end as GOLI
FROM WD_4),

t0 as 
(
SELECT DISTINCT  rpt.func_area,
rpt.RPT_KPI_ID
,rpt.KPI_NBR
,coalesce(O.rpt_mth, rpt.rpt_mth) rpt_mth
,x.EOP_IND
,COALESCE(COALESCE(O."CV",rpt.RPT_MTH_CV),0) as "CV"
,COALESCE(COALESCE(O.OL,rpt.RPT_MTH_OL),0) as "OL"
,COALESCE(COALESCE(O.BV,rpt.RPT_MTH_BV),0) as "BV"
FROM coe_prd_tbls.fpas_kpi_store_reporting RPT
right join coe_prd_tbls.fpas_kpi_store_td_offline_xref X
on x.KPI_NBR= rpt.KPI_NBR
and x.func_area = rpt.func_area
FULL OUTER JOIN COE_PRD_TBLS.FPAS_KPI_STORE_OFFLINE_TEMPLATE_STG O
ON RPT.RPT_KPI_ID = O.RPT_KPI_ID
AND year(current_date) = year(O.rpt_mth)
WHERE 
rpt.rpt_mth >= CAST('2024-01-01' AS DATE) and
rpt.rpt_mth between TD_YEAR_BEGIN(TRUNC(rpt.rpt_mth(DATE, FORMAT 'YYYYMMDD')))   AND   TD_YEAR_END(TRUNC(rpt.rpt_mth(DATE, FORMAT 'YYYYMMDD')))
and year(current_date) = year(rpt.rpt_mth)
--and rpt.RPT_KPI_ID ='VBG_CONS_00106818_1'
--and rpt.RPT_KPI_ID not in (select distinct RPT_KPI_ID from COE_PRD_TBLS.FPAS_KPI_STORE_OFFLINE_TEMPLATE_STG templ)
)

--select * from t0;

,
t2 as
(
select * from t0 UNPIVOT (MEASURE_VALUE for SCENARIO IN ("CV","OL","BV")) t1
)
,t5 as 
(
SELECT distinct t2.RPT_KPI_ID
,t2.KPI_NBR
,t2.func_area
,t2.EOP_IND
,year(current_date)  AS "PERIOD_YEAR"
,'M'||CAST(MONTH(t2.RPT_MTH) AS varchar(2)) ||'_'|| t2.SCENARIO AS "PIVOT_COL"
,t2.MEASURE_VALUE
from t2
),

t100 as
(
select * from t5 
PIVOT (SUM(MEASURE_VALUE) FOR PIVOT_COL IN (
	'M1_CV' AS "M1_CV"
	,'M2_CV' AS "M2_CV"
	,'M3_CV' AS "M3_CV"
	,'M4_CV' AS "M4_CV"
	,'M5_CV' AS "M5_CV"
	,'M6_CV' AS "M6_CV"
	,'M7_CV' AS "M7_CV"
	,'M8_CV' AS "M8_CV"
	,'M9_CV' AS "M9_CV"
	,'M10_CV' AS "M10_CV"
	,'M11_CV' AS "M11_CV"
	,'M12_CV' AS "M12_CV"
	
	,'M1_OL' AS "M1_OL"
	,'M2_OL' AS "M2_OL"
	,'M3_OL' AS "M3_OL"
	,'M4_OL' AS "M4_OL"
	,'M5_OL' AS "M5_OL"
	,'M6_OL' AS "M6_OL"
	,'M7_OL' AS "M7_OL"
	,'M8_OL' AS "M8_OL"
	,'M9_OL' AS "M9_OL"
	,'M10_OL' AS "M10_OL"
	,'M11_OL' AS "M11_OL"
	,'M12_OL' AS "M12_OL"

	,'M1_BV' AS "M1_BV"
	,'M2_BV' AS "M2_BV"
	,'M3_BV' AS "M3_BV"
	,'M4_BV' AS "M4_BV"
	,'M5_BV' AS "M5_BV"
	,'M6_BV' AS "M6_BV"
	,'M7_BV' AS "M7_BV"
	,'M8_BV' AS "M8_BV"
	,'M9_BV' AS "M9_BV"
	,'M10_BV' AS "M10_BV"
	,'M11_BV' AS "M11_BV"
	,'M12_BV' AS "M12_BV"	
	)) t6
) ,
--select * from t100
nc as
(
select 
t100.RPT_KPI_ID
,t100.KPI_NBR
,t100.FUNC_AREA
,t100.PERIOD_YEAR
,coalesce(t100.M1_CV,0) as M1_CV
,coalesce(t100.M2_CV,0) as M2_CV
,coalesce(t100.M3_CV,0) as M3_CV
,coalesce(t100.M4_CV,0) as M4_CV
,coalesce(t100.M5_CV,0) as M5_CV
,coalesce(t100.M6_CV,0) as M6_CV
,coalesce(t100.M7_CV,0) as M7_CV
,coalesce(t100.M8_CV,0) as M8_CV
,coalesce(t100.M9_CV,0) as M9_CV
,coalesce(t100.M10_CV,0) as M10_CV
,coalesce(t100.M11_CV,0) as M11_CV
,coalesce(t100.M12_CV,0) as M12_CV
,coalesce(t100.M1_OL,0) as M1_OL
,coalesce(t100.M2_OL,0) as M2_OL
,coalesce(t100.M3_OL,0) as M3_OL
,coalesce(t100.M4_OL,0) as M4_OL
,coalesce(t100.M5_OL,0) as M5_OL
,coalesce(t100.M6_OL,0) as M6_OL
,coalesce(t100.M7_OL,0) as M7_OL
,coalesce(t100.M8_OL,0) as M8_OL
,coalesce(t100.M9_OL,0) as M9_OL
,coalesce(t100.M10_OL,0) as M10_OL
,coalesce(t100.M11_OL,0) as M11_OL
,coalesce(t100.M12_OL,0) as M12_OL
,coalesce(t100.M1_BV,0) as M1_BV
,coalesce(t100.M2_BV,0) as M2_BV
,coalesce(t100.M3_BV,0) as M3_BV
,coalesce(t100.M4_BV,0) as M4_BV
,coalesce(t100.M5_BV,0) as M5_BV
,coalesce(t100.M6_BV,0) as M6_BV
,coalesce(t100.M7_BV,0) as M7_BV
,coalesce(t100.M8_BV,0) as M8_BV
,coalesce(t100.M9_BV,0) as M9_BV
,coalesce(t100.M10_BV,0) as M10_BV
,coalesce(t100.M11_BV,0) as M11_BV
,coalesce(t100.M12_BV,0) as M12_BV

,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M3_CV",0)
	ELSE coalesce(t100."M1_CV",0)+coalesce(t100."M2_CV",0)+coalesce(t100."M3_CV",0)	
END AS "Q1_CV"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M6_CV",0)
	ELSE coalesce(t100."M4_CV",0)+coalesce(t100."M5_CV",0)+coalesce(t100."M6_CV",0)	
END AS "Q2_CV"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M9_CV",0)
	ELSE coalesce(t100."M7_CV",0)+coalesce(t100."M8_CV",0)+coalesce(t100."M9_CV",0)	
END AS "Q3_CV"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M12_CV",0)
	ELSE coalesce(t100."M10_CV",0)+coalesce(t100."M11_CV",0)+coalesce(t100."M12_CV",0)	
END AS "Q4_CV"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M12_CV",0)
	ELSE coalesce(t100."M1_CV",0)+coalesce(t100."M2_CV",0)+coalesce(t100."M3_CV",0)+coalesce(t100."M4_CV",0)+coalesce(t100."M5_CV",0)+coalesce(t100."M6_CV",0)+coalesce(t100."M7_CV",0)+coalesce(t100."M8_CV",0)+coalesce(t100."M9_CV",0)+coalesce(t100."M10_CV",0)+coalesce(t100."M11_CV",0)+coalesce(t100."M12_CV",0)
END AS "YR_CV"

--Agg OL cols
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M3_OL",0)
	ELSE coalesce(t100."M1_OL",0)+coalesce(t100."M2_OL",0)+coalesce(t100."M3_OL",0)	
END AS "Q1_OL"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M6_OL",0)
	ELSE coalesce(t100."M4_OL",0)+coalesce(t100."M5_OL",0)+coalesce(t100."M6_OL",0)	
END AS "Q2_OL"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M9_OL",0)
	ELSE coalesce(t100."M7_OL",0)+coalesce(t100."M8_OL",0)+coalesce(t100."M9_OL",0)	
END AS "Q3_OL"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M12_OL",0)
	ELSE coalesce(t100."M10_OL",0)+coalesce(t100."M11_OL",0)+coalesce(t100."M12_OL",0)	
END AS "Q4_OL"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M12_OL",0)
	ELSE coalesce(t100."M1_OL",0)+coalesce(t100."M2_OL",0)+coalesce(t100."M3_OL",0)+coalesce(t100."M4_OL",0)+coalesce(t100."M5_OL",0)+coalesce(t100."M6_OL",0)+coalesce(t100."M7_OL",0)+coalesce(t100."M8_OL",0)+coalesce(t100."M9_OL",0)+coalesce(t100."M10_OL",0)+coalesce(t100."M11_OL",0)+coalesce(t100."M12_OL",0)
END AS "YR_OL"

--Agg BV cols

,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M3_BV",0)
	ELSE coalesce(t100."M1_BV",0)+coalesce(t100."M2_BV",0)+coalesce(t100."M3_BV",0)	
END AS "Q1_BV"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M6_BV",0)
	ELSE coalesce(t100."M4_BV",0)+coalesce(t100."M5_BV",0)+coalesce(t100."M6_BV",0)	
END AS "Q2_BV"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M9_BV",0)
	ELSE coalesce(t100."M7_BV",0)+coalesce(t100."M8_BV",0)+coalesce(t100."M9_BV",0)	
END AS "Q3_BV"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M12_BV",0)
	ELSE coalesce(t100."M10_BV",0)+coalesce(t100."M11_BV",0)+coalesce(t100."M12_BV",0)	
END AS "Q4_BV"
,CASE WHEN t100.EOP_IND = 'Y' then coalesce(t100."M12_BV",0)
	ELSE coalesce(t100."M1_BV",0)+coalesce(t100."M2_BV",0)+coalesce(t100."M3_BV",0)+coalesce(t100."M4_BV",0)+coalesce(t100."M5_BV",0)+coalesce(t100."M6_BV",0)+coalesce(t100."M7_BV",0)+coalesce(t100."M8_BV",0)+coalesce(t100."M9_BV",0)+coalesce(t100."M10_BV",0)+coalesce(t100."M11_BV",0)+coalesce(t100."M12_BV",0)
END AS "YR_BV"

,t100.EOP_IND
 
from t100
)

--select base_rpt_kpi_id from coe_prd_tbls.FPAS_KPI_STORE_DERIVED_KPIS_BASE_IDS where base_rpt_kpi_id not in (select RPT_KPI_ID from nc);
select * from nc;
