show table hqmkt_prd_qmtbls.knw_cons_base_1;

CREATE SET TABLE hqmkt_prd_qmtbls.knw_cons_base_1 ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      section CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ssf_rpt_mth DATE FORMAT 'yyyy-mm-dd',
      ssf_base_mth DATE FORMAT 'yyyy-mm-dd' COMPRESS (DATE '2019-04-01',DATE '2017-12-01',DATE '2020-09-01',DATE '2022-01-01',DATE '2017-07-01',DATE '2018-12-01',DATE '2020-04-01',DATE '2021-09-01',DATE '2017-02-01',DATE '2018-07-01',DATE '2019-12-01',DATE '2021-04-01',DATE '2022-09-01',DATE '2018-02-01',DATE '2019-07-01',DATE '2020-12-01',DATE '2022-04-01',DATE '2019-02-01',DATE '2017-10-01',DATE '2020-07-01',DATE '2021-12-01',DATE '2017-05-01',DATE '2018-10-01',DATE '2020-02-01',DATE '2021-07-01',DATE '2022-12-01',DATE '2018-05-01',DATE '2019-10-01',DATE '2021-02-01',DATE '2022-07-01',DATE '2019-05-01',DATE '2020-10-01',DATE '2022-02-01',DATE '2017-08-01',DATE '2020-05-01',DATE '2021-10-01',DATE '2017-03-01',DATE '2018-08-01',DATE '2021-05-01',DATE '2022-10-01',DATE '2018-03-01',DATE '2019-08-01',DATE '2022-05-01',DATE '2019-03-01',DATE '2017-11-01',DATE '2020-08-01',DATE '2017-06-01',DATE '2018-11-01',DATE '2020-03-01',DATE '2021-08-01',DATE '2017-01-01',DATE '2018-06-01',DATE '2019-11-01',DATE '2021-03-01',DATE '2022-08-01',DATE '2018-01-01',DATE '2019-06-01',DATE '2020-11-01',DATE '2022-03-01',DATE '2019-01-01',DATE '2017-09-01',DATE '2020-06-01',DATE '2021-11-01',DATE '2017-04-01',DATE '2018-09-01',DATE '2020-01-01',DATE '2021-06-01',DATE '2022-11-01',DATE '2018-04-01',DATE '2019-09-01',DATE '2021-01-01',DATE '2022-06-01'),
      ssf_cust_id VARCHAR(9) CHARACTER SET LATIN NOT CASESPECIFIC,
      ssf_acct_num VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC,
      ssf_cust_line_seq_id VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      ssf_mtn CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      ssf_vsn_cust_type_cd CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      ssf_vz2_segmt_cd CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('PFSGL00015','PFSGL00016','PFSGL00017'),
      ssf_prod_nm VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('iPhone 7 Black 32GB','IPHONE 8 SPACE GRAY 64GB VZ','Samsung Galaxy S7 Black 32GB','IPHONE 8 PLUS SP GRAY 64GB VZ','iPhone 6 16GB Space Gray','IPHONE X SPACE GRAY 64GB VZ','IPHONE 8 PLUS GOLD 64GB VZ','iPhone 7 Black 128GB','iPhone 7 Rose Gold 32GB','IPHONE 8 GOLD 64GB VZ','IPHONE X SILVER 64GB VZ','Hum by Verizon','LG Revere 3','Samsung Galaxy S7 Gold 32GB','iPhone 7 Plus Black 128GB','iPhone 6S 64GB Space Gray','IPHONE X SPACE GRAY 256GB VZ','Samsung Galaxy S8 Black','IPHONE XR BLACK 64GB','iPhone 7 Plus Black 32GB','Verizon Ellipsis 8','iPhone 6S 32GB Space Gray','Samsung Galaxy J7 V','IPHONE 8 SILVER 64GB VZ','Samsung Galaxy Tab E 8','iPhone 6 64GB Space Gray','IPHONE X SILVER 256GB VZ','SAMSUNG NOTE 8 MIDNIGHT BLACK','iPhone 7 Rose Gold 128GB','iPhone 6S 16GB Space Gray','iPhone 7 Plus Rose Gold 128GB','iPhone 6 16GB Silver','Samsung Galaxy S9 Midnight Black','Samsung Tab A 8','IPHONE 8 PLUS SILVER 64GB VZ','SAMSUNG GALAXY J3 ECLIPSE','Samsung Galaxy J3 V','Samsung Galaxy S 5 Black','Samsung Galaxy S8 Plus Black','iPhone 6S 64GB Rose Gold','iPhone 7 Plus Rose Gold 32GB','VZ Jetpack 4G MHS MIFI 6620L','Samsung Galaxy S8 Orchid Gray','SAMSUNG GALAXY J3 V 3RD GEN','iPhone 7 Silver 32GB','iPhone 5S Space Gray 16GB','Galaxy S9 Plus Midnight Black','Samsung Galaxy S6 Black 32GB','LG K20 V','IPHONE XR WHITE 64GB','Home Phone Connect F256','SAMSUNG NOTE 8 ORCHID GRAY','IPHONE XR BLACK 128GB','Kyocera Cadence LTE','IPHONE XR RED 64GB','IPHONE 8 PLUS SP GRY 256GB VZ','SAM Galaxy S8 Plus Orchid Gray','iPhone 6S 16GB Rose Gold','iPhone 7 Gold 32GB','iPhone 6 16GB Gold','Verizon Ellipsis 7','Samsung Galaxy S7 edge BLK 32GB','Verizon Ellipsis Jetpack MHS900L','Samsung Galaxy S9 Lilac Purple','Galaxy Note9 Ocean Blue 128GB','MOTO Z3','SAM GALAXY J7 V 2ND GENERATION','IPHONE XS SPACE GRAY 64GB VZ','IPAD 9.7 32GB SPACE GRAY VZ','IPAD WIFI 32GB SPACE GRAY','iPhone 6S 32GB Rose Gold','PIXEL 2 XL JUST BLACK 64GB','Galaxy S9 Plus Coral Blue','IPHONE XS MAX SPACE GRAY 64GB VZ','IPHONE XS MAX GOLD 64GB VZ','IPHONE 11 BLACK 64GB VZ','VZ Jetpack 4G MHS MIFI5510L','MOTO Z2 FORCE BLACK','Samsung Galaxy S9 Coral Blue','Galaxy S9 Plus Lilac Purple','IPHONE 8 PLUS GOLD 256GB VZ','Wireless Home Phone','Samsung Galaxy S7 edge SLV 32GB','IPHONE XS MAX SPACE GRY 256GB VZ','Jetpack 4G LTE MHS MiFi 7730L','IPHONE SE SPACE GRAY 32GB','iPhone 6S Plus 64GB Space Gray','iPhone 7 Plus Jet Black 128GB','Samsung Galaxy Tab E 32GB','iPhone 7 Silver 128GB','iPhone 7 Jet Black 128GB','IPHONE 8 PLUS 64GB RED VERIZON','iPhone 5S Silver 16GB','IPHONE XS MAX GOLD 256GB VZ','iPhone 6S 64GB Silver','IPHONE SE SPACE GRAY 16GB','iPhone 6 64GB Silver','IPHONE 8 SPACE GRAY 256GB VZ','Samsung Galaxy S8 Silver','iPhone 6S 128GB Space Gray','iPhone 6S Plus 64GB Rose Gold','Moto Z Force BLACK/LUNAR GREY','IPHONE XR BLUE 64GB','PIXEL 2 JUST BLACK 64GB','MOTO Z2 PLAY LUNAR GRAY','IPHONE XS SPACE GRAY 256GB VZ','iPhone 6S 64GB Gold','IPHONE XS GOLD 64GB VZ','HUM PLUS VT410','iPhone 7 Plus Red 128GB','Samsung Galaxy Core Prime','Samsung Galaxy S8 Plus Silver','SAM GALAXY S10 PLUS BLACK 128GB','iPhone 7 Gold 128GB','Samsung Galaxy S 5 White','IPHONE SE SPACE GRAY 64GB','Moto Z Play Black','LG Exalt LTE','DuraXVPlus by Kyocera','Samsung Gusto 3','LG Revere - VN150','IPHONE XR WHITE 128GB','SAMSUNG GALAXY NOTE5 BLACK 32 GB','iPhone 7 Plus Gold 128GB','Verizon Ellipsis 10','APPLE WATCH S4 44 SG AL BLK SP','SAMSUNG GALAXY S10 BLACK 128GB','DROID TURBO 2 BLK Soft-Grip 32GB','Galaxy Note9 Purple 128GB','LG Cosmos 3','ASUS ZenPad Z8s','iPhone 7 Plus Silver 128GB','SAMSUNG A50','IPHONE 8 64GB RED VERIZON','iPhone 6 64GB Gold','LG Stylo 2 V','iPhone 6 Plus 64GB Space Gray','iPhone 6 Plus 16GB Space Gray','iPhone 6S 16GB Silver','IPHONE XR RED 128GB','APPLE WATCH S3 42 SG AL BLK SP','IPHONE 11 BLACK 128GB VZ','iPhone 7 Red 128GB','Samsung Galaxy S6 White 32GB','APPLE WATCH S3 38 G AL PKSD SP','Dura XV LTE with camera','Ellipsis Jetpack MHS800L','iPhone 6S 32GB Silver','PIXEL 3 64 GB BLACK','Wireless Home Phone T2000','IPHONE XR CORAL 64GB','iPhone 6S 16GB Gold','SAMSUNG GALAXY A10E','MOTO Z4','IPHONE XS GOLD 256GB VZ','iPhone 7 Plus Silver 32GB','Ellipsis 8 HD Gray','IPAD MINI RETINA 16GB SILVER','GizmoGadget by LG Navy','IPAD MINI RETINA 16GB SPC GRAY','IPHONE SE ROSE GOLD 16GB','Moto G6','IPHONE 11 PURPLE 64GB VZ','LG G6 Platinum','IPHONE 11 WHITE 64GB VZ','Samsung Convoy 4','IPHONE 8 PLUS SILVER 256GB VZ','SAMSUNG GALAXY S10e BLACK 128GB','SAM GALAXY NOTE9 BLACK 128GB','LG G5 Titanium','Kyocera DuraForcePRO','LG Revere 2','iPhone 7 Plus Gold 32GB','APPLE WATCH S4 40 G AL PS SP','LG V20 Titanium','ASUS ZenPad Z10','Ellipsis Jetpack MHS815L','Pixel Black 32GB','IPHONE 8 GOLD 256GB VZ','IPHONE 11 RED 64GB VZ','Samsung Convoy 3','Samsung Galaxy S6 Gold 32GB','iPhone 5S Gold 16GB','iPhone 6 Plus 16GB Gold','iPhone 7 Plus Black 256GB','Samsung Galaxy S7 edge Gold 32GB','PIXEL 3 XL 64 GB BLACK','IPHONE XS MAX SILVER 64GB VZ','PIXEL 2 XL BLACK AND WHITE 64GB','VZ JETPACK 4G LTE MHS AC791L','DROID TURBO by MOTOROLA BLACK BN','iPhone 6S Plus 16GB Space Gray','LG V30','Home Phone Connect FT2260','IPHONE SE ROSE GOLD 64GB','LG G6 Black','IPHONE 11 PRO MAX GREEN 256G VZ','IPHONE XR BLUE 128GB','IPHONE XS MAX SILVER 256GB VZ','LG G7 ThinQ BLACK','IPHONE 11 PRO MAX GRAY 256GB VZ','iPhone 6S Plus 128GB Space Gray','IPHONE 8 SPACE GRAY 64GB SO','IPHONE XS SILVER 64GB VZ','SAM Galaxy Note 4 Charcoal Black','iPhone 6S Plus 32GB Space Gray','iPhone 6S Plus 64GB Gold','VERIZON JETPACK MIFI 8800L','IPHONE X SPACE GRAY 64GB SO','iPhone 6S Plus 16GB Rose Gold','Samsung Galaxy S 4 Black 16GB','GizmoPal 2 by LG Blue','iPhone 6S 32GB Gold','LG GPad 8.3 LTE','IPHONE SE ROSE GOLD 32GB','GizmoGadget by LG Red','IPHONE 11 PRO MAX GRAY 64GB VZ','Samsung Convoy II','iPhone 6 Plus 16GB Silver','IPAD WIFI 32GB GOLD','IPAD WIFI 32GB SILVER','LG G7 ThinQ SILVER','IPHONE X SPACE GRAY 256GB SO','IPAD AIR 2 64GB S GRAY','SAM GALAXY S10 PLUS WHITE 128GB','LG-VX5600','iPhone 6 - Non VZW','iPhone 6 Plus 64GB Gold','iPhone 6 Plus 64GB Silver','IPHONE XR CORAL 128GB','IPAD AIR 2 16GB S GRAY','Motorola Droid Maxx 16GB Black','IPHONE 11 PRO MAX GREEN 64GB VZ','PIXEL 2 KINDA BLUE 64GB','IPHONE 5 BLACK 16GB','VZ Jetpack 4G MHS 890L','LG G Pad X8.3','Ellipsis 8 HD Blue','LG Exalt','iPhone 6S Plus 64GB Silver','IPHONE 11 GREEN 64GB VZ','IPHONE XS SILVER 256GB VZ','iPhone 5C White 16GB','SAMSUNG GALAXY S10 BLUE 128GB','IPHONE 8 SILVER 256GB VZ','IPHONE 11 PURPLE 128GB VZ','ASUS ZenPad Z8','Pixel XL Black 32GB','SAM GALAXY S10 PLUS BLUE 128GB','DROID MAXX 2 Blue'),
      ssf_data_tier VARCHAR(14) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Smartphone','Internet','Basic','Other Services','Unknown'),
      ssf_device_grouping VARCHAR(23) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Apple','Android','Tablet','Basic','Wearable Devices','Mobile Hotspot','Automotive','Home Phone Connect','USB','Other Smart','Other Connected Devices','WinMo','Cantenna / Modem','Blackberry','Unknown','Camera','Laptop','Router / Modem','Netbook','Other Internet','Embed Chip','PCMCIA','Palm','iPad Bundle','IP Virtual Device','Module','Tracking Device','IP Desk Phone'),
      ssf_device_brand_nm VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('iPhone 7','iPhone 6S','IPHONE 8','IPHONE 8 PLUS','iPhone 7 Plus','IPHONE X','iPhone XR','iPhone 6','Galaxy S7','iPhone SE','iPhone XS Max','iPhone 6S Plus','iPhone 11','Galaxy S8','iPhone XS','Galaxy S9','Galaxy S8 Plus','Galaxy S9 Plus','APPLE WATCH S3','Home Phone Connect','Galaxy Note 8','iPhone 5S','iPhone 6 Plus','iPhone 11 Pro Max','Galaxy S7 Edge','Galaxy S6','Hum by Verizon','Revere 3','Other','GALAXY NOTE 9','Galaxy S5','Apple Watch S4','Verizon Ellipsis 8','IPAD Mar17','IPAD 9.7','Galaxy J7 V','Samsung Galaxy Tab E 8','iPhone 11 Pro','PIXEL 2 XL','GALAXY TAB A','iPhone 5C','GALAXY S10 PLUS','IPAD AIR 2','IPAD MINI RETINA','Galaxy J3 Eclipse','Galaxy J3 V','PIXEL 2','MHS 6620','GALAXY J3 V GEN3','GALAXY S10','LG K20 V','DROID TURBO 2','Galaxy Note 5','Kyocera Cadence','GALAXY S10e','Verizon Ellipsis 7','Ellipsis Jetpack MHS900L','PIXEL 3','Moto Z2 Force','Moto Z3','DROID TURBO','Moto Z2 Play','Galaxy J7 V Gen2','Moto Z Force','MHS 5510','IPAD AIR','Pixel','Galaxy S4','Moto Z Play','LG G6','MHS 7730','GizmoGadget','Apple Watch S5','Samsung Galaxy Tab E8','PIXEL 3 XL','Ellipsis 8 HD','iPad Pro 9.7','LG G7','Gusto III','HUM PLUS GEN2','Galaxy Core Prime','Pixel XL','Kyocera DuraXV Plus','Revere','Exalt LTE','IPAD PRO 10.5 GEN2','iPhone SE 2020','Verizon Ellipsis 10','iPhone 5','Cosmos 3','iPad Mini 4','Galaxy A50','LG G5','MOTOROLA Z4','Galaxy Note 10 Plus','ZenPad Z8s','Moto G6','LG Stylo 2','GizmoPal 2','Kyocera Dura XV LTE','Galaxy Note 4','LG V20','MHS 800','SAMSUNG GALAXY A10','Samsung Galaxy Watch','GIZMOWATCH','iPhone 4S','DROID MAXX','IPAD MINI','iPAD 7th Generation','Samsung Convoy 4','Kyocera DuraForcePRO','Revere 2','Gusto II','IPAD RETINA','ASUS ZenPad Z10','Ellipsis Jetpack MHS815L','Samsung Convoy 3','MHS AC791L','IPAD PRO','iPhone 4','LG V30','DROID MAXX 2','IPAD MINI 3','VZ JETPACK MIFI 8800L','LG GPad','Samsung Convoy','Samsung Gear S 3','Moto Z Droid','Galaxy S6 Edge Plus','Samsung Gear S 2','Accolade','IPAD PRO 12.9 GEN2','Galaxy S6 Edge','MHS 890','LG G Pad X8.3','Exalt','Moto G7 Power','iPad 3','iPad 2','ASUS ZenPad Z8','Galaxy Note 10','Haven','Gusto','iPad Pro 11','LG V40','LG Exalt 2','Extravert 2','Galaxy S3','LG G4','LG Terra','LG G3','Galaxy Note 3','Galaxy A20','Galaxy Note 10 5G','LG K8','GzOne Ravine II','LG GPad 7.0','ALCATEL GO FLIP V','LG GPad 10.1','Verizon Hum X GEN2','Asus Zenfone V Live','LG G8','Kyocera Dura Force Pro 2','Samsung Galaxy Tab S2','Asus Zenfone V','Convoy','Galaxy S20 Plus','Knack','PIXEL 3A','iPad Pro 12.9 Gen3','DROID MINI','PIXEL 3A XL','Cosmos 2','Samsung Tab E','Kyocera DuraXV','MHS 4510','LG V10','Intensity 2','Pixel 4 XL','GizmoTab','LTE Internet and Home Phone','Unknown Smartphone','Brigadier','Galaxy S20 Ultra','Octane','Ellipsis Jetpack','Galaxy Tab A 10.5','Galaxy Tab S3','Smooth','Pixel 4','Ellipsis Kids','MHS 4620','Ellipsis 10 HD','IPAD AIR 10.5','Brightside','Samsung Galaxy A51','Samsung Galaxy Tab 4 10.1','Samsung Galaxy Tab 2 7.0','Galaxy S4 Mini','Intensity 3','HTC 10','HomeFusion','IPAD MINI 7.9','Cosmos','ORBIC JOURNEY','GALAXY TAB S4','Moto E5 Play','GALAXY S10 5G','GzOne Ravine','Samsung Galaxy Watch  - Active 2','DROID ULTRA','MHS 291','DROID RAZR M','EnV 3','HTC One M9','LG G Vista','HTC Desire 626','LG K4','LG Lancet for Android','SAMSUNG GALAXY TAB S5','HTC Desire 530','Verizon Hum X','HTC Desire 526','GizmoPal','LG-VX8360','Samsung Galaxy S20','LG STYLO 5','Moto G7 Play','Samsung Galaxy Tab 4 8.0','Galaxy S3 Mini','LG G2','UNKNOWN 4G DEVICE','Smarthub with Voice','MHS 4620LE','Sam Galaxy Book','Pantech 4G USB Modem','Galaxy Note II','All New HTC One','NEW MOTO X','MOTO E6','SAM Galaxy Tab S','Samsung Galaxy Tab 2 10.1','Barrage','MHS LC11','Galaxy SM','Samsung Galaxy Note 10.1','GALAXY NOTE 20 ULTRA','MHS 2200','Samsung Galaxy A01'),
      ssf_device_generation CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      ssf_dev_typ VARCHAR(10) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('sp_apple','sp_android','tab','bas','wear','jetpack','auto','hpc','oth_inet','sp_other','zz oth','camera'),
      ssf_cdma VARCHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ssf_mfg_nm VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Apple','Samsung','LG','Motorola','Google','Novatel','Quanta','Kyocera','Huawei','Franklin','Hum','ASUS','VERIZON TELEMATICS','ODI DEVICE','ALCATEL','ZTE','Netgear','N/A','Casio','HTC','Quality One Wireless','RELIANCE COMMUNICATIONS','PanTech','UTStarCom','PCD','RIM','Nokia','WISTRON','Sony','SONIM','Sierra Wireless','Microsoft','ONEPLUS','HMD','Audiovox','ASKEY','HP','SEQUANS','Delphi','NEXTBOOK','Qualcomm','AMAZON','FIBOCOM','ON STAR','Palm','FOX','Gateway','DELL','RCC CONVERSION','JANUS','AXE','BROADSOFT','LMU','SUMMIT','HPI','PANASONIC','GOG','WAVECOM','Telit','G AND D','BRIGHTPOINT','Yealink','ANYDATA','Zebra','MEM','LG INNOTEK','STM','CINTERION','ALLTEL','ERICSSON','HERMES','FUSION WIRELESS','TELULAR','INGRAM','VERIZON','INTERMEC','ARRIS','RING LLC','INGRAM MICRO'),
      ssf_trade_promo_grp CHAR(2) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ssf_curr_contract_term VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Edge','Out of Contract','MTM Contract','2 Yr Contract','1 Yr Contract','Other Contract','Device Payment'),
      ssf_loan_num CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ssf_pplan_cd CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('11454','13610','13646','17542','17973','17989','17991','17993','17994','18042','18045','18046','18050','18051','18056','18059','18063','18064','18258','19965','21340','21629','24826','24828','25059','25582','26869','26872','26880','26907','26908','26911','26926','29279','32042','32043','32044','32045','32046','32557','36909','38338','38678','38681','39385','39387','39390','40644','63031','63033','63453','63465','64332','64334','65345','65502','65503','65523','65936','65961','65996','65999','72841','72864','72865','72895','73064','73389','73412','73413','73424','73425','73430','73431','73436','73437','73442','73443','73454','73567','73568','73569','73570','73571','75798','75801','75808','76017','76021','76022','76174','76175','76180','76181','77558','83233','83234','83494','83864','84114','84124','84127','84298','84299','84599','84710','84904','85225','85320','85321','86088','86089','86090','86487','86489','86491','86492','86494','86495','86496','86497','86498','86499','86500','86502','86503','86504','86505','86506','86507','86508','86509','86510','86511','86512','86513','87269','87270','88005','88605','88907','89103','89621','89736','89740','89741','89742','89849','89850','89851','89852','89968','90001','90002','90003','90004','90005','90006','90011','90015','90022','90033','90041','90042','90044','90132','90186','90525','91382','91641','91644','91701','91702','91821','91822','91824','91826','91945','91953','91954','92039','92040','92042','92144','92145','92146','92346','92756','92765','92770','92772','92775','92780','92784','93727','93792','94156','94157','94158','94159','94162','94163','94171','94679','96180','96325','96327','96328','96329','96331','96333','96334','96335','96337','96339','96340','96345','96366','96400','96698','96708','96800','96802','96803','97105','97379','97380','97381','97518','97522','97926','97928','97929','97975','97991','97993','97994','98012','98013','98061','98127','98129','98245','98315','98316','99230','99231','99304','99635','99999'),
      ssf_pplan_mkt_cd VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AAA','978','1010','668','666','663','664','667','665','504','452','1035','517','505','976','502','449','1138','640','308','1111','429','1043','917','615','428','1125','622','759','431','1105','508','620','112','904','1009','277','1166','669','1080','940','1008','1128','1088','1015','1079','1011','648','132','346','516','1001','1123','1137','1129','1012','1013','1130','740','1036','510','1007','642','680','1044','1067','1112','303','459','307','673','1122','621','1033','1048','938','1061','526','745','625','4','637','836','1017','1041','932','588','404','1038','1060','1062','390','1072','1059','453','684','936','520','1182','1103','1109','769','1029','647','779','131','670','1039','1042','1050','716','1167','1027','1134','935','1132','1018','1149','1084','1037','133','427','442','1058','425','1162','807','1108','1069','1117','1024','1096','1153','222','646','143','401','356','447','937','842','841','1066','242','1106','1020','247','1076','408','934','232','1065','645','686','644','388','130','282','763','902','226','776','1168','315','1040','400','726','638','1118','989','1151','1052','518','1115','770','913','918','295','677','641','407','1097','100','804','1147','1113','481','1046','654','1073','630','1078','225','815','1144','839','1053','460','580','1146','283','451','1145','687','153','1142','523','524','235','267','515','160','909','1004','1139','1127','1163','941','1034','632','1099','1158','381','224','1110','1098','UNTG','1169','1121','896','249','1133','357','1119','678','643','1161','639','1056','806','241','735','1003','216','840','613','1092','914','306','309'),
      ssf_pplan_sub_type_desc VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Verizon Unlimited','Verizon Plan 2.0 L','Go Unlimited 1.0','Go Unlimited 2.0','Verizon Plan 2.0 S','Verizon Plan 2.0 M','More Everything','Verizon Plan 1.0','Verizon Plan 2.0 XL','Verizon Plan 2.0 Single Smartphone','Start Unlimited','Connected Unlimited','Verizon Plan 2.0 Misc','Beyond Unlimited 1.0','Go Unlimited 55+','Line Level Plan','Verizon Plan 2.0 XXL','Play Unlimited','Beyond Unlimited 2.0','Do Unlimited','Account Level Pricing','Get Unlimited','Above Unlimited','Just Kids 3.0','Play Unlimited 3.0','Shared Data Plan - 10GB','Secondary Share','Primary Share','Shared Data Plan - 5GB','Do Unlimited 3.0','Business Share','Get Unlimited 3.0','Business Unlimited','Line Level Unlimited Data','5G Beyond Unlimited','5G Home','5G Above Unlimited','5G (Non Phone) Unlimited','Flexible Business','5G Moto Mod Unlimited','Business Share Unlimited Data','Start Unlimited Trial','4G LTE Home','Telemetry Share','Primary Share Unlimited Data','Secondary Share Unlimited Data','Business Custom','5G Moto Mod Business Unlimited'),
      plan_typ VARCHAR(9) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('a) Prem','b) Entry','c) Vz Unl','d) Oth','z) Null'),
      ssf_chan_cd CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      ssf_chan_nm VARCHAR(16) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('d1) Stores','i1) Local Agent','i2) Nat Retail','d5) Non Comm','d3) Telesales','d4) Internet','d2) B2B','i3) Ind Internet','z1) Other','i4) VAD/EOM'),
      ssf_tot_lines INTEGER COMPRESS (0 ,1 ),
      ssf_frac_accts DECIMAL(18,8) COMPRESS (0.00000000 ,0.04000000 ,0.20000000 ,1.00000000 ,0.01282051 ,0.01041667 ,0.01923077 ,0.02083333 ,0.02564103 ,0.01369863 ,0.03125000 ,0.03846154 ,0.04166667 ,0.06250000 ,0.01030928 ,0.00598802 ,0.01754386 ,0.07692308 ,0.00333333 ,0.08333333 ,0.03030303 ,0.12500000 ,0.00909091 ,0.00555556 ,0.01162791 ,0.00323625 ,0.16666667 ,0.02127660 ,0.04761905 ,0.05263158 ,0.00231481 ,0.01492537 ,0.01449275 ,0.00057405 ,0.05000000 ,0.25000000 ,0.00719424 ,0.01075269 ,0.01818182 ,0.01111111 ,0.01886792 ,0.02325581 ,0.01960784 ,0.01333333 ,0.33333333 ,0.01388889 ,0.01428571 ,0.09090909 ,0.05555556 ,0.02702703 ,0.02439024 ,0.01785714 ,0.00970874 ,0.02000000 ,0.10000000 ,0.50000000 ,0.01562500 ,0.00740741 ,0.01234568 ,0.00877193 ,0.02222222 ,0.14285714 ,0.00261780 ,0.01098901 ,0.01063830 ,0.02380952 ,0.03703704 ,0.02631579 ,0.01538462 ,0.01265823 ,0.02500000 ,0.06666667 ,0.04545455 ,0.04347826 ,0.02777778 ,0.01010101 ,0.02857143 ,0.01351351 ,0.00892857 ,0.01408451 ,0.00062150 ,0.11111111 ,0.07142857 ,0.03225806 ,0.01250000 ,0.00204499 ,0.03448276 ,0.03333333 ,0.02272727 ,0.02173913 ,0.00465116 ,0.03571429 ,0.01724138 ,0.01086957 ,0.02040816 ,0.01149425 ,0.05882353 ,0.00578035 ,0.01020408 ,0.02941176 ),
      ssf_vce_lines INTEGER COMPRESS (0 ,1 ),
      ssf_sp_lines INTEGER COMPRESS (0 ,1 ),
      ssf_tab_lines INTEGER COMPRESS (0 ,1 ),
      ssf_wear_lines INTEGER COMPRESS (0 ,1 ),
      dpp_loan_num CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      dpp_prod_nm VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('iPhone 7 Black 32GB','IPHONE 8 SPACE GRAY 64GB VZ','Samsung Galaxy S7 Black 32GB','IPHONE 8 PLUS SP GRAY 64GB VZ','IPHONE X SPACE GRAY 64GB VZ','IPHONE 8 PLUS GOLD 64GB VZ','iPhone 7 Black 128GB','iPhone 7 Rose Gold 32GB','IPHONE 8 GOLD 64GB VZ','IPHONE X SILVER 64GB VZ','Samsung Galaxy S7 Gold 32GB','iPhone 7 Plus Black 128GB','iPhone 6 16GB Space Gray','Samsung Galaxy S8 Black','IPHONE XR BLACK 64GB','iPhone 7 Plus Black 32GB','IPHONE X SPACE GRAY 256GB VZ','iPhone 6S 64GB Space Gray','Samsung Galaxy J7 V','SAMSUNG NOTE 8 MIDNIGHT BLACK','IPHONE 8 SILVER 64GB VZ','iPhone 6S 32GB Space Gray','Samsung Galaxy J3 V','iPhone 7 Rose Gold 128GB','IPHONE X SILVER 256GB VZ','Samsung Galaxy S9 Midnight Black','iPhone 7 Plus Rose Gold 128GB','Samsung Galaxy S8 Plus Black','IPHONE 8 PLUS SILVER 64GB VZ','SAMSUNG GALAXY J3 ECLIPSE','iPhone 6S 16GB Space Gray','iPhone 7 Plus Rose Gold 32GB','Samsung Galaxy S8 Orchid Gray','Galaxy S9 Plus Midnight Black','iPhone 6S 64GB Rose Gold','LG K20 V','SAMSUNG GALAXY J3 V 3RD GEN','LG Revere 3','iPhone 7 Silver 32GB','IPHONE XR WHITE 64GB','SAMSUNG NOTE 8 ORCHID GRAY','SAM Galaxy S8 Plus Orchid Gray','Samsung Galaxy S6 Black 32GB','IPHONE XR BLACK 128GB','iPhone 6 64GB Space Gray','IPHONE XR RED 64GB','iPhone 6 16GB Silver','Samsung Galaxy S7 edge BLK 32GB','Samsung Galaxy S9 Lilac Purple','Galaxy Note9 Ocean Blue 128GB','iPhone 7 Gold 32GB','IPHONE 8 PLUS SP GRY 256GB VZ','MOTO Z3','Galaxy S9 Plus Coral Blue','PIXEL 2 XL JUST BLACK 64GB','Kyocera Cadence LTE','IPHONE XS SPACE GRAY 64GB VZ','IPHONE XS MAX SPACE GRAY 64GB VZ','IPHONE XS MAX GOLD 64GB VZ','MOTO Z2 FORCE BLACK','iPhone 6S 32GB Rose Gold','Samsung Galaxy S9 Coral Blue','Galaxy S9 Plus Lilac Purple','SAM GALAXY J7 V 2ND GENERATION','iPhone 6S 16GB Rose Gold','Samsung Galaxy S7 edge SLV 32GB','IPHONE 11 BLACK 64GB VZ','IPHONE 8 PLUS GOLD 256GB VZ','IPHONE XS MAX SPACE GRY 256GB VZ','IPHONE 8 PLUS 64GB RED VERIZON','Moto Z Force BLACK/LUNAR GREY','Samsung Galaxy S8 Silver','Samsung Galaxy Core Prime','PIXEL 2 JUST BLACK 64GB','iPhone 7 Plus Jet Black 128GB','IPHONE SE SPACE GRAY 32GB','IPHONE XS MAX GOLD 256GB VZ','iPhone 7 Jet Black 128GB','Samsung Galaxy S 5 Black','iPhone 7 Silver 128GB','IPHONE XR BLUE 64GB','MOTO Z2 PLAY LUNAR GRAY','IPHONE 8 SPACE GRAY 256GB VZ','Samsung Galaxy S8 Plus Silver','iPhone 7 Plus Red 128GB','SAM GALAXY S10 PLUS BLACK 128GB','Moto Z Play Black','iPhone 6S Plus 64GB Space Gray','IPHONE SE SPACE GRAY 16GB','IPHONE XS GOLD 64GB VZ','iPhone 6S 128GB Space Gray','iPhone 6S 64GB Silver','iPhone 6S Plus 64GB Rose Gold','IPHONE XS SPACE GRAY 256GB VZ','iPhone 7 Gold 128GB','DROID TURBO 2 BLK Soft-Grip 32GB','iPhone 6S 64GB Gold','Galaxy Note9 Purple 128GB','LG Stylo 2 V','SAMSUNG GALAXY S10 BLACK 128GB','IPHONE XR WHITE 128GB','SAMSUNG A50','IPHONE 8 64GB RED VERIZON','iPhone 6 16GB Gold','iPhone 7 Plus Gold 128GB','DuraXVPlus by Kyocera','IPHONE SE SPACE GRAY 64GB','iPhone 7 Red 128GB','LG Exalt LTE','SAMSUNG GALAXY NOTE5 BLACK 32 GB','iPhone 5S Space Gray 16GB','PIXEL 3 64 GB BLACK','IPHONE XR RED 128GB','iPhone 7 Plus Silver 128GB','IPAD 9.7 32GB SPACE GRAY VZ','MOTO Z4','IPHONE 11 BLACK 128GB VZ','IPHONE XR CORAL 64GB','SAMSUNG GALAXY A10E','LG G5 Titanium','APPLE WATCH S4 44 SG AL BLK SP','LG G6 Platinum','Moto G6','iPhone 6 64GB Silver','SAM GALAXY NOTE9 BLACK 128GB','iPhone 6S 32GB Silver','SAMSUNG GALAXY S10e BLACK 128GB','iPhone 6S 16GB Silver','Pixel Black 32GB','Kyocera DuraForcePRO','IPHONE 11 PURPLE 64GB VZ','Samsung Galaxy S6 White 32GB','IPHONE XS GOLD 256GB VZ','iPhone 7 Plus Silver 32GB','IPHONE 11 WHITE 64GB VZ','Samsung Convoy 4','Dura XV LTE with camera','iPhone 6S 16GB Gold','LG V20 Titanium','PIXEL 2 XL BLACK AND WHITE 64GB','IPHONE 8 PLUS SILVER 256GB VZ','IPHONE SE ROSE GOLD 16GB','iPhone 7 Plus Gold 32GB','PIXEL 3 XL 64 GB BLACK','Samsung Galaxy S7 edge Gold 32GB','IPHONE 11 RED 64GB VZ','IPHONE XS MAX SILVER 64GB VZ','LG V30','IPHONE 8 GOLD 256GB VZ','LG G7 ThinQ BLACK','LG G6 Black','Samsung Galaxy S6 Gold 32GB','APPLE WATCH S4 40 G AL PS SP','iPhone 7 Plus Black 256GB','DROID TURBO by MOTOROLA BLACK BN','iPhone 6 Plus 64GB Space Gray','IPHONE XR BLUE 128GB','IPHONE XS MAX SILVER 256GB VZ','IPHONE XS SILVER 64GB VZ','LG G7 ThinQ SILVER','iPhone 6 Plus 16GB Space Gray','IPHONE 11 PRO MAX GREEN 256G VZ','iPhone 6 64GB Gold','IPHONE SE ROSE GOLD 64GB','APPLE WATCH S3 42 SG AL BLK SP','IPHONE 11 PRO MAX GRAY 256GB VZ','iPhone 6S Plus 16GB Space Gray','IPHONE 11 PRO MAX GRAY 64GB VZ','SAM GALAXY S10 PLUS WHITE 128GB','IPHONE SE ROSE GOLD 32GB','iPhone 6S Plus 32GB Space Gray','iPhone 6S 32GB Gold','Samsung Gusto 3','iPhone 5S Silver 16GB','iPhone 6S Plus 64GB Gold','PIXEL 2 KINDA BLUE 64GB','iPhone 6S Plus 128GB Space Gray','Moto Z Droid BLACK/LUNAR GREY','Samsung Galaxy S 5 White','iPhone 6S Plus 16GB Rose Gold','DROID MAXX 2 Blue','Pixel XL Black 32GB','IPHONE XR CORAL 128GB','SAMSUNG GALAXY S10 BLUE 128GB','APPLE WATCH S3 38 G AL PKSD SP','IPHONE 11 PRO MAX GREEN 64GB VZ','SAM S7 EDGE BLUE CORAL 32GB','DROID TURBO 2 Grey Nylon 32GB','IPHONE 11 GREEN 64GB VZ','SAM GALAXY S10 PLUS BLUE 128GB','SAM Galaxy Note 4 Charcoal Black','iPhone 6 Plus 16GB Gold','IPHONE 8 SILVER 256GB VZ','IPHONE XS SILVER 256GB VZ','IPHONE 11 PURPLE 128GB VZ','Samsung Tab A 8','SAMSUNG GALAXY NOTE10 PL BLK 256','iPhone 7 Black 256GB','IPHONE 11 WHITE 128GB VZ','ASUS ZENFONE V','ZenFone V Live','MOTO G7 POWER','iPhone 6S Plus 32GB Rose Gold','iPhone 6S Plus 64GB Silver','IPHONE 11 PRO MAX GOLD 64GB VZ','IPHONE 11 RED 128GB VZ','IPHONE 8 PLUS 256GB RED VERIZON','IPHONE 11 PRO SPACE GRAY 64G VZ','IPHONE 8 SPACE GRAY 64GB SO','IPHONE SE SILVER 32GB','IPHONE 11 PRO MAX GOLD 256GB VZ','SAMSUNG GALAXY S10 WHITE 128GB','Moto Z Play White','LG Cosmos 3','IPHONE 11 PRO GRAY 256GB VZ','PIXEL 2 CLEARLY WHITE 64GB','MOTO Z2 PLAY FINE GOLD','IPHONE SE SILVER 16GB','LG K8 V','Pixel Silver 32GB','LG Exalt 2','IPHONE XR YELLOW 64GB','APPLE WATCH S5 44 SG AL BLK SP','SAMSUNG GALAXY S10e BLUE 128GB','SAMSUNG GALAXY NOTE5 GOLD 32 GB','GALAXY NOTE10 PLUS SILVER 256GB','SAM GALAXY WATCH SILVER 46MM','SAMSUNG GALAXY A20','iPhone 6 Plus 16GB Silver','iPhone 6 Plus 64GB Gold','iPhone 6 Plus 64GB Silver','IPHONE SE GOLD 16GB','IPHONE 11 PRO GREEN 256GB VZ','iPhone 6S 128GB Rose Gold','IPHONE 8 PLUS SPACE GRAY 64GB SO','IPHONE SE SILVER 64GB','LG G4 Metallic Gray','IPAD WIFI 32GB SPACE GRAY','IPHONE SE GOLD 64GB','IPHONE 11 PRO GREEN 64GB VZ','ALCATEL GO FLIP V','IPAD 7TH GEN 32GB GRAY VZ','Kyocera Dura Force Pro 2','DROID TURBO 2 WHT Soft-Grip 32GB','iPhone 6S Plus 16GB Gold','LG Extravert 2','IPHONE SE SPACE GRAY 128GB','IPHONE SE 64GB BLACK','DROID TURBO by MOTOROLA BLK MGF','PIXEL 2 XL JUST BLACK 128GB'),
      dpp_data_tier VARCHAR(14) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Smartphone','Internet','Basic','Other Services','Unknown'),
      dpp_device_grouping VARCHAR(23) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Apple','Android','Basic','Tablet','Wearable Devices','Automotive','WinMo','Laptop','Other Connected Devices','Mobile Hotspot','Blackberry','Home Phone Connect','USB','Router / Modem','Unknown','Other Smart','Tracking Device'),
      dpp_device_brand_nm VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('iPhone 7','IPHONE 8','iPhone 6S','IPHONE 8 PLUS','iPhone 7 Plus','iPhone XR','IPHONE X','Galaxy S7','iPhone 6','iPhone XS Max','iPhone SE','iPhone 11','Galaxy S8','iPhone 6S Plus','iPhone XS','Galaxy S9','Galaxy S8 Plus','Galaxy S9 Plus','Galaxy Note 8','Galaxy S7 Edge','iPhone 11 Pro Max','GALAXY NOTE 9','Galaxy S6','Galaxy J7 V','iPhone 6 Plus','PIXEL 2 XL','Galaxy J3 V','APPLE WATCH S3','GALAXY S10 PLUS','PIXEL 2','Galaxy J3 Eclipse','iPhone 11 Pro','Apple Watch S4','LG K20 V','GALAXY J3 V GEN3','GALAXY S10','Revere 3','DROID TURBO 2','Galaxy S5','iPhone 5S','GALAXY S10e','Moto Z2 Force','PIXEL 3','Galaxy Note 5','Moto Z3','Moto Z Force','Pixel','Moto Z2 Play','IPAD 9.7','Kyocera Cadence','Moto Z Play','Galaxy J7 V Gen2','LG G6','DROID TURBO','PIXEL 3 XL','Galaxy Core Prime','LG G7','Pixel XL','LG G5','LG Stylo 2','MOTOROLA Z4','Galaxy A50','Apple Watch S5','Kyocera DuraXV Plus','Galaxy Note 10 Plus','Exalt LTE','LG V20','SAMSUNG GALAXY A10','iPhone SE 2020','Moto G6','Kyocera Dura XV LTE','Samsung Galaxy Watch','Kyocera DuraForcePRO','Samsung Convoy 4','IPAD AIR 2','Galaxy Note 4','DROID MAXX 2','LG V30','Moto Z Droid','IPAD Mar17','iPad Pro 9.7','iPAD 7th Generation','Gusto III','IPAD PRO 10.5 GEN2','LG G4','Galaxy S6 Edge Plus','LG V40','Galaxy Note 10','Galaxy S6 Edge','GALAXY TAB A','Asus Zenfone V','Asus Zenfone V Live','Moto G7 Power','Cosmos 3','LG K8','Galaxy S4','LG Exalt 2','iPhone 5C','Galaxy Note 10 5G','LG V10','Galaxy A20','LG G8','iPad Mini 4','IPAD PRO','Galaxy S20 Plus','iPad Pro 11','IPAD PRO 12.9 GEN2','ALCATEL GO FLIP V','Kyocera Dura Force Pro 2','Extravert 2','Samsung Convoy 3','Samsung Gear S 3','LG G3','PIXEL 3A','Pixel 4 XL','LG Terra','Galaxy S20 Ultra','DROID MAXX','Brigadier','PIXEL 3A XL','ASUS ZenPad Z10','iPad Pro 12.9 Gen3','Verizon Hum X GEN2','Samsung Galaxy A51','IPAD MINI RETINA','HTC 10','Pixel 4','Samsung Galaxy Tab E 8','Samsung Galaxy Tab E8','IPAD AIR','Samsung Galaxy Tab S2','ORBIC JOURNEY','HTC Desire 626','GALAXY S10 5G','DROID MINI','Kyocera DuraXV','Exalt','LG K4','IPAD AIR 10.5','LG Lancet for Android','HTC Desire 526','Galaxy Tab A 10.5','HTC One M9','Samsung Galaxy Watch  - Active 2','GALAXY TAB S4','Moto E5 Play','Samsung Tab E','IPAD MINI 7.9','Galaxy Tab S3','HTC Desire 530','Samsung Galaxy S20','Verizon Ellipsis 10','Galaxy Note 3','LG STYLO 5','IPAD MINI 3','SAMSUNG GALAXY TAB S5','Sam Galaxy Book','ASUS ZenFone AR','LG G Vista','Verizon Ellipsis 8','Moto Z3 Play','GizmoTab','Moto G7 Play','MOTO E6','Galaxy S4 Mini','LG V50','Samsung Galaxy A01','NEW MOTO X','CHROMEBOOK PLUS','Ellipsis 8 HD','ZenPad Z8s','GALAXY NOTE 20 ULTRA','DROID TURBO 2 MM','PRIV by Blackberry','Lumia 735','Verizon Hum X','LG V60 ThinQ','iPad Pro 12.9 Gen4','PALM PHONE','iPad Pro 11 Gen2','Other','SAM Galaxy Tab S','Samsung Galaxy Tab 4 10.1','Galaxy S3 Mini','Samsung Galaxy Book2','SAMSUNG GALAXY TAB A BROWN 8.4','SAMSUNG GALAXY TAB S6','ASUS ZenPad Z8','LG GPad 10.1','LG G2','Galaxy Note Edge','Samsung Galaxy Note Pro Tab','All New HTC One','Lucid 3','Galaxy Note 7','IPHONE 12 PRO','GALAXY NOTE 20','IPHONE 12','Google Nexus 6','IPAD MINI','Moto G Power','Revere 2','BlackBerry Classic','iPhone 5','GzOne Ravine II','ETALK','LG G Pad X8.3','Sony Xperia Z3v','Samsung Galaxy Tab 4 8.0','5G MIFI - M1000','RED HYDROGEN','Sonim XP5','Sony Xperia Z2','Samsung Galaxy A71','Samsung Galaxy View','APPLE WATCH S6','Galaxy A21','HTC One Remix','DROID ULTRA','MOTO G Stylus','LG Lancet','Samsung Galaxy Book S','Samsung Galaxy A11','MOTO X','Motorola Edge Plus','iPhone 4S','LG GPad','Gusto II','PALM Standalone','VZ JETPACK MIFI 8800L','Perception','Verizon Ellipsis 7','LG K51 Titan','LG Enact','DROID RAZR M','Brightside','MOTOROLA RAZR','LG GPad 7.0','Intensity 3','HTC Desire','HTC One M8 for Windows','SAMSUNG GALAXY S20 FE 5G','10.2 IPAD 8 GEN 2020','Google Pixel 4A','Samsung Galaxy Watch 3','Galaxy S3','One Plus 8','NOKIA 3 V','Ellipsis 10 HD','LG VELVET'),
      dpp_device_generation CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      dpp_dev_typ VARCHAR(10) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('sp_apple','zz oth','sp_android','bas','tab','wear','auto','oth_inet','sp_other','jetpack','hpc'),
      dpp_cdma CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      dpp_mfg_nm VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Apple','Samsung','LG','Motorola','Google','Novatel','Quanta','Kyocera','Huawei','Franklin','Hum','ASUS','VERIZON TELEMATICS','ODI DEVICE','ALCATEL','ZTE','Netgear','N/A','Casio','HTC','Quality One Wireless','RELIANCE COMMUNICATIONS','PanTech','UTStarCom','PCD','RIM','Nokia','WISTRON','Sony','SONIM','Sierra Wireless','Microsoft','ONEPLUS','HMD','Audiovox','ASKEY','HP','SEQUANS','Delphi','NEXTBOOK','Qualcomm','AMAZON','FIBOCOM','ON STAR','Palm','FOX','Gateway','DELL','RCC CONVERSION','JANUS','AXE','BROADSOFT','LMU','SUMMIT','HPI','PANASONIC','GOG','WAVECOM','Telit','G AND D','BRIGHTPOINT','Yealink','ANYDATA','Zebra','MEM','LG INNOTEK','STM','CINTERION','ALLTEL','ERICSSON','HERMES','FUSION WIRELESS','TELULAR','INGRAM','VERIZON','INTERMEC','ARRIS','RING LLC','INGRAM MICRO'),
      dpp_trade_promo_grp CHAR(2) CHARACTER SET UNICODE NOT CASESPECIFIC,
      dpp_loan_status_ind CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      dpp_loan_create_dt DATE FORMAT 'yyyy-mm-dd' COMPRESS ,
      dpp_loan_term_mth_qty INTEGER COMPRESS (6 ,12 ,20 ,24 ,30 ,36 ),
      dpp_loan_exp_dt DATE FORMAT 'yyyy-mm-dd' COMPRESS ,
      dpp_upg_elig_cd VARCHAR(6) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('100_DP','50_UO','75_DP','50_DP','60_DP','100_UO'),
      dpp_loan_upg_pct INTEGER COMPRESS (50 ,60 ,75 ,100 ),
      dpp_orig_device_amt DECIMAL(18,2) COMPRESS (768.00 ,192.00 ,960.00 ,384.00 ,576.00 ,168.99 ,849.97 ,849.99 ,529.99 ,18.00 ,850.00 ,210.00 ,274.00 ,530.00 ,699.00 ,955.00 ,507.00 ,99.99 ,100.00 ,420.00 ,525.00 ,949.99 ,629.99 ,950.00 ,630.00 ,799.00 ,839.99 ,199.99 ,1159.99 ,840.00 ,200.00 ,264.00 ,1160.00 ,648.00 ,625.00 ,729.99 ,89.99 ,1049.99 ,409.99 ,730.00 ,410.00 ,706.99 ,707.00 ,195.00 ,299.99 ,1259.99 ,748.00 ,300.00 ,556.00 ,1260.00 ,829.99 ,1149.99 ,509.99 ,830.00 ,446.00 ,510.00 ,230.99 ,231.00 ,999.00 ,719.99 ,79.99 ,143.99 ,399.99 ,720.00 ,144.00 ,912.00 ,400.00 ,528.00 ,929.99 ,1249.99 ,609.99 ,930.00 ,599.76 ,610.00 ,1099.00 ,755.99 ,179.99 ,499.99 ,692.00 ,756.00 ,180.00 ,500.00 ,669.00 ,1349.99 ,709.99 ,1029.99 ,710.00 ,599.98 ,791.99 ,599.99 ,24.00 ,792.00 ,408.00 ,472.00 ,600.00 ,128.99 ,769.00 ,129.00 ,449.00 ,1449.99 ,809.99 ,810.00 ,659.00 ,699.99 ,379.99 ,700.00 ,380.00 ,444.00 ,572.00 ,869.00 ,549.00 ,910.00 ,270.00 ,374.99 ,671.99 ,799.99 ,159.99 ,479.99 ,672.00 ,96.00 ,800.00 ,160.00 ,480.00 ,777.00 ,201.00 ,969.00 ,649.00 ,49.99 ,1009.99 ,369.99 ,1010.00 ,370.00 ,794.99 ,795.00 ,899.99 ,259.99 ,579.99 ,196.00 ,900.00 ,260.00 ,749.00 ,109.00 ,149.99 ,1109.99 ,1110.00 ,470.00 ,190.99 ,191.00 ,575.00 ,679.99 ,167.99 ,999.99 ,359.99 ,680.00 ,168.00 ,936.00 ,1000.00 ,360.00 ,424.00 ,488.00 ,552.00 ,849.00 ,249.99 ,569.99 ,250.00 ,674.99 ,675.00 ,779.99 ,1099.99 ,459.99 ,780.00 ,1100.00 ,460.00 ,524.00 ,949.00 ,669.99 ,989.99 ,349.99 ,670.00 ,990.00 ,350.00 ,879.99 ,239.99 ,1199.99 ,559.99 ,623.99 ,816.00 ,880.00 ,240.00 ,496.00 ,1200.00 ,560.00 ,624.00 ,769.99 ,449.99 ,577.99 ,130.00 ,450.00 ,578.00 ,659.99 ,979.99 ,1299.99 ,660.00 ,980.00 ,596.00 ,1149.00 ,549.98 ,869.99 ,549.99 ,870.00 ,230.00 ,550.00 ,399.00 ,1399.99 ,759.99 ,1079.99 ,696.00 ,760.00 ,120.00 ,312.00 ,376.00 ,440.00 ,649.92 ,1249.00 ,649.97 ,649.98 ,969.99 ,329.99 ,649.99 ,650.00 ,754.99 ,755.00 ,179.00 ,499.00 ,859.99 ,668.00 ,860.00 ,476.00 ,749.96 ,749.97 ,749.98 ,749.99 ,109.99 ,429.99 ,750.00 ,849.84 ,238.00 ,430.00 ,599.00 ,959.99 ),
      dpp_orig_loan_amt DECIMAL(18,2) COMPRESS (768.00 ,192.00 ,960.00 ,384.00 ,576.00 ,168.99 ,849.99 ,529.99 ,18.00 ,786.00 ,210.00 ,274.00 ,466.00 ,530.00 ,699.00 ,99.99 ,100.00 ,420.00 ,612.00 ,525.00 ,949.99 ,629.99 ,0.24 ,950.00 ,630.00 ,0.25 ,799.00 ,839.99 ,199.99 ,1159.99 ,519.99 ,840.00 ,200.00 ,264.00 ,456.00 ,1160.00 ,520.00 ,648.00 ,729.99 ,89.99 ,1049.99 ,409.99 ,730.00 ,410.00 ,707.00 ,195.00 ,299.99 ,300.00 ,492.00 ,556.00 ,1260.00 ,829.99 ,1149.99 ,509.99 ,830.00 ,446.00 ,510.00 ,231.00 ,999.00 ,719.99 ,79.99 ,143.99 ,399.99 ,720.00 ,144.00 ,400.00 ,528.00 ,592.00 ,929.99 ,1249.99 ,609.99 ,930.00 ,599.76 ,610.00 ,755.99 ,179.99 ,499.99 ,692.00 ,756.00 ,180.00 ,500.00 ,349.00 ,1349.99 ,709.99 ,1029.99 ,710.00 ,599.98 ,791.99 ,599.99 ,24.00 ,792.00 ,408.00 ,472.00 ,600.00 ,1.00 ,769.00 ,129.00 ,449.00 ,1449.99 ,809.99 ,810.00 ,659.00 ,699.99 ,379.99 ,700.00 ,380.00 ,444.00 ,572.00 ,636.00 ,869.00 ,549.00 ,910.00 ,270.00 ,374.99 ,671.99 ,799.99 ,159.99 ,479.99 ,672.00 ,96.00 ,800.00 ,160.00 ,480.00 ,648.99 ,777.00 ,201.00 ,649.00 ,49.99 ,1009.99 ,369.99 ,50.00 ,1010.00 ,370.00 ,795.00 ,899.99 ,259.99 ,579.99 ,196.00 ,900.00 ,260.00 ,516.00 ,749.00 ,109.00 ,149.99 ,1109.99 ,1110.00 ,470.00 ,190.99 ,574.99 ,191.00 ,575.00 ,679.99 ,167.99 ,999.99 ,359.99 ,680.00 ,168.00 ,1000.00 ,360.00 ,424.00 ,488.00 ,552.00 ,849.00 ,249.99 ,569.99 ,250.00 ,570.00 ,674.99 ,675.00 ,779.99 ,1099.99 ,459.99 ,780.00 ,1100.00 ,460.00 ,524.00 ,949.00 ,669.99 ,989.99 ,349.99 ,670.00 ,990.00 ,350.00 ,879.99 ,239.99 ,1199.99 ,559.99 ,623.99 ,816.00 ,880.00 ,240.00 ,560.00 ,624.00 ,24.99 ,769.99 ,449.99 ,577.99 ,130.00 ,450.00 ,578.00 ,642.00 ,299.00 ,659.99 ,979.99 ,1299.99 ,660.00 ,980.00 ,596.00 ,552.49 ,1149.00 ,869.99 ,549.99 ,870.00 ,550.00 ,399.00 ,1399.99 ,759.99 ,1079.99 ,696.00 ,760.00 ,120.00 ,312.00 ,376.00 ,440.00 ,1249.00 ,649.97 ,649.98 ,969.99 ,329.99 ,649.99 ,10.00 ,586.00 ,650.00 ,755.00 ,499.00 ,859.99 ,668.00 ,860.00 ,476.00 ,540.00 ,749.97 ,749.98 ,749.99 ,109.99 ,429.99 ,750.00 ,430.00 ,599.00 ,959.99 ,639.99 ),
      dpp_loan_mth_pymnt_amt DECIMAL(7,2) COMPRESS (0.01 ,33.29 ,7.70 ,20.50 ,0.04 ,15.41 ,33.33 ,25.66 ,30.81 ,66.66 ,12.91 ,30.83 ,23.16 ,10.37 ,46.24 ,10.41 ,28.33 ,46.25 ,20.66 ,13.00 ,43.74 ,25.83 ,5.37 ,15.62 ,2.83 ,7.95 ,36.11 ,41.24 ,5.41 ,23.33 ,41.25 ,15.66 ,20.79 ,8.00 ,38.74 ,20.83 ,38.75 ,36.20 ,25.99 ,26.00 ,36.24 ,54.16 ,0.41 ,18.33 ,36.25 ,8.12 ,26.04 ,31.16 ,33.74 ,15.83 ,33.75 ,8.16 ,31.20 ,31.24 ,13.33 ,31.25 ,21.04 ,18.50 ,28.74 ,10.83 ,16.00 ,21.12 ,26.24 ,8.33 ,26.25 ,18.58 ,41.62 ,28.83 ,8.37 ,23.74 ,41.66 ,5.83 ,23.75 ,34.00 ,31.45 ,13.54 ,0.75 ,11.00 ,21.24 ,3.33 ,21.25 ,31.49 ,18.70 ,31.50 ,23.83 ,28.95 ,18.74 ,36.66 ,0.83 ,18.75 ,29.00 ,52.04 ,5.99 ,6.00 ,52.08 ,26.50 ,23.95 ,13.74 ,31.66 ,23.99 ,24.00 ,26.56 ,29.12 ,1.00 ,29.16 ,11.25 ,21.50 ,31.75 ,1.04 ,24.08 ,62.49 ,26.66 ,8.75 ,19.00 ,6.24 ,24.16 ,42.08 ,6.25 ,39.54 ,26.75 ,11.41 ,3.74 ,21.66 ,39.58 ,14.00 ,19.16 ,16.62 ,32.00 ,29.45 ,52.49 ,88.33 ,16.66 ,34.58 ,52.50 ,32.04 ,21.83 ,49.99 ,32.08 ,24.41 ,21.87 ,39.79 ,27.00 ,11.66 ,29.58 ,4.00 ,27.04 ,44.99 ,27.08 ,19.41 ,22.00 ,60.41 ,6.66 ,39.99 ,4.16 ,22.08 ,40.00 ,24.66 ,17.00 ,32.37 ,37.49 ,19.58 ,37.50 ,29.83 ,34.99 ,17.08 ,35.00 ,14.54 ,19.66 ,24.79 ,32.49 ,14.58 ,32.50 ,24.83 ,47.87 ,29.99 ,47.91 ,30.00 ,27.45 ,6.99 ,19.79 ,7.00 ,27.49 ,9.58 ,27.50 ,19.83 ,24.95 ,7.04 ,9.62 ,24.99 ,42.91 ,7.08 ,25.00 ,40.37 ,4.54 ,40.41 ,58.33 ,4.58 ,22.50 ,32.75 ,19.99 ,37.91 ,2.08 ,20.00 ,35.37 ,17.49 ,35.41 ,17.50 ,14.95 ,38.00 ,14.99 ,32.91 ,15.00 ,12.45 ,9.91 ,27.83 ,12.49 ,30.41 ,48.33 ,12.50 ,27.87 ,32.99 ,45.79 ,33.00 ,17.66 ,9.99 ,27.91 ,45.83 ,10.00 ,7.45 ,35.62 ,7.49 ,25.41 ,7.50 ,22.87 ,27.99 ,28.00 ,33.12 ,20.33 ,22.91 ,40.83 ,5.00 ,25.50 ,56.24 ,38.33 ,23.00 ,28.12 ,23.02 ,71.66 ,17.91 ,35.83 ),
      dpp_remaining_loan_bal DECIMAL(18,2) COMPRESS (0.00 ,670.74 ,458.26 ,1006.11 ,105.00 ,156.20 ,916.52 ,33.33 ,849.99 ,210.00 ,312.40 ,524.88 ,66.66 ,348.26 ,189.56 ,916.60 ,315.00 ,468.60 ,99.99 ,100.00 ,420.00 ,624.80 ,696.52 ,77.00 ,133.32 ,379.08 ,525.00 ,166.64 ,253.68 ,379.12 ,591.60 ,630.00 ,166.65 ,94.98 ,624.90 ,199.98 ,840.00 ,200.00 ,233.28 ,233.31 ,299.88 ,443.24 ,870.77 ,814.47 ,54.16 ,90.00 ,266.64 ,87.48 ,299.97 ,824.78 ,300.00 ,333.28 ,791.54 ,333.30 ,31.24 ,189.96 ,243.72 ,612.36 ,650.76 ,366.63 ,1149.99 ,126.00 ,187.44 ,1093.68 ,343.64 ,399.96 ,499.80 ,824.94 ,538.22 ,712.31 ,399.99 ,80.00 ,289.92 ,433.28 ,466.56 ,499.84 ,433.29 ,656.04 ,41.66 ,466.62 ,929.99 ,1249.99 ,499.92 ,958.18 ,499.95 ,622.83 ,958.20 ,320.76 ,284.94 ,499.99 ,108.32 ,180.00 ,533.28 ,566.61 ,779.11 ,710.00 ,70.00 ,174.96 ,633.20 ,599.94 ,297.88 ,208.30 ,599.99 ,633.27 ,666.56 ,280.00 ,666.60 ,29.16 ,385.00 ,42.00 ,62.48 ,170.00 ,326.16 ,379.92 ,487.44 ,699.93 ,218.68 ,554.04 ,733.26 ,502.86 ,699.99 ,60.00 ,766.56 ,252.00 ,374.88 ,1101.93 ,728.18 ,766.59 ,165.00 ,531.08 ,374.94 ,687.28 ,126.64 ,162.48 ,833.20 ,270.00 ,408.24 ,474.81 ,119.00 ,799.99 ,160.00 ,480.00 ,474.90 ,262.44 ,352.04 ,574.77 ,787.29 ,562.02 ,83.32 ,541.58 ,899.99 ,116.64 ,362.40 ,1145.76 ,221.62 ,472.50 ,27.08 ,910.29 ,150.00 ,641.52 ,674.82 ,306.18 ,63.00 ,93.72 ,569.88 ,249.90 ,999.99 ,40.00 ,144.96 ,168.00 ,216.64 ,249.92 ,360.00 ,249.96 ,406.12 ,495.72 ,708.22 ,621.18 ,562.32 ,349.86 ,35.00 ,718.52 ,316.60 ,406.20 ,1099.99 ,140.00 ,349.92 ,664.86 ,449.82 ,349.99 ,398.64 ,718.65 ,1054.02 ,81.24 ,204.12 ,416.60 ,874.86 ,112.00 ,240.00 ,560.00 ,1054.09 ,680.34 ,549.78 ,411.58 ,449.99 ,58.32 ,130.00 ,181.20 ,270.80 ,84.00 ,124.96 ,583.20 ,124.98 ,862.27 ,281.16 ,460.36 ,583.24 ,158.30 ,437.36 ,1008.26 ,437.40 ,593.56 ,862.38 ,56.00 ,760.00 ,120.00 ,434.88 ,440.00 ,506.56 ,749.80 ,135.40 ,291.60 ,330.00 ,1197.84 ,291.62 ,749.88 ,28.00 ,217.44 ,220.00 ,253.28 ,324.96 ,962.43 ,145.80 ,637.33 ,749.99 ,110.00 ,601.54 ,670.68 ,532.44 ,524.79 ),
      dpp_remaining_payments INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ),
      dpp_device_amt_paid DECIMAL(18,2) COMPRESS (0.00 ,192.00 ,253.44 ,960.00 ,384.00 ,576.00 ,145.95 ,514.59 ,105.00 ,849.99 ,529.99 ,210.00 ,33.40 ,315.00 ,100.00 ,335.52 ,420.00 ,66.73 ,458.41 ,916.67 ,100.06 ,949.99 ,525.03 ,629.99 ,630.00 ,348.42 ,133.39 ,156.43 ,199.99 ,312.63 ,379.19 ,471.35 ,166.72 ,840.00 ,200.00 ,379.23 ,468.83 ,59.24 ,200.05 ,729.99 ,166.79 ,625.03 ,90.00 ,410.00 ,625.05 ,95.14 ,233.38 ,568.75 ,233.43 ,266.71 ,300.00 ,143.88 ,300.04 ,443.40 ,725.03 ,1149.99 ,126.00 ,510.00 ,333.37 ,87.63 ,243.79 ,366.70 ,333.43 ,366.71 ,399.99 ,720.00 ,80.00 ,144.00 ,400.00 ,528.00 ,791.69 ,400.03 ,612.51 ,190.12 ,929.99 ,433.35 ,507.59 ,433.36 ,31.47 ,466.69 ,187.67 ,466.71 ,499.99 ,756.00 ,180.00 ,500.02 ,343.87 ,622.91 ,41.81 ,500.07 ,533.35 ,710.00 ,70.00 ,287.61 ,656.27 ,320.91 ,566.68 ,285.10 ,599.99 ,792.00 ,280.00 ,408.00 ,600.00 ,600.01 ,297.95 ,385.00 ,633.34 ,175.11 ,810.00 ,666.67 ,208.45 ,31.82 ,666.71 ,699.99 ,487.51 ,543.83 ,700.00 ,60.00 ,29.31 ,733.33 ,380.08 ,766.66 ,554.19 ,119.00 ,95.97 ,431.34 ,62.71 ,799.99 ,672.00 ,800.00 ,160.00 ,480.00 ,218.91 ,649.00 ,375.09 ,49.99 ,833.35 ,375.11 ,408.39 ,50.00 ,126.80 ,1010.00 ,352.11 ,531.31 ,687.51 ,260.00 ,472.50 ,262.59 ,749.00 ,29.66 ,149.99 ,541.67 ,580.07 ,150.00 ,83.47 ,63.00 ,191.00 ,541.73 ,116.79 ,999.99 ,680.00 ,40.00 ,168.00 ,360.00 ,552.00 ,221.78 ,239.70 ,849.00 ,249.99 ,641.67 ,250.00 ,675.00 ,35.00 ,780.00 ,140.00 ,588.00 ,93.95 ,250.11 ,406.27 ,495.87 ,693.00 ,708.37 ,669.99 ,250.15 ,349.99 ,350.00 ,406.35 ,137.56 ,316.76 ,879.99 ,350.07 ,559.99 ,562.55 ,595.83 ,880.00 ,240.00 ,560.00 ,624.00 ,718.75 ,48.06 ,769.99 ,383.43 ,449.99 ,450.00 ,204.27 ,416.75 ,63.48 ,659.99 ,270.87 ,660.00 ,20.00 ,84.00 ,91.73 ,411.74 ,58.47 ,869.99 ,549.99 ,550.00 ,460.43 ,759.99 ,583.35 ,696.00 ,760.00 ,120.00 ,440.00 ,504.00 ,125.13 ,583.39 ,158.46 ,125.19 ,969.99 ,649.99 ,650.00 ,191.79 ,281.39 ,437.55 ,45.90 ,859.99 ,437.59 ,860.00 ,220.00 ,476.00 ,593.79 ,749.99 ,291.75 ,325.03 ,429.99 ,110.00 ,291.77 ,750.03 ),
      dpp_loan_amt_paid DECIMAL(18,2) COMPRESS (0.00 ,192.00 ,253.44 ,960.00 ,384.00 ,576.00 ,145.95 ,514.59 ,105.00 ,849.99 ,529.99 ,210.00 ,33.40 ,315.00 ,100.00 ,335.52 ,420.00 ,66.73 ,458.41 ,100.06 ,949.99 ,525.03 ,629.99 ,630.00 ,348.42 ,133.39 ,156.43 ,199.99 ,312.63 ,379.19 ,166.72 ,840.00 ,200.00 ,379.23 ,468.83 ,59.24 ,200.05 ,729.99 ,166.79 ,625.03 ,90.00 ,410.00 ,625.05 ,95.14 ,233.38 ,568.75 ,233.43 ,266.71 ,299.99 ,300.00 ,143.88 ,300.04 ,725.03 ,1149.99 ,126.00 ,510.00 ,333.37 ,87.63 ,243.79 ,366.70 ,333.43 ,366.71 ,399.99 ,720.00 ,80.00 ,144.00 ,528.00 ,791.69 ,400.03 ,612.51 ,190.12 ,929.99 ,433.35 ,507.59 ,433.36 ,31.47 ,466.69 ,187.67 ,466.71 ,499.99 ,756.00 ,180.00 ,500.02 ,343.87 ,622.91 ,41.81 ,500.07 ,533.35 ,710.00 ,70.00 ,287.61 ,656.27 ,320.91 ,566.68 ,285.10 ,599.99 ,75.20 ,792.00 ,280.00 ,408.00 ,600.00 ,600.01 ,297.95 ,1.00 ,385.00 ,633.34 ,175.11 ,810.00 ,666.67 ,208.45 ,31.82 ,666.71 ,699.99 ,487.51 ,543.83 ,700.00 ,60.00 ,29.31 ,733.33 ,380.08 ,766.66 ,554.19 ,119.00 ,95.97 ,62.71 ,799.99 ,672.00 ,160.00 ,480.00 ,218.91 ,649.00 ,375.09 ,49.99 ,833.35 ,375.11 ,408.39 ,50.00 ,126.80 ,1010.00 ,352.11 ,531.31 ,687.51 ,260.00 ,472.50 ,262.59 ,749.00 ,29.66 ,149.99 ,541.67 ,150.00 ,83.47 ,63.00 ,191.00 ,50.21 ,541.73 ,116.79 ,999.99 ,680.00 ,40.00 ,168.00 ,360.00 ,552.00 ,616.00 ,221.78 ,239.70 ,849.00 ,216.71 ,249.99 ,641.67 ,250.00 ,675.00 ,35.00 ,780.00 ,140.00 ,588.00 ,93.95 ,250.11 ,406.27 ,495.87 ,708.37 ,669.99 ,250.15 ,349.99 ,30.00 ,406.35 ,137.56 ,316.76 ,879.99 ,350.07 ,559.99 ,562.55 ,595.83 ,880.00 ,240.00 ,560.00 ,624.00 ,718.75 ,48.06 ,769.99 ,383.43 ,449.99 ,450.00 ,204.27 ,416.75 ,63.48 ,659.99 ,270.87 ,660.00 ,20.00 ,84.00 ,91.73 ,411.74 ,58.47 ,869.99 ,549.99 ,550.00 ,25.22 ,460.43 ,759.99 ,583.35 ,696.00 ,760.00 ,120.00 ,440.00 ,504.00 ,125.13 ,583.39 ,158.46 ,125.19 ,969.99 ,649.99 ,10.00 ,650.00 ,191.79 ,281.39 ,437.55 ,45.90 ,859.99 ,437.59 ,860.00 ,220.00 ,476.00 ,593.79 ,749.99 ,291.75 ,325.03 ,429.99 ,110.00 ,291.77 ,750.03 ),
      dpp_device_pct_paid DECIMAL(10,2) COMPRESS (0.00 ,0.01 ,0.02 ,0.03 ,0.04 ,0.05 ,0.06 ,0.07 ,0.08 ,0.09 ,0.10 ,0.11 ,0.12 ,0.13 ,0.14 ,0.15 ,0.16 ,0.17 ,0.18 ,0.19 ,0.20 ,0.21 ,0.22 ,0.23 ,0.24 ,0.25 ,0.26 ,0.27 ,0.28 ,0.29 ,0.30 ,0.31 ,0.32 ,0.33 ,0.34 ,0.35 ,0.36 ,0.37 ,0.38 ,0.39 ,0.40 ,0.41 ,0.42 ,0.43 ,0.44 ,0.45 ,0.46 ,0.47 ,0.48 ,0.49 ,0.50 ,0.51 ,0.52 ,0.53 ,0.54 ,0.55 ,0.56 ,0.57 ,0.58 ,0.59 ,0.60 ,0.61 ,0.62 ,0.63 ,0.64 ,0.65 ,0.66 ,0.67 ,0.68 ,0.69 ,0.70 ,0.71 ,0.72 ,0.73 ,0.74 ,0.75 ,0.76 ,0.77 ,0.78 ,0.79 ,0.80 ,0.81 ,0.82 ,0.83 ,0.84 ,0.85 ,0.86 ,0.87 ,0.88 ,0.89 ,0.90 ,0.91 ,0.92 ,0.93 ,0.94 ,0.95 ,0.96 ,0.97 ,0.98 ,0.99 ,1.00 ,-1.00 ,-0.74 ,-0.68 ,-0.25 ,-0.17 ,-0.12 ,-0.08 ,-0.04 ,-0.02 ,-0.01 ),
      dpp_loan_pct_paid DECIMAL(10,2) COMPRESS (0.00 ,0.01 ,0.02 ,0.03 ,0.04 ,0.05 ,0.06 ,0.07 ,0.08 ,0.09 ,0.10 ,0.11 ,0.12 ,0.13 ,0.14 ,0.15 ,0.16 ,-20.32 ,0.17 ,0.18 ,0.19 ,0.20 ,-20.28 ,0.21 ,0.22 ,0.23 ,0.24 ,-20.24 ,0.25 ,0.26 ,0.27 ,0.28 ,-20.20 ,0.29 ,0.30 ,0.31 ,0.32 ,-20.16 ,0.33 ,0.34 ,0.35 ,0.36 ,-20.12 ,0.37 ,0.38 ,0.39 ,0.40 ,-20.08 ,0.41 ,0.42 ,0.43 ,0.44 ,-20.04 ,0.45 ,0.46 ,0.47 ,0.48 ,0.49 ,0.50 ,0.51 ,0.52 ,0.53 ,0.54 ,0.55 ,0.56 ,0.57 ,0.58 ,0.59 ,0.60 ,0.61 ,0.62 ,0.63 ,0.64 ,0.65 ,0.66 ,0.67 ,0.68 ,0.69 ,0.70 ,0.71 ,0.72 ,0.73 ,0.74 ,0.75 ,0.76 ,0.77 ,0.78 ,0.79 ,0.80 ,0.81 ,0.82 ,0.83 ,0.84 ,-4.28 ,0.85 ,0.86 ,0.87 ,0.88 ,-4.24 ,0.89 ,0.90 ,0.91 ,0.92 ,-4.20 ,0.93 ,0.94 ,0.95 ,0.96 ,-32.32 ,-4.16 ,0.97 ,0.98 ,0.99 ,1.00 ,-32.28 ,-4.12 ,-32.24 ,-4.08 ,-32.20 ,-4.04 ,-32.16 ,-32.12 ,-32.08 ,-32.04 ,-1.00 ,-0.92 ,-0.75 ,-0.74 ,-3.28 ,-3.24 ,-0.68 ,-3.20 ,-3.16 ,-3.12 ,-3.08 ,-3.04 ,-0.25 ,-0.17 ,-0.12 ,-0.08 ,-0.04 ,-0.03 ,-0.02 ,-0.01 ),
      dpp_au_pay_status CHAR(9) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('50_00_Pay','50_01_Pay','50_02_Pay','50_03_Pay','50_04_Pay','50_05_Pay','50_06_Pay','50_07_Pay','50_08_Pay','50_09_Pay','50_10_Pay','50_11_Pay','50_12_Pay'),
      calh_esn_redempt_dt DATE FORMAT 'yyyy-mm-dd' COMPRESS ,
      calh_t_mth VARCHAR(8) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('38) OOC','01) T-24','25) T-0','02) T-23','03) T-22','04) T-21','05) T-20','06) T-19','09) T-16','07) T-18','10) T-15','08) T-17','11) T-14','13) T-12','12) T-13','14) T-11','15) T-10','26) T+1','16) T-9','17) T-8','18) T-7','19) T-6','20) T-5','27) T+2','21) T-4','22) T-3','28) T+3','23) T-2','29) T+4','30) T+5','24) T-1','31) T+6','32) T+7','33) T+8','34) T+9','35) T+10','36) T+11','37) T+12','99) Null'),
      calh_line_act_dt DATE FORMAT 'yyyy-mm-dd' COMPRESS ,
      calh_mtn_act_dt DATE FORMAT 'yyyy-mm-dd' COMPRESS ,
      acct_estb_dt DATE FORMAT 'yyyy-mm-dd' COMPRESS ,
      upg_elig CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      rialto_prod_nm VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('iPhone 7 Black 32GB','IPHONE 8 SPACE GRAY 64GB VZ','Samsung Galaxy S7 Black 32GB','IPHONE 8 PLUS SP GRAY 64GB VZ','iPhone 6 16GB Space Gray','IPHONE X SPACE GRAY 64GB VZ','IPHONE 8 PLUS GOLD 64GB VZ','iPhone 7 Black 128GB','iPhone 7 Rose Gold 32GB','IPHONE 8 GOLD 64GB VZ','IPHONE X SILVER 64GB VZ','Hum by Verizon','LG Revere 3','Samsung Galaxy S7 Gold 32GB','iPhone 7 Plus Black 128GB','iPhone 6S 64GB Space Gray','IPHONE X SPACE GRAY 256GB VZ','Samsung Galaxy S8 Black','IPHONE XR BLACK 64GB','iPhone 7 Plus Black 32GB','Verizon Ellipsis 8','iPhone 6S 32GB Space Gray','Samsung Galaxy J7 V','IPHONE 8 SILVER 64GB VZ','Samsung Galaxy Tab E 8','iPhone 6 64GB Space Gray','IPHONE X SILVER 256GB VZ','SAMSUNG NOTE 8 MIDNIGHT BLACK','iPhone 7 Rose Gold 128GB','iPhone 6S 16GB Space Gray','iPhone 7 Plus Rose Gold 128GB','iPhone 6 16GB Silver','Samsung Galaxy S9 Midnight Black','Samsung Tab A 8','IPHONE 8 PLUS SILVER 64GB VZ','SAMSUNG GALAXY J3 ECLIPSE','Samsung Galaxy J3 V','Samsung Galaxy S 5 Black','Samsung Galaxy S8 Plus Black','iPhone 6S 64GB Rose Gold','iPhone 7 Plus Rose Gold 32GB','VZ Jetpack 4G MHS MIFI 6620L','Samsung Galaxy S8 Orchid Gray','SAMSUNG GALAXY J3 V 3RD GEN','iPhone 7 Silver 32GB','iPhone 5S Space Gray 16GB','Galaxy S9 Plus Midnight Black','Samsung Galaxy S6 Black 32GB','LG K20 V','IPHONE XR WHITE 64GB','Home Phone Connect F256','SAMSUNG NOTE 8 ORCHID GRAY','IPHONE XR BLACK 128GB','Kyocera Cadence LTE','IPHONE XR RED 64GB','IPHONE 8 PLUS SP GRY 256GB VZ','SAM Galaxy S8 Plus Orchid Gray','iPhone 6S 16GB Rose Gold','iPhone 7 Gold 32GB','iPhone 6 16GB Gold','Verizon Ellipsis 7','Samsung Galaxy S7 edge BLK 32GB','Verizon Ellipsis Jetpack MHS900L','Samsung Galaxy S9 Lilac Purple','Galaxy Note9 Ocean Blue 128GB','MOTO Z3','SAM GALAXY J7 V 2ND GENERATION','IPHONE XS SPACE GRAY 64GB VZ','IPAD 9.7 32GB SPACE GRAY VZ','IPAD WIFI 32GB SPACE GRAY','iPhone 6S 32GB Rose Gold','PIXEL 2 XL JUST BLACK 64GB','Galaxy S9 Plus Coral Blue','IPHONE XS MAX SPACE GRAY 64GB VZ','IPHONE XS MAX GOLD 64GB VZ','IPHONE 11 BLACK 64GB VZ','VZ Jetpack 4G MHS MIFI5510L','MOTO Z2 FORCE BLACK','Samsung Galaxy S9 Coral Blue','Galaxy S9 Plus Lilac Purple','IPHONE 8 PLUS GOLD 256GB VZ','Wireless Home Phone','Samsung Galaxy S7 edge SLV 32GB','IPHONE XS MAX SPACE GRY 256GB VZ','Jetpack 4G LTE MHS MiFi 7730L','IPHONE SE SPACE GRAY 32GB','iPhone 6S Plus 64GB Space Gray','iPhone 7 Plus Jet Black 128GB','Samsung Galaxy Tab E 32GB','iPhone 7 Silver 128GB','iPhone 7 Jet Black 128GB','IPHONE 8 PLUS 64GB RED VERIZON','iPhone 5S Silver 16GB','IPHONE XS MAX GOLD 256GB VZ','iPhone 6S 64GB Silver','IPHONE SE SPACE GRAY 16GB','iPhone 6 64GB Silver','IPHONE 8 SPACE GRAY 256GB VZ','Samsung Galaxy S8 Silver','iPhone 6S 128GB Space Gray','iPhone 6S Plus 64GB Rose Gold','Moto Z Force BLACK/LUNAR GREY','IPHONE XR BLUE 64GB','PIXEL 2 JUST BLACK 64GB','MOTO Z2 PLAY LUNAR GRAY','IPHONE XS SPACE GRAY 256GB VZ','iPhone 6S 64GB Gold','IPHONE XS GOLD 64GB VZ','HUM PLUS VT410','iPhone 7 Plus Red 128GB','Samsung Galaxy Core Prime','Samsung Galaxy S8 Plus Silver','SAM GALAXY S10 PLUS BLACK 128GB','iPhone 7 Gold 128GB','Samsung Galaxy S 5 White','IPHONE SE SPACE GRAY 64GB','Moto Z Play Black','LG Exalt LTE','DuraXVPlus by Kyocera','Samsung Gusto 3','LG Revere - VN150','IPHONE XR WHITE 128GB','SAMSUNG GALAXY NOTE5 BLACK 32 GB','iPhone 7 Plus Gold 128GB','Verizon Ellipsis 10','APPLE WATCH S4 44 SG AL BLK SP','SAMSUNG GALAXY S10 BLACK 128GB','DROID TURBO 2 BLK Soft-Grip 32GB','Galaxy Note9 Purple 128GB','LG Cosmos 3','ASUS ZenPad Z8s','iPhone 7 Plus Silver 128GB','SAMSUNG A50','IPHONE 8 64GB RED VERIZON','iPhone 6 64GB Gold','LG Stylo 2 V','iPhone 6 Plus 64GB Space Gray','iPhone 6 Plus 16GB Space Gray','iPhone 6S 16GB Silver','IPHONE XR RED 128GB','APPLE WATCH S3 42 SG AL BLK SP','IPHONE 11 BLACK 128GB VZ','iPhone 7 Red 128GB','Samsung Galaxy S6 White 32GB','APPLE WATCH S3 38 G AL PKSD SP','Dura XV LTE with camera','Ellipsis Jetpack MHS800L','iPhone 6S 32GB Silver','PIXEL 3 64 GB BLACK','Wireless Home Phone T2000','IPHONE XR CORAL 64GB','iPhone 6S 16GB Gold','SAMSUNG GALAXY A10E','MOTO Z4','IPHONE XS GOLD 256GB VZ','iPhone 7 Plus Silver 32GB','Ellipsis 8 HD Gray','IPAD MINI RETINA 16GB SILVER','GizmoGadget by LG Navy','IPAD MINI RETINA 16GB SPC GRAY','IPHONE SE ROSE GOLD 16GB','Moto G6','IPHONE 11 PURPLE 64GB VZ','LG G6 Platinum','IPHONE 11 WHITE 64GB VZ','Samsung Convoy 4','IPHONE 8 PLUS SILVER 256GB VZ','SAMSUNG GALAXY S10e BLACK 128GB','SAM GALAXY NOTE9 BLACK 128GB','LG G5 Titanium','Kyocera DuraForcePRO','LG Revere 2','iPhone 7 Plus Gold 32GB','APPLE WATCH S4 40 G AL PS SP','LG V20 Titanium','ASUS ZenPad Z10','Ellipsis Jetpack MHS815L','Pixel Black 32GB','IPHONE 8 GOLD 256GB VZ','IPHONE 11 RED 64GB VZ','Samsung Convoy 3','Samsung Galaxy S6 Gold 32GB','iPhone 5S Gold 16GB','iPhone 6 Plus 16GB Gold','iPhone 7 Plus Black 256GB','Samsung Galaxy S7 edge Gold 32GB','PIXEL 3 XL 64 GB BLACK','IPHONE XS MAX SILVER 64GB VZ','PIXEL 2 XL BLACK AND WHITE 64GB','VZ JETPACK 4G LTE MHS AC791L','DROID TURBO by MOTOROLA BLACK BN','iPhone 6S Plus 16GB Space Gray','LG V30','Home Phone Connect FT2260','IPHONE SE ROSE GOLD 64GB','LG G6 Black','IPHONE 11 PRO MAX GREEN 256G VZ','IPHONE XR BLUE 128GB','IPHONE XS MAX SILVER 256GB VZ','LG G7 ThinQ BLACK','IPHONE 11 PRO MAX GRAY 256GB VZ','iPhone 6S Plus 128GB Space Gray','IPHONE 8 SPACE GRAY 64GB SO','IPHONE XS SILVER 64GB VZ','SAM Galaxy Note 4 Charcoal Black','iPhone 6S Plus 32GB Space Gray','iPhone 6S Plus 64GB Gold','VERIZON JETPACK MIFI 8800L','IPHONE X SPACE GRAY 64GB SO','iPhone 6S Plus 16GB Rose Gold','Samsung Galaxy S 4 Black 16GB','GizmoPal 2 by LG Blue','iPhone 6S 32GB Gold','LG GPad 8.3 LTE','IPHONE SE ROSE GOLD 32GB','GizmoGadget by LG Red','IPHONE 11 PRO MAX GRAY 64GB VZ','Samsung Convoy II','iPhone 6 Plus 16GB Silver','IPAD WIFI 32GB GOLD','IPAD WIFI 32GB SILVER','LG G7 ThinQ SILVER','IPHONE X SPACE GRAY 256GB SO','IPAD AIR 2 64GB S GRAY','SAM GALAXY S10 PLUS WHITE 128GB','LG-VX5600','iPhone 6 - Non VZW','iPhone 6 Plus 64GB Gold','iPhone 6 Plus 64GB Silver','IPHONE XR CORAL 128GB','IPAD AIR 2 16GB S GRAY','Motorola Droid Maxx 16GB Black','IPHONE 11 PRO MAX GREEN 64GB VZ','PIXEL 2 KINDA BLUE 64GB','IPHONE 5 BLACK 16GB','VZ Jetpack 4G MHS 890L','LG G Pad X8.3','Ellipsis 8 HD Blue','LG Exalt','iPhone 6S Plus 64GB Silver','IPHONE 11 GREEN 64GB VZ','IPHONE XS SILVER 256GB VZ','iPhone 5C White 16GB','SAMSUNG GALAXY S10 BLUE 128GB','IPHONE 8 SILVER 256GB VZ','IPHONE 11 PURPLE 128GB VZ','ASUS ZenPad Z8','Pixel XL Black 32GB','SAM GALAXY S10 PLUS BLUE 128GB','DROID MAXX 2 Blue'),
      rialto_data_tier VARCHAR(14) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Smartphone','Internet','Basic','Other Services','Unknown'),
      rialto_dev_grp VARCHAR(23) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Apple','Android','Tablet','Basic','Wearable Devices','Mobile Hotspot','Automotive','Home Phone Connect','USB','Other Connected Devices','Other Smart','WinMo','Cantenna / Modem','Blackberry','Laptop','Camera','Unknown','Router / Modem','Netbook','Other Internet','Embed Chip','PCMCIA','Palm','iPad Bundle','IP Virtual Device','Module','Tracking Device','IP Desk Phone'),
      rialto_brand_nm VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('iPhone 7','iPhone 6S','IPHONE 8','IPHONE 8 PLUS','iPhone 7 Plus','IPHONE X','iPhone XR','iPhone 6','Galaxy S7','iPhone SE','iPhone XS Max','iPhone 11','iPhone 6S Plus','Galaxy S8','iPhone XS','Galaxy S9','Galaxy S8 Plus','Galaxy S9 Plus','APPLE WATCH S3','Home Phone Connect','Galaxy Note 8','iPhone 5S','iPhone 6 Plus','iPhone 11 Pro Max','Galaxy S7 Edge','Hum by Verizon','Revere 3','Galaxy S6','GALAXY NOTE 9','Other','Galaxy S5','Apple Watch S4','Verizon Ellipsis 8','IPAD Mar17','IPAD 9.7','Galaxy J7 V','iPhone 11 Pro','Samsung Galaxy Tab E 8','PIXEL 2 XL','GALAXY S10 PLUS','GALAXY TAB A','Galaxy J3 V','IPAD AIR 2','PIXEL 2','Galaxy J3 Eclipse','IPAD MINI RETINA','iPhone 5C','GALAXY J3 V GEN3','MHS 6620','GALAXY S10','LG K20 V','Kyocera Cadence','DROID TURBO 2','GALAXY S10e','Galaxy Note 5','PIXEL 3','Ellipsis Jetpack MHS900L','Moto Z2 Force','Verizon Ellipsis 7','Moto Z3','Moto Z2 Play','Galaxy J7 V Gen2','Moto Z Force','DROID TURBO','Pixel','MHS 5510','Moto Z Play','IPAD AIR','LG G6','Galaxy S4','MHS 7730','PIXEL 3 XL','GizmoGadget','Apple Watch S5','Samsung Galaxy Tab E8','Ellipsis 8 HD','LG G7','iPad Pro 9.7','Pixel XL','HUM PLUS GEN2','Gusto III','Galaxy Core Prime','Exalt LTE','Kyocera DuraXV Plus','IPAD PRO 10.5 GEN2','Revere','iPhone SE 2020','LG G5','Galaxy A50','Verizon Ellipsis 10','MOTOROLA Z4','Galaxy Note 10 Plus','iPad Mini 4','Cosmos 3','Moto G6','ZenPad Z8s','LG Stylo 2','iPhone 5','Kyocera Dura XV LTE','GizmoPal 2','LG V20','Galaxy Note 4','MHS 800','SAMSUNG GALAXY A10','Samsung Galaxy Watch','GIZMOWATCH','Samsung Convoy 4','iPhone 4S','iPAD 7th Generation','Kyocera DuraForcePRO','IPAD MINI','DROID MAXX','Revere 2','Gusto II','IPAD RETINA','ASUS ZenPad Z10','Ellipsis Jetpack MHS815L','Samsung Convoy 3','MHS AC791L','LG V30','IPAD PRO','DROID MAXX 2','iPhone 4','VZ JETPACK MIFI 8800L','IPAD MINI 3','Moto Z Droid','LG GPad','Samsung Convoy','Samsung Gear S 3','IPAD PRO 12.9 GEN2','Samsung Gear S 2','Accolade','Galaxy S6 Edge Plus','MHS 890','LG G Pad X8.3','Exalt','Galaxy S6 Edge','Moto G7 Power','Galaxy Note 10','iPad 3','iPad 2','ASUS ZenPad Z8','LG V40','iPad Pro 11','LG Exalt 2','Haven','Gusto','Extravert 2','LG G4','Galaxy S3','LG Terra','Asus Zenfone V','Asus Zenfone V Live','LG G3','Galaxy A20','Galaxy Note 10 5G','Galaxy Note 3','LG K8','ALCATEL GO FLIP V','LG G8','LG GPad 7.0','Verizon Hum X GEN2','GzOne Ravine II','LG GPad 10.1','Galaxy S20 Plus','Kyocera Dura Force Pro 2','Samsung Galaxy Tab S2','iPad Pro 12.9 Gen3','PIXEL 3A','Convoy','Knack','PIXEL 3A XL','DROID MINI','Cosmos 2','Samsung Tab E','LG V10','Kyocera DuraXV','Pixel 4 XL','MHS 4510','GizmoTab','LTE Internet and Home Phone','Intensity 2','Galaxy S20 Ultra','Brigadier','Octane','Galaxy Tab A 10.5','Galaxy Tab S3','Ellipsis Jetpack','Pixel 4','IPAD AIR 10.5','Smooth','Ellipsis Kids','Ellipsis 10 HD','MHS 4620','Samsung Galaxy A51','Brightside','Samsung Galaxy Tab 4 10.1','IPAD MINI 7.9','Samsung Galaxy Tab 2 7.0','HTC 10','Galaxy S4 Mini','HomeFusion','Intensity 3','ORBIC JOURNEY','Unknown Smartphone','Cosmos','GALAXY TAB S4','GALAXY S10 5G','Moto E5 Play','Samsung Galaxy Watch  - Active 2','GzOne Ravine','MHS 291','DROID ULTRA','EnV 3','HTC One M9','DROID RAZR M','LG K4','HTC Desire 626','LG Lancet for Android','LG G Vista','SAMSUNG GALAXY TAB S5','HTC Desire 530','Verizon Hum X','Samsung Galaxy S20','HTC Desire 526','LG STYLO 5','GizmoPal','LG-VX8360','Moto G7 Play','Samsung Galaxy Tab 4 8.0','LG G2','Galaxy S3 Mini','Moto Z3 Play','Smarthub with Voice','MHS 4620LE','Sam Galaxy Book','Pantech 4G USB Modem','MOTO E6','Galaxy Note II','NEW MOTO X','All New HTC One','SAM Galaxy Tab S','Samsung Galaxy Tab 2 10.1','Barrage','ASUS ZenFone AR','MHS LC11','UNKNOWN 4G DEVICE','GALAXY NOTE 20 ULTRA','Samsung Galaxy Note 10.1','MHS 2200'),
      rialto_dev_gen CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      rialto_dev_typ VARCHAR(10) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('sp_apple','sp_android','tab','bas','wear','jetpack','auto','hpc','oth_inet','sp_other','zz oth','camera'),
      rialto_cdma CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      rialto_mfg_nm VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Apple','Samsung','LG','Motorola','Google','Novatel','Quanta','Kyocera','Huawei','Franklin','Hum','ASUS','VERIZON TELEMATICS','ODI DEVICE','ALCATEL','ZTE','Netgear','N/A','Casio','HTC','Quality One Wireless','RELIANCE COMMUNICATIONS','PanTech','UTStarCom','PCD','RIM','Nokia','WISTRON','Sony','SONIM','Sierra Wireless','Microsoft','ONEPLUS','HMD','Audiovox','ASKEY','HP','SEQUANS','Delphi','NEXTBOOK','Qualcomm','AMAZON','FIBOCOM','ON STAR','Palm','FOX','Gateway','DELL','RCC CONVERSION','JANUS','AXE','BROADSOFT','LMU','SUMMIT','HPI','PANASONIC','GOG','WAVECOM','Telit','G AND D','BRIGHTPOINT','Yealink','ANYDATA','Zebra','MEM','LG INNOTEK','STM','CINTERION','ALLTEL','ERICSSON','HERMES','FUSION WIRELESS','TELULAR','INGRAM','VERIZON','INTERMEC','ARRIS','RING LLC','INGRAM MICRO'),
      rialto_trade_promo_grp CHAR(2) CHARACTER SET UNICODE NOT CASESPECIFIC,
      rialto_short_nm VARCHAR(7) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('z) Not','c) Oth','a) X/11','b) 8','d) Old','e) 12'),
      rialto_dpp_tiv SMALLINT COMPRESS (0 ,100 ,440 ),
      rialto_cntrct1 VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('OOC','DP','DP-AU','SVC'),
      rialto_cntrct2 VARCHAR(3) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('IC','OOC'),
      rialto_cntrct3 VARCHAR(12) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('g) OOC','e) DP No AU','a) AU pay 0','d) AU pay 3+','f) SVC','c) AU pay 2','b) AU pay 1'),
      rialto_cntrct4 VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('f) OOC','d) Trade Pay 3+','a) Trade Pay 0','e) SVC','c) Trade Pay 2','b) Trade Pay 1'),
      rialto_cntrct5 VARCHAR(16) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('f) OOC','e) IC','a) AU pay 0','c) Trade Pay 0','d) Trade Pay 1-2','b) AU pay 1-2'),
      ever_upg CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      rialto_offer VARCHAR(24) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('a) DP-AU / Trade / Aware','b) Nat Promo','c) Reactive $200','d) Reactive $10 SE','z) Other'),
      dpp_elig CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      phog CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ohog_AAL CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ohog_Pricing CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ohog_Product CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ohog_Upgrade CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      dmsf_in_mkt INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      dmsf_max_in_mkt INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ))
PRIMARY INDEX ( ssf_cust_id ,ssf_cust_line_seq_id )
PARTITION BY RANGE_N(ssf_rpt_mth  BETWEEN 1180101  AND 1211201  EACH INTERVAL '1' MONTH ,
1211202  AND 1251231  EACH INTERVAL '1' MONTH ,
 NO RANGE, UNKNOWN);

show view ntl_prd_allvm.subs_sum_fact_v;

REPLACE VIEW NTL_PRD_ALLVM.SUBS_SUM_FACT_V
(RPT_MTH
,RPT_YEAR
,SOR_ID
,CUST_ID
,CUST_LINE_SEQ_ID
,MTN
,ACCT_NUM
,CUST_TYPE_CD
,REV_GEN_IND
,AREA_CD
,PREPAID_IND
,IN_CONTRACT_TERM
,PROMO_TYPE
,ACCESS_AMT
,VOICE_ACCESS_AMT
,DATA_ACCESS_AMT
,CHANNEL_TYPE
,MKT_CD
,TENURE
,PROD_NM
,PPLAN_CD
,PPLAN_MKT_CD
,COE_PPLAN_CLASS_DESC
,COE_PPLAN_CTGRY_DESC
,COE_PPLAN_TYPE_DESC
,COE_PPLAN_SUB_TYPE_DESC
,COE_PROD_TYPE_CD
,COE_PPLAN_GROUP
,COE_VOICE_PPLAN_ACCESS_AMT
,COE_DATA_PPLAN_ACCESS_AMT
,COE_PPLAN_SEGMT_DESC
,COE_PPLAN_SERVICE_TYPE_DESC
,MASTER_AGENT_ID
--,HRCHY_SEGMT
,LIFE_STAGE_SEGMT
,ETHNICITY_SEGMT
,ROLLUP_CD
,MNC_IND
,F1K_IND
,VZW_VALUE
,LANG_PREF_IND
,BIRTH_YEAR
,RLTD_ACCT_ID
,DUNS_LOC_NUM
,ECPD_PROFILE_ID
,SLS_OUTLET_ID
,VERTICAL
,ENDING_CUSTOMERS
,ORIG_SOR_ID
,MASTER_AGENT_AREA_CD
,VSN_CUST_TYPE_CD
,DEVICE_PROD_NM
,DEVICE_TYPE_CD
,ESN_NUM
,LINE_TYPE_CD
,PPLAN_LINE_ACCT_CD
,ACCT_ACCESS_AMT
,ACCT_VOICE_ACCESS_AMT
,ACCT_DATA_ACCESS_AMT
,PLAN_TYPE
,PPLAN_SHARE
,PPLAN_GROUP
,EQP_PROD_NM
,AREA_DESC
,REGION_CD
,REGION_DESC
,SUB_REGION_CD
,MANAGED_IND
,DEVICE_GROUPING
,DEVICE_GENERATION
,DEVICE_BRAND_NM
,DATA_TIER
,ODI_IND
,EDW_EDGE_QUALIFIED_IND
,CURR_CONTRACT_TERM
,ACCT_FRACTION
,SP_ACCT_FRACTION
,EQP_DEVICE_ID
,LOAN_NUM
,TOTAL_DATA_ALLOW
,PLAN_DATA_ALLOW
,BONUS_DATA_ALLOW
,VES_ACCOUNT_ID
,RPT_PPLAN_CD
,GIFT_DATA_ALLOW
,BOOST_DATA_ALLOW
,CARRYOVER_DATA_ALLOW
,PPLAN_SERVICE_TYPE_CD
,MGD_SEGMT
,VLC_AMT
,SUBSIDY_AMT
,VPC_AMT
,ACCT_PRICING_GRP
,VZ2_SEGMT_CD
,ERP_CUST_SUB_SEGMT_CD
,ERP_DIST_CHNL_CD
,CRO_RESTD_SEGMT_CD
,CRO_RESTD_ERP_CUST_SUB_SEGMT_CD
,SIM_TYPE_CD
,BGID_SOURCE 
,BGID
,MN_LINE_IND
,MN_PROD_NM
,LAST_UPD_DT
)AS
LOCKING ROW FOR ACCESS
SELECT
RPT_MTH
,RPT_YEAR
,A.SOR_ID
,A.CUST_ID
,A.CUST_LINE_SEQ_ID
,MTN
,ACCT_NUM
,CUST_TYPE_CD
,REV_GEN_IND
,AREA_CD
,A.PREPAID_IND
,IN_CONTRACT_TERM
,PROMO_TYPE
,A.ACCESS_AMT
,VOICE_ACCESS_AMT
,DATA_ACCESS_AMT
,CHANNEL_TYPE
,MKT_CD
,TENURE
,Coalesce(X.MASK_VAL, PROD_NM) as prod_nm_derived
,A.PPLAN_CD
,PPLAN_MKT_CD
,P.PPLAN_CLASS_DESC
,P.PPLAN_CTGRY_DESC
,P.PPLAN_TYPE_DESC
,P.PPLAN_SUB_TYPE_DESC
,P.PROD_TYPE_CD
,P.PPLAN_GROUP
,P.VOICE_PPLAN_ACCESS_AMT
,P.DATA_PPLAN_ACCESS_AMT
,P.PPLAN_SEGMT_DESC
,P.PPLAN_SERVICE_TYPE_DESC
,MASTER_AGENT_ID
--,CASE WHEN a.rpt_mth < 1170101 then a.HRCHY_SEGMT else c.hrchy_segmt end HRCHY_SEGMT
,LIFE_STAGE_SEGMT
,NULL AS ETHNICITY_SEGMT
,NULL AS ROLLUP_CD
,MNC_IND
,F1K_IND
,VZW_VALUE
,NULL AS LANG_PREF_IND
,BIRTH_YEAR
,RLTD_ACCT_ID
,DUNS_LOC_NUM
,ECPD_PROFILE_ID
,SLS_OUTLET_ID
,VERTICAL
,ENDING_CUSTOMERS
,ORIG_SOR_ID
,MASTER_AGENT_AREA_CD
,VSN_CUST_TYPE_CD
,CASE WHEN DEVICE_TYPE_CD LIKE ANY ('4G%','5G%')
THEN Coalesce(XX.MASK_VAL, EQP_PROD_NM)
ELSE NULL END as device_prod_nm_derived
,DEVICE_TYPE_CD
,ESN_NUM
,LINE_TYPE_CD
,A.PPLAN_LINE_ACCT_CD
,ACCT_ACCESS_AMT
,ACCT_VOICE_ACCESS_AMT
,ACCT_DATA_ACCESS_AMT
,PLAN_TYPE
,A.PPLAN_SHARE
,A.PPLAN_GROUP
,Coalesce(XX.MASK_VAL, EQP_PROD_NM)
,AREA_DESC
,REGION_CD
,REGION_DESC
,SUB_REGION_CD
,MANAGED_IND
--,DEVICE_GROUPING
,CASE WHEN RPT_MTH>=1230101 and  P.PPLAN_SUB_TYPE_DESC ='Second Number'  THEN 'MN-'||A.DEVICE_GROUPING ELSE A.DEVICE_GROUPING END as DEVICE_GROUPING
,DEVICE_GENERATION
,Coalesce(X.MASK_VAL, XX.MASK_VAL, DEVICE_BRAND_NM)
--,DATA_TIER
,CASE WHEN RPT_MTH>=1230101 and  P.PPLAN_SUB_TYPE_DESC ='Second Number'  THEN 'MN-'||A.DATA_TIER ELSE A.DATA_TIER END as DATA_TIER
,ODI_IND
,EDW_EDGE_QUALIFIED_IND
,CURR_CONTRACT_TERM
,ACCT_FRACTION
,ME_ACCT_FRACTION
,EQP_DEVICE_ID
,LOAN_NUM
,TOTAL_DATA_ALLOW
,PLAN_DATA_ALLOW
,BONUS_DATA_ALLOW
,VES_ACCOUNT_ID
,RPT_PPLAN_CD
,GIFT_DATA_ALLOW
,BOOST_DATA_ALLOW
,CARRYOVER_DATA_ALLOW
,CASE WHEN A.PREPAID_IND = 'Y' THEN 'ST.PRE' ELSE 'ST.POST' END
,CASE WHEN a.rpt_mth >= 1170101 THEN a.HRCHY_SEGMT ELSE b.mgd_segmt end AS MGD_SEGMT
,VLC_AMT
,SUBSIDY_AMT
,VPC_AMT
,ACCT_PRICING_GRP
,Coalesce(A.VZ2_SEGMT_CD,'UNTG') AS VZ2_SEGMT_CD
,Coalesce(A.ERP_CUST_SUB_SEGMT_CD,'UNTG') AS ERP_CUST_SUB_SEGMT_CD
,Coalesce(EDC.ERP_DIST_CHNL_CD,'UNTG') AS ERP_DIST_CHNL_CD
,A.CRO_RESTD_SEGMT_CD
,A.CRO_RESTD_ERP_CUST_SUB_SEGMT_CD
,A.SIM_TYPE_CD
,A.BGID_SOURCE 
,A.BGID
,CASE WHEN  P.PPLAN_SUB_TYPE_DESC ='Second Number'  THEN 'Y' ELSE 'N' END as MN_LINE_IND
,CAST(TRIM(CASE WHEN  P.PPLAN_SUB_TYPE_DESC ='Second Number'  THEN 'MN-'||
    COALESCE(
    (CASE WHEN DEVICE_TYPE_CD LIKE ANY ('4G%','5G%')
     THEN Coalesce(XX.MASK_VAL, EQP_PROD_NM)
     ELSE NULL END)
     ,
      Coalesce(X.MASK_VAL, PROD_NM)
      ) 


      ELSE 
    COALESCE(
    (CASE WHEN DEVICE_TYPE_CD LIKE ANY ('4G%','5G%')
     THEN Coalesce(XX.MASK_VAL, EQP_PROD_NM)
     ELSE NULL END)
     ,
      Coalesce(X.MASK_VAL, PROD_NM)
     )  
           END) as VARCHAR(35)) as MN_PROD_NM

,A.LAST_UPD_DT

FROM UDM_PRD_TBLS.SUBS_SUM_FACT A
LEFT OUTER JOIN UDM_PRDSTG_SECTBLS.MASKING_PROD_NM_XREF X
ON A.PROD_NM = X.MASK_PROD_NM
LEFT OUTER JOIN UDM_PRDSTG_SECTBLS.MASKING_PROD_NM_XREF XX
ON A.EQP_PROD_NM = XX.MASK_PROD_NM

LEFT OUTER JOIN BI_PRD_TBLS.HRCHY_MGD_SEGMT_XREF b
ON a.hrchy_segmt = b.hrchy_segmt

LEFT JOIN UDM_PRDUSR_ALLVM.COE_PRICE_PLAN_XREF_V P
ON A.PPLAN_CD = P.PPLAN_CD
AND A.PREPAID_IND = P.PREPAID_IND

LEFT OUTER JOIN NTL_PRD_ALLVM.ERP_DISTRIBUTION_CHANNEL_MAP_V  EDC
ON A.SOR_ID = EDC.SOR_ID
AND A.CHANNEL_TYPE = EDC.SLS_DIST_CHNL_TYPE_CD;

show table UDM_PRD_TBLS.SUBS_SUM_FACT;

CREATE SET TABLE UDM_PRD_TBLS.SUBS_SUM_FACT ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      RPT_MTH DATE FORMAT 'YYYYMM' NOT NULL,
      RPT_YEAR INTEGER NOT NULL COMPRESS (2010 ,2011 ,2012 ,2013 ,2014 ,2015 ,2016 ,2017 ,2018 ),
      SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('E','V'),
      CUST_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      CUST_LINE_SEQ_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      MTN CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('2026413499','2026803421','2055722606','2079070471','2079079236','2085691418','2088596566','2088698323','2092755341','2104886229','2132001593','2153018227','2159908995','2164091415','2173130941','2175491228','2175497745','2176633428','2176635502','2282290845','2293760855','2299386999','2402856391','2404466983','2482021225','2485618277','2529330715','2622271028','2709255213','2815430601','2817148733','2817445423','2819040807','3014488091','3023822346','3025353398','3072598722','3072870205','3078710742','3097912954','3104904502','3107020336','3107075025','3109223575','3154301137','3176503886','3185256970','3202930081','3302042789','3302069934','3304017024','3309982155','3342073978','3346956065','3363091502','3475631650','3477283830','3606182450','3608702988','4022908322','4043137859','4045501255','4045580559','4096593525','4102711421','4104565344','4104585309','4125265641','4155154486','4193768027','4197064499','4402258830','4405416864','4405636520','4407732898','4433590724','4439042959','4789523968','4789601370','4848960185','5039511852','5052389864','5096079770','5104060526','5139073419','5165517045','5202606932','5204057777','5205915327','5303514083','5516976240','5592400548','5597061420','5613073291','5672042277','5703379910','5704179040','5706608703','5707650641','6052287690','6073293279','6077423036','6092041829','6092062916','6093152524','6094258462','6094720577','6096515596','6122396331','6158121864','6163020342','6164020464','6172858300','6194103091','6195403425','6198236484','6232380010','6264833079','6463543164','6465961771','7022749034','7024677560','7024688335','7032982160','7036355528','7039632127','7043025305','7045606303','7048812042','7063029933','7064248735','7064660402','7065703830','7073673271','7132020549','7142229107','7142905824','7142937388','7143087202','7143099345','7143130126','7143138403','7143156196','7143156352','7143166503','7143379654','7143498444','7143519901','7143570481','7143920836','7144029242','7144219881','7144650771','7144692924','7145049500','7145127639','7145201913','7146048362','7146145788','7146154603','7146536034','7147422067','7147457507','7147957444','7148835506','7149048487','7149441501','7149448910','7149801579','7165123915','7169989021','7175996501','7178178929','7179911708','7193423096','7246122999','7249867847','7312255597','7327402730','7329665922','7578761432','7578975687','7702624272','7702959544','7708330971','7708452893','7708453103','7708455682','8013804628','8015731013','8015803969','8016477739','8032958445','8033158817','8036340581','8037301326','8054512059','8056165878','8082812984','8082958144','8125495415','8125498038','8133265403','8142432177','8144213157','8145906965','8152097630','8156666596','8182353746','8182708744','8185776522','8188099701','8282308177','8283298673','8318095998','8433560185','8435990377','8508661396','8583576941','8604906333','8646177580','8648849983','9012370510','9012370511','9012370742','9012371328','9012371329','9012371331','9012371335','9042001823','9085777616','9088940102','9092414391','9123813829','9134162177','9145392127','9162124880','9167048377','9175263841','9175756492','9193067385','9194512270','9196051474','9196217192','9288305759','9372436100','9412245428','9495335739','9512350245','9546486444','9547325629','9728377385','9792181612','9802411194','9802413036'),
      ACCT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('1','2','3','4','5','6','7'),
      CUST_TYPE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CO','IN','MJ'),
      REV_GEN_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS (' ','N','Y'),
      AREA_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('MW','NM','SO','WE'),
      PREPAID_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('0','N','Y'),
      PAYMENT_TYPE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('All Other-Postpaid','Prepaid'),
      REVENUE_TYPE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS 'All Other',
      IN_CONTRACT_TERM VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('1 Yr Contract','2 Yr Contract','MTM Contract','No Contract','Out of Contract'),
      PROMO_TYPE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('ALPVCE','ALPVCM','BFPOTH','BFPVCE','BSODAT','BSOM2M','BSOOTH','BSOVCE','BSOVCM','FSPM2M','FSPOTH','FSPVCE','FSPVCM','FSSVCE','FSSVCM','GBBVMD','GBPVMD','GBVVMD','MGUVMD','NVPVMD','NvpVMD','PRE01','PREP1','PREP2','PREP4','PREP6','PREPA','PREPB','PREPD','PREPE','PREPJ','PREPK','PREPN','PREPT','PREPU','PREPW','PREPX','PREPZ','PREQ2','PREQ4','PREQ5','PREQ6','PREQ8','PREQA','PREQC','SEPDAT','SEPVCE','SEPVMD','SGLDAT','SGLM2M','SGLOTH','SGLVCE','SGLVCM','SGLVMD','SGLVOI','VUPVMD','VZPVCM','VZPVMD'),
      ACCESS_TIER VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS 'NULL',
      VOICE_PPLAN_ACCESS_TIER VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS 'NULL',
      ARPU_TIER VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS 'No ARPU Tier',
      DATA_ACCESS_TIER VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS 'NULL',
      ACCESS_AMT DECIMAL(15,2) COMPRESS (0.00 ,38.45 ,64.09 ,99.99 ,100.00 ,0.18 ,0.20 ,0.25 ,0.28 ,0.30 ,0.35 ,89.99 ,0.40 ,90.00 ,0.45 ,0.50 ,84.99 ,85.00 ,0.55 ,0.60 ,15.99 ,79.99 ,80.00 ,0.70 ,0.75 ,75.00 ,0.80 ,0.85 ,69.99 ,70.00 ,0.90 ,64.99 ,1.00 ,65.00 ,170.00 ,59.99 ,60.00 ,55.00 ,49.99 ,50.00 ,44.99 ,45.00 ,150.00 ,39.99 ,40.00 ,34.99 ,35.00 ,140.00 ,29.99 ,30.00 ,25.00 ,130.00 ,19.99 ,20.00 ,37.99 ,15.00 ,119.99 ,120.00 ,9.99 ,10.00 ,5.00 ,109.99 ,110.00 ),
      VOICE_ACCESS_AMT DECIMAL(15,2) COMPRESS (0.00 ,38.45 ,99.99 ,36.00 ,100.00 ,0.25 ,10.50 ,31.00 ,56.67 ,89.99 ,90.00 ,44.09 ,79.99 ,80.00 ,75.00 ,34.09 ,28.99 ,5.99 ,69.99 ,70.00 ,47.00 ,0.99 ,64.99 ,59.99 ,60.00 ,37.00 ,57.50 ,14.00 ,16.60 ,55.00 ,32.00 ,49.99 ,50.00 ,47.50 ,44.99 ,45.00 ,39.99 ,40.00 ,1.67 ,47.78 ,34.99 ,35.00 ,11.99 ,29.99 ,30.00 ,71.00 ,27.50 ,24.99 ,25.00 ,1.99 ,22.50 ,37.86 ,19.99 ,20.00 ,53.33 ,15.00 ,56.00 ,33.00 ,9.99 ,10.00 ,5.00 ,46.00 ),
      DATA_ACCESS_AMT DECIMAL(15,2) COMPRESS (0.00 ,64.00 ,40.98 ,40.99 ,33.33 ,18.00 ,35.99 ,36.00 ,0.18 ,0.20 ,13.00 ,205.00 ,0.25 ,30.98 ,30.99 ,0.28 ,0.30 ,0.34 ,92.50 ,0.35 ,0.37 ,0.40 ,90.00 ,2.99 ,3.00 ,0.45 ,18.40 ,44.00 ,0.50 ,20.99 ,0.55 ,0.60 ,26.23 ,80.00 ,0.65 ,0.70 ,34.00 ,10.98 ,0.75 ,10.99 ,74.99 ,75.00 ,0.80 ,72.50 ,29.00 ,0.85 ,5.99 ,69.99 ,6.00 ,70.00 ,0.90 ,0.99 ,64.99 ,1.00 ,65.00 ,26.67 ,19.00 ,59.99 ,60.00 ,54.99 ,55.00 ,1.30 ,52.50 ,9.00 ,49.99 ,50.00 ,55.12 ,27.00 ,44.99 ,45.00 ,39.99 ,40.00 ,37.50 ,34.99 ,35.00 ,22.22 ,29.99 ,30.00 ,7.00 ,4.50 ,24.99 ,25.00 ,2.00 ,130.00 ,22.50 ,19.99 ,20.00 ,84.00 ,60.98 ,60.99 ,37.99 ,14.99 ,15.00 ,120.00 ,32.98 ,32.99 ,9.99 ,10.00 ,50.98 ,50.99 ,43.33 ,4.99 ,5.00 ,110.00 ,2.50 ),
      CHANNEL_TYPE VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('A','D','I','IN','M','N','NC','R','T','V'),
      MKT_CD VARCHAR(6) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('00H','00I','00J','00K','00M','00N','00O','018','021','023','026','027','029','02A','02F','02G','031','037','039','03Z','040','044','046','048','04A','04E','04O','04P','04T','04U','053','055','057','059','05A','05J','05K','05L','05M','05N','05P','05R','060','061','063','065','066','06D','06E','06F','06I','06R','074','075','076','083','084','086','089','091','128','140','154','159','161','201','209','255','274','287','317','328','329','337','340','341','343','345','347','348','349','351','356','358','362','364','365','366','368','369','371','372','373','374','375','377','378','379','381','382','383','385','390','391','398','401','402','405','415','418','421','422','424','428','429','430','431','435','439','443','445','454','455','456','457','458','459','462','463','464','468','473','489','494','500','506','509','511','515','516','529','530','534','536','538','542','544','546','547','549','584','589','601','604','610','612','613','617','618','619','621','624','625','626','627','628','630','632','635','640','642','645','646','647','648','651','655','664','666','667','668','669','670','671','672','681','682','692','693','694','699','701','723','726','730','732','733','734','735','736','737','741','744','748','749','750','751','753','761','762','763','764','766','768','771','772','773','774','775','786','789','790','796','797','803','808','809','815','823','824','847','889','896','939','942','943','945','959','960','961','968','969','971','973','976','977','981','982','983','984','986','987','989','EFY','EHT'),
      TENURE VARCHAR(12) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('1 YR to 2 YR','2 YR to 3 YR','3 YR+       ','Up to 1 Year'),
      PROD_NM VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2GIG Technologies 2GIG-CP21-345','4G Smartphone PDI','ADR6200','Alarm.com - ADC-200H-EVD','Alarm.com ADC-200C-EVD','Ambient X-3100','Apple iPhone 4 16GB','Apple iPhone 4 32GB','A_R430','A_R500','A_V3A','BlackBerry 8330','BlackBerry 8830','BlackBerry 9630','BlackBerry Bold 9650 6.0','BlackBerry Bold 9650','BlackBerry Bold 9930','BlackBerry Curve 8330 Pink','BlackBerry Curve 8530 Black','BlackBerry Curve 8530 Violet','BlackBerry Curve 9330 Gray','BlackBerry Storm','BlackBerry Storm2 9550','CalAmp - LMU-200','CalAmp - LMU-2620','CalAmp - PL641','Casio GzOne Commando','Casio GzOne Ravine 2','Casio GzOne Ravine II','Casio GzOne Ravine','CASIO ROCK C731','CDM8630','Crane - WAN Module CDMA','DROID X by Motorola','DuraXVPlus by Kyocera','G and D 4FF BULK SIM CARD','G and D 4G 3FF SIM - DF','G and D 4G 3FF SIM Retail Stores','G and D 4G MFF2 SIM','G and D 4G NFC SIM - DF','G and D 4G NFC SIM Retail Stores','G and D 4G SIM Card - DF','G and D Soft SIM Type S','GEMALTO 4FF BULK SIM CARD','GEMALTO 4FF DFILL SIM CARD','Gemalto 4FF NFC SIM - DF','Gemalto 4G 2FF-HD SIM','Gemalto 4G 3FF SIM - DF','Gemalto 4G 3FF SIM Retail Stores','Gemalto 4G NFC SIM - DF','Gemalto 4G NFC SIM Retail Stores','Gemalto 4G SIM Card - DF','Gemalto 4G SIMCard Retail Stores','Geotab - GO7 CDMA_Verizon','GND 4FF NFC SIM Retail Stores','GND M2M 2FF NONRUG SIM','GTO 4FF NFC SIM Retail Stores','GTO 4G M2M NONRUG CLOUD SIM','GTO Multi-Form-Factor SIM','GzOne Boulder C711SLXB','Home Phone Connect F256','Home Phone Connect FT2260','Honeywell - CD6000H','Honeywell - Dolphin 99EX','HTC DROID Incredible 2','HTC Incredible ADR6300 SLCD','HTC Incredible ADR6300','Hum by Verizon','IPAD2 WI-FI 3G 16GB BLACK','IPAD2 WI-FI 3G 32GB BLACK','IPAD2 WI-FI 3G 64GB BLACK','IpDatatel - IPD BAT CU','IPHONE 4 BLACK 8 GB','IPHONE 4 BLACK 8GB','iPhone 4 White 16GB','IPHONE 4 WHITE 8 GB','IPHONE 4 WHITE 8GB','IPHONE 4S BLACK 16GB','IPHONE 4S BLACK 32GB','IPHONE 4S BLACK 64GB','IPHONE 4S BLACK 8GB','IPHONE 4S WHITE 16GB','IPHONE 4S WHITE 32GB','IPHONE 4S WHITE 8GB','Itron - 1210-AMP','Itron - OpenWay 3.1','Knack','LG Ally VS740','LG Cosmos - VN250','LG Cosmos 2','LG Cosmos 3 Prepay','LG Cosmos 3','LG Cosmos Touch - VN270','LG Enlighten VS700','LG enV3 - VX9200','LG env3 Maroon VX9200','LG Exalt','LG Extravert - VN271','LG Extravert - VN271PP','LG Extravert 2','LG Octane','LG Optimus Exceed 2','LG Optimus Zone 2','LG Optimus Zone','LG Revere - VN150 Prepay','LG Revere - VN150','LG Revere 2','LG Revere 3','LG Vortex VS660 Black','LG-VX10000 Silver','LG-VX11000','LG-VX3300','LG-VX5200','LG-VX5300','LG-VX5400','LG-VX5500 Prepaid','LG-VX5500','LG-VX5600 Prepaid','LG-VX5600','LG-VX8300','LG-VX8350 Red','LG-VX8350','LG-VX8360','LG-VX8370','LG-VX8560 Black','LG-VX8575','LG-VX9100 Black','LG-VX9100 Maroon','LG-VX9700','MiFi2200 OTA','MiFi2200','Montage - MGCDMAV1','Moto G','Motorola a855','Motorola Droid 2 Global','Motorola Droid 2','Motorola DROID 3','MOTOROLA DROID PRO','Motorola DROID X 2GB','Motorola DROID X2','Motorola K1m','Motorola Limerick-VU204','Motorola MC959B','Motorola Rival A455 Purple','Motorola Rival A455 Tin Silver','Motorola V3m','Motorola V750','Motorola V860','Motorola W315','Motorola W385','Motorola W755 Black Slate','Motorola W755 Purple','Motorola W766','Networkfleet 5000CDMA-PCS3','Non-Branded 1x Only Module','Non-Branded EVDO Module','Pantech Crux','Pantech Hotshot','Passtime - PTE-3','PC5750','PC770','Philips - 100204C','Philips - 100605C','PHILIPS HEALTHCR 100605C 1.AA','Prepaid Samsung Gusto II','Prepaid SAMSUNG Gusto','Q2438','Samsung Brightside Sapphire Blue','Samsung Brightside','Samsung Convoy 3','Samsung Convoy 4','Samsung Convoy II','Samsung Fascinate','Samsung Galaxy Tab','Samsung Gusto 3 Prepay','Samsung Gusto 3','Samsung Gusto II Snow Silver','Samsung Gusto II','SAMSUNG Gusto Prepaid','SAMSUNG Gusto','Samsung Haven SCH-U320','Samsung Intensity 3 Steel Gray','Samsung Intensity 3','Samsung Intensity II Blue','Samsung Intensity II Gray','Samsung Reality SCH-U820 Black','Samsung Reality SCH-U820 Red','SCH-A870','SCH-u340','SCH-U350 Prepaid HBD','SCH-U350 Prepaid','SCH-U350','SCH-u410','SCH-u430','SCH-U450 Red','SCH-U450','SCH-u540','SCH-U640','SCH-u650','SCH-u740 Silver','SCH-u750','SCH-u960','SimpliSafe - SSCDMA5','Smart Synch Inc. - SSI 1210 1x','SmartSynch Inc SSI kV2c 1X','ST Multi-Form-Factor SIM','STM 3FF SIM Retail Stores','STM 4FF NFC SIM Retail Stores','STM 4FF SIM Retail Stores','Test Device','UM175','UMW190NCD','USA Tech - ePort Telemeter','USB760','Verizon Wireless Fivespot AC30','Vivint - CP01 Novatel','Vivint - CP01 Telit','Wireless Home Phone','WP8990','Xirgo - XT-2150CV','Xirgo - XT-3450CV'),
      PPLAN_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('10034','10037','10102','10174','10176','17991','18245','20245','24245','28261','28263','28267','28271','28341','28343','62033','64334','65999','66307','72841','72864','72865','73164','73395','73396','73412','73413','73414','73415','73417','73424','73425','73426','73427','73430','73431','73432','73436','73437','73442','73443','73454','73567','73568','73569','73570','73571','73618','73678','73736','73737','73766','73807','73845','73937','73939','74048','74051','74054','74511','74603','75274','76022','76068','76113','76180','76181','76509','77558','77773','83155','83233','83234','83238','83241','83242','83498','84114','84124','84127','84295','84296','84298','84299','84356','84357','84443','84609','84734','85168','85191','85320','85321','86156','86244','86487','86489','86491','86492','86494','86495','86496','86497','86498','86499','86500','86501','86502','86503','86504','86994','87180','87181','87182','87214','87291','87466','87561','87695','88005','88605','88907','89346','89424','89642','89674','89690','89742','89849','89850','90001','90002','90003','90004','90005','90006','90011','90015','90022','90033','90041','90042','90044','90186','90427','91126','91337','91382','91518','91519','91641','91701','91702','91821','91822','91824','91830','91903','91907','91945','91953','91954','92039','92040','92042','92609','92731','92732','92736','92741','92742','92756','92765','92770','92772','92775','92780','92784','93240','93594','94156','94157','94158','94159','94162','94171','94679','95722','96325','96327','96328','96329','96331','96333','96334','96345','96430','96523','97105','97783','97801','97928','98108','98127','98129','99068','99230','99231','99304','99610'),
      PPLAN_MKT_CD VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1000','1010','452','504','506','616','663','664','665','666','667','668','669','978','AAA'),
      MASTER_AGENT_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('00670','01638','04804','05731','08145GP','11093','2313','2473','47965GP','6830','ABCPHONES','AMAZON','AMERCELL','APPLE','ATIWRLS','BESTBUY','BJSCLUB','CARTOYS','CSKNX','DIAMOND','DM4607','DM5029','GOWRLS','INPHONIC','LTCOM','MOOREHEAD','No Value','NW4981','NW5036','PM400','QWESTC','RADIOSHAK','RUSSELL','SAMSCLUB','SC4424','SC4427','SC6677','TARGET','TERMALLLO','W-AW','WALMART','WRLSADV','ZWRLS'),
      HRCHY_SEGMT VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('CC Ent 1 (1000-9999)','CC Ent 2 (10k up)','CC Federal','CC Federal Corp','CC Government Corp','CC Med 1 (50-99)','CC Med 2 (100-499)','CC Med 3 (500-999)','CC Sml 1 (1-4)','CC Sml 2 (5-49)','CC Sml 2 (5-9)','CC Sml 3 (10-24)','CC Sml 4 (25-49)','CC State Local','CC Undetermined','CC VZW Corp','CN B2B Sml 1 (1-4)','CN CO Sml 1 (1-4)','CN CO Sml 2 (5-9)','CN Ent 1 (1000-9999)','CN Ent 2 (10k up)','CN Sml 1 (1-4)','CN Sml 2 (5-49)','CN Undetermined','CO Consumer','EC Ent 1 (1000-9999)','EC Ent 2 (10k up)','EC Federal','EC Government Emp','EC Med 1 (50-99)','EC Med 2 (100-499)','EC Med 3 (500-999)','EC Sml 1 (1-4)','EC Sml 2 (5-49)','EC Sml 2 (5-9)','EC Sml 3 (10-24)','EC Sml 4 (25-49)','EC State Local','EC Undetermined','EC VZW Emp'),
      LIFE_STAGE_SEGMT VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('1','2','3','4','5','UNTG'),
      ETHNICITY_SEGMT VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('African-American','Asian-American','Hispanic','Other'),
      ROLLUP_CD VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('A','B','C','E','F','G','I','J','K','L','N','O','U','UNTG','Z'),
      MNC_IND VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('N','UNTG','Y'),
      F1K_IND VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('N','UNTG','Y'),
      VZW_VALUE VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('G','N','UNTG'),
      LANG_PREF_IND VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('E','S','UNTG'),
      BIRTH_YEAR INTEGER NOT NULL COMPRESS (0 ,1934 ,1935 ,1936 ,1937 ,1938 ,1939 ,1940 ,1941 ,1942 ,1943 ,1944 ,1945 ,1946 ,1947 ,1948 ,1949 ,1950 ,1951 ,1952 ,1953 ,1954 ,1955 ,1956 ,1957 ,1958 ,1959 ,1960 ,1961 ,1962 ,1963 ,1964 ,1965 ,1966 ,1967 ,1968 ,1969 ,1970 ,1971 ,1972 ,1973 ,1974 ,1975 ,1976 ,1977 ,1978 ,1979 ,1980 ,1981 ,1982 ,1983 ,1984 ,1985 ,1986 ,1987 ,1988 ,1989 ,1990 ,1991 ,1992 ,1993 ,1994 ,1995 ),
      BREAKAGE_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('N','Y'),
      RLTD_ACCT_ID VARCHAR(31) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('ADTM2','ALACM','AMBEL','AMTMB','BNKA1','BOEEP','CAVE1','CCAST','CCOL1','CITIE','COCBO','COMCA','CRAMS','CVSEM','DKENY','DOD8E','EMFED','EMFRI','EMPMA','FARM1','FEWPN','FEXC1','FMAT','FORMO','FXSTE','GEEMP','GEOTA','GMDLE','GMEMP','GTAEE','HISNR','HOMD1','HTPGE','HWAVC','IBM','ILCME','JPMCE','KRGR1','KSREL','LOCEM','LOSH1','MARWE','NAC17','NAE17','NJED','NJEMP','NPHME','NPLC1','NPLE1','NPPFC','NPPFE','NPPMC','NPPME','NPRII','NPRIV','NRTEM','NS5E','NTC01','NTE01','NTEPP','NXMX','NYCBE','NYELI','NYS','NYSEM','OGNPC','PHQQC','PN12E','POSEM','PROG','PVMLS','REALA','SCWXC','SMSYN','SNCE1','SOE11','SOSC1','STAEH','STAEQ','TNSO1','TRGTE','TXECM','TXS2E','UHCEM','UNED1','Untagged','UNTG','UPC01','UPE01','UPSDN','USAMM','USBA1','UTEMP','VCEMP','VERI4','VHAEE','VHANE','VIBC1','VIVIC','VNUMB','VZC02','VZCOM','W5PGP','WALG1','WCWN6','WELEP','WEMCA','X-V2420042121','X-V2420362451','X-V6420693421','X-V9420570851'),
      DUNS_LOC_NUM VARCHAR(9) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('001280726','001293950','001338912','001344746','001367960','001915172','002537595','002602709','003261245','003296175','004078374','004145566','004271024','005070479','005769120','006868772','006962435','006997142','006999528','009256819','009341075','010647377','014087247','015202963','019165622','030772334','031649358','038827882','039705152','043008317','048415509','051957769','055169452','058070459','068406763','071444202','078495761','078511720','078749664','079229828','079749053','079840594','079881839','079943410','079946378','080484649','093649895','105469758','105473891','107212169','119380439','126279470','135832421','143918449','145464355','156728417','157276408','165993713','167263826','168751212','171874865','172486644','175206614','605686237','617188834','624875451','781654975','783245467','805882318','806204301','809988595','825530082','828356241','835543521','872904193','929956381','930758169','A00024366','A00174551','A00288473','A00295249','A00309524','A00385117','A00455531','Untagged','UNTG'),
      ECPD_PROFILE_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('107888','117818','121576','1270','1381','1507721','1621','1968','2070','2125','2206','22135','2344','23640','2466467','2481446','2626','2735','2756','2776443','2791622','2974358','3032424','3064374','3071','3077556','3117986','3123528','3141912','3149877','3161585','3186257','3200070','3201482','3288514','3292786','3300129','3307599','3316094','3378684','3384459','3438528','3443279','3460391','3474073','3479577','3499','3616','39400','39604','40950','4262','42934','4497','5008','517689','521501','539602','55582','559201','56079','5705','5857','5858','603412','6242','6282','63073','631662','648596','669160','70093','704518','70822','729646','751349','757783','78532','78538','80766','815125','83988','890617','89408','965847','UNTG'),
      SLS_OUTLET_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('100025','100027','100028','100029','101068','10176','118618','119264','119265','119266','119481','120343','120344','123869','123871','124252','124484','124485','126073','13425','13920','13922','14349','14569','15255','15260','15269','15291','15307','1612','1744','18035','18063','18358','18380','18381','18688','19385','22466','22755','25655','25678','272','3008','301','302','3341','3812','3902','393','395','4231','4232','4751','6070','6071','6202','673','71734','72127','72132','72133','72355','72382','7277','74584','74662','74663','74664','74667','74686','74816','74942','75060','75063','75064','75207','75727','75884','75922','75923','75950','76077','76078','76082','76583','76587','7737','79927','80643','80644','82491','8253','82537','84136','84888','84904','84906','84990','84996','84999','85016','85067','85673','86121','8620','86439','86697','86742','88166','88260','8865','88707','88708','88710','88711','9196','95480','95578','96532','96609','96610','96611','98238','99514','99602','9971'),
      VERTICAL VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('Agriculture','Construction','Consumer','Distribution','Education','Entertainment','Finance','Government','Healthcare','Insurance','Legal','Manufacturing','Media','Mining','Oil_and_Gas','Pharmaceutical','Prof_Svc','Public_Safety','Real_Estate','Service_Industry','Transportation','Unclassified','Utilities'),
      ENDING_CUSTOMERS INTEGER COMPRESS 1 ,
      ORIG_SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A','E','H','I','K','L','N','O','S','V','W'),
      MASTER_AGENT_AREA_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'NA',
      VSN_CUST_TYPE_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('BE','NA','PE'),
      DATA_PACK_REQ_AMT DECIMAL(10,2) COMPRESS 0.00 ,
      DEVICE_PROD_NM VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('All New HTC One Metal Gray','Brigadier by Kyocera','Casio GzOne Commando 4G LTE','DROID DNA by HTC','DROID MAXX 2 Blue','Droid Maxx by Motorola','Droid Mini by Motorola','DROID RAZR HD by MOTOROLA','DROID RAZR MAXX HD by MOTOROLA','DROID TURBO 2 BLK Soft-Grip 32GB','DROID TURBO 2 Grey Nylon 32GB','DROID TURBO by MOTOROLA BLACK BN','DROID TURBO by MOTOROLA BLK MGF','DROID TURBO by MOTOROLA RED MGF','Droid Ultra by Motorola','Ellipsis Jetpack MHS800L','Harman - HERMES MB HI US LTE','HTC DROID INCREDIBLE 4G LTE','HTC ONE','HTC Rezound','HTC Thunderbolt ADR6400L LTE','IPAD 4G 16GB BLACK','IPAD 4G 32GB BLACK','IPAD 4G 64GB BLACK','IPAD AIR 16GB SILVER','IPAD AIR 16GB SPACE GRAY','IPAD AIR 2 16GB S GRAY','IPAD AIR 2 64GB S GRAY','IPAD AIR 32GB SPACE GRAY','IPAD MINI 16GB WHITE','IPAD MINI RETINA 16GB SILVER','IPAD MINI RETINA 16GB SPC GRAY','IPAD RETINA DISPLAY 16GB BLACK','IPAD RETINA DISPLAY 32GB BLACK','IPAD WIFI 32GB SPACE GRAY','IPHONE 5 BLACK 16GB','IPHONE 5 BLACK 32GB','IPHONE 5 BLACK 64GB','IPHONE 5 WHITE 16GB','IPHONE 5 WHITE 32GB','iPhone 5C Blue 16GB','iPhone 5C Blue 32GB','IPHONE 5C BLUE 8GB-USA','iPhone 5C Green 16GB','iPhone 5C Pink 16GB','IPHONE 5C PINK 8GB-USA','iPhone 5C White 16GB','iPhone 5C White 32GB','IPHONE 5C WHITE 8GB -USA','iPhone 5S Gold 16GB','iPhone 5S Gold 32GB','iPhone 5S Silver 16GB','iPhone 5S Silver 32GB','iPhone 5S Space Gray 16GB','iPhone 5S Space Gray 32GB','iPhone 5S Space Gray 64GB','iPhone 6 128GB Space Gray','iPhone 6 16GB Gold','iPhone 6 16GB Silver','iPhone 6 16GB Space Gray','iPhone 6 64GB Gold','iPhone 6 64GB Silver','iPhone 6 64GB Space Gray','iPhone 6 Plus 16GB Gold','iPhone 6 Plus 16GB Silver','iPhone 6 Plus 16GB Space Gray','iPhone 6 Plus 64GB Gold','iPhone 6 Plus 64GB Silver','iPhone 6 Plus 64GB Space Gray','iPhone 6S 128GB Space Gray','iPhone 6S 16GB Gold','iPhone 6S 16GB Rose Gold','iPhone 6S 16GB Silver','iPhone 6S 16GB Space Gray','iPhone 6S 32GB Rose Gold','iPhone 6S 32GB Space Gray','iPhone 6S 64GB Gold','iPhone 6S 64GB Rose Gold','iPhone 6S 64GB Silver','iPhone 6S 64GB Space Gray','iPhone 6S Plus 128GB Space Gray','iPhone 6S Plus 16GB Rose Gold','iPhone 6S Plus 16GB Space Gray','iPhone 6S Plus 64GB Gold','iPhone 6S Plus 64GB Rose Gold','iPhone 6S Plus 64GB Silver','iPhone 6S Plus 64GB Space Gray','iPhone 7 Black 128GB','iPhone 7 Black 32GB','iPhone 7 Gold 128GB','iPhone 7 Gold 32GB','iPhone 7 Jet Black 128GB','iPhone 7 Plus Black 128GB','iPhone 7 Plus Black 32GB','iPhone 7 Plus Jet Black 128GB','iPhone 7 Plus Rose Gold 128GB','iPhone 7 Plus Rose Gold 32GB','iPhone 7 Rose Gold 128GB','iPhone 7 Rose Gold 32GB','iPhone 7 Silver 128GB','iPhone 7 Silver 32GB','IPHONE 8 GOLD 64GB VZ','IPHONE 8 PLUS GOLD 64GB VZ','IPHONE 8 PLUS SP GRAY 64GB VZ','IPHONE 8 SPACE GRAY 64GB VZ','IPHONE SE ROSE GOLD 16GB','IPHONE SE SPACE GRAY 16GB','IPHONE SE SPACE GRAY 32GB','IPHONE SE SPACE GRAY 64GB','IPHONE X SILVER 256GB VZ','IPHONE X SILVER 64GB VZ','IPHONE X SPACE GRAY 256GB VZ','IPHONE X SPACE GRAY 64GB VZ','Itron - OpenWay 3.5 S','Jetpack 4G LTE MHS MiFi 7730L','LG G Pad X8.3','LG G2','LG G3 Metallic Black','LG G3 Silk White','LG G4 Metallic Gray','LG G5 Titanium','LG GPad 10.1 LTE','LG GPad 7.0 LTE','LG GPad 8.3 LTE','LG K20 V','LG Lucid 2','LG Lucid','LG Optimus Zone 3 Subsidy Lock','LG Revolution','LG Spectrum','LG VL600','MOBIS - D-Audio LTE','Moto Z Force BLACK/LUNAR GREY','Moto Z Play Black','Motorola Droid 4','Motorola Droid Bionic 16GB','Motorola Droid Bionic','Motorola Droid Maxx 16GB Black','Motorola Droid Maxx 16GB Red','Motorola DROID RAZR M WHITE','Motorola DROID RAZR M','Motorola DROID RAZR Maxx','Motorola DROID RAZR','Motorola DROID RAZR-16GB','Pantech Breakout ADR8995','Pantech UML290','Pantech UML290VW-G','Pantech UML295','SAM Galaxy Note 4 Charcoal Black','SAM Galaxy Note 4 Frost White','SAM Galaxy S8 Plus Orchid Gray','Samsung Galaxy Core Prime','SAMSUNG GALAXY J3 ECLIPSE','Samsung Galaxy J3 V','Samsung Galaxy J7 V','Samsung Galaxy Nexus','Samsung Galaxy Note 3 in White','Samsung Galaxy Note 3','Samsung Galaxy Note II in Silver','Samsung Galaxy Note II in White','SAMSUNG GALAXY NOTE5 BLACK 32 GB','Samsung Galaxy S 4 Black 16GB','Samsung Galaxy S 4 Black Mist','Samsung Galaxy S 4 Mini','Samsung Galaxy S 4 White 16GB','Samsung Galaxy S 4 White Frost','Samsung Galaxy S 5 Black','Samsung Galaxy S 5 Copper Gold','Samsung Galaxy S 5 White','Samsung Galaxy S III 16GB Black','Samsung Galaxy S III 16GB Blue','Samsung Galaxy S III 16GB White','Samsung Galaxy S III Mini','Samsung Galaxy S6 Black 32GB','Samsung Galaxy S6 Gold 32GB','Samsung Galaxy S6 White 32GB','Samsung Galaxy S7 Black 32GB','Samsung Galaxy S7 edge BLK 32GB','Samsung Galaxy S7 edge Gold 32GB','Samsung Galaxy S7 edge SLV 32GB','Samsung Galaxy S7 Gold 32GB','Samsung Galaxy S8 Black','Samsung Galaxy S8 Orchid Gray','Samsung Galaxy S8 Plus Black','Samsung Galaxy Stellar','Samsung Galaxy Stratosphere II','Samsung Galaxy Tab 2 10.1','Samsung Galaxy Tab 2 7.0','Samsung Galaxy Tab E 8','SAMSUNG NOTE 8 MIDNIGHT BLACK','Samsung SCH-I510','Samsung Stratosphere','USB551L 4G USB Modem','Verizon Ellipsis 10','Verizon Ellipsis 7','Verizon Ellipsis 8','Verizon Ellipsis Jetpack','VZ JETPACK 4G LTE MHS AC791L','VZ Jetpack 4G MHS 291L','VZ Jetpack 4G MHS 890L','VZ Jetpack 4G MHS MIFI 6620L','VZ Jetpack 4G MHS MIFI4510L','VZ Jetpack 4G MHS MIFI4620L','VZ Jetpack 4G MHS MIFI4620LE','VZ Jetpack 4G MHS MIFI5510L','VZ Jetpack 4G MHS SCH-LC11'),
      DEVICE_TYPE_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('4GS','ODI','VZW'),
      ESN_NUM VARCHAR(256) CHARACTER SET LATIN NOT CASESPECIFIC,
      SECURED_PROD_NM VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2GIG Technologies 2GIG-CP21-345','4G Smartphone PDI','ADR6200','A_R430','A_R500','A_V3A','Alarm.com - ADC-200H-EVD','Alarm.com ADC-200C-EVD','Ambient X-3100','Apple iPhone 4 16GB','Apple iPhone 4 32GB','BlackBerry 8330','BlackBerry 8830','BlackBerry 9630','BlackBerry Bold 9650','BlackBerry Bold 9650 6.0','BlackBerry Bold 9930','BlackBerry Curve 8330 Pink','BlackBerry Curve 8530 Black','BlackBerry Curve 8530 Violet','BlackBerry Curve 9330 Gray','BlackBerry Storm','BlackBerry Storm2 9550','CASIO ROCK C731','CDM8630','CalAmp - LMU-200','CalAmp - LMU-2620','CalAmp - PL641','Casio GzOne Commando','Casio GzOne Ravine','Casio GzOne Ravine 2','Casio GzOne Ravine II','Crane - WAN Module CDMA','DROID X by Motorola','DuraXVPlus by Kyocera','G and D 4FF BULK SIM CARD','G and D 4G 3FF SIM - DF','G and D 4G 3FF SIM Retail Stores','G and D 4G MFF2 SIM','G and D 4G NFC SIM - DF','G and D 4G NFC SIM Retail Stores','G and D 4G SIM Card - DF','G and D Soft SIM Type S','GEMALTO 4FF BULK SIM CARD','GEMALTO 4FF DFILL SIM CARD','GND 4FF NFC SIM Retail Stores','GND M2M 2FF NONRUG SIM','GTO 4FF NFC SIM Retail Stores','GTO 4G M2M NONRUG CLOUD SIM','GTO Multi-Form-Factor SIM','Gemalto 4FF NFC SIM - DF','Gemalto 4G 2FF-HD SIM','Gemalto 4G 3FF SIM - DF','Gemalto 4G 3FF SIM Retail Stores','Gemalto 4G NFC SIM - DF','Gemalto 4G NFC SIM Retail Stores','Gemalto 4G SIM Card - DF','Gemalto 4G SIMCard Retail Stores','Geotab - GO7 CDMA_Verizon','GzOne Boulder C711SLXB','HTC DROID Incredible 2','HTC Incredible ADR6300','HTC Incredible ADR6300 SLCD','Home Phone Connect F256','Home Phone Connect FT2260','Honeywell - CD6000H','Honeywell - Dolphin 99EX','Hum by Verizon','IPAD2 WI-FI 3G 16GB BLACK','IPAD2 WI-FI 3G 32GB BLACK','IPAD2 WI-FI 3G 64GB BLACK','IPHONE 4 BLACK 8 GB','IPHONE 4 BLACK 8GB','IPHONE 4 WHITE 8 GB','IPHONE 4 WHITE 8GB','IPHONE 4S BLACK 16GB','IPHONE 4S BLACK 32GB','IPHONE 4S BLACK 64GB','IPHONE 4S BLACK 8GB','IPHONE 4S WHITE 16GB','IPHONE 4S WHITE 32GB','IPHONE 4S WHITE 8GB','IpDatatel - IPD BAT CU','Itron - 1210-AMP','Itron - OpenWay 3.1','Knack','LG Ally VS740','LG Cosmos - VN250','LG Cosmos 2','LG Cosmos 3','LG Cosmos 3 Prepay','LG Cosmos Touch - VN270','LG Enlighten VS700','LG Exalt','LG Extravert - VN271','LG Extravert - VN271PP','LG Extravert 2','LG Octane','LG Optimus Exceed 2','LG Optimus Zone','LG Optimus Zone 2','LG Revere - VN150','LG Revere - VN150 Prepay','LG Revere 2','LG Revere 3','LG Vortex VS660 Black','LG enV3 - VX9200','LG env3 Maroon VX9200','LG-VX10000 Silver','LG-VX11000','LG-VX3300','LG-VX5200','LG-VX5300','LG-VX5400','LG-VX5500','LG-VX5500 Prepaid','LG-VX5600','LG-VX5600 Prepaid','LG-VX8300','LG-VX8350','LG-VX8350 Red','LG-VX8360','LG-VX8370','LG-VX8560 Black','LG-VX8575','LG-VX9100 Black','LG-VX9100 Maroon','LG-VX9700','MOTOROLA DROID PRO','MiFi2200','MiFi2200 OTA','Montage - MGCDMAV1','Moto G','Motorola DROID 3','Motorola DROID X 2GB','Motorola DROID X2','Motorola Droid 2','Motorola Droid 2 Global','Motorola K1m','Motorola Limerick-VU204','Motorola MC959B','Motorola Rival A455 Purple','Motorola Rival A455 Tin Silver','Motorola V3m','Motorola V750','Motorola V860','Motorola W315','Motorola W385','Motorola W755 Black Slate','Motorola W755 Purple','Motorola W766','Motorola a855','Networkfleet 5000CDMA-PCS3','Non-Branded 1x Only Module','Non-Branded EVDO Module','PC5750','PC770','PHILIPS HEALTHCR 100605C 1.AA','Pantech Crux','Pantech Hotshot','Passtime - PTE-3','Philips - 100204C','Philips - 100605C','Prepaid SAMSUNG Gusto','Prepaid Samsung Gusto II','Q2438','SAMSUNG Gusto','SAMSUNG Gusto Prepaid','SCH-A870','SCH-U350','SCH-U350 Prepaid','SCH-U350 Prepaid HBD','SCH-U450','SCH-U450 Red','SCH-U640','SCH-u340','SCH-u410','SCH-u430','SCH-u540','SCH-u650','SCH-u740 Silver','SCH-u750','SCH-u960','ST Multi-Form-Factor SIM','STM 3FF SIM Retail Stores','STM 4FF NFC SIM Retail Stores','STM 4FF SIM Retail Stores','Samsung Brightside','Samsung Brightside Sapphire Blue','Samsung Convoy 3','Samsung Convoy 4','Samsung Convoy II','Samsung Fascinate','Samsung Galaxy Tab','Samsung Gusto 3','Samsung Gusto 3 Prepay','Samsung Gusto II','Samsung Gusto II Snow Silver','Samsung Haven SCH-U320','Samsung Intensity 3','Samsung Intensity 3 Steel Gray','Samsung Intensity II Blue','Samsung Intensity II Gray','Samsung Reality SCH-U820 Black','Samsung Reality SCH-U820 Red','SimpliSafe - SSCDMA5','Smart Synch Inc. - SSI 1210 1x','SmartSynch Inc SSI kV2c 1X','Test Device','UM175','UMW190NCD','USA Tech - ePort Telemeter','USB760','Verizon Wireless Fivespot AC30','Vivint - CP01 Novatel','Vivint - CP01 Telit','WP8990','Wireless Home Phone','Xirgo - XT-2150CV','Xirgo - XT-3450CV','iPhone 4 White 16GB'),
      LINE_TYPE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('H','O','T','W'),
      PPLAN_LINE_ACCT_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A','L'),
      ACCT_ACCESS_AMT DECIMAL(15,2) COMPRESS (0.00 ,100.00 ,90.00 ,300.00 ,85.00 ,80.00 ,70.00 ,175.00 ,65.00 ,60.00 ,1125.00 ,375.00 ,50.00 ,45.00 ,150.00 ,40.00 ,35.00 ,140.00 ,30.00 ,135.00 ,130.00 ,450.00 ,20.00 ,15.00 ,120.00 ,225.00 ,10.00 ,1500.00 ,5.00 ,750.00 ,110.00 ),
      ACCT_VOICE_ACCESS_AMT DECIMAL(15,2) COMPRESS (0.00 ,31.00 ,13.33 ,16.00 ,80.00 ,70.00 ,16.67 ,50.00 ,40.00 ,7.00 ,2.00 ,20.00 ,17.50 ,10.00 ,7.50 ),
      ACCT_DATA_ACCESS_AMT DECIMAL(15,2) COMPRESS (0.00 ,64.00 ,33.33 ,100.00 ,13.00 ,205.00 ,54.00 ,92.50 ,730.00 ,90.00 ,3.00 ,44.00 ,39.00 ,80.00 ,185.00 ,34.00 ,180.00 ,72.50 ,70.00 ,175.00 ,280.00 ,65.00 ,1450.00 ,26.67 ,60.00 ,52.50 ,9.00 ,50.00 ,155.00 ,580.00 ,40.00 ,37.50 ,35.00 ,355.00 ,22.22 ,30.00 ,350.00 ,135.00 ,130.00 ,22.50 ,20.00 ,84.00 ,120.00 ,1075.00 ,112.50 ,110.00 ,430.00 ,2.50 ),
      PLAN_TYPE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('ALPVCE','ALPVCM','BFPOTH','BFPVCE','BSODAT','BSOM2M','BSOOTH','BSOVCE','BSOVCM','FSPM2M','FSPOTH','FSPVCE','FSPVCM','FSSVCE','FSSVCM','GBBVMD','GBPVMD','GBVVMD','MGUVMD','NvpVMD','NVPVMD','PREP1','PREP2','PREP6','PREPA','PREPB','PREPD','PREPW','PREPX','PREPZ','PREQ2','PREQ4','PREQ5','PREQ6','PREQ8','PREQA','PREQC','SEPDAT','SEPVCE','SEPVMD','SGLDAT','SGLM2M','SGLOTH','SGLVCE','SGLVCM','SGLVMD','SGLVOI','VUPVMD','VZPVCM','VZPVMD'),
      PPLAN_SHARE VARCHAR(13) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('ALP','B2B Flexible','B2B Share','Beyond Unlimi','Business Unli','FS Primary','FS Secondary','Go Unlimited','Go Unlmtd 2.0','New VZ Plan','Prepaid','SE','Single Line','Verizon Plan','Verizon UNL'),
      PPLAN_GROUP VARCHAR(18) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('DATA ONLY','Data only','Machine TO Machine','Machine to Machine','Other','Prepaid','Voice and Text','Voice ONLY','Voice only','Voice over IP','Voice_Text_Data'),
      EQP_PROD_NM VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2GIG Technologies 2GIG-CP21-345','ADR6200','Alarm.com - ADC-200H-EVD','Alarm.com ADC-200C-EVD','Apple iPhone 4 16GB','Apple iPhone 4 32GB','BlackBerry 8330','BlackBerry 9630','BlackBerry Bold 9650','BlackBerry Bold 9650 6.0','BlackBerry Bold 9930','BlackBerry Curve 8530 Black','BlackBerry Curve 9330 Gray','BlackBerry Storm','BlackBerry Storm2 9550','CASIO ROCK C731','CDM8630','Casio GzOne Commando','Casio GzOne Ravine','Casio GzOne Ravine 2','Casio GzOne Ravine II','DROID TURBO 2 BLK Soft-Grip 32GB','DROID TURBO by MOTOROLA BLACK BN','DROID X by Motorola','Droid Mini by Motorola','DuraXVPlus by Kyocera','Ellipsis Jetpack MHS800L','GzOne Boulder C711SLXB','HTC DROID Incredible 2','HTC Incredible ADR6300','HTC Incredible ADR6300 SLCD','HTC Thunderbolt ADR6400L LTE','Home Phone Connect F256','Home Phone Connect FT2260','Hum by Verizon','IPAD AIR 16GB SPACE GRAY','IPAD AIR 2 64GB S GRAY','IPAD RETINA DISPLAY 16GB BLACK','IPAD2 WI-FI 3G 16GB BLACK','IPAD2 WI-FI 3G 32GB BLACK','IPHONE 4 BLACK 8 GB','IPHONE 4 BLACK 8GB','IPHONE 4 WHITE 8 GB','IPHONE 4 WHITE 8GB','IPHONE 4S BLACK 16GB','IPHONE 4S BLACK 32GB','IPHONE 4S BLACK 8GB','IPHONE 4S WHITE 16GB','IPHONE 4S WHITE 8GB','IPHONE 5 BLACK 16GB','IPHONE 5 BLACK 32GB','IPHONE 5 WHITE 16GB','IPHONE 5 WHITE 32GB','IPHONE 5C BLUE 8GB-USA','IPHONE 5C WHITE 8GB -USA','IPHONE 8 PLUS SP GRAY 64GB VZ','IPHONE 8 SPACE GRAY 64GB VZ','IPHONE SE SPACE GRAY 16GB','Itron - OpenWay 3.5 S','Knack','LG Ally VS740','LG Cosmos - VN250','LG Cosmos 2','LG Cosmos 3','LG Cosmos Touch - VN270','LG Exalt','LG Extravert - VN271','LG Extravert 2','LG G2','LG G3 Metallic Black','LG GPad 8.3 LTE','LG Lucid','LG Octane','LG Revere - VN150','LG Revere - VN150 Prepay','LG Revere 2','LG Revere 3','LG enV3 - VX9200','LG env3 Maroon VX9200','LG-VX10000 Silver','LG-VX11000','LG-VX5300','LG-VX5400','LG-VX5500','LG-VX5600','LG-VX5600 Prepaid','LG-VX8300','LG-VX8350','LG-VX8360','LG-VX8575','LG-VX9100 Black','LG-VX9100 Maroon','LG-VX9700','MiFi2200','Montage - MGCDMAV1','Motorola DROID 3','Motorola DROID RAZR','Motorola DROID RAZR M','Motorola DROID RAZR Maxx','Motorola DROID RAZR-16GB','Motorola DROID X 2GB','Motorola DROID X2','Motorola Droid 2','Motorola Droid 2 Global','Motorola Droid 4','Motorola Droid Bionic','Motorola Droid Maxx 16GB Black','Motorola Limerick-VU204','Motorola V3m','Motorola V750','Motorola V860','Motorola W385','Motorola W755 Black Slate','Motorola W755 Purple','Motorola a855','Non-Branded 1x Only Module','PC5750','PHILIPS HEALTHCR 100605C 1.AA','Pantech UML290','Pantech UML290VW-G','Passtime - PTE-3','Philips - 100605C','Prepaid SAMSUNG Gusto','Prepaid Samsung Gusto II','SAM Galaxy Note 4 Charcoal Black','SAM Galaxy Note 4 Frost White','SAMSUNG GALAXY NOTE5 BLACK 32 GB','SAMSUNG Gusto','SAMSUNG Gusto Prepaid','SCH-U350','SCH-U350 Prepaid HBD','SCH-U450','SCH-U450 Red','SCH-U640','SCH-u340','SCH-u410','SCH-u750','SCH-u960','Samsung Brightside','Samsung Convoy 3','Samsung Convoy II','Samsung Fascinate','Samsung Galaxy Core Prime','Samsung Galaxy J3 V','Samsung Galaxy Note 3','Samsung Galaxy Note II in Silver','Samsung Galaxy S 4 Black 16GB','Samsung Galaxy S 4 Black Mist','Samsung Galaxy S 4 Mini','Samsung Galaxy S 4 White 16GB','Samsung Galaxy S 4 White Frost','Samsung Galaxy S 5 Black','Samsung Galaxy S 5 White','Samsung Galaxy S III 16GB Black','Samsung Galaxy S III 16GB Blue','Samsung Galaxy S III 16GB White ','Samsung Galaxy S6 Black 32GB','Samsung Galaxy S6 Gold 32GB','Samsung Galaxy S6 White 32GB','Samsung Galaxy S7 Black 32GB','Samsung Galaxy S7 Gold 32GB','Samsung Galaxy S7 edge BLK 32GB','Samsung Galaxy S7 edge SLV 32GB','Samsung Galaxy S8 Black','Samsung Galaxy Stellar','Samsung Galaxy Tab','Samsung Galaxy Tab 2 7.0','Samsung Galaxy Tab E 8','Samsung Gusto 3','Samsung Gusto 3 Prepay','Samsung Gusto II','Samsung Gusto II Snow Silver','Samsung Haven SCH-U320','Samsung Intensity 3','Samsung Intensity II Blue','Samsung Intensity II Gray','Samsung Reality SCH-U820 Black','Samsung SCH-I510','Samsung Stratosphere','Test Device','UM175','USB551L 4G USB Modem','USB760','VZ Jetpack 4G MHS 291L','VZ Jetpack 4G MHS 890L','VZ Jetpack 4G MHS MIFI 6620L','VZ Jetpack 4G MHS MIFI4510L','VZ Jetpack 4G MHS MIFI4620L','VZ Jetpack 4G MHS MIFI4620LE','VZ Jetpack 4G MHS MIFI5510L','VZ Jetpack 4G MHS SCH-LC11','Verizon Ellipsis 7','Verizon Ellipsis 8','Vivint - CP01 Novatel','Vivint - CP01 Telit','Wireless Home Phone','Xirgo - XT-3450CV','iPhone 4 White 16GB','iPhone 5C Blue 16GB','iPhone 5C Green 16GB','iPhone 5C Pink 16GB','iPhone 5C White 16GB','iPhone 5S Gold 16GB','iPhone 5S Silver 16GB','iPhone 5S Silver 32GB','iPhone 5S Space Gray 16GB','iPhone 5S Space Gray 32GB','iPhone 6 16GB Gold','iPhone 6 16GB Silver','iPhone 6 16GB Space Gray','iPhone 6 64GB Gold','iPhone 6 64GB Silver','iPhone 6 64GB Space Gray','iPhone 6 Plus 16GB Gold','iPhone 6 Plus 16GB Silver','iPhone 6 Plus 16GB Space Gray','iPhone 6 Plus 64GB Gold','iPhone 6 Plus 64GB Space Gray','iPhone 6S 16GB Rose Gold','iPhone 6S 16GB Space Gray','iPhone 6S 32GB Space Gray','iPhone 6S 64GB Gold','iPhone 6S 64GB Rose Gold','iPhone 6S 64GB Silver','iPhone 6S 64GB Space Gray','iPhone 6S Plus 64GB Rose Gold','iPhone 6S Plus 64GB Space Gray','iPhone 7 Black 128GB','iPhone 7 Black 32GB','iPhone 7 Plus Black 128GB','iPhone 7 Plus Black 32GB','iPhone 7 Plus Rose Gold 128GB','iPhone 7 Rose Gold 128GB','iPhone 7 Rose Gold 32GB'),
      AREA_DESC VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Midwest','Northeast','South','West'),
      REGION_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AR','CN','CR','DA','DM','DT','FL','GA','HG','IW','MN','MO','MU','NE','NW','NY','PH','PT','SC','UP','VA','WB'),
      REGION_DESC VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Carolina/Tennessee','Central Texas','Florida','Georgia/Alabama','Great Plains','Houston/Gulf Coast','Illinois/Wisconsin','Kansas/Missouri','Michigan/Indiana/KY','Mountain','New England','New York Metro','Northern California/Nevada','Pacific Northwest','Pennsylvania/WV/Ohio','Philadelphia Tri-State','South Central','Southern California','Southwest','Upstate New York','Virginia South','W/B - Virginia'),
      SUB_REGION_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AC','AF','AH','AL','AP','AQ','AR','AU','CH','CI','CN','CO','CR','CU','CV','CW','DA','DE','DF','EC','EL','EX','GA','HA','HN','HO','IA','ID','IN','KS','KY','LA','LV','ML','MN','MO','MT','ND','NE','NF','NO','NW','NY','OH','OK','OM','OR','OU','PH','PT','PX','SB','SD','SE','SF','TN','TU','UN','UP','VV','WB','WU','WX'),
      MANAGED_IND CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'C  ',
      DEVICE_GROUPING VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Android','Apple','APPLE','Automotive','Basic','Blackberry','Embed Chip','Home Phone Connect','Laptop','Mobile Hotspot','Module','Netbook','Other Connected Devices','Other Internet','Palm','PCMCIA','Router / Modem','Tablet','Tracking Device','USB','Wearable Devices','WinMo'),
      DEVICE_GENERATION VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1X','3G','4G'),
      DEVICE_BRAND_NM VARCHAR(32) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('All New HTC One','APPLE WATCH S3','BlackBerry Bold','Blackberry Bold','Blackberry Curve 9330','Blackberry Curve','Blackberry Global','Blackberry Storm 2','Blackberry Storm','Blackberry Tour','Brigadier','Commando 4G LTE','Curve 2','Droid 2 Global','Droid 2','DROID 3','Droid 4','Droid Bionic','Droid Charge','DROID DNA','Droid Eris','DROID Incredible 2','Droid Incredible','DROID MAXX 2','DROID MAXX','DROID MINI','DROID RAZR HD','DROID RAZR M','DROID RAZR MAXX HD','DROID RAZR MAXX','DROID RAZR','DROID TURBO 2','DROID TURBO','DROID ULTRA','Droid X','DROID X','DROID X2','Droid','Fascinate','Galaxy Core Prime','Galaxy J3 Eclipse','Galaxy J3 V','Galaxy J7 V','Galaxy Nexus','Galaxy Note 3','Galaxy Note 4','Galaxy Note 5','Galaxy Note 8','Galaxy Note II','Galaxy S3 Mini','Galaxy S3','Galaxy S4 Mini','Galaxy S4','Galaxy S5','Galaxy S6 Edge Plus','Galaxy S6 Edge','Galaxy S6','Galaxy S7 Edge','Galaxy S7','Galaxy S8 Plus','Galaxy S8','Galaxy Stellar','GzOne','HTC ONE','Hum by Verizon','iPad 2','iPad 3','IPAD AIR 2','IPAD AIR','IPAD Mar17','IPAD MINI 3','iPad Mini 4','IPAD MINI RETINA','IPAD MINI','iPad Pro 9.7','IPAD PRO','IPAD RETINA','iPhone 4','iPhone 4S','iPhone 5','iPhone 5C','iPhone 5S','iPhone 6 Plus','iPhone 6','iPhone 6S Plus','iPhone 6S','iPhone 7 Plus','iPhone 7','IPHONE 8 PLUS','IPHONE 8','iPhone SE','IPHONE X','LG Ally','LG G Pad X8.3','LG G2','LG G3','LG G4','LG G5','LG GPad','Lucid 2','Lucid','Lumia 822','MHS 5510','MHS 6620','MHS 7730','MHS 800','MHS AC791L','Moto G','Moto Z Force','Moto Z Play','Optimus Exceed 2','Optimus Zone 2','Optimus Zone 3','Other','Pantech 4G USB Modem','Pixel','Rezound','Samsung Galaxy Tab 2 7.0','Samsung Galaxy Tab E 8','Samsung Galaxy Tab','Stratosphere','Thunderbolt','Verizon Ellipsis 10','Verizon Ellipsis 7','Verizon Ellipsis 8','Vortex'),
      DATA_TIER VARCHAR(32) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('Basic','Internet','Other Services','Other','Smartphone'),
      ODI_IND VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('ODI','UNK','VZW'),
      EDW_EDGE_QUALIFIED_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC DEFAULT 'N',
      CURR_CONTRACT_TERM VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1 Yr Contract','2 Yr Contract','Edge','MTM Contract','No Contract','Out of Contract'),
      ACCT_FRACTION DECIMAL(18,8) COMPRESS (0.00000000 ,0.04000000 ,0.20000000 ,1.00000000 ,0.04166667 ,0.12500000 ,0.16666667 ,0.25000000 ,0.33333333 ,0.09090909 ,0.10000000 ,0.50000000 ,0.14285714 ,0.11111111 ),
      ME_ACCT_FRACTION DECIMAL(18,8) COMPRESS (0.00000000 ,0.04000000 ,0.20000000 ,1.00000000 ,0.04166667 ,0.12500000 ,0.16666667 ,0.25000000 ,0.33333333 ,0.10000000 ,0.50000000 ,0.14285714 ,0.04347826 ,0.11111111 ),
      EQP_DEVICE_ID VARCHAR(256) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LOAN_NUM VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      TOTAL_DATA_ALLOW VARCHAR(26) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0 GB','1 GB','1 MB','1.00 GB','1.00 KB','1.00 MB','10 GB','10.00 GB','10.00 MB','100 MB','100.00 MB','11 GB','11.00 GB','12 GB','12.00 GB','125.00 KB','13 GB','14 GB','14.00 GB','15 GB','15.00 GB','150 KB','150.00 KB','16 GB','16.00 GB','17 GB','170.00 KB','18 GB','18.00 GB','2 GB','2 MB','2.00 GB','2.00 MB','20 GB','20.00 GB','21 GB','22 GB','22.00 GB','24 GB','24.00 GB','25 GB','25 MB','25.00 GB','250 MB','250.00 KB','250.00 MB','3 GB','3.00 GB','3.00 MB','30 GB','30.00 GB','300 MB','31 GB','4 GB','4.00 GB','40 GB','5 GB','5 MB','5.00 GB','5.00 MB','50 GB','500 KB','500 MB','500.00 KB','500.00 MB','6 GB','6.00 GB','60 GB','60.00 GB','7 GB','7.00 GB','75 MB','8 GB','8.00 GB','9 GB','No Data','PAYGO','PREPAID','UNLIMITED'),
      PLAN_DATA_ALLOW VARCHAR(26) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0 GB','1 GB','1.00 GB','10 GB','10.00 GB','12 GB','12.00 GB','120 GB','120.00 GB','14 GB','15 GB','15.00 GB','150 GB','150.00 GB','16 GB','16.00 GB','18 GB','18.00 GB','2 GB','2.00 GB','20 GB','20.00 GB','200.00 GB','24.00 GB','25 GB','25.00 GB','250 MB','3 GB','3.00 GB','30 GB','30.00 GB','300 GB','300 MB','35.00 GB','4 GB','4.00 GB','40 GB','40.00 GB','5.00 GB','50 GB','50.00 GB','500 MB','500.00 MB','6 GB','6.00 GB','60 GB','60.00 GB','8 GB','8.00 GB','No Data','PREPAID','UNLIMITED'),
      BONUS_DATA_ALLOW VARCHAR(26) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1 GB','1.00 GB','10 GB','10.00 GB','12.00 GB','2 GB','2.00 GB','3 GB','4 GB','4.00 GB','500 MB','6.00 GB','8.00 GB','No Data','PREPAID'),
      VES_ACCOUNT_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1014','1081','1106','1108','1112','1113','1124','1136','1150','1152','1162','121','1233','1276','1296','149','153','1887','1962','204','205','217','2234','237','246','252','296','309','346','3794','3795','382','398','402','421','446','447','449','450','508','516','517','520','523','531','566','579','584','586','613','645','650','749','766','80043','80050','820','829','852','855','982','99','NONE'),
      RPT_PPLAN_CD VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('ST.POST.1957','ST.POST.1976','ST.POST.2052','ST.POST.UNK.DMY','ST.POST.V.17991','ST.POST.V.72841','ST.POST.V.73412','ST.POST.V.73413','ST.POST.V.73414','ST.POST.V.73415','ST.POST.V.73424','ST.POST.V.73425','ST.POST.V.73426','ST.POST.V.73430','ST.POST.V.73431','ST.POST.V.73432','ST.POST.V.73436','ST.POST.V.73437','ST.POST.V.73442','ST.POST.V.73443','ST.POST.V.73454','ST.POST.V.73569','ST.POST.V.73570','ST.POST.V.73571','ST.POST.V.73618','ST.POST.V.73678','ST.POST.V.73736','ST.POST.V.73737','ST.POST.V.73766','ST.POST.V.73807','ST.POST.V.73939','ST.POST.V.74048','ST.POST.V.74051','ST.POST.V.74511','ST.POST.V.76180','ST.POST.V.76181','ST.POST.V.77558','ST.POST.V.77773','ST.POST.V.83233','ST.POST.V.83234','ST.POST.V.83241','ST.POST.V.83242','ST.POST.V.84114','ST.POST.V.84124','ST.POST.V.84127','ST.POST.V.84298','ST.POST.V.84356','ST.POST.V.84357','ST.POST.V.84734','ST.POST.V.85191','ST.POST.V.85320','ST.POST.V.85321','ST.POST.V.86156','ST.POST.V.86489','ST.POST.V.86491','ST.POST.V.86492','ST.POST.V.86494','ST.POST.V.86495','ST.POST.V.86496','ST.POST.V.86497','ST.POST.V.86498','ST.POST.V.86499','ST.POST.V.86500','ST.POST.V.86502','ST.POST.V.86503','ST.POST.V.86994','ST.POST.V.87180','ST.POST.V.87181','ST.POST.V.87182','ST.POST.V.87214','ST.POST.V.87695','ST.POST.V.88005','ST.POST.V.88605','ST.POST.V.88907','ST.POST.V.89346','ST.POST.V.89424','ST.POST.V.89742','ST.POST.V.89849','ST.POST.V.89850','ST.POST.V.90001','ST.POST.V.90002','ST.POST.V.90003','ST.POST.V.90004','ST.POST.V.90005','ST.POST.V.90006','ST.POST.V.90011','ST.POST.V.90015','ST.POST.V.90022','ST.POST.V.90033','ST.POST.V.90041','ST.POST.V.90042','ST.POST.V.90044','ST.POST.V.90186','ST.POST.V.90427','ST.POST.V.91126','ST.POST.V.91337','ST.POST.V.91382','ST.POST.V.91519','ST.POST.V.91701','ST.POST.V.91702','ST.POST.V.91821','ST.POST.V.91822','ST.POST.V.91824','ST.POST.V.91830','ST.POST.V.91903','ST.POST.V.91907','ST.POST.V.91945','ST.POST.V.91953','ST.POST.V.92039','ST.POST.V.92040','ST.POST.V.92042','ST.POST.V.92609','ST.POST.V.92731','ST.POST.V.92732','ST.POST.V.92741','ST.POST.V.92742','ST.POST.V.92756','ST.POST.V.92765','ST.POST.V.92770','ST.POST.V.92772','ST.POST.V.92775','ST.POST.V.92780','ST.POST.V.92784','ST.POST.V.94156','ST.POST.V.94157','ST.POST.V.94158','ST.POST.V.94159','ST.POST.V.94162','ST.POST.V.94171','ST.POST.V.94679','ST.POST.V.95722','ST.POST.V.96325','ST.POST.V.96327','ST.POST.V.96328','ST.POST.V.96329','ST.POST.V.96331','ST.POST.V.96333','ST.POST.V.96523','ST.POST.V.97105','ST.POST.V.97801','ST.POST.V.97928','ST.POST.V.98108','ST.POST.V.98127','ST.POST.V.98129','ST.POST.V.99068','ST.POST.V.99230','ST.POST.V.99231','ST.POST.V.99610','ST.PRE.UNK.DMY','ST.PRE.V.10037','ST.PRE.V.10174','ST.PRE.V.20245','ST.PRE.V.24245','ST.PRE.V.28263','ST.PRE.V.28267','ST.PRE.V.28271','ST.PRE.V.28341','ST.PRE.V.73395','ST.PRE.V.73396','ST.PRE.V.75274','ST.PRE.V.84296','ST.PRE.V.84609'),
      LAST_UPD_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2017-12-02',DATE '2017-07-06',DATE '2018-07-02',DATE '2018-02-02',DATE '2017-10-02',DATE '2017-05-02',DATE '2018-10-02',DATE '2018-05-03',DATE '2017-08-02',DATE '2018-08-02',DATE '2018-03-02',DATE '2017-11-02',DATE '2017-06-02',DATE '2018-11-02',DATE '2018-06-02',DATE '2018-11-22',DATE '2018-01-02',DATE '2018-01-30',DATE '2018-09-02',DATE '2017-09-27',DATE '2018-04-02',DATE '2017-04-21'),
      INSERT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2017-12-02',DATE '2016-02-02',DATE '2017-07-02',DATE '2017-02-02',DATE '2015-10-03',DATE '2018-07-02',DATE '2018-02-02',DATE '2016-10-02',DATE '2016-05-02',DATE '2017-10-02',DATE '2017-05-02',DATE '2018-10-02',DATE '2018-05-02',DATE '2016-08-02',DATE '2016-03-02',DATE '2017-08-02',DATE '2017-03-02',DATE '2018-08-02',DATE '2018-03-02',DATE '2016-11-02',DATE '2016-06-02',DATE '2017-11-02',DATE '2016-01-04',DATE '2017-06-02',DATE '2018-11-02',DATE '2017-01-02',DATE '2018-06-02',DATE '2018-01-02',DATE '2016-09-02',DATE '2016-04-02',DATE '2017-09-02',DATE '2017-04-02',DATE '2018-09-02',DATE '2015-12-17',DATE '2018-04-02',DATE '2015-12-18',DATE '2016-12-02',DATE '2016-12-12',DATE '2016-07-02'),
      CUST_SSN_ESTB_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      CUST_SSN_TENURE_MTH INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ,101 ,102 ,103 ,104 ,105 ,106 ,107 ,108 ,109 ,110 ,111 ,112 ,113 ,114 ,115 ,116 ,117 ,118 ,119 ,120 ,121 ,122 ,123 ,124 ,125 ,126 ,127 ,128 ,129 ,130 ,131 ,132 ,133 ,134 ,135 ,136 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,145 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,156 ,157 ,158 ,159 ,160 ,161 ,162 ,163 ,164 ,165 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,174 ,175 ,176 ,177 ,178 ,179 ,180 ,181 ,182 ,183 ,184 ,185 ,186 ,187 ,188 ,189 ,190 ,191 ,192 ,193 ,194 ,195 ,196 ,197 ,198 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,228 ,229 ,230 ,231 ,232 ,233 ),
      CREDIT_RISK_TYPE_CD VARCHAR(11) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('1','2','3','4','A1','AA','B','C','CA','CB','OTHER','UNTG','XX','ZZ'),
      GIFT_DATA_ALLOW VARCHAR(26) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'No Data',
      BOOST_DATA_ALLOW VARCHAR(26) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'No Data',
      CARRYOVER_DATA_ALLOW VARCHAR(26) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'No Data',
      VLC_AMT DECIMAL(15,2) COMPRESS (0.00 ,45.00 ),
      SUBSIDY_AMT DECIMAL(15,2) COMPRESS 0.00 ,
      VPC_AMT DECIMAL(15,2) COMPRESS 0.00 ,
      ACCT_PRICING_GRP VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('BEYUNLM1','BUSFLX + LEG','BUSUNLM + BUSFLX + LEG','BUSUNLM + LEG','GOUNLM1','GOUNLM2 + VPCCMP','GOUNLM2','LEG','ME','PPAY','VZP1','VZP2','VZUNLM'),
      VZ2_SEGMT_CD VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('PFSGL00001','PFSGL00002','PFSGL00003','PFSGL00004','PFSGL00005','PFSGL00006','PFSGL00007','PFSGL00009','PFSGL00010','PFSGL00011','PFSGL00012','PFSGL00013','PFSGL00014','PFSGL00015','PFSGL00016','PFSGL00017','PFSGL00018','PFSGL00019','PFSGL00020','PFSGL00021','PFSGL00022','PFSGL00023','PFSGL00024','PFSGL00025','PFSGL00026','PFSGL00027','PFSGL00028','PFSGL00029','PFSGL00030','PFSGL00031','PFSGL00032','PFSGL00033','PFSGL00034','PFSGL00035','PFSGL00036','PFSGL00037','PFSGL00038','PFSGL00039','PFSGL00040','PFSGL00041','PFSGL00042','PFSGL00043','PFSGL00044','PFSGL00045','PFSGL00046','PFSGL00047','PFSGL00048','PFSGL00049','PFSGL00050','PFSGL00052','PFSGL00053','PFSGL00054','PFSGL00055','PFSGL00056','PFSGL00057','PFSGL00058','PFSGL00059','PFSGL00060','PFSGL00061','PFSGL00062','PFSGL00063','PFSGL00064','PFSGL00065','PFSGL00066','PFSGL00067','PFSGL00068','PFSGL00069','PFSGL00070','PFSGL00071','PFSGL00072','PFSGL00073','PFSGL00074'),
      ERP_CUST_SUB_SEGMT_CD VARCHAR(255) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('B019','B020','B021','B022','B023','B024','B025','B026','B027','B028','B029','B030','B031','B032','B033','B034','B035','B036','B037','B038','B039','B041','B042','B043','B044','B045','B046','B047','B049','B052','B053','B054','B055','B056','B057','B060','B061','B062','C001','C002','C003','C004','C005','C006','C007','C009','C010','C011','C012','C013','C014','C015','C016','C017','C018','C040','C048','C050','C058','C059','C063','C064','C065','C066','C067','C068','C069','C070','C071','C072','C073','C074','CCPC'),
      CRO_RESTD_SEGMT_CD VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('PFSGL00001','PFSGL00002','PFSGL00003','PFSGL00004','PFSGL00005','PFSGL00006','PFSGL00007','PFSGL00009','PFSGL00010','PFSGL00011','PFSGL00012','PFSGL00013','PFSGL00014','PFSGL00015','PFSGL00016','PFSGL00017','PFSGL00018','PFSGL00019','PFSGL00020','PFSGL00021','PFSGL00022','PFSGL00023','PFSGL00024','PFSGL00025','PFSGL00026','PFSGL00027','PFSGL00028','PFSGL00029','PFSGL00030','PFSGL00031','PFSGL00032','PFSGL00033','PFSGL00034','PFSGL00035','PFSGL00036','PFSGL00037','PFSGL00038','PFSGL00039','PFSGL00040','PFSGL00041','PFSGL00042','PFSGL00043','PFSGL00044','PFSGL00045','PFSGL00046','PFSGL00047','PFSGL00048','PFSGL00049','PFSGL00050','PFSGL00052','PFSGL00053','PFSGL00054','PFSGL00055','PFSGL00056','PFSGL00057','PFSGL00058','PFSGL00059','PFSGL00060','PFSGL00061','PFSGL00062','PFSGL00063','PFSGL00064','PFSGL00065','PFSGL00066','PFSGL00067','PFSGL00068','PFSGL00069','PFSGL00070','PFSGL00071','PFSGL00072','PFSGL00073','PFSGL00074'),
      CRO_RESTD_ERP_CUST_SUB_SEGMT_CD VARCHAR(255) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('B019','B020','B021','B022','B023','B024','B025','B026','B027','B028','B029','B030','B031','B032','B033','B034','B035','B036','B037','B038','B039','B041','B042','B043','B044','B045','B046','B047','B049','B052','B053','B054','B055','B056','B057','B060','B061','B062','C001','C002','C003','C004','C005','C006','C007','C009','C010','C011','C012','C013','C014','C015','C016','C017','C018','C040','C048','C050','C058','C059','C063','C064','C065','C066','C067','C068','C069','C070','C071','C072','C073','C074','CCPC'),
      SIM_TYPE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('C','H','M','P','S','T'),
      BGID_SOURCE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CUSTOMER_LOC','PHYSICAL_LOC','ISPU_PHYSICAL_LOC'),
      BGID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC)
PRIMARY INDEX ( CUST_ID ,CUST_LINE_SEQ_ID )
PARTITION BY RANGE_N(RPT_MTH  BETWEEN DATE '2007-01-01' AND DATE '2025-12-31' EACH INTERVAL '1' MONTH ,
 NO RANGE OR UNKNOWN);


show table UDM_PRDSTG_SECTBLS.MASKING_PROD_NM_XREF;

CREATE SET TABLE UDM_PRDSTG_SECTBLS.MASKING_PROD_NM_XREF ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      MASK_PROD_NM VARCHAR(80) CHARACTER SET LATIN NOT CASESPECIFIC,
      MASK_VAL VARCHAR(80) CHARACTER SET LATIN NOT CASESPECIFIC)
UNIQUE PRIMARY INDEX ( MASK_PROD_NM );


show table BI_PRD_TBLS.HRCHY_MGD_SEGMT_XREF;

CREATE SET TABLE BI_PRD_TBLS.HRCHY_MGD_SEGMT_XREF ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_1AmpSparseMap_150Nodes COLOCATE USING TD_1AmpSparseMap_150Nodes
     (
      HRCHY_SEGMT VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      MGD_SEGMT VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC)
UNIQUE PRIMARY INDEX ( HRCHY_SEGMT );

 show view UDM_PRDUSR_ALLVM.COE_PRICE_PLAN_XREF_V;

-- create view


REPLACE VIEW UDM_PRDUSR_ALLVM.COE_PRICE_PLAN_XREF_V
(
PPLAN_CD
,PPLAN_DESC
,PREPAID_IND
,PPLAN_LINE_ACCT_CD
,PPLAN_SERVICE_TYPE_DESC
,PPLAN_CLASS_DESC
,PPLAN_CTGRY_DESC
,PPLAN_TYPE_DESC
,PPLAN_SUB_TYPE_DESC
,ESSBASE_PPLAN
,CTGRY_CD
,COLLECT_CD
,ACCESS_AMT
,VOICE_PPLAN_ACCESS_AMT
,DATA_PPLAN_ACCESS_AMT
,PPLAN_SHARE
,PROD_TYPE_CD
,PPLAN_GROUP
,VOICE_PPLAN_ACCESS_TIER
,PRI_SEC_IND
,SEGMT_CD
,PPLAN_SEGMT_DESC
,PPLAN_SEGMT_KEY
,PPLAN_SEGMT_GRP_CD
,PPLAN_SEGMT_GRP_DESC
,VOICE_ALLOW_SHARE_IND
,DATA_ALLOW_SHARE_IND
,MSG_ALLOW_SHARE_IND
,DATA_ALLOW_TIER_CD
,DATA_ALLOW_TIER_DESC
,DATA_ALLOW_TIER_VALUE
,DATA_ALLOW_TIER_UNIT_OF_MEAS
,DATA_OVG_UNIT_OF_MEAS_DESC
,DATA_PEAK_RT
,DATA_OFF_PEAK_RT
,DATA_ANYTIME_RT
,TERM_IND
,PK_ALLOW_MIN
,OFF_PK_ALLOW_MIN
,TOT_ALLOW_MIN
,PK_MIN_RT
,OFF_PK_MIN_RT
,WKEND_RT_IND
,WKEND_MIN_RT
,MTN_TO_MTN_MIN_RT
,VZ_LD_PK_RT
,VZ_LD_OFF_PK_RT
,VZ_LD_RT_ID
,VZ_LD_RT_DESC
,NON_VZ_PK_RT
,NON_VZ_OFF_PK_RT
,ACCESS_TIER_NUM
,ALLOW_TIER_NUM
,STD_ACCESS_TIER_NUM
,BUDGET_ACCESS_TIER_NUM
,CNTRCT_TERM_IND
,MSG_ALLOW_CNT
,MSG_INCOMING_RT
,MSG_OUTGOING_RT
,PPLAN_BNDL_TYPE_CD
,PPLAN_PROCESSING_TYPE_CD
)
AS LOCKING ROW FOR ACCESS
SELECT
PPLAN_CD
,PPLAN_DESC
,PREPAID_IND
,PPLAN_LINE_ACCT_CD
,PPLAN_SERVICE_TYPE_DESC
,PPLAN_CLASS_DESC
,PPLAN_CTGRY_DESC
,PPLAN_TYPE_DESC
,PPLAN_SUB_TYPE_DESC
,ESSBASE_PPLAN
,CTGRY_CD
,COLLECT_CD
,ACCESS_AMT
,VOICE_PPLAN_ACCESS_AMT
,DATA_PPLAN_ACCESS_AMT
,PPLAN_SHARE
,PROD_TYPE_CD
,PPLAN_GROUP
,VOICE_PPLAN_ACCESS_TIER
,PRI_SEC_IND
,SEGMT_CD
,PPLAN_SEGMT_DESC
,PPLAN_SEGMT_KEY
,PPLAN_SEGMT_GRP_CD
,PPLAN_SEGMT_GRP_DESC
,VOICE_ALLOW_SHARE_IND
,DATA_ALLOW_SHARE_IND
,MSG_ALLOW_SHARE_IND
,DATA_ALLOW_TIER_CD
,DATA_ALLOW_TIER_DESC
,DATA_ALLOW_TIER_VALUE
,DATA_ALLOW_TIER_UNIT_OF_MEAS
,DATA_OVG_UNIT_OF_MEAS_DESC
,DATA_PEAK_RT
,DATA_OFF_PEAK_RT
,DATA_ANYTIME_RT
,TERM_IND
,PK_ALLOW_MIN
,OFF_PK_ALLOW_MIN
,TOT_ALLOW_MIN
,PK_MIN_RT
,OFF_PK_MIN_RT
,WKEND_RT_IND
,WKEND_MIN_RT
,MTN_TO_MTN_MIN_RT
,VZ_LD_PK_RT
,VZ_LD_OFF_PK_RT
,VZ_LD_RT_ID
,VZ_LD_RT_DESC
,NON_VZ_PK_RT
,NON_VZ_OFF_PK_RT
,ACCESS_TIER_NUM
,ALLOW_TIER_NUM
,STD_ACCESS_TIER_NUM
,BUDGET_ACCESS_TIER_NUM
,CNTRCT_TERM_IND
,MSG_ALLOW_CNT
,MSG_INCOMING_RT
,MSG_OUTGOING_RT
,PPLAN_BNDL_TYPE_CD
,PPLAN_PROCESSING_TYPE_CD
FROM UDM_PRDUSR_TBLS.COE_PRICE_PLAN_XREF;



show table UDM_PRDUSR_TBLS.COE_PRICE_PLAN_XREF;

CREATE SET TABLE UDM_PRDUSR_TBLS.COE_PRICE_PLAN_XREF ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      PPLAN_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      PREPAID_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_LINE_ACCT_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_SERVICE_TYPE_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      pplan_class_desc VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
      pplan_ctgry_desc VARCHAR(28) CHARACTER SET UNICODE NOT CASESPECIFIC,
      pplan_type_desc VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      pplan_sub_type_desc VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      essbase_pplan VARCHAR(9) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ctgry_cd CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      collect_cd VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      access_amt DECIMAL(10,2),
      voice_pplan_access_amt DECIMAL(11,2),
      data_pplan_access_amt DECIMAL(10,2),
      pplan_share VARCHAR(8) CHARACTER SET UNICODE NOT CASESPECIFIC,
      prod_type_cd VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      Pplan_Group VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      VOICE_PPLAN_ACCESS_TIER VARCHAR(21) CHARACTER SET UNICODE NOT CASESPECIFIC,
      pri_sec_ind CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      segmt_cd CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_SEGMT_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_SEGMT_KEY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_SEGMT_GRP_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_SEGMT_GRP_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      VOICE_ALLOW_SHARE_IND VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DATA_ALLOW_SHARE_IND VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      MSG_ALLOW_SHARE_IND VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DATA_ALLOW_TIER_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      DATA_ALLOW_TIER_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      DATA_ALLOW_TIER_VALUE DECIMAL(10,0),
      DATA_ALLOW_TIER_UNIT_OF_MEAS VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      DATA_OVG_UNIT_OF_MEAS_DESC VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      DATA_PEAK_RT DECIMAL(15,11),
      DATA_OFF_PEAK_RT DECIMAL(15,11),
      DATA_ANYTIME_RT DECIMAL(15,11),
      TERM_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PK_ALLOW_MIN INTEGER,
      OFF_PK_ALLOW_MIN INTEGER,
      TOT_ALLOW_MIN INTEGER,
      PK_MIN_RT DECIMAL(10,2),
      OFF_PK_MIN_RT DECIMAL(10,2),
      WKEND_RT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      WKEND_MIN_RT DECIMAL(10,2),
      MTN_TO_MTN_MIN_RT DECIMAL(10,2),
      VZ_LD_PK_RT DECIMAL(10,2),
      VZ_LD_OFF_PK_RT DECIMAL(10,2),
      VZ_LD_RT_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      VZ_LD_RT_DESC VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      NON_VZ_PK_RT DECIMAL(10,2),
      NON_VZ_OFF_PK_RT DECIMAL(10,2),
      ACCESS_TIER_NUM SMALLINT,
      ALLOW_TIER_NUM SMALLINT,
      STD_ACCESS_TIER_NUM BYTEINT,
      BUDGET_ACCESS_TIER_NUM BYTEINT,
      CNTRCT_TERM_IND BYTEINT,
      MSG_ALLOW_CNT DECIMAL(10,0),
      MSG_INCOMING_RT DECIMAL(5,2),
      MSG_OUTGOING_RT DECIMAL(5,2),
      PPLAN_BNDL_TYPE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_PROCESSING_TYPE_CD VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC)
PRIMARY INDEX ( PPLAN_CD );

 REPLACE VIEW  NTL_PRD_ALLVM.ERP_DISTRIBUTION_CHANNEL_MAP_V
    ( 
      SOR_ID
    , SLS_DIST_CHNL_TYPE_CD
    , SLS_DIST_CHNL_GRP_CD
    , SLS_DIST_CHNL_TYPE_DESC
    , SLS_DIST_CHNL_CHURN_CTGRY
    ,ERP_DIST_CHNL_CD
    ) 
    AS LOCKING TABLE UDM_PRD_TBLS.SALES_DIST_CHANNEL_TYPE  FOR ACCESS 
    SELECT 
      SOR_ID
    , SLS_DIST_CHNL_TYPE_CD ( CHAR (4))
    , SLS_DIST_CHNL_GRP_CD
    , SLS_DIST_CHNL_TYPE_DESC
    , SLS_DIST_CHNL_CHURN_CTGRY
    , ERP_DIST_CHNL_CD
    from  UDM_PRD_TBLS.SALES_DIST_CHANNEL_TYPE
    WHERE SOR_ID ='V'
    UNION ALL
    SELECT
    'V' ( CHAR(1) )  as SOR_ID 
    ,'UNTG' ( CHAR(4) )  as SLS_DIST_CHNL_TYPE_CD 
    ,NULL ( CHAR(1) ) as SLS_DIST_CHNL_GRP_CD
    ,NULL ( CHAR(25) ) as  SLS_DIST_CHNL_TYPE_DESC 
,    NULL( CHAR(40) )  as SLS_DIST_CHNL_CHURN_CTGRY
 ,   'UNTG'  ( CHAR(10) )as ERP_DIST_CHNL_CD 
 from UDM_PRD_TBLS.SALES_DIST_CHANNEL_TYPE WHERE SOR_ID ='V' and  SLS_DIST_CHNL_TYPE_CD ='M';



show table UDM_PRD_TBLS.SALES_DIST_CHANNEL_TYPE;

CREATE SET TABLE UDM_PRD_TBLS.SALES_DIST_CHANNEL_TYPE ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_1AmpSparseMap_150Nodes COLOCATE USING TD_1AmpSparseMap_150Nodes
     (
      SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SLS_DIST_CHNL_TYPE_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SLS_DIST_CHNL_GRP_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      SLS_DIST_CHNL_TYPE_DESC VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      SLS_DIST_CHNL_CHURN_CTGRY VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC FORMAT 'X(10)',
      LAST_UPD_DT DATE FORMAT 'YYYY/MM/DD',
      ERP_DIST_CHNL_CD VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      RPT_CHNL_DESC VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC)
PRIMARY INDEX ( SLS_DIST_CHNL_TYPE_CD );

show view ntl_prd_allvm.cust_acct_line_v;

REPLACE VIEW NTL_PRD_ALLVM.CUST_ACCT_LINE_V
(
SOR_ID
,CUST_ID
,CUST_LINE_SEQ_ID
,ACCT_NUM
,MTN
,LN_ID
,LN_ID_TYPE
,LN_OF_SVC_ID_NO_P1
,LN_OF_SVC_ID_NO_P2
,SLS_OUTLET_ID
,MKT_CD
,BUS_NM
,NM_PRFX
,NM_FIRST
,NM_MDLIN
,NM_LAST
,COMPTR_CD
,IEC_CD
,SLS_PRSN_ID
,PPLAN_EFF_DT
,ESN_NUM
,LINE_ACT_DT
,MTN_ACT_DT
,LINE_TERM_DT
,MTN_STATUS_IND
,ESN_CHANGE_DT
,ESN_CHANGE_REAS_CD
,DSCNT_PLAN_CD
,DEACT_CHANGE_REAS_CD
,WARR_LGTH
,WARR_EFF_DT
,EQP_STATUS_CD
,EQP_PROD_ID
,EQP_TYPE_CD
,CNTRCT_NUM
,CNTRCT_TERM_DT
,CNTRCT_TERM_FEE
,CNTRCT_PRD_MTH
,CNTRCT_EFF_DT
,CNTRCT_SLS_PRSN_ID
,MTN_ZONE_ACT_DT
,CREDIT_APP_NUM
,MTN_ZONE_ID
,MTN_ZONE_DEACT_DT
,BILL_ACCT_CD
,HANDICAP_IND
,INSERT_DT
,PREPAID_IND
,EMIN
,NE2_REDEMPT_DT
,CONV_MTN_STATUS_IND
,CONV_DEACT_CHANGE_REAS_CD
,CONV_LINE_TERM_DT
,GEO_CD
,GEO_IND
,ORIG_CUST_ID
,ORIG_CUST_LINE_SEQ_ID
,PROD_NM
,PRISM_SEQ_NUM
,ORIG_SOR_ID
,LAST_CYCLE_DT
,REV_GEN_IND
,ACTN_MKT_SEG_CD
,BUDGET_CTR_CD
,SLS_DIST_CHNL_TYPE_CD
,CORP_REPORTING_CD
,ESN_REDEMPT_DT
,CNTRCT_SLS_OUTLET_ID
,CNTRCT_SLS_DIST_CHNL_TYPE_CD
,CNTRCT_USER_ID
,STATIC_IP_ADDR
,STATIC_IP_ADDR_EFF_DT
,STATIC_IP_ADDR_TERM_DT
,PORT_STATUS_CD
,PORT_EFF_DT
,PORT_CONFIRM_IND
,CNTRCT_END_DT
,BUS_ID
,AUTO_PORT_CD
,XMKT_ACCT_NUM
,XMKT_ACCT_IND
,SIM_NUM
,CREDIT_CLASS_IND
,SCRTY_DEP_IND
,SCRTY_DEP_AMT
,SCRTY_DEP_STATUS_CD
,SCRTY_DEP_PAY_AMT
,AGE_INPUT_PREMIER
,ELEC_SIGN_CAPT_IND
,MERIT_EXP_DT
,SCRTY_DEP_INT_AMT
,ACT_CHANGE_REAS_CD
,BIRTH_YEAR
,INSTANCE_IND
,AREA_CD
,LAST_UPD_DT
,CPNI_IND
,STATIC_IP_ADDR_TYPE
,FIN_MKT_CD
,LINE_TYPE_CD
,CNTRCT_TERM_ID
,CUST_ASSOC_ID
,ALLTEL_SRC_BILL_ACCT_ID
,ALLTEL_SRC_SUB_UNIQUE_ID
,CUST_TYPE_CD
,VSN_CUST_TYPE_CD
,DEVICE_TYPE_CD
,VZW_IMSI
,VF_IMSI
,NE2_DSCNT_AMT
,AUP_IND
,DEVICE_PROD_NM
,EQP_DEVICE_ID
,STATIC_IPV6_ADDR
,STATIC_IP_VER_NUM
,LN_CREDIT_CLASS_IND
,GEO_OVRIDE_CD
,ACSS_CALL_ID
,BRAND_TYPE_CD
)
AS LOCKING TABLE UDM_PRD_TBLS.CUST_ACCT_LINE FOR ACCESS
LOCKING TABLE UDM_PRDSTG_SECTBLS.MASKING_PROD_NM_XREF FOR ACCESS
SELECT SOR_ID
,CUST_ID
,CUST_LINE_SEQ_ID
,ACCT_NUM
,MTN
,LN_ID
,LN_ID_TYPE
,LN_OF_SVC_ID_NO_P1
,LN_OF_SVC_ID_NO_P2
,SLS_OUTLET_ID
,MKT_CD
,BUS_NM
,NM_PRFX
,NM_FIRST
,NM_MDLIN
,NM_LAST
,COMPTR_CD
,IEC_CD
,SLS_PRSN_ID
,PPLAN_EFF_DT
,ESN_NUM
,LINE_ACT_DT
,MTN_ACT_DT
,LINE_TERM_DT
,MTN_STATUS_IND
,ESN_CHANGE_DT
,ESN_CHANGE_REAS_CD
,DSCNT_PLAN_CD
,DEACT_CHANGE_REAS_CD
,WARR_LGTH
,WARR_EFF_DT
,EQP_STATUS_CD
,CASE
WHEN COALESCE ( X.MASK_VAL,Applib.Prod_Nm_Mask_F ( PROD_NM ) ) IN ( '3GSmartPhone','Internet' )
THEN NULL
WHEN COALESCE ( XX.MASK_VAL,Applib.Prod_Nm_Mask_F ( DEVICE_PROD_NM ) ) IN ( '4GSmartPhone','Internet' )
THEN NULL
ELSE EQP_PROD_ID
END
,EQP_TYPE_CD
,CNTRCT_NUM
,CNTRCT_TERM_DT
,CNTRCT_TERM_FEE
,CNTRCT_PRD_MTH
,CNTRCT_EFF_DT
,CNTRCT_SLS_PRSN_ID
,MTN_ZONE_ACT_DT
,CREDIT_APP_NUM
,MTN_ZONE_ID
,MTN_ZONE_DEACT_DT
,BILL_ACCT_CD
,HANDICAP_IND
,INSERT_DT
,PREPAID_IND
,EMIN
,NE2_REDEMPT_DT
,CONV_MTN_STATUS_IND
,CONV_DEACT_CHANGE_REAS_CD
,CONV_LINE_TERM_DT
,GEO_CD
,GEO_IND
,ORIG_CUST_ID
,ORIG_CUST_LINE_SEQ_ID
,COALESCE ( X.MASK_VAL,Applib.Prod_Nm_Mask_F ( PROD_NM ) ) ( Char ( 32 ) )
,PRISM_SEQ_NUM
,ORIG_SOR_ID
,LAST_CYCLE_DT
,REV_GEN_IND
,ACTN_MKT_SEG_CD
,BUDGET_CTR_CD
,SLS_DIST_CHNL_TYPE_CD
,CORP_REPORTING_CD
,ESN_REDEMPT_DT
,CNTRCT_SLS_OUTLET_ID
,CNTRCT_SLS_DIST_CHNL_TYPE_CD
,CNTRCT_USER_ID
,STATIC_IP_ADDR
,STATIC_IP_ADDR_EFF_DT
,STATIC_IP_ADDR_TERM_DT
,PORT_STATUS_CD
,PORT_EFF_DT
,PORT_CONFIRM_IND
,CNTRCT_END_DT
,BUS_ID
,AUTO_PORT_CD
,XMKT_ACCT_NUM
,XMKT_ACCT_IND
,SIM_NUM
,CREDIT_CLASS_IND
,SCRTY_DEP_IND
,SCRTY_DEP_AMT
,SCRTY_DEP_STATUS_CD
,SCRTY_DEP_PAY_AMT
,AGE_INPUT_PREMIER
,ELEC_SIGN_CAPT_IND
,MERIT_EXP_DT
,SCRTY_DEP_INT_AMT
,ACT_CHANGE_REAS_CD
,BIRTH_YEAR
,INSTANCE_IND
,AREA_CD
,LAST_UPD_DT
,CPNI_IND
,STATIC_IP_ADDR_TYPE
,FIN_MKT_CD
,LINE_TYPE_CD
,CNTRCT_TERM_ID
,CUST_ASSOC_ID
,ALLTEL_SRC_BILL_ACCT_ID
,ALLTEL_SRC_SUB_UNIQUE_ID
,CUST_TYPE_CD
,VSN_CUST_TYPE_CD
,DEVICE_TYPE_CD
,VZW_IMSI
,VF_IMSI
,NE2_DSCNT_AMT
,AUP_IND
,COALESCE ( XX.MASK_VAL,Applib.Prod_Nm_Mask_F ( DEVICE_PROD_NM ) ) ( Char ( 32 ) )
,EQP_DEVICE_ID
,STATIC_IPV6_ADDR
,STATIC_IP_VER_NUM
,LN_CREDIT_CLASS_IND
,GEO_OVRIDE_CD
,ACSS_CALL_ID
,BRAND_TYPE_CD
FROM UDM_PRD_TBLS.CUST_ACCT_LINE A

LEFT JOIN UDM_PRDSTG_SECTBLS.MASKING_PROD_NM_XREF X
ON A.PROD_NM=X.MASK_PROD_NM

LEFT JOIN UDM_PRDSTG_SECTBLS.MASKING_PROD_NM_XREF XX
ON A.DEVICE_PROD_NM=XX.MASK_PROD_NM

WHERE COALESCE ( CUST_ASSOC_ID,' ' )<>'12';


show table UDM_PRD_TBLS.CUST_ACCT_LINE;

CREATE SET TABLE UDM_PRD_TBLS.CUST_ACCT_LINE ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('E','V'),
      CUST_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      CUST_LINE_SEQ_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      PPLAN_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('10803','13656','15067','16807','17181','17991','17993','18042','18045','18056','18059','18063','18090','18337','19345','20177','20300','20312','21148','21340','21441','23010','23655','24604','24828','24880','25558','25582','25714','26471','26869','26872','26907','26911','26926','27979','28782','31703','32047','32440','32557','32973','33925','34976','35175','35176','36514','36635','36909','36911','36956','37402','38206','38354','38355','38357','38795','39089','39385','39387','39390','40002','40644','40646','40715','40752','41015','41021','41034','41322','41353','42040','42486','43848','44024','44027','44215','44282','44503','44775','45164','45751','46696','46733','46738','47081','47191','47301','47579','47587','47880','47895','48733','50010','50127','50129','50250','50255','50420','50427','50430','50432','50434','52582','52724','53537','54788','55525','55583','56371','56449','58701','60287','60903','61526','73807','74051','74511','84114','84295','84356','84357','85191','86156','86790','86994','87646','88907','89346','89424','89690','91337','92731','92732','92736','92741','92742','92747','93792','94326','94941','94953','95026','95390','95431','95434','96029','96477','96523','97055','97299','97729','97783','98061','98108','98113','98126','98245','98824','98884','99068','99082','99303','99304','99307','99308','99320','99589','99610','99806','99838','99850','99999'),
      PPLAN_MKT_CD VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('666','668','669','978'),
      ACCT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1','2','3','4','5','6','7'),
      MTN CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2023292243','2023653753','2023808001','2024656489','2025777019','2029069825','2064374879','2064509638','2094025822','2094050069','2132153308','2135005276','2142880496','2145510108','2152195595','2152621645','2152873450','2153018227','2153077952','2158151448','2162100593','2317405523','2515337134','2525061109','2533504698','2672299186','2813819008','2814151440','2814157061','2816380326','2817344916','3038861505','3102838495','3104993012','3105954555','3123433466','3125192642','3138208830','3147035633','3149735689','3183490689','3187805192','3192700134','3216931561','3232626522','3477283830','4027409688','4042720001','4042729441','4042741636','4109250942','4122161654','4123107632','4124801613','4125238374','4126003050','4126516062','4128749627','4159712771','4193572441','5033082314','5052311365','5105072931','5105525615','5105528916','5107259785','5125674951','5126382105','5179272116','5202712890','5204057777','5592404180','5862190073','6023190331','6034405961','6106335377','6122396331','6125902594','6145618546','6153477949','6155199524','6168266269','6174477804','6198573742','6362333783','6468250253','6502914095','6504001727','6619040978','7024000675','7024196670','7032446219','7033004732','7033953798','7046821237','7063405528','7074955555','7084765949','7089278913','7132016034','7132041901','7132060818','7132085296','7132536845','7137031625','7137033791','7137039824','7137055479','7137241888','7137256686','7138236142','7138239670','7138247644','7138280534','7142872973','7142902285','7143296740','7169129103','7175742163','7183009323','7194310058','7246228145','7248318945','7248318947','7248318949','7248318951','7248318954','7248318957','7248318958','7248318959','7248318960','7248318963','7248318968','7248318974','7248318976','7248318977','7248318978','7248802396','7249531447','7249946020','7326744541','7329254614','7573392040','7573750547','7576157164','7578106235','7578808959','7605050015','7707151365','7723592256','7733181751','7735975109','7863851216','7863856681','7865141029','7868970260','8037183654','8038040136','8055046484','8057464262','8082651633','8107305318','8133936107','8133939246','8133941112','8133941129','8135414691','8139512517','8139571038','8139571671','8139575746','8139577730','8143228788','8143237169','8168535604','8168536686','8179058263','8179753629','8182353746','8182987021','8183884391','8184154466','8184706162','8185770719','8186324366','8187267011','8188085444','8189198486','8189432448','8287360591','8303990012','8323645391','8329840133','8435980741','8435980772','8436938953','8437012061','8455984742','8472277207','8473455501','8479469366','8503844726','8632558360','8632559740','8642380764','8642756580','8643805400','8644141790','8644235850','8649334172','9012010987','9012101996','9014845518','9045531023','9045532732','9045537012','9046732696','9047108270','9082851263','9084105089','9098967777','9109750054','9132054207','9134248688','9166620265','9167100205','9168933300','9174971927','9175580404','9175968001','9176284584','9177977626','9179743377','9415041115','9415458800','9492856089','9517332645','9542900508','9542954157','9545940992','9548291085','9565661666','9565662376','9566221114','9723581679','9728413371','9728901826','9792481032','9795308211','9856341547','9856341696','9857917384','9893977976','9897988811'),
      SLS_OUTLET_ID VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('','100025','100027','100028','100029','101068','10176','118618','119264','119265','119266','119481','120343','120344','123869','123871','123977','124252','124253','124255','124484','124485','124487','124629','124630','124632','124636','124641','124642','124643','124644','124646','124648','124654','124657','124671','125256','126073','126826','127852','127874','127960','128049','128050','128054','128056','128058','128060','128303','133261','13425','13920','13922','14349','14568','14569','15255','15260','15269','15307','1744','18063','21536','22755','3008','3341','3812','4231','4232','6071','6202','673','71734','72127','72133','72355','7277','74584','74662','74663','74686','74816','75060','75064','75207','75884','75950','76077','76078','7737','79927','80643','82491','8253','85016','85067','85843','86121','8620','88166','8865','88707','88708','88710','88711','9196','92060','95578','96532','96609','96610','96611','9971'),
      MKT_CD CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('00H ','00I ','00J ','00K ','00M ','00N ','00O ','00P ','00S ','00T ','00W ','011 ','014 ','018 ','01P ','021 ','023 ','026 ','027 ','02A ','02F ','02G ','031 ','037 ','039 ','03O ','03Z ','040 ','044 ','046 ','048 ','04A ','04B ','04C ','04D ','04E ','04F ','04G ','04H ','04I ','04J ','04L ','04M ','04N ','04O ','04P ','04Q ','04R ','04S ','04T ','04U ','053 ','055 ','057 ','05A ','05J ','05K ','05L ','05M ','05N ','05R ','063 ','065 ','066 ','06D ','06E ','06F ','06I ','06R ','074 ','075 ','076 ','083 ','084 ','086 ','089 ','091 ','097 ','159 ','161 ','201 ','209 ','255 ','274 ','287 ','328 ','329 ','337 ','340 ','341 ','345 ','347 ','349 ','351 ','356 ','358 ','362 ','364 ','365 ','366 ','368 ','369 ','372 ','373 ','374 ','375 ','377 ','378 ','379 ','381 ','382 ','383 ','385 ','388 ','390 ','391 ','398 ','402 ','405 ','415 ','418 ','421 ','422 ','428 ','429 ','430 ','431 ','435 ','439 ','443 ','445 ','455 ','456 ','457 ','458 ','459 ','462 ','463 ','464 ','468 ','473 ','500 ','506 ','509 ','511 ','515 ','516 ','529 ','530 ','534 ','536 ','538 ','542 ','544 ','546 ','547 ','549 ','589 ','601 ','604 ','610 ','613 ','618 ','619 ','621 ','624 ','625 ','626 ','627 ','628 ','630 ','632 ','635 ','638 ','640 ','642 ','645 ','646 ','647 ','648 ','651 ','655 ','664 ','666 ','667 ','668 ','669 ','670 ','671 ','672 ','681 ','692 ','693 ','694 ','699 ','723 ','726 ','730 ','732 ','733 ','734 ','735 ','737 ','744 ','748 ','749 ','751 ','753 ','761 ','762 ','764 ','766 ','768 ','771 ','772 ','773 ','774 ','775 ','786 ','790 ','796 ','797 ','803 ','808 ','809 ','823 ','824 ','847 ','889 ','896 ','897 ','939 ','942 ','943 ','944 ','945 ','954 ','959 ','960 ','961 ','968 ','969 ','973 ','976 ','977 ','981 ','982 ','984 ','986 ','987 ','989 ','AIF ','AOD ','EFY ','EHT '),
      PPLAN_MKT_CD_PREV VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1010','663','664','667','668','978'),
      PPLAN_CD_PREV VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('64334','65961','65996','65999','66004','72841','72864','72865','72867','72886','73412','73413','73414','73415','73416','73417','73424','73425','73426','73427','73430','73431','73432','73436','73437','73442','73443','73737','83242'),
      BUS_NM VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      NM_PRFX VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      NM_FIRST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('.','AARON','AB3','ADAM','AL','ALAN','ALARM','ALEX','ALICIA','ALULA, LLC','AMANDA','AMBER','AMY','ANDREA','ANDREW','ANGELA','ANN','ANTHONY','APRIL','ASHLEY','BARBARA','BEN','BENJAMIN','BENNETT','BIG','BILL','BRAD','BRANDON','BRENDA','BRIAN','BRUCE','BRYAN','CAMPBELL','CARL','CARLOS','CAROL','CATHERINE','CHAD','CHARLES','CHERYL','CHIP','CHRIS','CHRISTINA','CHRISTINE','CHRISTOPHER','CHRISTY','CINDY','CLIVE','CRAIG','CYNTHIA','DALE','DAN','DANIEL','DANIELLE','DAVID','DAWN','DEBORAH','DEBRA','DENISE','DENNIS','DIANE','DONALD','DONNA','DOOR','DOUGLAS','EDWARD','ELIZABETH','EMILY','ERIC','ERIK','ERIN','FRANK','GARY','GEORGE','GORDON','GPS','GREG','GREGORY','HEATHER','HYUNDAI','IP','IPAD','JACK','JACOB','JAMES','JAMIE','JANET','JASON','JEFF','JEFFREY','JENNIFER','JEREMY','JERRY','JESSE','JESSICA','JESUS','JIM','JOE','JOHN','JONATHAN','JOSE','JOSEPH','JOSH','JOSHUA','JUAN','JULIE','JUSTIN','KAREN','KATHERINE','KATHLEEN','KATHY','KEITH','KELLY','KENNETH','KEVIN','KIM','KIMBERLY','KYLE','LARRY','LAURA','LAUREN','LINDA','LISA','LORI','LUIS','MARGARET','MARIA','MARK','MARY','MATT','MATTHEW','MEGAN','MELISSA','MICHAEL','MICHELLE','MIKE','NANCY','NATHAN','NEW','NICHOLAS','NICK','NICOLE','No','NPHASE','OAS','PAMELA','PATRICIA','PATRICK','PAUL','PETER','PREPAID','PROGRESSIVE','RACHEL','RAMY','RANDY','RAYMEISHA','RAYMOND','REBECCA','RICHARD','RICK','ROBERT','ROBIN','ROGER','RON','RONALD','RYAN','SAMANTHA','SAMUEL','SANDRA','SARA','SARAH','SCOTT','SEAN','SHANNON','SHARON','SHAWN','SHERRY','SMARTSYNCH','STEPHANIE','STEPHEN','STEVE','STEVEN','STUDENT','SUSAN','TAMMY','TERESA','TERRY','THOMAS','TIM','TIMOTHY','TODD','TOM','TONY','TRACY','TRAVIS','TYLER','Update','USA','USER','VIVINT','WILLIAM','ZACK'),
      NM_MDLIN CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      NM_LAST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('.','AB3','ACCT','ADAMS','ALLEN','ALPERT','ALRED','ALULA, LLC','ANDERSON','AUTOEVER','BAILEY','BAKER','BELL','BENNETT','BLAKE','BOYD','BROOKS','BROWN','BRUCE','BURDIEK','CAMPBELL','CANNON','CARTER','CAT','CAWSE','CLARK','COLLINS','COM','CONSUMERS','COOK','COOPER','COX','CUSTOMER','DASH','DATATEL','DAVIS','DEMEDIO','DEPIERRO','DIRECT','DODSON','DOE','DORMAN','DUONG','EDWARDS','ENGG','EVANS','FLORES','GALMAN','GARCIA','GOLDEN','GOLDMAN','GONZALEZ','GRAMM','GRAY','GREEN','H','HALL','HANFT','HANNON','HARRIS','HER','HERNANDEZ','HILL','HOWARD','INC','Info','INS','IPAD','JACKSON','JOHNSON','JONES','JUAREZ','KELLY','KIM','KING','LAURANS','LEE','LEWIS','LINE','LONG','LOPEZ','LUJAN','LUOMA','LYNCH','MARTIN','MARTINEZ','MASTERS','MCCOOL','MIFI','MILLER','MISMATCH','MITCHELL','MOORE','MORGAN','MORRIS','MOURAD','MURPHY','NAME','NELSON','NIELSEN','NORTH','PARKER','PEEL','PEREZ','PETERSON','PHILLIPS','PHONE','PHONEINTHEBOX','PYLE','RAMIREZ','REED','REYES','RISBERG','RIVERA','ROBERTS','ROBINSON','RODINE','RODRIGUEZ','ROGERS','SANCHEZ','SCHWARZ','SCOTT','SMITH','SPUZZILLO','STEARNS','STEM','STEWART','STRAUB','SWEHLA','TABLET','TAYLOR','TECHNOLOGIES INC','THOMAS','THOMPSON','TORRES','TURNER','USER','VACCARO','WALKER','WARD','WEBB','WEINTRAUB','WELLS','WHITE','WILLIAMS','WILSON','WOOD','WRIGHT','YOUNG','ZAPATERO'),
      HOME_TEL_NUM CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0000000000','1111111111','6783893146','7039621881','7777777777','9999999999'),
      BUS_TEL_NUM CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0000000000','4045735800','4404615000','5099249900','5165772000','5177880550','5619883600','7033647000','7243875200','8013779111','8444822822','8597464351','8889574675','9999999999'),
      COMPTR_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('010','019'),
      IEC_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS '0000 ',
      SLS_PRSN_ID VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('','E00L9','E0GTU','E0HS1','E20P5','E22HG','E22T6','E22VK','ECB63','ECK39','ECN33','ECW79','ECW80','ECW82','ECW83','ED767','EDC58','EDC59','EE06U','EE0CX','EE0F2','EE0GF','EE0H4','EE0H8','EE100','EE104','EE25Y','EE29D','EE400','EE427','EE476','EE478','EE79Y','EE822','EEN60','EFQ51','EGU48','EJL29','ENC','ENC01','EPB68','ESQ34','ESQ43','ETS09','ETS11','ETS12','ETU90','EZ009','EZ189','EZ706','EZ982','N566N','N568N','N815N','N817N','N884N','NPB2C','NPM2M','NPMOP','NPWBG','PREPI','UDIVR'),
      PPLAN_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2021-06-24',DATE '2022-06-08',DATE '2021-06-25',DATE '2022-06-09',DATE '2021-06-28',DATE '2019-09-17',DATE '2018-04-22',DATE '2022-06-16',DATE '2022-06-17',DATE '2019-09-24',DATE '2022-06-20',DATE '2019-09-25',DATE '2022-06-21',DATE '2019-09-26',DATE '2022-06-22',DATE '2019-09-27',DATE '2020-09-11',DATE '2022-06-23',DATE '2022-06-24',DATE '2022-06-27',DATE '2022-06-28',DATE '2022-06-29',DATE '2021-09-02',DATE '2022-06-30',DATE '2022-01-19',DATE '2022-01-20',DATE '2022-01-21',DATE '2022-01-22',DATE '2020-09-24',DATE '2022-01-24',DATE '2022-01-25',DATE '2022-01-26',DATE '2022-01-27',DATE '2022-01-28',DATE '2022-01-29',DATE '2019-12-02',DATE '2022-01-31',DATE '2022-09-01',DATE '2022-09-02',DATE '2021-04-07',DATE '2022-09-06',DATE '2019-12-11',DATE '2021-09-23',DATE '2019-12-12',DATE '2021-09-24',DATE '2022-09-08',DATE '2022-09-09',DATE '2022-09-12',DATE '2022-04-01',DATE '2022-09-13',DATE '2019-12-18',DATE '2022-09-14',DATE '2022-09-15',DATE '2022-09-16',DATE '2021-04-21',DATE '2021-04-23',DATE '2022-09-19',DATE '2022-04-08',DATE '2022-09-20',DATE '2022-09-21',DATE '2019-02-02',DATE '2022-09-22',DATE '2022-04-11',DATE '2022-09-23',DATE '2021-04-28',DATE '2022-04-12',DATE '2022-09-24',DATE '2021-04-29',DATE '2022-09-26',DATE '2011-11-02',DATE '2022-09-27',DATE '2011-11-03',DATE '2022-09-28',DATE '2011-11-04',DATE '2022-09-29',DATE '2011-11-05',DATE '2022-09-30',DATE '2022-04-19',DATE '2011-11-07',DATE '2022-04-20',DATE '2011-11-08',DATE '2022-04-21',DATE '2011-11-09',DATE '2022-04-22',DATE '2011-11-10',DATE '2011-11-11',DATE '2011-11-13',DATE '2018-10-02',DATE '2022-04-26',DATE '2011-11-14',DATE '2011-11-16',DATE '2011-11-17',DATE '2021-07-02',DATE '2017-10-24',DATE '2018-10-11',DATE '2021-02-02',DATE '2022-07-01',DATE '2019-10-08',DATE '2022-07-06',DATE '2022-07-07',DATE '2022-07-08',DATE '2019-05-02',DATE '2022-07-11',DATE '2022-02-01',DATE '2022-07-13',DATE '2020-10-02',DATE '2021-02-18',DATE '2022-02-02',DATE '2022-07-14',DATE '2022-02-03',DATE '2022-07-15',DATE '2022-02-04',DATE '2022-02-05',DATE '2020-10-06',DATE '2022-07-18',DATE '2021-02-23',DATE '2022-02-07',DATE '2022-07-19',DATE '2022-02-08',DATE '2022-07-20',DATE '2022-02-09',DATE '2022-02-10',DATE '2022-07-22',DATE '2022-02-11',DATE '2020-10-12',DATE '2022-02-12',DATE '2022-07-24',DATE '2022-02-13',DATE '2022-07-25',DATE '2022-02-14',DATE '2022-07-26',DATE '2022-02-15',DATE '2022-07-27',DATE '2020-10-16',DATE '2022-02-16',DATE '2022-02-17',DATE '2022-07-29',DATE '2022-02-18',DATE '2022-02-19',DATE '2019-05-24',DATE '2022-02-20',DATE '2022-02-21',DATE '2022-02-22',DATE '2022-02-23',DATE '2022-02-24',DATE '2022-02-25',DATE '2022-02-26',DATE '2022-02-27',DATE '2022-02-28',DATE '2021-10-13',DATE '2020-05-18',DATE '2021-05-02',DATE '2021-10-14',DATE '2021-05-03',DATE '2022-10-02',DATE '2022-10-03',DATE '2022-10-04',DATE '2022-10-05',DATE '2022-10-06',DATE '2022-10-07',DATE '2021-05-14',DATE '2022-10-10',DATE '2022-10-11',DATE '2022-10-12',DATE '2022-10-13',DATE '2021-05-18',DATE '2022-05-02',DATE '2022-05-03',DATE '2022-05-06',DATE '2022-05-11',DATE '2022-05-18',DATE '2022-05-19',DATE '2022-05-20',DATE '2022-05-24',DATE '2020-03-02',DATE '2022-05-26',DATE '2022-05-27',DATE '2017-01-02',DATE '2020-03-11',DATE '2020-03-12',DATE '2021-08-11',DATE '2021-03-02',DATE '2022-08-01',DATE '2022-08-02',DATE '2022-08-03',DATE '2022-08-04',DATE '2022-08-05',DATE '2022-08-08',DATE '2022-08-09',DATE '2022-08-10',DATE '2022-08-11',DATE '2022-03-01',DATE '2022-03-02',DATE '2022-03-03',DATE '2022-03-04',DATE '2022-08-16',DATE '2022-03-05',DATE '2022-08-17',DATE '2022-08-18',DATE '2022-03-07',DATE '2022-08-19',DATE '2021-03-24',DATE '2022-03-08',DATE '2019-06-13',DATE '2022-03-09',DATE '2022-03-10',DATE '2022-08-22',DATE '2017-09-02',DATE '2022-03-11',DATE '2022-08-23',DATE '2022-08-24',DATE '2019-11-29',DATE '2022-03-13',DATE '2022-08-25',DATE '2020-06-02',DATE '2022-03-14',DATE '2022-08-26',DATE '2022-03-15',DATE '2022-03-16',DATE '2021-11-01',DATE '2022-03-17',DATE '2022-08-29',DATE '2021-11-02',DATE '2022-03-18',DATE '2022-03-19',DATE '2022-08-31',DATE '2019-06-24',DATE '2022-03-20',DATE '2022-03-21',DATE '2022-03-22',DATE '2022-03-23',DATE '2022-03-24',DATE '2020-01-02',DATE '2022-03-29',DATE '2022-03-31',DATE '2011-10-19',DATE '2011-10-20',DATE '2011-10-21',DATE '2017-09-26',DATE '2011-10-22',DATE '2011-10-23',DATE '2011-10-24',DATE '2011-10-26',DATE '2011-10-27',DATE '2020-01-16',DATE '2021-11-24',DATE '2011-10-29',DATE '2022-06-01',DATE '2022-06-02',DATE '2020-01-23',DATE '2021-06-22',DATE '2022-06-06',DATE '2021-06-23',DATE '2022-06-07'),
      ESN_NUM VARCHAR(256) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('13800000400','A0000000005003','A0000000005004','A0000000005005','A0000000005010','A0000000005013','A0000000005018','STKAA','STKHG','STKMA'),
      LINE_ACT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2008-03-21',DATE '2006-11-22',DATE '2009-03-06',DATE '2006-11-24',DATE '2006-06-16',DATE '2008-03-28',DATE '2007-06-01',DATE '2009-03-13',DATE '2006-11-30',DATE '2008-03-31',DATE '2007-06-08',DATE '2007-11-21',DATE '2007-11-23',DATE '2006-06-30',DATE '2007-06-15',DATE '2009-03-27',DATE '2007-11-30',DATE '2008-06-03',DATE '2009-03-31',DATE '2007-06-22',DATE '2008-06-06',DATE '2008-11-21',DATE '2006-09-01',DATE '2007-06-29',DATE '2008-06-13',DATE '2008-11-26',DATE '2008-01-04',DATE '2008-06-16',DATE '2008-11-28',DATE '2008-06-17',DATE '2008-06-20',DATE '2008-01-11',DATE '2008-06-23',DATE '2008-06-24',DATE '2008-06-26',DATE '2008-01-15',DATE '2008-06-27',DATE '2003-12-19',DATE '2003-12-20',DATE '2008-01-18',DATE '2008-06-30',DATE '2009-01-02',DATE '2003-12-22',DATE '2006-04-07',DATE '2003-12-23',DATE '2003-12-24',DATE '2007-09-05',DATE '2007-09-07',DATE '2008-01-25',DATE '2009-01-09',DATE '2008-01-26',DATE '2006-09-29',DATE '2008-01-29',DATE '2004-12-17',DATE '2007-09-14',DATE '2004-12-18',DATE '2008-01-31',DATE '2004-12-20',DATE '2004-12-21',DATE '2008-09-02',DATE '2004-12-22',DATE '2008-09-03',DATE '2004-12-23',DATE '2008-09-04',DATE '2004-12-24',DATE '2007-09-21',DATE '2008-09-05',DATE '2009-01-23',DATE '2008-09-09',DATE '2007-09-26',DATE '2005-12-16',DATE '2007-09-28',DATE '2008-09-12',DATE '2005-12-17',DATE '2006-12-01',DATE '2009-01-30',DATE '2005-12-19',DATE '2008-09-15',DATE '2009-01-31',DATE '2005-12-20',DATE '2008-09-16',DATE '2005-12-21',DATE '2005-12-22',DATE '2005-12-23',DATE '2008-09-19',DATE '2006-12-08',DATE '2008-09-23',DATE '2006-12-12',DATE '2006-12-13',DATE '2006-12-14',DATE '2008-09-26',DATE '2006-12-15',DATE '2006-12-16',DATE '2006-12-18',DATE '2008-09-30',DATE '2006-12-19',DATE '2009-04-03',DATE '2006-12-20',DATE '2006-12-21',DATE '2006-12-22',DATE '2006-12-23',DATE '2007-12-07',DATE '2006-12-26',DATE '2007-12-10',DATE '2009-04-10',DATE '2006-12-27',DATE '2007-12-11',DATE '2006-12-28',DATE '2007-12-12',DATE '2006-12-29',DATE '2007-12-13',DATE '2007-12-14',DATE '2007-12-15',DATE '2007-12-17',DATE '2008-12-01',DATE '2006-07-22',DATE '2007-07-06',DATE '2007-12-18',DATE '2008-12-02',DATE '2007-12-19',DATE '2007-12-20',DATE '2007-12-21',DATE '2008-12-05',DATE '2007-12-22',DATE '2007-12-23',DATE '2006-07-28',DATE '2007-12-24',DATE '2007-07-13',DATE '2007-12-25',DATE '2008-12-09',DATE '2007-02-02',DATE '2007-12-26',DATE '2007-12-27',DATE '2007-12-28',DATE '2008-12-12',DATE '2008-07-01',DATE '2009-04-30',DATE '2007-12-31',DATE '2008-07-03',DATE '2008-12-15',DATE '2007-07-20',DATE '2008-12-16',DATE '2008-12-17',DATE '2008-12-18',DATE '2008-07-07',DATE '2008-12-19',DATE '2008-07-08',DATE '2008-12-20',DATE '2008-12-22',DATE '2007-07-27',DATE '2008-07-11',DATE '2008-12-23',DATE '2007-02-16',DATE '2008-12-24',DATE '2008-02-01',DATE '2008-12-25',DATE '2007-07-30',DATE '2008-02-02',DATE '2008-07-14',DATE '2008-12-26',DATE '2007-07-31',DATE '2008-07-15',DATE '2008-07-16',DATE '2008-02-05',DATE '2008-12-29',DATE '2008-07-18',DATE '2008-12-30',DATE '2008-12-31',DATE '2008-02-08',DATE '2008-02-09',DATE '2008-07-25',DATE '2008-02-15',DATE '2008-02-16',DATE '2008-07-29',DATE '2008-07-30',DATE '2009-02-02',DATE '2008-02-19',DATE '2008-07-31',DATE '2009-02-03',DATE '2007-10-05',DATE '2008-02-22',DATE '2009-02-06',DATE '2009-02-07',DATE '2009-02-10',DATE '2007-10-12',DATE '2008-02-29',DATE '2009-02-13',DATE '2009-02-14',DATE '2009-02-16',DATE '2009-02-17',DATE '2007-10-19',DATE '2008-10-03',DATE '2009-02-20',DATE '2009-02-23',DATE '2009-02-24',DATE '2007-10-26',DATE '2009-02-27',DATE '2009-02-28',DATE '2008-05-02',DATE '2008-10-17',DATE '2008-05-09',DATE '2007-05-31',DATE '2006-08-04',DATE '2008-05-16',DATE '2009-05-01',DATE '2008-10-31',DATE '2006-08-11',DATE '2008-05-23',DATE '2008-05-28',DATE '2007-08-01',DATE '2006-08-18',DATE '2008-05-30',DATE '2007-08-03',DATE '2007-08-08',DATE '2006-08-25',DATE '2007-08-10',DATE '2006-08-30',DATE '2006-08-31',DATE '2007-08-15',DATE '2007-08-16',DATE '2007-08-17',DATE '2008-08-01',DATE '2007-08-20',DATE '2007-08-21',DATE '2008-08-05',DATE '2007-08-22',DATE '2004-11-26',DATE '2007-08-23',DATE '2008-08-07',DATE '2007-08-24',DATE '2008-08-08',DATE '2006-03-31',DATE '2008-08-12',DATE '2007-08-29',DATE '2007-08-30',DATE '2008-08-14',DATE '2007-08-31',DATE '2008-08-15',DATE '2008-08-18',DATE '2008-08-19',DATE '2008-08-20',DATE '2005-11-25',DATE '2008-08-21',DATE '2008-08-22',DATE '2005-06-17',DATE '2008-08-25',DATE '2007-03-30',DATE '2008-03-14',DATE '2008-08-26',DATE '2008-08-27',DATE '2008-08-28',DATE '2008-08-29',DATE '2007-11-02',DATE '2008-08-30',DATE '2009-03-03'),
      MTN_ACT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2009-03-04',DATE '2008-03-21',DATE '2009-03-05',DATE '2009-03-06',DATE '2006-11-24',DATE '2009-03-09',DATE '2009-03-10',DATE '2008-03-28',DATE '2007-06-01',DATE '2009-03-13',DATE '2008-03-31',DATE '2009-03-16',DATE '2006-01-10',DATE '2009-03-20',DATE '2007-11-23',DATE '2008-11-07',DATE '2009-03-23',DATE '2009-03-24',DATE '2009-03-27',DATE '2007-11-30',DATE '2008-11-14',DATE '2009-03-30',DATE '2008-06-03',DATE '2009-03-31',DATE '2008-06-06',DATE '2008-11-21',DATE '2008-06-10',DATE '2008-11-24',DATE '2007-06-29',DATE '2008-06-13',DATE '2008-11-25',DATE '2008-11-26',DATE '2008-01-04',DATE '2008-06-16',DATE '2008-11-28',DATE '2008-06-17',DATE '2008-06-18',DATE '2008-06-20',DATE '2008-06-23',DATE '2008-06-24',DATE '2008-06-26',DATE '2008-01-15',DATE '2008-06-27',DATE '2008-01-18',DATE '2008-06-30',DATE '2009-01-02',DATE '2009-01-05',DATE '2007-09-07',DATE '2009-01-08',DATE '2008-01-25',DATE '2009-01-09',DATE '2007-09-14',DATE '2008-01-31',DATE '2009-01-16',DATE '2004-12-21',DATE '2008-09-02',DATE '2004-12-22',DATE '2008-09-03',DATE '2004-12-23',DATE '2008-09-04',DATE '2009-01-20',DATE '2007-09-21',DATE '2008-09-05',DATE '2009-01-22',DATE '2009-01-23',DATE '2008-09-08',DATE '2009-01-24',DATE '2008-09-09',DATE '2007-09-28',DATE '2008-09-12',DATE '2009-01-29',DATE '2009-01-30',DATE '2008-09-15',DATE '2009-01-31',DATE '2005-12-20',DATE '2008-09-16',DATE '2005-12-21',DATE '2005-12-22',DATE '2005-12-23',DATE '2008-09-19',DATE '2008-09-23',DATE '2008-09-26',DATE '2006-12-15',DATE '2006-12-16',DATE '2008-09-29',DATE '2009-04-01',DATE '2006-12-18',DATE '2008-09-30',DATE '2006-12-19',DATE '2009-04-03',DATE '2006-12-20',DATE '2006-12-21',DATE '2006-12-22',DATE '2006-12-23',DATE '2007-12-07',DATE '2006-12-26',DATE '2009-04-10',DATE '2007-12-11',DATE '2007-12-12',DATE '2006-12-29',DATE '2007-12-13',DATE '2009-04-13',DATE '2007-12-14',DATE '2007-12-15',DATE '2007-12-17',DATE '2008-12-01',DATE '2009-04-17',DATE '2007-12-18',DATE '2008-12-02',DATE '2007-12-19',DATE '2008-12-03',DATE '2007-12-20',DATE '2007-12-21',DATE '2008-12-05',DATE '2007-12-22',DATE '2009-04-23',DATE '2007-12-24',DATE '2008-12-08',DATE '2009-04-24',DATE '2007-07-13',DATE '2008-12-09',DATE '2007-12-26',DATE '2008-12-10',DATE '2007-12-27',DATE '2008-12-11',DATE '2007-12-28',DATE '2008-12-12',DATE '2009-04-28',DATE '2008-07-01',DATE '2008-07-02',DATE '2009-04-30',DATE '2007-12-31',DATE '2008-07-03',DATE '2008-12-15',DATE '2007-07-20',DATE '2008-12-16',DATE '2008-12-17',DATE '2008-12-18',DATE '2008-07-07',DATE '2008-12-19',DATE '2008-07-08',DATE '2008-12-20',DATE '2008-07-10',DATE '2008-12-22',DATE '2007-07-27',DATE '2008-07-11',DATE '2008-12-23',DATE '2008-12-24',DATE '2008-02-01',DATE '2008-02-02',DATE '2008-07-14',DATE '2008-12-26',DATE '2008-07-15',DATE '2008-07-16',DATE '2008-02-05',DATE '2008-07-17',DATE '2008-12-29',DATE '2008-07-18',DATE '2008-12-30',DATE '2008-02-07',DATE '2008-12-31',DATE '2008-02-08',DATE '2008-07-21',DATE '2008-07-22',DATE '2008-07-23',DATE '2008-07-24',DATE '2008-07-25',DATE '2008-07-26',DATE '2008-02-15',DATE '2008-02-16',DATE '2008-07-28',DATE '2008-07-29',DATE '2008-07-30',DATE '2009-02-02',DATE '2008-02-19',DATE '2008-07-31',DATE '2009-02-03',DATE '2009-02-04',DATE '2009-02-05',DATE '2008-02-22',DATE '2009-02-06',DATE '2009-02-07',DATE '2009-02-09',DATE '2009-02-10',DATE '2009-02-11',DATE '2009-02-12',DATE '2008-02-29',DATE '2009-02-13',DATE '2009-02-14',DATE '2009-02-16',DATE '2008-10-01',DATE '2009-02-17',DATE '2009-02-18',DATE '2008-10-03',DATE '2009-02-19',DATE '2009-02-20',DATE '2009-02-21',DATE '2009-02-23',DATE '2009-02-24',DATE '2007-10-25',DATE '2009-02-25',DATE '2008-10-10',DATE '2009-02-26',DATE '2009-02-27',DATE '2009-02-28',DATE '2008-05-02',DATE '2008-10-17',DATE '2008-05-09',DATE '2008-10-23',DATE '2008-10-24',DATE '2008-05-16',DATE '2009-05-01',DATE '2008-10-31',DATE '2009-05-05',DATE '2008-05-23',DATE '2009-05-08',DATE '2008-05-28',DATE '2008-05-30',DATE '2007-08-03',DATE '2009-05-15',DATE '2009-05-18',DATE '2009-05-19',DATE '2007-08-10',DATE '2009-05-22',DATE '2009-05-23',DATE '2007-08-17',DATE '2008-08-01',DATE '2007-08-20',DATE '2008-08-04',DATE '2007-08-21',DATE '2008-08-05',DATE '2008-08-06',DATE '2008-08-07',DATE '2007-08-24',DATE '2008-08-08',DATE '2008-08-11',DATE '2008-08-12',DATE '2008-08-13',DATE '2008-08-14',DATE '2007-08-31',DATE '2008-08-15',DATE '2008-08-18',DATE '2008-08-19',DATE '2008-08-20',DATE '2005-11-25',DATE '2008-08-21',DATE '2008-08-22',DATE '2008-08-25',DATE '2008-03-14',DATE '2008-08-26',DATE '2008-08-27',DATE '2008-08-28',DATE '2008-08-29',DATE '2007-11-02',DATE '2009-03-03'),
      LINE_TERM_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      MTN_STATUS_IND CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A   ','D   ','S   '),
      ESN_CHANGE_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      ESN_CHANGE_REAS_CD VARCHAR(7) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AP','AU','B2','CE','CR','EA','FX','TA','U2','UN','UP','W2','WA','WP'),
      DSCNT_PLAN_CD VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      DEACT_CHANGE_REAS_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('35   ','90   ','91   ','A2   ','F2   ','FF   '),
      WARR_LGTH CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      WARR_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      EQP_STATUS_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('OW','PU'),
      EQP_PROD_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0','13822','18721','19023','19024','21102','21103','21104','21105','23299','23526','24108','24482','24483','24484','25777','25899','26499','26500','26503','26553','26614','26672','27083','27084','27145','27147','27148','27322','27403','27795','27855','27905','28265','28625','28883','28988','29083','29183','29705','29780','29992','30066','30538','30540','30614','30676','30698','30734','30841','31088','31464','32105','3217','32182','32291','32352','32771','32823','33026','33120','33554','33556','33920','34213','34638','34639','34640','34858','35270','35272','35274','35278','35279','35287','35288','35289','35319','35331','35705','36911','36912','36913','36914','36915','36916','37077','37754','37755','37756','38118','40226','40227','40228','40448','40706','41355','41356','42186','43569','44826','46962','47094','47258','47259','47442','47605','47606','47607','51270','51272','51824','51825','51826','53376'),
      EQP_TYPE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('B','M','P','T'),
      CNTRCT_NUM VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CNTRCT_TERM_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      CNTRCT_TERM_FEE DECIMAL(10,2) COMPRESS (0.00 ,175.00 ,50.00 ,350.00 ),
      CNTRCT_PRD_MTH BYTEINT COMPRESS (0 ,24 ),
      CNTRCT_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      CNTRCT_SLS_PRSN_ID VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('E20P5','ECK39','ECN33','ECW79','ECW82','ECW83','EDC58','EDC59','EE06U','EE0CX','EE25Y','EE400','EEN60','EJH43','ENC','ENC01','EPB68','ESQ34','ESQ43','ETS09','ETU90','EZ009','EZ706','EZ982','N815N','N817N','NPB2C','NPM2M','NPMOP','NPWBG'),
      MTN_ZONE_ACT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2020-09-02',DATE '2021-01-21',DATE '2015-07-29',DATE '2019-09-25',DATE '2022-06-21',DATE '2021-01-26',DATE '2021-01-28',DATE '2015-02-24',DATE '2022-06-24',DATE '2021-01-29',DATE '2017-12-22',DATE '2022-01-19',DATE '2020-09-21',DATE '2017-02-01',DATE '2017-02-02',DATE '2020-04-13',DATE '2017-12-29',DATE '2020-04-14',DATE '2018-07-03',DATE '2018-12-20',DATE '2022-09-01',DATE '2019-12-06',DATE '2015-10-15',DATE '2021-04-09',DATE '2015-05-09',DATE '2021-04-16',DATE '2021-09-28',DATE '2021-04-17',DATE '2015-05-13',DATE '2012-03-08',DATE '2021-04-20',DATE '2015-10-28',DATE '2012-08-24',DATE '2022-04-09',DATE '2020-12-11',DATE '2019-07-17',DATE '2020-07-01',DATE '2019-12-31',DATE '2020-12-15',DATE '2010-11-20',DATE '2013-03-05',DATE '2015-05-30',DATE '2022-04-19',DATE '2022-04-21',DATE '2014-08-08',DATE '2021-12-08',DATE '2019-02-20',DATE '2020-02-04',DATE '2020-02-06',DATE '2020-12-30',DATE '2020-07-22',DATE '2018-05-01',DATE '2011-01-01',DATE '2017-05-19',DATE '2020-07-31',DATE '2014-03-20',DATE '2021-07-20',DATE '2019-05-02',DATE '2021-07-26',DATE '2021-02-15',DATE '2015-03-11',DATE '2020-10-03',DATE '2022-02-04',DATE '2016-08-20',DATE '2022-02-17',DATE '2020-10-23',DATE '2021-10-07',DATE '2020-05-12',DATE '2022-02-25',DATE '2020-05-18',DATE '2021-05-03',DATE '2017-08-30',DATE '2021-05-14',DATE '2018-03-07',DATE '2018-08-20',DATE '2021-05-18',DATE '2018-03-14',DATE '2013-09-13',DATE '2015-06-26',DATE '2017-11-09',DATE '2020-08-11',DATE '2019-03-27',DATE '2021-08-07',DATE '2017-06-15',DATE '2020-08-26',DATE '2019-11-06',DATE '2020-03-24',DATE '2021-03-10',DATE '2018-11-28',DATE '2019-11-12',DATE '2021-08-24',DATE '2021-08-25',DATE '2011-02-19',DATE '2018-01-08',DATE '2020-11-04',DATE '2022-08-19',DATE '2018-01-17',DATE '2021-03-27',DATE '2020-06-03',DATE '2022-03-22',DATE '2017-09-14',DATE '2019-01-15',DATE '2014-12-19',DATE '2020-11-24',DATE '2014-12-20',DATE '2021-11-08',DATE '2019-01-18',DATE '2020-06-18',DATE '2007-03-15',DATE '2017-04-11',DATE '2020-01-08',DATE '2014-02-04',DATE '2021-11-17',DATE '2021-06-07',DATE '2017-09-27',DATE '2021-06-08',DATE '2021-11-20',DATE '2017-09-28',DATE '2012-10-11',DATE '2021-01-05',DATE '2021-01-08',DATE '2020-01-26',DATE '2022-06-06',DATE '2016-12-14',DATE '2015-12-31',DATE '2016-12-15'),
      CREDIT_APP_NUM CHAR(9) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      MTN_ZONE_ID CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      MTN_ZONE_DEACT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      BILL_ACCT_CD VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      EMAIL_ADDR VARCHAR(60) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('ABC@ABC.COM','CUSTOMERCARE@APRIVA.COM','DECLINE@VZW.COM','DECLINED@VZW.COM','NO@NO.COM','NOEMAIL@NOEMAIL.COM','NONE@NONE.COM','PRODUCTION@ALULA.NET','SS@NIELSEN.COM','Update@VZW.com','VERIZONORDERS@TRAQ.COM'),
      HANDICAP_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('5','N','Y'),
      LAST_UPD_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2022-09-11',DATE '2022-03-05',DATE '2022-03-13'),
      INSERT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2009-03-04',DATE '2009-03-05',DATE '2009-03-06',DATE '2009-03-07',DATE '2009-03-08',DATE '2006-11-25',DATE '2008-03-25',DATE '2009-03-10',DATE '2009-03-11',DATE '2003-04-07',DATE '2009-03-12',DATE '2009-03-13',DATE '2009-03-14',DATE '2003-09-22',DATE '2009-03-15',DATE '2009-03-17',DATE '2009-03-18',DATE '2008-11-04',DATE '2009-03-20',DATE '2009-03-21',DATE '2007-06-10',DATE '2009-03-22',DATE '2007-11-24',DATE '2009-03-24',DATE '2009-03-25',DATE '2008-11-11',DATE '2009-03-27',DATE '2009-03-28',DATE '2007-06-19',DATE '2008-06-03',DATE '2009-03-31',DATE '2003-04-29',DATE '2007-06-22',DATE '2008-11-18',DATE '2008-06-10',DATE '2008-11-22',DATE '2007-06-29',DATE '2008-01-01',DATE '2008-11-25',DATE '2008-06-17',DATE '2008-11-29',DATE '2008-06-24',DATE '2008-06-25',DATE '2008-01-15',DATE '2008-06-27',DATE '2008-06-28',DATE '2007-09-01',DATE '2009-01-03',DATE '2007-09-05',DATE '2008-01-22',DATE '2009-01-06',DATE '2007-09-11',DATE '2008-01-29',DATE '2003-07-21',DATE '2007-09-16',DATE '2007-09-18',DATE '2008-09-03',DATE '2008-09-04',DATE '2009-01-20',DATE '2008-09-05',DATE '2009-01-24',DATE '2008-09-09',DATE '2009-01-25',DATE '2008-09-10',DATE '2007-04-15',DATE '2009-01-27',DATE '2008-04-01',DATE '2009-01-30',DATE '2009-01-31',DATE '2008-09-16',DATE '2008-09-17',DATE '2008-09-23',DATE '2002-10-19',DATE '2008-09-24',DATE '2008-09-25',DATE '2007-12-01',DATE '2009-04-01',DATE '2008-09-30',DATE '2009-04-02',DATE '2006-12-19',DATE '2009-04-03',DATE '2009-04-04',DATE '2006-12-21',DATE '2009-04-05',DATE '2006-12-22',DATE '2006-12-23',DATE '2009-04-07',DATE '2006-12-24',DATE '2009-04-08',DATE '2009-04-09',DATE '2007-12-11',DATE '2009-04-11',DATE '2003-05-07',DATE '2006-07-16',DATE '2007-12-12',DATE '2007-12-13',DATE '2008-04-29',DATE '2009-04-13',DATE '2007-12-14',DATE '2009-04-14',DATE '2007-12-15',DATE '2009-04-15',DATE '2007-12-16',DATE '2009-04-17',DATE '2007-12-18',DATE '2008-12-02',DATE '2009-04-18',DATE '2007-12-19',DATE '2008-12-03',DATE '2007-12-20',DATE '2007-12-21',DATE '2009-04-21',DATE '2007-12-22',DATE '2008-12-06',DATE '2009-04-22',DATE '2007-12-23',DATE '2009-04-23',DATE '2007-12-24',DATE '2009-04-24',DATE '2007-12-25',DATE '2008-12-09',DATE '2009-04-25',DATE '2007-12-26',DATE '2008-12-10',DATE '2007-12-27',DATE '2007-12-28',DATE '2009-04-28',DATE '2007-12-29',DATE '2008-07-01',DATE '2009-04-29',DATE '2008-07-02',DATE '2009-04-30',DATE '2008-12-16',DATE '2008-12-17',DATE '2008-12-18',DATE '2007-02-11',DATE '2008-12-19',DATE '2008-07-08',DATE '2008-12-20',DATE '2008-07-09',DATE '2008-12-21',DATE '2008-12-23',DATE '2008-12-24',DATE '2008-12-25',DATE '2008-02-02',DATE '2007-07-31',DATE '2008-02-03',DATE '2008-07-15',DATE '2008-12-27',DATE '2008-07-16',DATE '2008-02-05',DATE '2008-12-30',DATE '2008-12-31',DATE '2006-10-08',DATE '2007-02-25',DATE '2008-02-09',DATE '2008-07-22',DATE '2008-07-23',DATE '2002-08-19',DATE '2008-02-12',DATE '2008-07-24',DATE '2008-02-16',DATE '2008-02-17',DATE '2008-07-29',DATE '2009-02-01',DATE '2007-10-02',DATE '2008-07-30',DATE '2008-02-19',DATE '2008-07-31',DATE '2009-02-03',DATE '2006-05-08',DATE '2008-02-20',DATE '2009-02-04',DATE '2009-02-07',DATE '2008-02-24',DATE '2009-02-08',DATE '2007-10-09',DATE '2009-02-10',DATE '2003-08-18',DATE '2009-02-11',DATE '2009-02-12',DATE '2009-02-14',DATE '2003-03-10',DATE '2009-02-15',DATE '2008-10-01',DATE '2009-02-17',DATE '2009-02-18',DATE '2009-02-20',DATE '2009-02-21',DATE '2008-10-07',DATE '2009-02-24',DATE '2009-02-25',DATE '2009-02-27',DATE '2008-10-14',DATE '2007-05-20',DATE '2008-10-21',DATE '2008-10-24',DATE '2008-05-13',DATE '2008-10-25',DATE '2008-10-28',DATE '2009-05-01',DATE '2009-05-02',DATE '2008-05-20',DATE '2002-06-17',DATE '2009-05-05',DATE '2009-05-06',DATE '2009-05-07',DATE '2009-05-08',DATE '2009-05-09',DATE '2008-05-28',DATE '2009-05-12',DATE '2007-08-01',DATE '2008-05-30',DATE '2009-05-15',DATE '2009-05-17',DATE '2007-08-07',DATE '2009-05-19',DATE '2007-08-08',DATE '2009-05-20',DATE '2009-05-21',DATE '2009-05-22',DATE '2009-05-23',DATE '2009-05-24',DATE '2007-08-14',DATE '2007-08-15',DATE '2007-08-17',DATE '2008-08-01',DATE '2008-08-02',DATE '2007-08-21',DATE '2008-08-05',DATE '2007-08-22',DATE '2008-08-06',DATE '2007-03-11',DATE '2008-08-08',DATE '2007-08-28',DATE '2008-08-12',DATE '2007-08-29',DATE '2008-08-13',DATE '2007-08-31',DATE '2008-08-15',DATE '2008-03-04',DATE '2008-08-19',DATE '2008-08-20',DATE '2008-08-21',DATE '2008-08-22',DATE '2008-08-23',DATE '2008-08-26',DATE '2008-08-27',DATE '2008-08-28',DATE '2006-06-05',DATE '2008-08-29',DATE '2009-03-01',DATE '2008-08-30',DATE '2009-03-03'),
      CONV_MTN_STATUS_IND CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CONV_DEACT_CHANGE_REAS_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CONV_LINE_TERM_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      PREPAID_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('3','N','Y'),
      EMIN CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2022035685','2022037969','2023292243','2023653753','2026412364','2027991036','2027995644','2029971034','2053291351','2064374879','2066978117','2094025822','2094050069','2132153308','2135005276','2142880496','2145510108','2152195595','2152873450','2152928997','2152929092','2152929168','2158800152','2282070099','2317405523','2515337134','2533504698','2537403577','2672299186','2813819008','2814151440','2814157061','2816380326','2817344916','3033451281','3102708765','3125192642','3138208830','3147035633','3149735689','3183490689','3187805192','3192700134','3216931561','4027409688','4042720001','4042741636','4076973117','4122161654','4123107632','4124801613','4125238374','4126003050','4126516062','4128749627','4159712771','4193573205','4432579183','4438451570','5033082314','5052311684','5095412853','5105072931','5105525615','5105529722','5122366768','5125674951','5179272116','5209759473','5405214953','5405551542','5593310834','5612523911','5612526148','5612545095','5615160522','5704417134','5732170028','6023190331','6024788864','6025090505','6025713280','6073210183','6093065046','6123609185','6125901807','6125902594','6125904099','6144065729','6153477949','6153478594','6155193072','6155199524','6168266269','6187927580','6198573742','6262049707','6264194885','6264822875','6309470318','6362471748','6468250253','6502914095','6504001727','6613055143','6618742361','6619040978','6626999004','6783723430','6789771975','7012490314','7013676855','7013880186','7022715245','7024238613','7032171718','7032446219','7033042416','7033286546','7037955921','7037957089','7039468355','7063405528','7084765949','7089278913','7132016034','7132041901','7132060818','7132085296','7132536845','7137031625','7137033791','7137039824','7137055479','7137241888','7137256686','7138236142','7138239670','7138247644','7138280534','7142872973','7169129103','7175742163','7178922433','7194310058','7242997452','7243168807','7243169047','7243169118','7243169272','7243169283','7243169293','7243169294','7243169296','7243169297','7243169520','7243169521','7243169550','7243169551','7243169561','7243169854','7245944198','7246226975','7246228145','7247130010','7247130034','7247130040','7247130042','7247130043','7247130044','7312352821','7576157164','7578106235','7578808959','7605050015','7703174942','7707151365','7722011141','7723592256','7733042770','7738961804','7863851216','7863856681','7865141029','7868970260','8037183654','8038040136','8043574721','8057464262','8082712017','8132039759','8132039776','8139512517','8139571038','8139571671','8139575746','8139577730','8143228788','8179058263','8179753629','8182183092','8182270500','8182987021','8183884391','8184560650','8287360591','8322009490','8323645391','8329840133','8435980741','8435980772','8436938953','8437012061','8479469366','8503844726','8632558360','8642380764','8642703778','8644141790','8644235850','9012010987','9012011745','9012333816','9013558290','9014845518','9045531023','9045532732','9045537012','9046732696','9082290796','9097332645','9109750054','9132093465','9134248688','9166620265','9167100205','9312377609','9415041115','9492856089','9542157788','9542900508','9542954157','9548291085','9563570577','9565661666','9565662376','9722491681','9727690150','9728413371','9792481032','9795308211','9856341547','9856341696','9857917384'),
      NE2_REDEMPT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      GEO_CD CHAR(14) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('USA01073070000','USA01089370000','USA01101510000','USA01117000000','USA04013000000','USA04013120000','USA04013274000','USA04013460000','USA04013550000','USA04013650000','USA04013730000','USA04019770000','USA06001530000','USA06013683780','USA06019270000','USA06029035260','USA06037430000','USA06037440000','USA06037800000','USA06059009470','USA06059020000','USA06059253800','USA06059367700','USA06059511820','USA06059690000','USA06065620000','USA06067640000','USA06073660000','USA06075670000','USA06085680000','USA06085770000','USA06111546520','USA08005452550','USA08013078500','USA08031200000','USA08041A00080','USA09001000000','USA09001559900','USA09001730000','USA09003000000','USA09009000000','USA10003000000','USA10005000000','USA11001500000','USA12021000000','USA12031350000','USA12057710000','USA12081000000','USA12083000000','USA12086179350','USA12095000000','USA12095530000','USA12099000000','USA12099073000','USA12103513500','USA12103630000','USA12105000000','USA13067000000','USA13067796120','USA13089109440','USA13117000000','USA13121016960','USA13121040000','USA13121685160','USA13135000000','USA15003715500','USA16001088300','USA17031140000','USA17143590000','USA18003250000','USA18097360030','USA19153799500','USA20173790000','USA21067460270','USA21111480060','USA22071550000','USA24005182500','USA24510040000','USA25009000000','USA25017000000','USA25021557450','USA25021742100','USA25023000000','USA25025070000','USA25027000000','USA26075414200','USA26099000000','USA26125000000','USA26125041050','USA26163000000','USA26163220000','USA27053243080','USA27053301400','USA27053430000','USA27055092260','USA27123580000','USA29077700000','USA29095380000','USA30111065500','USA31055370000','USA31109280000','USA31177053500','USA32003319000','USA32003400000','USA33011000000','USA33015000000','USA34003000000','USA34005000000','USA34013000000','USA34023000000','USA34025000000','USA34027000000','USA34027482100','USA34029000000','USA34035000000','USA35001020000','USA36005510000','USA36027000000','USA36029000000','USA36047510000','USA36055000000','USA36061510000','USA36067000000','USA36081510000','USA36085510000','USA36103020440','USA36103465140','USA37057000000','USA37063190000','USA37067750000','USA37081280000','USA37119120000','USA37183000000','USA37183550000','USA38017257000','USA39017000000','USA39035160000','USA39035484680','USA39049180000','USA39061150000','USA39095770000','USA39151000000','USA40109550000','USA40143750000','USA41051590000','USA42003000000','USA42003505280','USA42003610000','USA42017000000','USA42029000000','USA42045000000','USA42071000000','USA42091000000','USA42101600000','USA42129000000','USA42129524320','USA45045000000','USA45045308500','USA45063000000','USA45083000000','USA46005310600','USA46099590200','USA47037520060','USA47065140000','USA47093000000','USA47093400000','USA47157480000','USA47187277400','USA48029650000','USA48085580160','USA48113190000','USA48113370000','USA48141240000','USA48157708080','USA48201350000','USA48201A04080','USA48439040000','USA48439270000','USA48453050000','USA49011403600','USA49035670000','USA49049443200','USA49049624700','USA49057559800','USA51013030000','USA51041000000','USA51059000000','USA51059799520','USA51107000000','USA51550160000','USA51760670000','USA51810820000','USA53033630000','USA53033A00220','USA53063393350','USA53063670000','USA55079530000','USA55127869250'),
      GEO_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'G3',
      ORIG_CUST_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('223564045','242004212','242028440','242036245','242042978','242045800','242048616','242078291','242232494','271372775','342023651','342082451','342100815','342162423','342230011','342283376','342285417','342330389','342415115','442018439','442055186','442125447','442261096','442335235','442477149','523748267','542028174','542057161','542057243','542063202','542066517','542147069','542339667','542351490','642015857','642040113','642048712','642056016','642057533','642067947','642069342','642070214','642074487','642187368','672323346','687158971','742026243','742027525','742034421','742048882','742051081','742069653','742071421','742205247','822646749','842042373','842233241','842343964','942009052','942057085','942060984','942247427','942330429'),
      ORIG_CUST_LINE_SEQ_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0_1','0_2','1','10','11','12','13','14','15','16','17','18','19','2','20','21','22','23','24','25','26','27','28','29','3','4','5','6','7','8','9'),
      PROD_NM CHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2GIG Technologies 2GIG-CP21-345 ','3G Basic PDI                    ','4G Smartphone PDI               ','4G Tablets PDI                  ','5G Core Smartphone PDI          ','5G Interim Soft SIM by Gemalto  ','5G Interim Soft SIM by GnD      ','5G Interim Soft SIM by ST       ','5G SA soft SIM by Gemalto       ','5G SA soft SIM by GnD           ','5G SA soft SIM by ST            ','5G Smartphone PDI               ','5G standalone SIM by ST         ','5G standalone SIM by Thales     ','Alarm.com - ADC-200H-EVD        ','Alarm.com ADC-200C-EVD          ','Auto Receptionist               ','CalAmp - LMU-200                ','CalAmp - LMU-2620               ','CalAmp - LMU-2630               ','CalAmp - LMU-3030               ','CalAmp - PL641                  ','Connected Holdings - ARROWCV002 ','DMP - 263C 2nd Generation       ','Default PDI                     ','DuraXVPlus by Kyocera           ','G and D 4FF BULK SIM CARD       ','G and D 4G 2FF-HD Cloud SIM     ','G and D 4G 3FF SIM - DF         ','G and D 4G 3FF SIM Retail Stores','G and D 4G 3FF-HD Cloud SIM     ','G and D 4G M2M NONRUG CLOUD SIM ','G and D 4G M2M RUG CLOUD SIM    ','G and D 4G MFF2 Cloud SIM       ','G and D 4G MFF2 Cloud SIM-MTC   ','G and D 4G MFF2 SIM             ','G and D 4G NONRUG CLOUD SIM-MTC ','G and D 4G SIM Card - DF        ','G and D Soft SIM                ','G and D Soft SIM Type S         ','G-D Multi-Form-Factor SIM       ','GD 4G M2M NONRUG CLOUD SIM      ','GD 4G NONRUG CLOUD SIM-MTC      ','GEMALTO 4FF BULK SIM CARD       ','GEMALTO 4FF DFILL SIM CARD      ','GND 4FF NFC SIM Retail Stores   ','GND M2M 2FF NONRUG SIM          ','GTO 4FF NFC SIM Retail Stores   ','GTO 4G 5G Interim DFILL SIM     ','GTO 4G M2M NONRUG CLOUD SIM     ','GTO 4G NONRUG CLOUD SIM-MTC     ','GTO Multi-Form-Factor SIM       ','GTO Multi-Form-Factor SIM DF    ','G_D 4G and 5G SA Interim SIM    ','Gemalto 4FF NFC SIM - DF        ','Gemalto 4G 2FF-HD Cloud SIM     ','Gemalto 4G 2FF-HD SIM           ','Gemalto 4G 3FF SIM - DF         ','Gemalto 4G 3FF SIM Retail Stores','Gemalto 4G MFF2 Cloud SIM       ','Gemalto 4G MFF2 Cloud SIM-MTC   ','Gemalto 4G MFF2 SIM             ','Gemalto 4G NFC SIM Retail Stores','Gemalto 4G SIMCard Retail Stores','Gemalto Soft SIM                ','Gemalto Test eUICC-Type S       ','Gemalto eUICC Type C-MFF2       ','GenX Mobile - GNX-5P-C          ','Geotab - GO7 CDMA_Verizon       ','GizmoGadget by LG Navy          ','GizmoPal 2 by LG Blue           ','Home Phone Connect F256         ','Honeywell - CD6000H             ','Honeywell - CDMA-X              ','Hum by Verizon                  ','Hunt Group                      ','IDEMIA M2M Non-Industrial       ','IpDatatel - IPD BAT CU          ','Itron - 1210-AMP                ','Itron - OpenWay 3.1             ','LG Revere 3                     ','Laird - Orion                   ','Montage - MGCDMAV1              ','Networkfleet 5000CDMA-PCS3      ','PHILIPS HEALTHCR 100605C 1.AA   ','Passtime - PTE-3                ','Passtime - TRAX-4               ','Philips - 100204C               ','Philips - 100204C 2.xx          ','Philips - 100605C               ','Positioning Univ - ES710        ','Queclink - GV55VC               ','SIM SKU 4G 5G                   ','ST 4G 5G Interim SIM            ','ST 4G M2M RUG MTC CLOUD SIM     ','ST Multi-Form-Factor SIM        ','STM 3FF SIM Retail Stores       ','STM 4FF NFC SIM Retail Stores   ','STM 4FF SIM Retail Stores       ','STM 4G M2M NONRUG CLOUD SIM     ','STM 4G MFF2 Cloud SIM           ','STM 4G MFF2 Cloud SIM-MTC       ','STM 4G NONRUG CLOUD SIM-MTC     ','STM BULKSIM-CMR-MP-S            ','STM Soft SIM                    ','Samsung Convoy 3                ','Samsung Convoy 4                ','Samsung Gusto 3 Prepay          ','Simple Voice Mobile Client      ','SimpliSafe - SSCDMA5            ','SmartSynch Inc SSI kV2c 1X      ','Test Device                     ','Thales 5G SIM multiple profiles ','UNI PREPAID TRI 4G SIM KIT      ','USA Tech - ePort Telemeter      ','USB760                          ','Vivint - CP01 Novatel           ','Vivint - CP01 Telit             ','Wireless Home Phone             ','Xirgo - XT-2150CV               ','Xirgo - XT-3250CV               ','Xirgo - XT-3450CV               '),
      PRISM_SEQ_NUM CHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ORIG_SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A','E','H','I','K','L','N','O','S','V','W'),
      LAST_CYCLE_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS (DATE '2019-04-01',DATE '2021-06-25',DATE '2017-12-01',DATE '2022-06-10',DATE '2020-09-01',DATE '2022-01-01',DATE '2018-04-23',DATE '2019-09-23',DATE '2021-01-23',DATE '2021-01-25',DATE '2020-09-10',DATE '2022-01-10',DATE '2022-06-23',DATE '2018-12-01',DATE '2020-04-01',DATE '2021-09-01',DATE '2019-04-23',DATE '2017-12-23',DATE '2020-04-10',DATE '2020-09-23',DATE '2022-01-23',DATE '2021-09-10',DATE '2019-12-01',DATE '2021-04-01',DATE '2022-09-01',DATE '2018-12-23',DATE '2020-04-23',DATE '2018-02-01',DATE '2019-12-10',DATE '2021-09-23',DATE '2019-07-01',DATE '2022-09-10',DATE '2022-09-12',DATE '2020-12-01',DATE '2022-04-01',DATE '2022-09-13',DATE '2022-09-14',DATE '2018-07-23',DATE '2022-09-15',DATE '2022-09-16',DATE '2022-09-17',DATE '2022-09-18',DATE '2019-12-23',DATE '2021-04-23',DATE '2022-09-19',DATE '2022-09-20',DATE '2019-02-01',DATE '2022-09-21',DATE '2017-10-01',DATE '2020-12-10',DATE '2022-04-10',DATE '2022-09-22',DATE '2022-09-23',DATE '2022-09-24',DATE '2020-07-01',DATE '2022-09-25',DATE '2022-09-26',DATE '2018-02-23',DATE '2022-09-27',DATE '2022-09-28',DATE '2021-12-01',DATE '2022-09-29',DATE '2022-09-30',DATE '2019-07-23',DATE '2020-07-10',DATE '2020-12-23',DATE '2022-04-23',DATE '2018-10-01',DATE '2020-02-01',DATE '2021-12-10',DATE '2021-07-01',DATE '2020-02-06',DATE '2019-02-23',DATE '2017-10-23',DATE '2020-02-10',DATE '2020-07-23',DATE '2020-07-25',DATE '2021-07-10',DATE '2021-12-23',DATE '2019-10-01',DATE '2021-02-01',DATE '2022-07-01',DATE '2019-10-06',DATE '2018-10-23',DATE '2020-02-23',DATE '2018-10-25',DATE '2021-02-10',DATE '2021-07-23',DATE '2019-05-01',DATE '2022-07-10',DATE '2020-10-01',DATE '2022-02-01',DATE '2018-05-23',DATE '2019-05-10',DATE '2019-10-23',DATE '2021-02-23',DATE '2020-10-10',DATE '2022-02-10',DATE '2022-07-23',DATE '2020-05-01',DATE '2021-10-01',DATE '2019-05-23',DATE '2020-05-10',DATE '2020-10-23',DATE '2022-02-23',DATE '2018-08-01',DATE '2021-10-10',DATE '2021-05-01',DATE '2022-10-01',DATE '2022-10-02',DATE '2020-05-23',DATE '2022-10-03',DATE '2022-10-04',DATE '2018-03-01',DATE '2022-10-05',DATE '2022-10-06',DATE '2021-10-23',DATE '2022-10-07',DATE '2022-10-08',DATE '2019-08-01',DATE '2022-10-09',DATE '2022-10-10',DATE '2022-10-11',DATE '2022-05-01',DATE '2018-08-23',DATE '2021-05-23',DATE '2019-03-01',DATE '2017-11-01',DATE '2022-05-10',DATE '2020-08-01',DATE '2018-03-23',DATE '2019-08-23',DATE '2020-08-10',DATE '2022-05-23',DATE '2018-11-01',DATE '2020-03-01',DATE '2021-08-01',DATE '2019-03-23',DATE '2017-11-23',DATE '2018-11-10',DATE '2020-08-23',DATE '2018-06-01',DATE '2021-08-10',DATE '2019-11-01',DATE '2021-03-01',DATE '2022-08-01',DATE '2018-11-23',DATE '2020-03-23',DATE '2018-01-01',DATE '2021-03-10',DATE '2021-08-23',DATE '2019-06-01',DATE '2022-08-10',DATE '2020-11-01',DATE '2022-03-01',DATE '2018-06-23',DATE '2019-06-10',DATE '2019-11-23',DATE '2021-03-23',DATE '2019-01-01',DATE '2022-08-23',DATE '2020-06-01',DATE '2018-01-23',DATE '2021-11-01',DATE '2019-01-10',DATE '2019-06-23',DATE '2020-06-10',DATE '2020-11-23',DATE '2022-03-23',DATE '2018-09-01',DATE '2020-01-01',DATE '2021-11-10',DATE '2021-06-01',DATE '2019-01-23',DATE '2020-01-10',DATE '2020-06-23',DATE '2018-04-01',DATE '2021-06-10',DATE '2021-11-23',DATE '2019-09-01',DATE '2021-01-01',DATE '2022-06-01',DATE '2018-09-23',DATE '2020-01-23',DATE '2021-06-23'),
      REV_GEN_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      ACTN_MKT_SEG_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      BUDGET_CTR_CD VARCHAR(36) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('123444','1MBNOSMS-TECHNO-X','AB3','ATD300S','DOOR001','HMA'),
      SLS_DIST_CHNL_TYPE_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A  ','D  ','I  ','M  ','N  ','R  ','T  '),
      CORP_REPORTING_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('V','V100025N','V100027N','V100028N','V100029N','V101068N','V10176T','V118618D','V119264D','V119265D','V119266D','V119481T','V120343D','V120344D','V123869D','V123871D','V123977D','V124252D','V124253D','V124255D','V124484D','V124485D','V124487D','V124629N','V124630N','V124632N','V124636N','V124641N','V124642N','V124643N','V124644N','V124646N','V124648N','V124654N','V124657N','V124671N','V125256N','V126073D','V126826NC','V128049T','V128050T','V128056T','V128058T','V128303N','V133261NC','V13920T','V13922D','V14349N','V14568N','V14569N','V15255D','V15260T','V15269N','V15307T','V1744D','V18063D','V21536D','V22755D','V3008NC','V3341T','V3812D','V4231T','V4232D','V6071D','V6202D','V673D','V71734D','V72127D','V72133D','V72355D','V7277T','V74584D','V74662N','V74663T','V74686D','V74816T','V75060T','V75064I','V75207D','V75884D','V76077T','V76078T','V7737D','V79927D','V80643R','V82491D','V8253N','V85016D','V85067N','V85843NC','V86121D','V8620N','V88166D','V8865D','V88707D','V88708D','V88710D','V88711D','V9196D','V92060NC','V95578D','V96532I','V96609M','V96610D','V96611T','V9971D'),
      ESN_REDEMPT_DT DATE FORMAT 'yyyy/mm/dd' COMPRESS ,
      CNTRCT_SLS_OUTLET_ID VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('100025','100027','100028','100029','101068','10176','109950','118618','119264','119265','119266','119481','120343','120344','123869','123871','123977','124252','124255','124484','124485','124487','124629','124630','124631','124632','124633','124634','124636','124641','124642','124643','124644','124645','124646','124647','124648','124654','124657','124659','124662','124671','124672','125256','125258','126073','126826','128049','128050','128056','128058','128303','133261','13920','13922','14349','14568','14569','15255','15260','15269','1744','18063','21536','22755','3008','3341','3812','4231','4232','6071','6202','673','71734','72127','72133','72355','7277','74662','74686','75060','75207','75209','75884','76078','7737','79918','79927','82491','8253','85016','85067','86121','8620','88166','8865','88707','88708','88710','88711','9196','92060','92406','92632','95578','9971'),
      CNTRCT_SLS_DIST_CHNL_TYPE_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A  ','D  ','M  ','N  ','NC ','R  '),
      CNTRCT_USER_ID VARCHAR(8) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('00000829','00057234','00064929','00094525','00100625','00117718','ACAV840P','ACSTACNP','BGCOAPI','BGCOIOT','BGCOOFFL','CXPAPIPR','DVSLORX','FCST146P','FCST482P','FCST496P','FCST498P','HONEYWEL','M2MOC','MYBIZSID','NPHASE','POSEMP','PRMVIPVZ','R0200915','R1418884','SE POS','SYSTPOS','TANGOE','VISMTN1','VZTELMAT'),
      STATIC_IP_ADDR VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      STATIC_IP_ADDR_EFF_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      STATIC_IP_ADDR_TERM_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      PORT_STATUS_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      PORT_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      PORT_CONFIRM_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('C','D','P'),
      CNTRCT_END_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      BUS_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      AUTO_PORT_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('F','N','Y'),
      XMKT_ACCT_NUM VARCHAR(36) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('242004212_1','242028440_1','242036245_1','242042978_1','242045800_1','242048616_1','242078291_1','242204427_1','242232494_1','271372775_1','342023651_1','342061795_1','342082451_1','342100815_1','342162423_1','342230011_1','342230011_3','342283376_1','342285417_1','342297304_1','342330389_1','342415115_1','442018439_1','442055186_1','442125447_1','442261096_1','442261096_2','442261096_3','442335235_1','442477149_1','523748267_3','542028174_1','542028174_5','542057161_1','542057243_1','542063202_1','542147069_4','542339667_1','642015857_1','642040113_1','642048712_1','642056016_1','642057533_1','642067947_1','642069342_1','642070214_1','642074487_1','642075741_1','642187368_1','672323346_2','687158971_1','742026243_1','742027525_1','742034421_1','742048882_1','742055842_1','742069653_1','742071421_1','742205247_1','822646749_1','842042373_1','842057206_1','842233241_1','842310215_1','842330014_1','842343964_1','942009052_1','942057085_1','942060984_1','942060984_4','942060984_5','942330429_1','942367820_1'),
      XMKT_ACCT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'N',
      SIM_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CREDIT_CLASS_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('4K','6K','A ','A1','B ','C '),
      SCRTY_DEP_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      SCRTY_DEP_AMT DECIMAL(10,2) COMPRESS (0.00 ,125.00 ),
      SCRTY_DEP_STATUS_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SCRTY_DEP_PAY_AMT DECIMAL(10,2) COMPRESS (0.00 ,125.00 ),
      ROLLUP_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('B','D','F','G','H','I','J','M','N','O','P','R','S','U','X','Z'),
      AGE_INPUT_PREMIER CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      HISP_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      HISP_CONF_IND BYTEINT COMPRESS ,
      ELEC_SIGN_CAPT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      MERIT_EXP_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      SCRTY_DEP_INT_AMT DECIMAL(7,2) COMPRESS 0.00 ,
      ACT_CHANGE_REAS_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      BIRTH_YEAR INTEGER COMPRESS (1936 ,1940 ,1941 ,1942 ,1943 ,1944 ,1945 ,1946 ,1947 ,1948 ,1949 ,1950 ,1951 ,1952 ,1953 ,1954 ,1955 ,1956 ,1957 ,1958 ,1959 ,1960 ,1961 ,1962 ,1963 ,1964 ,1965 ,1966 ,1967 ,1968 ,1969 ,1970 ,1971 ,1972 ,1973 ,1974 ,1975 ,1976 ,1977 ,1978 ,1979 ,1980 ,1981 ,1982 ,1983 ,1984 ,1985 ,1986 ,1987 ,1988 ,1989 ,1990 ,1991 ,1992 ,1993 ,1994 ,1995 ,1996 ,1997 ,1998 ,1999 ,2000 ),
      INSTANCE_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('EP','VB','VE','VN','VW'),
      AREA_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('MW','NM','SO','WE'),
      CPNI_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('I','O'),
      STATIC_IP_ADDR_TYPE CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('R','U'),
      FIN_MKT_CD VARCHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('00H','00I','00J','00K','00M','00N','00O','00P','00S','00T','00W','011','014','018','01P','021','023','026','027','02A','02F','02G','031','037','039','03O','03Z','040','044','046','048','04A','04B','04C','04D','04E','04F','04G','04H','04I','04J','04L','04M','04N','04O','04P','04Q','04R','04S','04T','04U','053','055','057','05A','05J','05K','05L','05M','05N','05R','063','065','066','06D','06E','06F','06I','06R','074','075','076','083','084','086','089','091','097','159','161','201','209','255','274','287','328','329','337','340','341','345','347','349','351','356','358','362','364','365','366','368','369','372','373','374','375','377','378','379','381','382','383','385','388','390','391','398','402','405','415','418','421','422','428','429','430','431','435','439','443','445','455','456','457','458','459','462','463','464','468','473','500','506','509','511','515','516','529','530','534','536','538','542','544','546','547','549','589','601','604','610','613','618','619','621','624','625','626','627','628','630','632','635','638','640','642','645','646','647','648','651','655','664','666','667','668','669','670','671','672','681','692','693','694','699','723','726','730','732','733','734','735','737','744','748','749','751','753','761','762','764','766','768','771','772','773','774','775','786','790','796','797','803','808','809','823','824','847','889','896','897','939','942','943','944','945','954','959','960','961','968','969','973','976','977','981','982','984','986','987','989','AIF','AOD','EFY','EHT'),
      LINE_TYPE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('H','O','T','W'),
      CNTRCT_TERM_ID VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0','02','11','12','14','15','20','21','35','42','43','45','48'),
      CUST_ASSOC_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0','14'),
      ALLTEL_SRC_BILL_ACCT_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ALLTEL_SRC_SUB_UNIQUE_ID VARCHAR(28) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ALLTEL_MAKE VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ALLTEL_MODEL VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CUST_TYPE_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CO','IN','MJ'),
      VSN_CUST_TYPE_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('BE','NA','PE'),
      MOB_CBR_NUM CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      DEVICE_TYPE_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('4GS','5GS','ODI'),
      VZW_IMSI VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      VF_IMSI VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS '000000000000000',
      NE2_DSCNT_AMT DECIMAL(7,2) COMPRESS 0.00 ,
      AUP_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      SECURED_PROD_NM CHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2GIG Technologies 2GIG-CP21-345 ','3G Basic PDI                    ','4G Smartphone PDI               ','4G Tablets PDI                  ','5G Core Smartphone PDI          ','5G Interim Soft SIM by Gemalto  ','5G Interim Soft SIM by GnD      ','5G Interim Soft SIM by ST       ','5G SA soft SIM by Gemalto       ','5G SA soft SIM by GnD           ','5G SA soft SIM by ST            ','5G Smartphone PDI               ','5G standalone SIM by ST         ','5G standalone SIM by Thales     ','Alarm.com - ADC-200H-EVD        ','Alarm.com ADC-200C-EVD          ','Auto Receptionist               ','CalAmp - LMU-200                ','CalAmp - LMU-2620               ','CalAmp - LMU-2630               ','CalAmp - LMU-3030               ','CalAmp - PL641                  ','Connected Holdings - ARROWCV002 ','DMP - 263C 2nd Generation       ','Default PDI                     ','DuraXVPlus by Kyocera           ','G and D 4FF BULK SIM CARD       ','G and D 4G 2FF-HD Cloud SIM     ','G and D 4G 3FF SIM - DF         ','G and D 4G 3FF SIM Retail Stores','G and D 4G 3FF-HD Cloud SIM     ','G and D 4G M2M NONRUG CLOUD SIM ','G and D 4G M2M RUG CLOUD SIM    ','G and D 4G MFF2 Cloud SIM       ','G and D 4G MFF2 Cloud SIM-MTC   ','G and D 4G MFF2 SIM             ','G and D 4G NONRUG CLOUD SIM-MTC ','G and D 4G SIM Card - DF        ','G and D Soft SIM                ','G and D Soft SIM Type S         ','G-D Multi-Form-Factor SIM       ','GD 4G M2M NONRUG CLOUD SIM      ','GD 4G NONRUG CLOUD SIM-MTC      ','GEMALTO 4FF BULK SIM CARD       ','GEMALTO 4FF DFILL SIM CARD      ','GND 4FF NFC SIM Retail Stores   ','GND M2M 2FF NONRUG SIM          ','GTO 4FF NFC SIM Retail Stores   ','GTO 4G 5G Interim DFILL SIM     ','GTO 4G M2M NONRUG CLOUD SIM     ','GTO 4G NONRUG CLOUD SIM-MTC     ','GTO Multi-Form-Factor SIM       ','GTO Multi-Form-Factor SIM DF    ','G_D 4G and 5G SA Interim SIM    ','Gemalto 4FF NFC SIM - DF        ','Gemalto 4G 2FF-HD Cloud SIM     ','Gemalto 4G 2FF-HD SIM           ','Gemalto 4G 3FF SIM - DF         ','Gemalto 4G 3FF SIM Retail Stores','Gemalto 4G MFF2 Cloud SIM       ','Gemalto 4G MFF2 Cloud SIM-MTC   ','Gemalto 4G MFF2 SIM             ','Gemalto 4G NFC SIM Retail Stores','Gemalto 4G SIMCard Retail Stores','Gemalto Soft SIM                ','Gemalto Test eUICC-Type S       ','Gemalto eUICC Type C-MFF2       ','GenX Mobile - GNX-5P-C          ','Geotab - GO7 CDMA_Verizon       ','GizmoGadget by LG Navy          ','GizmoPal 2 by LG Blue           ','Home Phone Connect F256         ','Honeywell - CD6000H             ','Honeywell - CDMA-X              ','Hum by Verizon                  ','Hunt Group                      ','IDEMIA M2M Non-Industrial       ','IpDatatel - IPD BAT CU          ','Itron - 1210-AMP                ','Itron - OpenWay 3.1             ','LG Revere 3                     ','Laird - Orion                   ','Montage - MGCDMAV1              ','Networkfleet 5000CDMA-PCS3      ','PHILIPS HEALTHCR 100605C 1.AA   ','Passtime - PTE-3                ','Passtime - TRAX-4               ','Philips - 100204C               ','Philips - 100204C 2.xx          ','Philips - 100605C               ','Positioning Univ - ES710        ','Prepaid Samsung Gusto II        ','Queclink - GV55VC               ','SIM SKU 4G 5G                   ','ST 4G 5G Interim SIM            ','ST 4G M2M RUG MTC CLOUD SIM     ','ST Multi-Form-Factor SIM        ','STM 3FF SIM Retail Stores       ','STM 4FF NFC SIM Retail Stores   ','STM 4FF SIM Retail Stores       ','STM 4G M2M NONRUG CLOUD SIM     ','STM 4G MFF2 Cloud SIM           ','STM 4G MFF2 Cloud SIM-MTC       ','STM 4G NONRUG CLOUD SIM-MTC     ','STM BULKSIM-CMR-MP-S            ','STM Soft SIM                    ','Samsung Convoy 3                ','Samsung Convoy 4                ','Samsung Gusto 3 Prepay          ','Simple Voice Mobile Client      ','SimpliSafe - SSCDMA5            ','SmartSynch Inc SSI kV2c 1X      ','Test Device                     ','Thales 5G SIM multiple profiles ','UNI PREPAID TRI 4G SIM KIT      ','USA Tech - ePort Telemeter      ','USB760                          ','Vivint - CP01 Novatel           ','Vivint - CP01 Telit             ','Wireless Home Phone             ','Xirgo - XT-2150CV               ','Xirgo - XT-3250CV               ','Xirgo - XT-3450CV               '),
      DEVICE_PROD_NM VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('10.2 IPAD 8 GEN 32GB SG','Alarm.com - ADC-450L-A-V','ALARM.COM - ADC-470L-LTE1','ALCATEL GO FLIP V','APPLE WATCH S3 42 SG AL BLK SP','APPLE WATCH S4 40 G AL PS SP','APPLE WATCH S4 44 SG AL BLK SP','APPLE WATCH S5 44 SG AL BLK SP','ASIATELCO TEC - WCM-002','ASIATELCO TECH USA - WCM-001','ASUS ZenPad Z8s','AW S6 44 SG AL B S','AW7 45 MD AL MD SP','AXON BODY 3 - AX1023','CalAmp Corp - LMU2630LV','CONNECTED HOLD-ARROWMV001','Continental Automotive T-DCM','Cradlepoint - AER1650LP4','CRANE PAYMENT - ADVANCE 5000','Cymbal ZTE','DURA XV EXTREME CAMERA','Dura XV LTE with camera','Ellipsis Jetpack MHS800L','Ellipsis Jetpack MHS815L','ELLIPSIS JETPACK MHS900LS','ePort Telemeter - LTE','ETALK PREPAY','ETALK','FREEUS - BELLE LTE VOI','FREEUS - BELLE X','GALAXY A42 5G BLACK','Galaxy Note9 Ocean Blue 128GB','GALAXY S21 5G 128 GB GRAY','GALAXY S21 PLUS 5G 128 GB BLACK','GALAXY S21 U 5G 128 GB BLACK','GALAXY S22 128 BLK','GALAXY S22 ULTRA 128 BLK','Galaxy S9 Plus Midnight Black','GizmoWatch 2 Blue','GO9 LTE','GSM LLC - STEALTH CAM VERIZON','Harman - HERMES MB HI US LTE','HARMAN INTERN - CONBOX-HIGH','Honeywell - ADTLTE-V','Honeywell - LTEL3V-ADT','Honeywell - LTEXV-ADT','Honeywell International LTE-XV','HUM PLUS VT410','Hunt Group','HYUNDAI MOBIS - AVN GEN 5 WID','HYUNDAI MOBIS-AVN GEN 5 WID 2','IPAD 7TH GEN 32GB GRAY VZ','IPAD 9.7 32GB SPACE GRAY VZ','IPAD 9GEN 64 GRAY','IPAD AIR 16GB SPACE GRAY','IPAD AIR 2 16GB S GRAY','IPAD AIR 2 64GB S GRAY','IPAD MINI RETINA 16GB SILVER','IPAD MINI RETINA 16GB SPC GRAY','IPAD WIFI 32GB SPACE GRAY','IPHONE 11 128GB BLACK','IPHONE 11 64GB BLACK','IPHONE 11 BLACK 128GB VZ','IPHONE 11 BLACK 64GB VZ','IPHONE 11 GREEN 64GB VZ','IPHONE 11 PRO GRAY 256GB VZ','IPHONE 11 PRO MAX GOLD 256GB VZ','IPHONE 11 PRO MAX GOLD 64GB VZ','IPHONE 11 PRO MAX GRAY 256GB VZ','IPHONE 11 PRO MAX GRAY 64GB VZ','IPHONE 11 PRO MAX GREEN 256G VZ','IPHONE 11 PRO MAX GREEN 64GB VZ','IPHONE 11 PRO SPACE GRAY 64G VZ','IPHONE 11 PURPLE 128GB VZ','IPHONE 11 PURPLE 64GB VZ','IPHONE 11 RED 128GB VZ','IPHONE 11 RED 64GB VZ','IPHONE 11 WHITE 128GB VZ','IPHONE 11 WHITE 64GB VZ','IPHONE 12 128 BLACK','IPHONE 12 128 BLUE','IPHONE 12 128 WHITE','IPHONE 12 64 BLACK','IPHONE 12 64 BLUE','IPHONE 12 64 GREEN','IPHONE 12 64 RED','IPHONE 12 64 WHITE','IPHONE 12 64GB PURPLE','IPHONE 12 PRO 128 BLUE','IPHONE 12 PRO 128 GRAPH','IPHONE 12 PRO 256 BLUE','IPHONE 12 PRO 256 GRAPH','IPHONE 12 PRO MAX 128 BLUE','IPHONE 12 PRO MAX 128 GOLD','IPHONE 12 PRO MAX 128 GRAPH','IPHONE 12 PRO MAX 128 SILVER','IPHONE 12 PRO MAX 256 BLUE','IPHONE 12 PRO MAX 256 GOLD','IPHONE 12 PRO MAX 256 GRAPH','IPHONE 13 128 BLUE','IPHONE 13 128 MIDNIGHT','IPHONE 13 128 PINK','IPHONE 13 128 RED','IPHONE 13 128 STARLIGHT','IPHONE 13 256 MIDNIGHT','IPHONE 13 PRO 128 GRAPHITE','IPHONE 13 PRO 128 SIERRA BLUE','IPHONE 13 PRO 256 GRAPHITE','IPHONE 13 PRO 256 SIERRA BLUE','IPHONE 13 PRO MAX 128 ALPINE GR','IPHONE 13 PRO MAX 128 GOLD','IPHONE 13 PRO MAX 128 GRAPHITE','IPHONE 13 PRO MAX 128 SR BLU','IPHONE 13 PRO MAX 256 GOLD','IPHONE 13 PRO MAX 256 GRAPHITE','IPHONE 13 PRO MAX 256 SR BLU','iPhone 5S Space Gray 16GB','iPhone 6 16GB Silver','iPhone 6 16GB Space Gray','iPhone 6 64GB Space Gray','iPhone 6S 16GB Space Gray','iPhone 6S 32GB Space Gray','iPhone 6S 64GB Rose Gold','iPhone 6S 64GB Space Gray','iPhone 7 Black 128GB','iPhone 7 Black 32GB','iPhone 7 Plus Black 128GB','iPhone 7 Plus Black 32GB','iPhone 7 Plus Rose Gold 128GB','iPhone 7 Plus Rose Gold 32GB','iPhone 7 Rose Gold 128GB','iPhone 7 Rose Gold 32GB','iPhone 7 Silver 32GB','IPHONE 8 GOLD 64GB VZ','IPHONE 8 PLUS GOLD 64GB VZ','IPHONE 8 PLUS SILVER 64GB VZ','IPHONE 8 PLUS SP GRAY 64GB VZ','IPHONE 8 PLUS SP GRY 256GB VZ','IPHONE 8 SILVER 64GB VZ','IPHONE 8 SPACE GRAY 64GB VZ','IPHONE SE 20 64GB BLACK','IPHONE SE 20 64GB RED','IPHONE SE 20 64GB WHITE','IPHONE SE 22 64 MIDNIGHT SO','IPHONE SE 64GB BLACK','IPHONE SE 64GB RED','IPHONE SE 64GB WHITE','IPHONE X SILVER 256GB VZ','IPHONE X SILVER 64GB VZ','IPHONE X SPACE GRAY 256GB VZ','IPHONE X SPACE GRAY 64GB VZ','IPHONE XR 64GB BLACK','IPHONE XR BLACK 128GB','IPHONE XR BLACK 64GB','IPHONE XR BLUE 64GB','IPHONE XR RED 64GB','IPHONE XR WHITE 64GB','IPHONE XS MAX GOLD 256GB VZ','IPHONE XS MAX GOLD 64GB VZ','IPHONE XS MAX SPACE GRAY 64GB VZ','IPHONE XS MAX SPACE GRY 256GB VZ','IPHONE XS SPACE GRAY 64GB VZ','Itron - OpenWay 3.5 S','ITRON OW CAT-M1','Jetpack 4G LTE MHS MiFi 7730L','Kyocera Cadence LTE','Kyocera Dura Force Pro 2','LG ELECTRONI - OCU3 HIGH','LG ELECTRONI - OCU3 LOW - HI','LG G Pad X8.3','LG K20 V','LG Optimus Zone 3 Subsidy Lock','MG1-5-US','Mobilogix - BrainV2','MOBIS - D-Audio LTE','MOBIS D-AUDIO VOLTE','MOTO E4','MOTO E5 GO','Moto E5 Play','MOTO ONE 5G UW','MOTO Z3','MOTO Z4','MOTOROLA EDGE 5G UW 256GB','NAPCO SECURITY- ISECURE','NAYAX - AMIT LTE','NORTEK 2GIG-LTEV1-A-GC2','NOTE20 ULTRA 5G BLACK 128GB','PASSTIME - TRAX-6','PHILIPS - 1141624-R410','PHILIPS - 200604C-R410 DFX','PHILIPS - 200604C-R410','PHILLIPS CONN - ARROW-QA','QolSys - IQPanel 2','QOLSYS INC - IQ PANEL 4','RELIANCE ORBIC SPEED 4G MHS RT','RESIDEO - LTEM-XV','SAM GALAXY J7 V 2ND GENERATION','SAM GALAXY S10 PLUS BLACK 128GB','SAMSUNG A50','SAMSUNG GALAXY A02','SAMSUNG GALAXY A10E','SAMSUNG GALAXY A51','SAMSUNG GALAXY J3 ECLIPSE','SAMSUNG GALAXY J3 V 3RD GEN','Samsung Galaxy J3 V','Samsung Galaxy J7 V','Samsung Galaxy S 5 Black','SAMSUNG GALAXY S10 BLACK 128GB','SAMSUNG GALAXY S10e BLACK 128GB','SAMSUNG GALAXY S20 FE 5G NAVY','Samsung Galaxy S6 Black 32GB','Samsung Galaxy S7 Black 32GB','Samsung Galaxy S7 Gold 32GB','Samsung Galaxy S8 Black','Samsung Galaxy S8 Orchid Gray','Samsung Galaxy S8 Plus Black','Samsung Galaxy S9 Coral Blue','Samsung Galaxy S9 Lilac Purple','Samsung Galaxy S9 Midnight Black','SAMSUNG GALAXY TAB A BROWN','SAMSUNG GALAXY TAB A7 LITE','Samsung Galaxy Tab E 32GB','Samsung Galaxy Tab E 8','SAMSUNG GALAXY TAB S5E','SAMSUNG NOTE 8 MIDNIGHT BLACK','Samsung Tab A 8','Simple Voice Mobile Client','SIMPLISAFE - SS-CAT-M1','SIMPLISAFE - SS3CAT-M1-BG9','SPIREON INC - ATS100M-V','SPYPOINT LINK-MICRO-V','TACTACAM LLC - REVEAL X','TACTACAM LLC - REVEAL','TG1-US','UNKNOWN 4G DEVICE','Vehicle Monitoring','Verizon Ellipsis 10','Verizon Ellipsis 7','Verizon Ellipsis 8','Verizon Ellipsis Jetpack MHS900L','VERIZON JETPACK MIFI 8800L','VIVINT - CC03','VZ INTERNET GATEWAY ARC-XCI55AX','VZ INTERNET GATEWAY ASK-NCQ1338','VZ JETPACK 4G LTE MHS AC791L','VZ Jetpack 4G MHS MIFI 6620L','VZ Jetpack 4G MHS MIFI5510L','WIRELESS HOME PHONE LVP2','Wireless Home Phone T2000','Xirgo - XT6372R','ZTE Blade Vantage 2','ZTE Blade Vantage'),
      EQP_DEVICE_ID VARCHAR(256) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('STKAA','STKHG','STKMA'),
      STATIC_IPV6_ADDR VARCHAR(39) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      STATIC_IP_VER_NUM CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      LN_CREDIT_CLASS_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1D','2M'),
      GEO_OVRIDE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LINE_BASE_IND VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ACSS_CALL_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LN_ID VARCHAR(60) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LN_ID_TYPE VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LN_OF_SVC_ID_NO_P1 VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS '1000300',
      LN_OF_SVC_ID_NO_P2 VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      BRAND_TYPE_CD VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS )
PRIMARY INDEX ( CUST_ID ,CUST_LINE_SEQ_ID )
INDEX ( CUST_ID )
INDEX ( MTN )
INDEX ( CUST_ID ,ACCT_NUM )
INDEX ( LINE_ACT_DT ) ORDER BY VALUES ( LINE_ACT_DT )
INDEX ( PPLAN_CD )
INDEX ( LAST_UPD_DT ) ORDER BY VALUES ( LAST_UPD_DT )
INDEX ( SLS_OUTLET_ID )
INDEX ( ORIG_CUST_ID )
INDEX ( CREDIT_APP_NUM )
INDEX ( EMIN )
INDEX CAL_ESN ( ESN_NUM );

show view ntl_prd_allvm.cust_acct_line_dly_hist_v;

REPLACE VIEW NTL_PRD_ALLVM.CUST_ACCT_LINE_DLY_HIST_V
(
SOR_ID
,CUST_ID
,CUST_LINE_SEQ_ID
,EFF_DT
,EXP_DT
,CURR_PREV_IND
,ACCT_NUM
,MTN
,LN_ID
,LN_ID_TYPE
,LN_OF_SVC_ID_NO_P1
,LN_OF_SVC_ID_NO_P2
,SLS_OUTLET_ID
,MKT_CD
,BUS_NM
,NM_PRFX
,NM_FIRST
,NM_MDLIN
,NM_LAST
,HOME_TEL_NUM
,BUS_TEL_NUM
,COMPTR_CD
,IEC_CD
,SLS_PRSN_ID
,PPLAN_EFF_DT
,ESN_NUM
,LINE_ACT_DT
,MTN_ACT_DT
,LINE_TERM_DT
,MTN_STATUS_IND
,ESN_CHANGE_DT
,ESN_CHANGE_REAS_CD
,DSCNT_PLAN_CD
,DEACT_CHANGE_REAS_CD
,WARR_LGTH
,WARR_EFF_DT
,EQP_STATUS_CD
,EQP_PROD_ID
,EQP_TYPE_CD
,CNTRCT_NUM
,CNTRCT_TERM_DT
,CNTRCT_TERM_FEE
,CNTRCT_PRD_MTH
,CNTRCT_EFF_DT
,CNTRCT_SLS_PRSN_ID
,MTN_ZONE_ACT_DT
,CREDIT_APP_NUM
,MTN_ZONE_ID
,MTN_ZONE_DEACT_DT
,BILL_ACCT_CD
,HANDICAP_IND
,CONV_MTN_STATUS_IND
,CONV_DEACT_CHANGE_REAS_CD
,CONV_LINE_TERM_DT
,PREPAID_IND
,EMIN
,NE2_REDEMPT_DT
,GEO_CD
,GEO_IND
,ORIG_CUST_ID
,ORIG_CUST_LINE_SEQ_ID
,PROD_NM
,ORIG_SOR_ID
,REV_GEN_IND
,BUDGET_CTR_CD
,SLS_DIST_CHNL_TYPE_CD
,CORP_REPORTING_CD
,ESN_REDEMPT_DT
,CNTRCT_SLS_OUTLET_ID
,CNTRCT_SLS_DIST_CHNL_TYPE_CD
,CNTRCT_USER_ID
,STATIC_IP_ADDR
,STATIC_IP_ADDR_EFF_DT
,STATIC_IP_ADDR_TERM_DT
,PORT_STATUS_CD
,PORT_EFF_DT
,PORT_CONFIRM_IND
,CNTRCT_END_DT
,BUS_ID
,AUTO_PORT_CD
,XMKT_ACCT_NUM
,XMKT_ACCT_IND
,SIM_NUM
,CREDIT_CLASS_IND
,SCRTY_DEP_IND
,SCRTY_DEP_AMT
,SCRTY_DEP_STATUS_CD
,SCRTY_DEP_PAY_AMT
,ROLLUP_CD
,AGE_INPUT_PREMIER
,HISP_IND
,HISP_CONF_IND
,INSERT_DT
,ELEC_SIGN_CAPT_IND
,MERIT_EXP_DT
,SCRTY_DEP_INT_AMT
,ACT_CHANGE_REAS_CD
,BIRTH_YEAR
,INSTANCE_IND
,AREA_CD
,CPNI_IND
,STATIC_IP_ADDR_TYPE
,FIN_MKT_CD
,LINE_TYPE_CD
,CNTRCT_TERM_ID
,CUST_ASSOC_ID
,ALLTEL_SRC_BILL_ACCT_ID
,ALLTEL_SRC_SUB_UNIQUE_ID
,CUST_TYPE_CD
,VSN_CUST_TYPE_CD
,MOB_CBR_NUM
,DEVICE_TYPE_CD
,VZW_IMSI
,VF_IMSI
,NE2_DSCNT_AMT
,AUP_IND
,DEVICE_PROD_NM
,EQP_DEVICE_ID
,STATIC_IPV6_ADDR
,STATIC_IP_VER_NUM
,LAST_UPD_DT
,LN_CREDIT_CLASS_IND
,GEO_OVRIDE_CD
,ACSS_CALL_ID
,BRAND_TYPE_CD
)
AS LOCKING TABLE UDM_PRD_TBLS.CUST_ACCT_LINE_DLY_HIST FOR ACCESS
LOCKING TABLE UDM_PRDSTG_SECTBLS.MASKING_PROD_NM_XREF FOR ACCESS
SELECT SOR_ID
, CUST_ID
, CUST_LINE_SEQ_ID
, EFF_DT
, EXP_DT
, CURR_PREV_IND
, ACCT_NUM
, MTN
, LN_ID
, LN_ID_TYPE
, LN_OF_SVC_ID_NO_P1
, LN_OF_SVC_ID_NO_P2
, SLS_OUTLET_ID
, MKT_CD
, BUS_NM
, NM_PRFX
, NM_FIRST
, NM_MDLIN
, NM_LAST
, HOME_TEL_NUM
, BUS_TEL_NUM
, COMPTR_CD
, IEC_CD
, SLS_PRSN_ID
, PPLAN_EFF_DT
, ESN_NUM
, LINE_ACT_DT
, MTN_ACT_DT
, LINE_TERM_DT
, MTN_STATUS_IND
, ESN_CHANGE_DT
, ESN_CHANGE_REAS_CD
, DSCNT_PLAN_CD
, DEACT_CHANGE_REAS_CD
, WARR_LGTH
, WARR_EFF_DT
, EQP_STATUS_CD
, CASE
WHEN COALESCE ( X.MASK_VAL,Applib.Prod_Nm_Mask_F ( A.PROD_NM ) )='3GSmartPhone'
THEN NULL
WHEN COALESCE ( XX.MASK_VAL,Applib.Prod_Nm_Mask_F ( A.DEVICE_PROD_NM ) )='4GSmartPhone'
THEN NULL
ELSE EQP_PROD_ID
END  
, EQP_TYPE_CD
, CNTRCT_NUM
, CNTRCT_TERM_DT
, CNTRCT_TERM_FEE
, CNTRCT_PRD_MTH
, CNTRCT_EFF_DT
, CNTRCT_SLS_PRSN_ID
, MTN_ZONE_ACT_DT
, CREDIT_APP_NUM
, MTN_ZONE_ID
, MTN_ZONE_DEACT_DT
, BILL_ACCT_CD -- ,EMAIL_ADDR -- commented out per Mar 1, 2015 ER
, HANDICAP_IND
, CONV_MTN_STATUS_IND
, CONV_DEACT_CHANGE_REAS_CD
, CONV_LINE_TERM_DT
, PREPAID_IND
, EMIN
, NE2_REDEMPT_DT
, GEO_CD
, GEO_IND
, ORIG_CUST_ID
, ORIG_CUST_LINE_SEQ_ID
, COALESCE ( X.MASK_VAL,Applib.Prod_Nm_Mask_F ( A.PROD_NM ) ) ( Char ( 32 ) )
, ORIG_SOR_ID
, REV_GEN_IND
, BUDGET_CTR_CD
, SLS_DIST_CHNL_TYPE_CD
, CORP_REPORTING_CD
, ESN_REDEMPT_DT
, CNTRCT_SLS_OUTLET_ID
, CNTRCT_SLS_DIST_CHNL_TYPE_CD
, CNTRCT_USER_ID
, STATIC_IP_ADDR
, STATIC_IP_ADDR_EFF_DT
, STATIC_IP_ADDR_TERM_DT
, PORT_STATUS_CD
, PORT_EFF_DT
, PORT_CONFIRM_IND
, CNTRCT_END_DT
, BUS_ID
, AUTO_PORT_CD
, XMKT_ACCT_NUM
, XMKT_ACCT_IND
, SIM_NUM
, CREDIT_CLASS_IND
, SCRTY_DEP_IND
, SCRTY_DEP_AMT
, SCRTY_DEP_STATUS_CD
, SCRTY_DEP_PAY_AMT
, NULL AS ROLLUP_CD
, AGE_INPUT_PREMIER
, HISP_IND
, HISP_CONF_IND
, INSERT_DT
, ELEC_SIGN_CAPT_IND
, MERIT_EXP_DT
, SCRTY_DEP_INT_AMT
, ACT_CHANGE_REAS_CD
, BIRTH_YEAR
, INSTANCE_IND
, AREA_CD
, CPNI_IND
, STATIC_IP_ADDR_TYPE
, FIN_MKT_CD
, LINE_TYPE_CD
, CNTRCT_TERM_ID
, CUST_ASSOC_ID
, ALLTEL_SRC_BILL_ACCT_ID
, ALLTEL_SRC_SUB_UNIQUE_ID
, CUST_TYPE_CD
, VSN_CUST_TYPE_CD
, MOB_CBR_NUM
, DEVICE_TYPE_CD
, VZW_IMSI
, VF_IMSI
, NE2_DSCNT_AMT
, AUP_IND
, COALESCE ( XX.MASK_VAL,Applib.Prod_Nm_Mask_F ( A.DEVICE_PROD_NM ) ) ( Char ( 32 ) )
, EQP_DEVICE_ID
, STATIC_IPV6_ADDR
, STATIC_IP_VER_NUM
, LAST_UPD_DT
, LN_CREDIT_CLASS_IND
, GEO_OVRIDE_CD
, ACSS_CALL_ID
, BRAND_TYPE_CD
FROM UDM_PRD_TBLS.CUST_ACCT_LINE_DLY_HIST A

LEFT JOIN UDM_PRDSTG_SECTBLS.MASKING_PROD_NM_XREF X
ON A.PROD_NM=X.MASK_PROD_NM

LEFT JOIN UDM_PRDSTG_SECTBLS.MASKING_PROD_NM_XREF XX
ON A.DEVICE_PROD_NM=XX.MASK_PROD_NM

WHERE COALESCE ( CUST_ASSOC_ID,' ' )<>'12';


show table UDM_PRD_TBLS.CUST_ACCT_LINE_DLY_HIST;

CREATE SET TABLE UDM_PRD_TBLS.CUST_ACCT_LINE_DLY_HIST ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL COMPRESS ('E','V'),
      CUST_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      CUST_LINE_SEQ_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      EFF_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS (DATE '2018-04-16',DATE '2018-04-17',DATE '2010-08-01',DATE '2018-04-18',DATE '2018-04-19',DATE '2013-10-11',DATE '2018-04-20',DATE '2017-12-04',DATE '2018-04-21',DATE '2018-04-22',DATE '2018-04-23',DATE '2018-04-24',DATE '2018-04-25',DATE '2018-04-26',DATE '2017-12-10',DATE '2018-04-27',DATE '2018-04-28',DATE '2014-10-04',DATE '2018-04-29',DATE '2007-11-17',DATE '2014-10-05',DATE '2018-04-30',DATE '2010-03-06',DATE '2017-12-21',DATE '2014-10-15',DATE '2017-12-27',DATE '2018-07-01',DATE '2017-12-29',DATE '2018-07-02',DATE '2018-07-03',DATE '2018-07-04',DATE '2018-07-05',DATE '2018-07-06',DATE '2018-07-07',DATE '2018-07-08',DATE '2018-07-09',DATE '2018-07-10',DATE '2014-10-30',DATE '2018-07-11',DATE '2018-07-12',DATE '2011-03-12',DATE '2018-02-01',DATE '2018-07-13',DATE '2018-02-02',DATE '2018-07-14',DATE '2018-02-03',DATE '2018-07-15',DATE '2018-07-16',DATE '2018-07-17',DATE '2018-07-18',DATE '2018-02-07',DATE '2018-07-19',DATE '2015-10-23',DATE '2018-02-08',DATE '2018-07-20',DATE '2018-02-09',DATE '2018-07-21',DATE '2018-07-22',DATE '2018-02-11',DATE '2018-07-23',DATE '2018-07-24',DATE '2018-07-25',DATE '2018-07-26',DATE '2015-10-30',DATE '2018-07-27',DATE '2017-10-02',DATE '2017-10-03',DATE '2017-10-05',DATE '2009-01-10',DATE '2017-10-06',DATE '2018-02-23',DATE '2017-10-07',DATE '2017-10-09',DATE '2017-10-10',DATE '2006-04-20',DATE '2007-09-16',DATE '2017-10-12',DATE '2017-10-13',DATE '2017-10-14',DATE '2017-10-15',DATE '2017-10-18',DATE '2017-10-20',DATE '2017-10-23',DATE '2017-10-24',DATE '2017-10-25',DATE '2017-10-27',DATE '2018-05-01',DATE '2018-05-02',DATE '2018-05-03',DATE '2017-10-31',DATE '2018-05-04',DATE '2006-12-08',DATE '2018-05-05',DATE '2008-09-21',DATE '2018-05-06',DATE '2018-05-07',DATE '2018-05-08',DATE '2018-05-09',DATE '2018-05-10',DATE '2018-05-11',DATE '2018-05-12',DATE '2018-05-13',DATE '2018-05-14',DATE '2018-05-15',DATE '2018-05-16',DATE '1900-01-01',DATE '2018-05-17',DATE '2018-05-18',DATE '2018-05-19',DATE '2018-05-20',DATE '2018-05-21',DATE '2018-05-22',DATE '2018-05-23',DATE '2018-05-24',DATE '2018-05-25',DATE '2018-05-26',DATE '2018-05-27',DATE '2009-04-15',DATE '2018-05-28',DATE '2018-05-29',DATE '2018-05-30',DATE '2018-05-31',DATE '2017-08-07',DATE '2017-08-11',DATE '2017-08-12',DATE '2017-08-16',DATE '2017-08-19',DATE '2017-08-22',DATE '2017-08-24',DATE '2017-08-25',DATE '2017-08-26',DATE '2017-08-27',DATE '2017-08-28',DATE '2017-08-29',DATE '2018-03-02',DATE '2017-08-31',DATE '2018-03-08',DATE '2018-03-13',DATE '2018-03-14',DATE '2018-03-16',DATE '2018-03-17',DATE '2017-11-01',DATE '2018-03-18',DATE '2018-03-19',DATE '2017-11-03',DATE '2018-03-20',DATE '2018-03-21',DATE '2018-03-22',DATE '2018-03-23',DATE '2018-03-24',DATE '2007-10-12',DATE '2018-03-25',DATE '2007-10-13',DATE '2018-03-26',DATE '2018-03-27',DATE '2018-03-28',DATE '2018-03-29',DATE '2018-03-30',DATE '2017-11-14',DATE '2018-03-31',DATE '2017-11-17',DATE '2017-11-18',DATE '2011-07-02',DATE '2017-11-20',DATE '2017-11-21',DATE '2017-11-22',DATE '2013-04-20',DATE '2017-11-24',DATE '2017-11-25',DATE '2017-11-26',DATE '2017-11-27',DATE '2017-11-28',DATE '2018-06-01',DATE '2017-11-29',DATE '2018-06-02',DATE '2018-06-03',DATE '2010-07-31',DATE '2018-06-04',DATE '2018-06-05',DATE '2018-06-06',DATE '2018-06-07',DATE '2018-06-08',DATE '2018-06-09',DATE '2018-06-10',DATE '2014-04-18',DATE '2018-06-11',DATE '2018-06-12',DATE '2018-06-13',DATE '2018-01-02',DATE '2018-06-14',DATE '2018-01-03',DATE '2018-06-15',DATE '2018-01-04',DATE '2018-06-16',DATE '2018-06-17',DATE '2018-06-18',DATE '2018-06-19',DATE '2018-01-08',DATE '2018-06-20',DATE '2018-06-21',DATE '2018-06-22',DATE '2018-06-23',DATE '2018-06-24',DATE '2018-06-25',DATE '2018-06-26',DATE '2018-01-15',DATE '2018-06-27',DATE '2018-06-28',DATE '2018-06-29',DATE '2017-09-01',DATE '2018-06-30',DATE '2017-09-02',DATE '2017-09-04',DATE '2018-01-21',DATE '2018-01-22',DATE '2017-09-06',DATE '2018-01-23',DATE '2017-09-07',DATE '2018-01-24',DATE '2017-09-08',DATE '2018-01-25',DATE '2017-09-09',DATE '2018-01-26',DATE '2017-09-12',DATE '2018-01-29',DATE '2018-01-30',DATE '2017-09-15',DATE '2017-09-17',DATE '2017-09-18',DATE '2017-09-20',DATE '2013-02-17',DATE '2017-09-21',DATE '2017-09-23',DATE '2017-09-26',DATE '2017-09-27',DATE '2013-02-24',DATE '2018-04-01',DATE '2017-09-29',DATE '2018-04-02',DATE '2018-04-03',DATE '2018-04-04',DATE '2018-04-05',DATE '2018-04-06',DATE '2018-04-07',DATE '2018-04-08',DATE '2018-04-09',DATE '2018-04-10',DATE '2018-04-11',DATE '2018-04-12',DATE '2018-04-13',DATE '2018-09-25',DATE '2013-10-05',DATE '2018-04-14',DATE '2018-09-26',DATE '2018-04-15'),
      EXP_DT DATE FORMAT 'YYYY-MM-DD',
      CURR_PREV_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('C','P'),
      PPLAN_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('10803','15067','16268','17181','17991','63033','63453','64334','65502','65520','65523','65527','65530','65936','65961','65996','65999','66002','66004','66307','72841','72864','72865','72866','72867','72886','72888','73395','73412','73413','73414','73415','73416','73417','73424','73425','73426','73427','73430','73431','73432','73436','73437','73442','73443','73454','73569','73570','73575','73576','73618','73678','73736','73737','73766','73807','74051','74413','74511','76181','77558','77773','83155','83233','83234','83241','83242','84114','84296','84298','84356','84357','84609','84734','85139','85168','85500','85825','86091','86156','86244','86994','86996','87170','87214','87466','87561','87603','87695','88005','88967','89067','89346','89424','89642','89674','89682','89787','90532','91337','91382','91758','91768','91795','91953','91982','92202','92609','92731','92732','92736','92741','92742','93527','94724','94953','95026','95390','95434','96042','96430','96477','96523','97055','97091','97299','97312','97729','97783','97801','98108','98126','98175','98402','98884','99068','99178','99565','99589','99619','99859','99999'),
      PPLAN_MKT_CD VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1010','452','502','504','505','616','663','664','665','666','667','668','669','978'),
      ACCT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1','10','2','3','4','5','7'),
      MTN CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2152086632','2152195018','2156308824','2157565286','2157784778','2159622348','2159623432','2258924354','2403053980','2404343241','2485638801','2485638825','2487637302','2487637637','2623895075','2672412960','2673076681','2673575449','3022587028','3023810798','3033584112','3035486084','3038597438','3072587884','3103673623','3104291925','3105089427','3107016218','3107958346','3108639440','3109220222','3127711340','3133789100','3135492511','3135492516','3135492517','3135499822','3135499830','3135499843','3135499882','3135499886','3135502311','3135502313','3136001823','3139109291','3139690241','3139690576','3139690590','3149100899','3152632596','3166177485','3166507796','3174089670','3174390671','3174982411','3175174288','3176905841','3176940557','3238103219','3238212210','3306041055','3306041160','3306081081','3606214638','3615631180','4024405383','4026307242','4062495757','4076941176','4082040316','4082041877','4083136646','4083139563','4083142161','4084822230','4084822348','4084823760','4086126454','4086947423','4088913258','4088915124','4088916230','4097828359','4104563580','4104906225','4124807272','4144069118','4158477196','4254571256','4358517468','4432230015','4805107100','5039309205','5043307338','5052355633','5052649706','5057707747','5134901817','5178960851','5187915141','5204057777','5205919159','5407976173','5622542560','5624773989','5628226057','5632101289','5703371675','5742420818','5867198417','6022977936','6026178489','6027144056','6027258470','6096613856','6103682856','6106335377','6107311046','6125992849','6142027880','6142028406','6164465327','6168220924','6198382376','6199228764','6199337783','6262010448','6264226159','6307237265','6463413259','6464382279','6469424611','6613452500','7012690362','7049684722','7065669868','7132019606','7138599245','7174338416','7178701186','7194826552','7194947721','7246990762','7323006993','7324395653','7602710421','7602715768','7602718578','7602718594','7603100124','7603108743','7604730420','7604736813','7605792386','7606852439','7609859928','7654388990','8013670610','8013801577','8042834498','8043476854','8043637531','8043665961','8043876612','8044008467','8049214512','8053909052','8054335384','8058890903','8102875349','8106250889','8108775487','8122199309','8144406083','8183999000','8184295694','8185903328','8186061789','8189703328','8189747059','8436938953','8563716118','8582458823','8584497365','8587408796','8587752050','8642708296','8643162421','8654145590','8658504654','9098165775','9122234335','9132052634','9135301568','9143640487','9144009105','9167472895','9193453565','9194346505','9196190836','9253249481','9253249986','9492302433','9492411455','9492464368','9492829832','9493226268','9494688955','9496162775','9496973279','9497519277','9497519657','9497519747','9498128360','9498363585','9498386338','9499103301','9499103304','9499103616','9499103778','9499103781','9499103791','9499103793','9499103798','9499103802','9499237495','9499237497','9499237498','9499237503','9499237552','9499237562','9499237619','9499237641','9499237643','9499237648','9499237656','9499237672','9499237678','9499237690','9499237740','9499237748','9499237754','9499237785','9499237909','9499237916','9499237919','9512055073','9518367870','9702223815','9702503547','9705564365','9705932376','9706400077','9708462140','9708462143'),
      SLS_OUTLET_ID VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('100027','101068','107296','118618','119264','119265','119266','119481','120342','120343','120344','123869','123871','123977','124484','124485','13425','13922','14569','15307','1612','1744','18035','18063','18358','18380','18688','19070','22466','22755','22849','24455','25655','25678','28966','3008','3341','3812','4231','6071','71734','71967','72133','7277','74663','74667','74816','75060','75063','75064','75207','75884','75922','75923','75950','76077','76078','76587','7737','80643','80644','82491','8253','84136','84904','84906','84990','85016','85031','85067','85673','86121','8620','86439','86742','88166','8865','88707','88708','88710','88711','9196','96532','96609','96610','96611','99602'),
      MKT_CD CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('00H ','00I ','018 ','021 ','023 ','026 ','027 ','029 ','02A ','02F ','02G ','031 ','037 ','039 ','03Z ','040 ','044 ','046 ','048 ','04A ','04B ','04C ','04E ','04F ','04G ','04I ','04J ','04M ','04O ','04P ','04Q ','04T ','04U ','053 ','055 ','057 ','059 ','05A ','05J ','05K ','05L ','05M ','060 ','063 ','065 ','066 ','06D ','06E ','06F ','06I ','06R ','074 ','075 ','076 ','083 ','084 ','086 ','089 ','159 ','209 ','255 ','274 ','298 ','328 ','329 ','337 ','340 ','341 ','343 ','345 ','347 ','348 ','349 ','351 ','356 ','358 ','362 ','363 ','364 ','365 ','366 ','368 ','369 ','372 ','373 ','374 ','377 ','378 ','379 ','381 ','382 ','383 ','385 ','390 ','391 ','398 ','402 ','405 ','408 ','415 ','418 ','421 ','422 ','428 ','430 ','431 ','435 ','439 ','443 ','455 ','456 ','457 ','459 ','462 ','464 ','468 ','473 ','500 ','506 ','509 ','511 ','515 ','516 ','530 ','534 ','536 ','538 ','542 ','546 ','547 ','549 ','589 ','601 ','604 ','613 ','618 ','619 ','621 ','624 ','625 ','626 ','627 ','628 ','630 ','642 ','645 ','646 ','647 ','648 ','651 ','655 ','664 ','666 ','667 ','668 ','669 ','670 ','671 ','672 ','692 ','693 ','694 ','699 ','701 ','726 ','730 ','732 ','733 ','734 ','735 ','748 ','749 ','750 ','751 ','753 ','761 ','762 ','764 ','766 ','771 ','772 ','773 ','775 ','789 ','790 ','796 ','797 ','803 ','808 ','809 ','823 ','896 ','939 ','942 ','943 ','944 ','945 ','959 ','960 ','961 ','968 ','969 ','973 ','976 ','977 ','981 ','982 ','984 ','986 ','987 ','989 ','AIF ','AIY ','AJK ','CTT ','CUP ','EFY ','EHT '),
      PPLAN_MKT_CD_PREV VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1010','308','452','502','504','505','517','663','664','665','666','667','668','978'),
      PPLAN_CD_PREV VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('63016','63033','63110','63112','63435','63453','63465','63862','64334','65502','65520','65523','65527','65530','65537','65936','65938','65960','65961','65962','65963','65996','65999','66002','66004','66039','72841','72864','72865','72866','72867','72869','72883','72884','72885','72886','72887','72888','73412','73413','73414','73415','73416','73417','73419','73424','73425','73426','73427','73430','73431','73432','73433','73436','73437','73442','73443','73483','73569','73570','73618','73678','73736','73737','73945','74412','74592','74603','74609','76181','83233','83234','83241','83242'),
      BUS_NM VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      NM_PRFX VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      NM_FIRST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('.','110538 DAVID','110538/DAVID','AARON','ADAM','AL','ALAN','ALARM','ALEX','ALLEN','AMANDA','AMY','ANDREA','ANDREW','ANDY','ANGELA','ANN','ANTHONY','ASHLEY','BARBARA','BIG','BILL','BOB','BRANDON','BRENDA','BRIAN','BRUCE','BRYAN','CAMPBELL','CARL','CAROL','CAROLYN','CATERPILLAR','CATHERINE','CHAD','CHARLES','CHERYL','CHRIS','CHRISTINA','CHRISTINE','CHRISTOPHER','CINDY','CLIVE','CONNECTED','CRAIG','CYNTHIA','DAN','DANIEL','DAVE','DAVID','DAWN','DEAN','DEBORAH','DEBRA','DENISE','DENNIS','DIANA','DIANE','DON','DONALD','DONNA','DORON','DOUGLAS','EDWARD','ELIZABETH','EMILY','ERIC','FLEETMATICS','FRANK','GARY','GENERAC','GEORGE','GERALD','GORDON','GPS','GREG','GREGORY','HEATHER','HYUNDAI','IP','JACK','JAMES','JAMIE','JANET','JANICE','JASON','JEFF','JEFFREY','JENNIFER','JEREMY','JERRY','JESSE','JESSICA','JIM','JOAN','JOE','JOHN','JONATHAN','JOSE','JOSEPH','JOSHUA','JUAN','JUDITH','JUDY','JULIE','JUSTIN','KAREN','KATHLEEN','KATHY','KEITH','KELLY','KENNETH','KEVIN','KIM','KIMBERLY','KRISTEN','LARRY','LAURA','LESLIE','LINDA','LISA','LORI','LYNN','MARGARET','MARIA','MARK','MARTIN','MARY','MATT','MATTHEW','MEDTRONIC CARE','MELISSA','MICHAEL','MICHELLE','MIKE','NANCY','NETWORKFLEET','NEW','NICHOLAS','NICOLE','NPHASE','OAS','PAMELA','PATRICIA','PATRICK','PAUL','PDI','PETER','POSITION','PROGRESSIVE','RANDY','RAYMOND','REBECCA','RICHARD','RICK','ROBERT','ROBIN','ROGER','RONALD','RYAN','SAGEQUEST','SANDRA','SARAH','SCOTT','SEAN','SECURECOM','SHANNON','SHARON','SHAWN','SHERRY','SIMPLISAFE','SMARTSYNCH','SS-CE','STAR','STEPHANIE','STEPHEN','STEVE','STEVEN','SUSAN','TAMMY','TERESA','TERRY','THERESA','THOMAS','TIM','TIMOTHY','TINA','TODD','TOM','TONY','TRACY','TRAVIS','Update','USA','USER FIRST NAME','USER','VIVINT','WAYNE','WENDY','WILLIAM','WIRELESS'),
      NM_MDLIN CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      NM_LAST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('.','90','ACCT','ADAMS','ALLEN','ANDERSON','AUTOEVER','BAKER','BONEN','BROWN','BURDIEK','CAMPBELL','CARTER','CAT','CAWSE','CLARK','COM','CONSUMERS','COX','DATATEL','DAVIS','DENDIS','DEPIERRO','DIRECT','DOBBERT','DORMAN','ENGG','FIELDS','FITZSIMMONS','FLEET','GARCIA','GONZALEZ','GRAMM','GREEN','HALL','HANFT','HARRIS','HERNANDEZ','HILL','HOHM','HOLDINGS','HOWARD','INC','Info','INS','INSIGHT','IV','JACKSON','JAGET','JOHNSON','JONES','KIM','KING','LAURANS','LEE','LEWIS','LINE','LOPEZ','LUCAS','LUOMA','MANAGEMENT SERVICES','MARTIN','MARTINEZ','MASTERS','MCCOOL','MILLER','MOBILE','MOORE','MURPHY','NAME','NELSON','ORZECH','PHILLIPS','PHONE','PHONEINTHEBOX','PLUS','POWER','PRODUCTION','ROBERTS','ROBINSON','RODRIGUEZ','SCHWARZ','SCOTT','SMITH','SWEHLA','TAYLOR','TECHNOLOGIES INC','TELCARE','TELEMETRY','TEST','THOMAS','THOMPSON','USA','USER LAST NAME','USER','VER','WALKER','WHITE','WILLIAMS','WILSON','WIRELESS','WRIGHT','YOUNG','ZAPATERO'),
      HOME_TEL_NUM CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('7777777777','9999999999'),
      BUS_TEL_NUM CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('7777777777','9999999999'),
      COMPTR_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      IEC_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0000 ','5050 '),
      SLS_PRSN_ID VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('','E000E','E000G','E00N0','E048Y','E0CJB','E0HKW','E14XT','ECK39','ECW79','ECW80','ECW81','ECW82','ECW83','ED767','EDC58','EDC59','EE008','EE023','EE02M','EE09T','EE104','EE119','EE203','EE205','EE245','EE25Y','EE267','EE278','EE327','EE400','EE478','EE485','EE568','EE647','EE762','EE76R','EE774','EE795','EE79Y','EE822','EE834','EE911','EE928','EEN60','EGK55','EGU48','EHT19','EJL29','EJX46','EL822','EMF10','EMH73','ENC','EPB68','ESQ34','ESQ43','ET852','ETS09','ETS11','ETS12','ETS17','ETU90','ETX83','EVH14','EWU99','EZ009','EZ982','NPB2C','NPM2M','NPMOP','PREPI','TAF10','UDIVR','UGCIS'),
      PPLAN_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2016-12-16',DATE '2015-02-09',DATE '2015-02-10',DATE '2018-04-22',DATE '2014-10-01',DATE '2015-07-29',DATE '2015-07-30',DATE '2016-12-27',DATE '2016-07-25',DATE '2016-02-15',DATE '2017-07-11',DATE '2014-10-16',DATE '2015-10-01',DATE '2017-02-01',DATE '2017-07-13',DATE '2017-02-02',DATE '2017-02-03',DATE '2017-02-06',DATE '2014-10-23',DATE '2017-02-07',DATE '2016-02-24',DATE '2017-02-08',DATE '2015-10-09',DATE '2017-02-09',DATE '2014-05-14',DATE '2016-02-26',DATE '2017-02-10',DATE '2014-05-15',DATE '2014-05-16',DATE '2017-07-24',DATE '2015-10-13',DATE '2017-07-25',DATE '2017-02-14',DATE '2014-05-19',DATE '2014-05-21',DATE '2018-02-02',DATE '2014-05-22',DATE '2015-05-06',DATE '2015-05-08',DATE '2017-02-20',DATE '2015-10-21',DATE '2016-10-05',DATE '2017-02-21',DATE '2016-10-06',DATE '2017-02-22',DATE '2017-02-24',DATE '2015-10-27',DATE '2016-10-13',DATE '2016-05-03',DATE '2017-10-02',DATE '2015-05-24',DATE '2016-05-09',DATE '2015-05-26',DATE '2011-11-02',DATE '2016-05-11',DATE '2011-11-03',DATE '2018-02-24',DATE '2015-05-28',DATE '2011-11-04',DATE '2015-05-29',DATE '2011-11-05',DATE '2017-10-11',DATE '2011-11-07',DATE '2014-08-04',DATE '2016-05-16',DATE '2017-10-12',DATE '2011-11-08',DATE '2014-08-05',DATE '2016-05-17',DATE '2011-11-09',DATE '2016-05-18',DATE '2011-11-10',DATE '2014-08-07',DATE '2016-10-31',DATE '2011-11-11',DATE '2011-11-13',DATE '2011-11-14',DATE '2014-08-11',DATE '2014-08-12',DATE '2016-05-24',DATE '2011-11-16',DATE '2014-08-13',DATE '2011-11-17',DATE '2014-08-14',DATE '2016-05-26',DATE '2017-10-24',DATE '2014-08-18',DATE '2014-08-19',DATE '2015-08-03',DATE '2014-08-21',DATE '2018-05-03',DATE '2014-08-25',DATE '2014-08-26',DATE '2015-08-10',DATE '2014-08-28',DATE '2017-05-24',DATE '2014-08-29',DATE '2015-08-13',DATE '2016-08-02',DATE '2015-08-20',DATE '2016-08-04',DATE '2014-03-26',DATE '2015-03-20',DATE '2014-11-06',DATE '2017-08-02',DATE '2016-08-19',DATE '2015-03-24',DATE '2016-03-09',DATE '2014-11-11',DATE '2012-01-20',DATE '2016-08-24',DATE '2014-06-02',DATE '2016-03-16',DATE '2017-03-01',DATE '2015-11-04',DATE '2012-01-29',DATE '2016-03-21',DATE '2017-03-10',DATE '2011-09-19',DATE '2017-08-24',DATE '2011-09-20',DATE '2011-09-21',DATE '2011-09-22',DATE '2011-09-23',DATE '2017-03-16',DATE '2011-09-24',DATE '2015-11-18',DATE '2016-11-02',DATE '2011-09-26',DATE '2011-09-27',DATE '2018-03-05',DATE '2011-09-29',DATE '2015-11-23',DATE '2016-11-07',DATE '2017-03-26',DATE '2015-06-15',DATE '2016-06-01',DATE '2015-01-06',DATE '2015-06-18',DATE '2016-06-02',DATE '2016-11-16',DATE '2016-11-17',DATE '2016-06-06',DATE '2015-06-24',DATE '2015-06-25',DATE '2016-06-09',DATE '2018-03-24',DATE '2014-09-01',DATE '2018-03-26',DATE '2014-09-02',DATE '2017-11-10',DATE '2018-03-27',DATE '2017-11-11',DATE '2014-09-04',DATE '2016-01-05',DATE '2016-06-21',DATE '2017-06-05',DATE '2016-01-12',DATE '2016-06-24',DATE '2015-01-29',DATE '2012-12-02',DATE '2016-01-15',DATE '2016-06-27',DATE '2016-06-28',DATE '2016-06-29',DATE '2016-06-30',DATE '2017-01-02',DATE '2014-09-19',DATE '2017-06-16',DATE '2016-01-22',DATE '2015-09-09',DATE '2017-01-11',DATE '2016-01-29',DATE '2015-04-03',DATE '2017-06-30',DATE '2018-01-05',DATE '2015-04-10',DATE '2018-06-19',DATE '2015-09-24',DATE '2016-09-08',DATE '2017-01-24',DATE '2015-04-14',DATE '2017-01-31',DATE '2016-04-04',DATE '2016-04-05',DATE '2016-04-06',DATE '2017-09-02',DATE '2016-04-07',DATE '2014-12-09',DATE '2011-10-02',DATE '2014-12-11',DATE '2014-12-12',DATE '2016-04-12',DATE '2011-10-04',DATE '2016-04-13',DATE '2011-10-05',DATE '2011-10-08',DATE '2011-10-10',DATE '2014-07-07',DATE '2011-10-11',DATE '2015-12-04',DATE '2017-04-04',DATE '2016-04-21',DATE '2011-10-13',DATE '2014-12-22',DATE '2011-10-14',DATE '2014-12-23',DATE '2014-12-24',DATE '2017-09-20',DATE '2011-10-16',DATE '2017-04-09',DATE '2017-09-21',DATE '2011-10-17',DATE '2014-07-14',DATE '2014-12-26',DATE '2017-04-10',DATE '2017-09-22',DATE '2014-07-15',DATE '2014-12-27',DATE '2016-04-27',DATE '2017-04-11',DATE '2011-10-19',DATE '2017-04-12',DATE '2011-10-20',DATE '2014-07-17',DATE '2014-12-29',DATE '2015-07-01',DATE '2017-04-13',DATE '2011-10-21',DATE '2014-07-18',DATE '2011-10-22',DATE '2011-10-23',DATE '2017-04-16',DATE '2011-10-24',DATE '2017-04-17',DATE '2014-07-22',DATE '2011-10-26',DATE '2011-10-27',DATE '2014-07-24',DATE '2015-07-09',DATE '2016-12-05',DATE '2011-10-29',DATE '2015-07-10',DATE '2011-10-31',DATE '2014-07-28',DATE '2017-04-24',DATE '2014-07-29',DATE '2014-07-31',DATE '2015-07-16',DATE '2016-12-12',DATE '2017-04-28',DATE '2011-05-24',DATE '2015-07-17',DATE '2016-07-01'),
      ESN_NUM VARCHAR(256) CHARACTER SET LATIN NOT CASESPECIFIC,
      LINE_ACT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2005-06-24',DATE '2006-06-09',DATE '2006-11-22',DATE '2004-01-30',DATE '2005-06-27',DATE '2004-01-31',DATE '2005-06-28',DATE '2006-11-24',DATE '2005-06-29',DATE '2006-11-25',DATE '2005-06-30',DATE '2006-11-27',DATE '2004-09-03',DATE '2006-06-16',DATE '2004-09-04',DATE '2006-11-29',DATE '2007-06-01',DATE '2006-11-30',DATE '2004-09-10',DATE '2006-06-23',DATE '2004-09-11',DATE '2005-01-28',DATE '2005-01-29',DATE '2005-01-31',DATE '2001-12-21',DATE '2005-09-02',DATE '2006-06-30',DATE '2001-12-22',DATE '2007-06-15',DATE '2005-09-07',DATE '2007-06-22',DATE '2002-12-14',DATE '2005-09-16',DATE '2002-12-20',DATE '2006-09-01',DATE '2007-06-29',DATE '2002-12-21',DATE '2003-12-06',DATE '2002-12-23',DATE '2002-12-24',DATE '2005-09-23',DATE '2006-09-08',DATE '2003-12-12',DATE '2003-12-13',DATE '2004-04-30',DATE '2005-04-16',DATE '2003-12-16',DATE '2003-12-17',DATE '2005-09-30',DATE '2003-12-18',DATE '2003-12-19',DATE '2006-04-04',DATE '2003-12-20',DATE '2003-12-22',DATE '2006-04-07',DATE '2003-12-23',DATE '2003-12-24',DATE '2003-12-26',DATE '2004-12-10',DATE '2004-12-11',DATE '2005-04-29',DATE '2004-12-13',DATE '2005-04-30',DATE '2003-12-30',DATE '2004-07-02',DATE '2004-12-14',DATE '2004-12-15',DATE '2004-12-16',DATE '2006-09-29',DATE '2004-12-17',DATE '2004-12-18',DATE '2004-12-20',DATE '2004-07-09',DATE '2004-12-21',DATE '2004-12-22',DATE '2004-12-23',DATE '2004-12-24',DATE '2005-12-09',DATE '2005-12-10',DATE '2005-12-12',DATE '2004-07-16',DATE '2005-07-01',DATE '2005-12-14',DATE '2004-12-30',DATE '2005-12-15',DATE '2004-02-07',DATE '2005-12-16',DATE '2005-12-17',DATE '2006-12-01',DATE '2005-07-07',DATE '2005-12-19',DATE '2004-07-23',DATE '2005-07-08',DATE '2005-12-20',DATE '2005-12-21',DATE '2004-02-13',DATE '2005-12-22',DATE '2006-12-06',DATE '2004-02-14',DATE '2005-12-23',DATE '2005-12-24',DATE '2006-12-08',DATE '2004-07-30',DATE '2005-07-15',DATE '2004-07-31',DATE '2005-02-04',DATE '2006-12-12',DATE '2005-02-05',DATE '2006-12-13',DATE '2004-02-21',DATE '2005-12-30',DATE '2006-12-14',DATE '2006-07-03',DATE '2006-12-15',DATE '2006-12-16',DATE '2005-07-22',DATE '2006-12-18',DATE '2005-02-11',DATE '2006-07-07',DATE '2006-12-19',DATE '2004-02-27',DATE '2005-02-12',DATE '2006-12-20',DATE '2004-02-28',DATE '2006-12-21',DATE '2006-12-22',DATE '2006-12-23',DATE '2005-07-28',DATE '2005-07-29',DATE '2005-02-18',DATE '2006-07-14',DATE '2006-12-26',DATE '2004-10-02',DATE '2005-02-19',DATE '2005-02-21',DATE '2006-12-29',DATE '2005-02-25',DATE '2006-07-21',DATE '2004-10-09',DATE '2005-02-26',DATE '2006-07-22',DATE '2007-07-06',DATE '2005-02-28',DATE '2007-12-21',DATE '2007-12-22',DATE '2006-07-28',DATE '2007-12-24',DATE '2007-07-13',DATE '2006-07-31',DATE '2004-05-07',DATE '2004-05-08',DATE '2007-07-20',DATE '2007-07-27',DATE '2005-05-06',DATE '2005-05-07',DATE '2007-07-31',DATE '2004-05-28',DATE '2005-05-27',DATE '2003-08-15',DATE '2006-05-12',DATE '2003-08-16',DATE '2005-05-31',DATE '2006-10-27',DATE '2003-08-22',DATE '2004-08-06',DATE '2003-08-23',DATE '2004-08-07',DATE '2003-08-29',DATE '2004-08-13',DATE '2003-08-30',DATE '2004-08-14',DATE '2004-08-16',DATE '2005-08-01',DATE '2004-03-06',DATE '2004-08-18',DATE '2005-08-03',DATE '2004-08-19',DATE '2004-08-20',DATE '2005-08-05',DATE '2004-08-21',DATE '2005-08-08',DATE '2005-08-09',DATE '2004-03-13',DATE '2005-08-10',DATE '2005-08-11',DATE '2004-08-27',DATE '2005-08-12',DATE '2004-08-28',DATE '2005-08-13',DATE '2005-08-15',DATE '2004-08-31',DATE '2005-03-04',DATE '2005-08-16',DATE '2005-03-05',DATE '2005-08-17',DATE '2005-08-19',DATE '2007-05-31',DATE '2006-08-04',DATE '2005-08-22',DATE '2005-08-23',DATE '2005-08-24',DATE '2005-08-26',DATE '2006-08-11',DATE '2006-08-14',DATE '2005-08-31',DATE '2006-08-15',DATE '2006-08-16',DATE '2007-08-01',DATE '2006-08-18',DATE '2007-08-03',DATE '2003-11-24',DATE '2005-03-25',DATE '2006-08-21',DATE '2003-11-25',DATE '2003-11-26',DATE '2006-08-23',DATE '2003-11-28',DATE '2006-08-25',DATE '2007-08-09',DATE '2003-11-29',DATE '2007-08-10',DATE '2005-03-31',DATE '2004-06-04',DATE '2006-08-29',DATE '2006-08-30',DATE '2006-08-31',DATE '2007-08-17',DATE '2004-06-11',DATE '2007-08-21',DATE '2007-08-22',DATE '2004-01-02',DATE '2004-11-26',DATE '2007-08-24',DATE '2004-06-18',DATE '2005-06-03',DATE '2006-03-31',DATE '2004-06-19',DATE '2004-01-10',DATE '2007-08-31',DATE '2004-06-25',DATE '2005-06-10',DATE '2004-06-26',DATE '2005-11-25',DATE '2004-01-17',DATE '2004-06-29',DATE '2005-06-14',DATE '2004-06-30',DATE '2005-06-15',DATE '2005-06-16',DATE '2005-06-17',DATE '2005-06-18',DATE '2006-06-02',DATE '2007-03-30',DATE '2005-06-20',DATE '2004-01-24'),
      MTN_ACT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2005-06-24',DATE '2006-06-09',DATE '2006-11-22',DATE '2005-06-27',DATE '2004-01-31',DATE '2005-06-28',DATE '2006-11-24',DATE '2005-06-29',DATE '2006-11-25',DATE '2005-06-30',DATE '2006-11-27',DATE '2004-09-03',DATE '2006-06-16',DATE '2006-11-29',DATE '2007-06-01',DATE '2006-11-30',DATE '2007-06-05',DATE '2006-01-10',DATE '2006-06-23',DATE '2005-01-28',DATE '2007-06-08',DATE '2005-01-29',DATE '2005-01-31',DATE '2007-06-11',DATE '2007-06-13',DATE '2005-09-02',DATE '2006-06-30',DATE '2007-06-15',DATE '2007-06-18',DATE '2007-06-19',DATE '2007-06-20',DATE '2007-06-22',DATE '2007-06-28',DATE '2002-12-20',DATE '2006-09-01',DATE '2007-06-29',DATE '2002-12-21',DATE '2002-12-23',DATE '2006-09-07',DATE '2006-09-08',DATE '2003-12-12',DATE '2003-12-13',DATE '2005-04-16',DATE '2003-12-18',DATE '2006-09-15',DATE '2003-12-19',DATE '2006-04-04',DATE '2003-12-20',DATE '2003-12-22',DATE '2006-04-07',DATE '2003-12-23',DATE '2007-09-04',DATE '2003-12-24',DATE '2007-09-05',DATE '2007-09-07',DATE '2004-12-11',DATE '2005-04-29',DATE '2005-04-30',DATE '2006-04-14',DATE '2004-12-15',DATE '2004-12-16',DATE '2006-09-29',DATE '2004-12-17',DATE '2007-09-14',DATE '2004-12-18',DATE '2004-12-20',DATE '2004-12-21',DATE '2007-04-06',DATE '2004-12-22',DATE '2004-12-23',DATE '2004-12-24',DATE '2007-09-21',DATE '2005-07-01',DATE '2004-07-17',DATE '2005-12-14',DATE '2004-12-30',DATE '2005-12-15',DATE '2005-12-16',DATE '2007-09-28',DATE '2004-07-20',DATE '2005-12-17',DATE '2006-12-01',DATE '2004-07-21',DATE '2004-07-22',DATE '2005-07-07',DATE '2005-12-19',DATE '2004-07-23',DATE '2005-07-08',DATE '2005-12-20',DATE '2005-12-21',DATE '2006-12-05',DATE '2005-12-22',DATE '2006-12-06',DATE '2004-07-26',DATE '2005-12-23',DATE '2005-12-24',DATE '2006-12-08',DATE '2004-07-30',DATE '2005-07-15',DATE '2005-02-04',DATE '2006-12-12',DATE '2005-02-05',DATE '2006-12-13',DATE '2005-12-30',DATE '2006-12-14',DATE '2006-07-03',DATE '2006-12-15',DATE '2006-12-16',DATE '2005-07-22',DATE '2006-12-18',DATE '2005-02-11',DATE '2006-07-07',DATE '2006-12-19',DATE '2005-02-12',DATE '2006-12-20',DATE '2006-12-21',DATE '2006-12-22',DATE '2006-12-23',DATE '2005-07-29',DATE '2005-02-18',DATE '2006-07-14',DATE '2006-12-26',DATE '2005-02-19',DATE '2006-12-27',DATE '2006-12-28',DATE '2006-12-29',DATE '2007-07-03',DATE '2005-02-25',DATE '2006-07-21',DATE '2007-07-05',DATE '2005-02-26',DATE '2006-07-22',DATE '2007-07-06',DATE '2007-12-18',DATE '2007-12-19',DATE '2005-02-28',DATE '2007-12-20',DATE '2007-12-21',DATE '2006-07-26',DATE '2007-12-22',DATE '2006-07-28',DATE '2007-12-24',DATE '2007-07-13',DATE '2007-12-26',DATE '2006-07-31',DATE '2006-02-20',DATE '2007-07-17',DATE '2007-07-18',DATE '2007-07-19',DATE '2007-07-20',DATE '2007-02-09',DATE '2007-07-24',DATE '2007-07-25',DATE '2007-07-26',DATE '2007-07-27',DATE '2007-02-16',DATE '2005-05-06',DATE '2007-07-30',DATE '2005-05-07',DATE '2007-07-31',DATE '2004-05-28',DATE '2007-02-28',DATE '2006-05-12',DATE '2006-10-27',DATE '2004-08-04',DATE '2004-08-05',DATE '2004-08-07',DATE '2004-08-10',DATE '2004-08-11',DATE '2004-08-13',DATE '2004-08-14',DATE '2007-05-11',DATE '2004-08-16',DATE '2005-08-01',DATE '2007-10-25',DATE '2004-08-17',DATE '2005-08-03',DATE '2004-08-20',DATE '2005-08-05',DATE '2004-08-21',DATE '2004-08-23',DATE '2005-08-08',DATE '2005-08-09',DATE '2005-08-10',DATE '2005-08-11',DATE '2005-08-12',DATE '2004-08-28',DATE '2005-08-13',DATE '2005-08-15',DATE '2005-08-16',DATE '2005-03-05',DATE '2005-08-17',DATE '2005-08-19',DATE '2007-05-31',DATE '2006-08-04',DATE '2005-08-22',DATE '2005-08-23',DATE '2006-08-07',DATE '2005-08-24',DATE '2005-08-26',DATE '2006-08-11',DATE '2006-08-14',DATE '2005-08-31',DATE '2006-08-15',DATE '2006-08-16',DATE '2006-08-17',DATE '2007-08-01',DATE '2006-08-18',DATE '2007-08-02',DATE '2007-08-03',DATE '2005-03-25',DATE '2006-08-21',DATE '2006-08-22',DATE '2007-08-06',DATE '2006-08-23',DATE '2007-08-07',DATE '2006-08-24',DATE '2007-08-08',DATE '2003-11-28',DATE '2006-08-25',DATE '2007-08-09',DATE '2007-08-10',DATE '2006-08-28',DATE '2006-08-29',DATE '2007-08-13',DATE '2006-08-30',DATE '2007-08-14',DATE '2006-08-31',DATE '2007-08-15',DATE '2005-11-04',DATE '2007-08-16',DATE '2007-08-17',DATE '2007-08-20',DATE '2007-03-09',DATE '2007-08-21',DATE '2007-08-22',DATE '2004-11-26',DATE '2007-08-23',DATE '2007-08-24',DATE '2005-06-03',DATE '2006-03-31',DATE '2007-08-30',DATE '2007-08-31',DATE '2005-06-10',DATE '2007-03-23',DATE '2008-08-20',DATE '2005-11-25',DATE '2006-11-10',DATE '2005-06-15',DATE '2005-06-16',DATE '2005-06-17',DATE '2007-03-29',DATE '2005-06-18',DATE '2007-03-30',DATE '2005-06-20'),
      LINE_TERM_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      MTN_STATUS_IND CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A   ','D   ','S   '),
      ESN_CHANGE_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      ESN_CHANGE_REAS_CD CHAR(7) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A2     ','AU     ','CE     ','CR     ','EA     ','EU     ','FX     ','M2     ','NE     ','U2     ','UN     ','UP     ','W2     ','WP     '),
      DSCNT_PLAN_CD VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      DEACT_CHANGE_REAS_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('90   ','FF   '),
      WARR_LGTH CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      WARR_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      EQP_STATUS_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('OW','PU'),
      EQP_PROD_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('12641','12916','12917','12991','13043','13188','13281','13282','13283','13307','13326','13327','13333','13359','13435','13450','13486','13487','13533','13550','13650','13693','13703','13780','13813','13822','141','14476','14480','14554','14555','14556','14566','14574','14595','14605','16019','16771','16772','16819','16821','16822','16841','16842','16847','16858','16859','16863','16864','16865','17233','17245','18449','18479','18491','18522','18549','18606','18609','18681','18700','18701','18721','18757','18855','18965','19021','19023','19024','19026','19037','19209','19369','19371','19674','19679','19955','19956','20277','20310','20344','20455','20457','20471','20559','20564','21066','21068','21102','21103','21104','21105','21294','21349','21513','21514','21801','21896','21930','23089','23091','23092','23093','23299','23347','23460','23526','23539','23540','23612','23766','23997','24054','24055','24108','24109','24110','24111','24482','24483','24484','25316','25372','25468','25471','25682','25776','25777','25898','25899','25969','26223','26433','26499','26500','26503','26518','26553','26560','26612','26614','26672','26748','26857','26861','27083','27084','27145','27148','27322','27403','27795','27855','27905','28265','28375','28625','28883','28911','28912','28988','29083','29183','29355','29458','29852','29992','3002','30189','30538','30540','30614','30676','3068','30698','30766','3084','30841','31088','31134','31437','31464','31686','3174','3201','3202','32077','3217','32182','32291','32352','32607','32771','33026','33120','3354','3386','3427','35272','35278','35287','35331','3595','3596','3597','3614','3615','3620','3626','3627','3628','3650','3737','3774','37754','3776','3781','3798','3800','3801','3802','3837','3849','3850','3851','3873','3874','3887','3892','3893','3951','3960','3969','3973','3976','3988'),
      EQP_TYPE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('(','A','B','M','N','P','T'),
      CNTRCT_NUM CHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CNTRCT_TERM_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      CNTRCT_TERM_FEE DECIMAL(10,2) COMPRESS (0.00 ,200.00 ,175.00 ,50.00 ,350.00 ),
      CNTRCT_PRD_MTH BYTEINT COMPRESS (0 ,12 ,24 ),
      CNTRCT_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      CNTRCT_SLS_PRSN_ID CHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('E000E           ','E000G           ','E00N0           ','E048Y           ','E14XT           ','ECK39           ','ECW79           ','ECW80           ','ECW82           ','ECW83           ','ED767           ','EDC59           ','EE008           ','EE02M           ','EE076           ','EE104           ','EE119           ','EE193           ','EE245           ','EE25Y           ','EE278           ','EE314           ','EE400           ','EE478           ','EE485           ','EE568           ','EE647           ','EE76R           ','EE774           ','EE795           ','EE79Y           ','EE822           ','EE911           ','EE912           ','EEN60           ','EGK55           ','EGU48           ','EJH43           ','EJL29           ','EJX46           ','EL822           ','EMF10           ','ENC             ','EPB68           ','ESQ34           ','ESQ43           ','ET852           ','ETS09           ','ETS11           ','ETU90           ','EWU99           ','EZ982           ','NPB2C           ','NPM2M           ','NPMOP           ','TAF10           ','TBE81           '),
      MTN_ZONE_ACT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2016-12-16',DATE '2015-07-23',DATE '2005-01-17',DATE '2006-01-01',DATE '2003-04-07',DATE '2009-03-13',DATE '2017-07-04',DATE '2017-12-22',DATE '2011-08-06',DATE '2005-09-03',DATE '2014-10-16',DATE '2017-02-01',DATE '2017-02-03',DATE '2017-12-29',DATE '2011-03-01',DATE '2017-02-09',DATE '2015-10-15',DATE '2018-02-01',DATE '2009-11-13',DATE '2011-03-15',DATE '2016-10-04',DATE '2015-05-09',DATE '2010-11-01',DATE '2018-02-07',DATE '2015-05-13',DATE '2012-03-08',DATE '2015-10-28',DATE '2005-04-21',DATE '2010-11-10',DATE '2015-05-21',DATE '2013-03-05',DATE '2017-10-11',DATE '2007-04-04',DATE '2010-11-24',DATE '2014-08-08',DATE '2016-05-20',DATE '2010-11-29',DATE '2017-10-17',DATE '2013-08-28',DATE '2007-09-26',DATE '2016-05-26',DATE '2010-06-25',DATE '2011-01-01',DATE '2017-05-19',DATE '2005-07-17',DATE '2014-08-29',DATE '2005-07-18',DATE '2014-03-20',DATE '2011-06-24',DATE '2015-03-11',DATE '2015-03-13',DATE '2005-02-20',DATE '2005-02-21',DATE '2009-04-17',DATE '2014-11-07',DATE '2016-08-20',DATE '2009-04-22',DATE '2005-10-02',DATE '2005-10-03',DATE '2009-04-28',DATE '2016-08-30',DATE '2004-05-10',DATE '2017-08-15',DATE '2017-03-09',DATE '2017-08-26',DATE '2014-01-08',DATE '2005-05-09',DATE '2015-06-05',DATE '2005-05-10',DATE '2017-08-30',DATE '2014-01-11',DATE '2013-01-29',DATE '2009-12-18',DATE '2018-03-07',DATE '2015-06-17',DATE '2018-03-14',DATE '2008-02-19',DATE '2016-11-15',DATE '2007-10-05',DATE '2015-06-23',DATE '2010-12-15',DATE '2015-06-24',DATE '2015-06-26',DATE '2008-02-28',DATE '2014-09-16',DATE '2017-06-14',DATE '2017-06-15',DATE '2008-10-17',DATE '2015-09-05',DATE '2012-12-13',DATE '2015-09-09',DATE '2014-09-26',DATE '2014-09-27',DATE '2015-09-15',DATE '2016-09-02',DATE '2003-06-01',DATE '2011-02-19',DATE '2015-09-29',DATE '2018-01-17',DATE '2017-09-01',DATE '2010-10-14',DATE '2015-04-23',DATE '2013-07-12',DATE '2016-04-08',DATE '2015-04-28',DATE '2017-09-14',DATE '2014-12-19',DATE '2014-12-20',DATE '2013-02-16',DATE '2007-03-15',DATE '2014-02-03',DATE '2016-04-27',DATE '2017-04-11',DATE '2014-02-04',DATE '2008-03-01',DATE '2013-02-23',DATE '2017-09-29',DATE '2012-10-11',DATE '2012-10-12',DATE '2011-05-16',DATE '2008-03-11',DATE '2015-12-23',DATE '2008-08-28',DATE '2007-11-01',DATE '2016-12-14',DATE '2015-12-31'),
      CREDIT_APP_NUM CHAR(9) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      MTN_ZONE_ID CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      MTN_ZONE_DEACT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      BILL_ACCT_CD VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('BAC','BAM'),
      EMAIL_ADDR VARCHAR(60) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CHRIS.BAIRD@OPTCONNECT.COM','CODI.CHAPMAN@YAHOO.COM','DECLINE@VZW.COM','DONOTREPLY@DUKE-ENERGY.COM','EBRYANT68@VERIZON.NET','ITAMTELCO@PGE.COM','MOBILESUPPORT@CHARTER.COM','QMDEWALT@YAHOO.COM','SALVATORE.SIGNORELLI@FEDEX.COM','SCASTRO@SKYPATROL.COM','SUPPORT@KOREWIRELESS.COM','Update@VZW.com','VERIZONORDERS@TRAQ.COM','WIRELESSREQUESTS@CENTURYLINK.COM'),
      HANDICAP_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('5','N','Y'),
      CONV_MTN_STATUS_IND CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CONV_DEACT_CHANGE_REAS_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CONV_LINE_TERM_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      PREPAID_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0','3','B','N','Y'),
      EMIN CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2152086632','2152195018','2156301013','2159620298','2159622348','2258924354','2485638801','2485638825','2487637302','2487637637','2623895075','2676393817','2676718825','2679983941','2817771710','3012821637','3022366602','3023810798','3033584112','3035486084','3038597438','3072587884','3102191378','3103673623','3104291925','3105089427','3107016218','3109220222','3127711340','3133789100','3135492511','3135492516','3135492517','3135499822','3135499830','3135499843','3135499882','3135499886','3135502311','3135502313','3136001823','3139109291','3139690241','3139690576','3139690590','3149100899','3152632596','3153787702','3166171642','3166507796','3172217481','3174089670','3174390671','3174982411','3176905841','3176940557','3238103219','3238212210','3306041055','3306041160','3306081081','3606214638','3612300774','3615631180','4026307242','4072295741','4082040316','4082041877','4082130933','4083136646','4083139563','4083142161','4084822230','4084822348','4084823760','4084826053','4085353316','4088913258','4088915124','4088916230','4097828359','4104563580','4104906225','4142223606','4158477196','4252462720','4342379919','4358517468','4404886636','4802667861','4802941240','4805107100','4805402064','5039309205','5043014970','5052355633','5053316161','5057707747','5095412853','5132668021','5178960851','5182505004','5183014513','5187915141','5205919159','5402622589','5407976173','5624773989','5626071938','5628226057','5632712438','5703371675','5742420833','5852389429','5852490489','5867198417','6027611512','6027613973','6103682856','6107152710','6125992849','6142027880','6142028406','6164465327','6168220924','6199228764','6199337783','6262010448','6264226159','6309476336','6467532895','6469424611','7012690362','7013323194','7033072782','7033078505','7065669868','7132019606','7153547768','7175148287','7178701186','7194947721','7195205359','7246990762','7323432133','7602710421','7602715768','7602718578','7602718594','7603100124','7603108743','7604736813','7604843578','7605792386','7606852439','7609859928','7654387265','8013670610','8013801577','8016944285','8043637531','8043665961','8043807879','8043876612','8053909052','8058890903','8102578465','8102875349','8105151260','8123181837','8144409514','8182400037','8184295694','8185903328','8186061789','8189390488','8189703328','8436938953','8563716118','8582458823','8584497365','8587615621','8587752050','8642708296','8643162421','8654145590','8658504654','9092055073','9098165775','9098367870','9122234335','9132053784','9135301568','9142433428','9144009105','9167472895','9173443302','9192161024','9193069301','9194524121','9196190836','9252200231','9252200596','9492055561','9492056686','9492056690','9492056695','9492056697','9492056707','9492056710','9492057038','9492057041','9492057110','9492101904','9492221669','9492221671','9492221672','9492221676','9492221725','9492221735','9492222250','9492222271','9492222273','9492222278','9492222286','9492222302','9492222308','9492222319','9492222349','9492222356','9492222362','9492222391','9492222491','9492222498','9492222501','9492231848','9492302433','9492334981','9492464368','9492501364','9492505409','9493226268','9496973279','9497514341','9497519277','9497519657','9497519747','9702223815','9702503547','9705564365','9705932376','9706400077','9708462140','9708462143'),
      NE2_REDEMPT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      GEO_CD CHAR(14) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('USA04013000000','USA04013460000','USA04013550000','USA04013650000','USA04019770000','USA06037430000','USA06037440000','USA06059009470','USA06059367700','USA06059394960','USA06059511820','USA06059690000','USA06067640000','USA06073660000','USA06075670000','USA06085680000','USA06085770000','USA06097000000','USA06111546520','USA08005452550','USA08013078500','USA08031200000','USA09001000000','USA09001559900','USA09001730000','USA09003000000','USA09009000000','USA10003000000','USA11001500000','USA12031350000','USA12057000000','USA12057710000','USA12086179350','USA12095000000','USA13067000000','USA13121016960','USA13121040000','USA13121685160','USA13135000000','USA17031140000','USA17031658190','USA17143590000','USA17167720000','USA18057103420','USA18097360030','USA21111480060','USA21187586920','USA24005182500','USA24031071250','USA24037000000','USA24510040000','USA25009000000','USA25017000000','USA25017110000','USA25017726000','USA25021742100','USA25023000000','USA25025070000','USA25027000000','USA26075414200','USA26125000000','USA26163210000','USA26163220000','USA28049360000','USA29077700000','USA30111065500','USA31055370000','USA33011000000','USA33015000000','USA34003000000','USA34005000000','USA34023000000','USA34025000000','USA34027000000','USA34035000000','USA35001020000','USA36005510000','USA36029000000','USA36047510000','USA36055000000','USA36059063870','USA36061510000','USA36067000000','USA36081510000','USA36085510000','USA36103020440','USA36119000000','USA37119120000','USA37183550000','USA39035160000','USA39035484680','USA39049180000','USA39061150000','USA39153010000','USA41051590000','USA42003000000','USA42003610000','USA42017000000','USA42029000000','USA42091000000','USA42101600000','USA46005000000','USA46005310600','USA47037520060','USA47093400000','USA47157480000','USA48029650000','USA48085580160','USA48113190000','USA48141240000','USA48157708080','USA48201000000','USA48201350000','USA48439270000','USA48453050000','USA49011403600','USA49049443200','USA49049624700','USA51041000000','USA51059000000','USA51059799520','USA51760670000','USA51810820000','USA53033630000','USA53063393350','USA55127869250'),
      GEO_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'G3',
      ORIG_CUST_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('221461140','221600254','222878125','222999030','223180139','223564045','242004212','242036245','242042978','242045800','242048616','242078291','287228790','321322047','342023651','342074703','342082451','421410740','423318974','442007874','442010365','442018439','442055186','486113084','522291830','542028174','542057243','542060577','542063202','542066517','542147069','572231959','572494133','582393461','585729371','586013243','621121445','621520320','623383279','642015857','642028006','642040113','642056016','642057533','642064515','642069342','672323346','687158971','742010031','742027525','742034421','742048882','742051081','742055842','822646749','823383210','842026865','920210329','942004484','942009052','942050205','942065516','986158284'),
      ORIG_CUST_LINE_SEQ_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0_1','0_2','0_3','1','10','11','12','2','3','4','5','6','7','8','9'),
      PROD_NM CHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2GIG Technologies 2GIG-CP21-345 ','4G Smartphone PDI               ','ADR6200                         ','A_V3A                           ','AgSense - Field Commander SL    ','AgSense Wagnet Field Commander  ','Alarm.com - ADC-200H-EVD        ','Alarm.com - ADC-200N-EVD        ','Alarm.com ADC-200C-EVD          ','Ambient X-3100                  ','Ambient X-3100-MC8355           ','Apple iPhone 4 16GB             ','Apple iPhone 4 32GB             ','Autonet - Kanaan 3              ','BlackBerry 8330                 ','BlackBerry 8830                 ','BlackBerry 9630                 ','BlackBerry Bold 9650            ','BlackBerry Bold 9650 6.0        ','BlackBerry Bold 9930            ','BlackBerry Curve 8330 Pink      ','BlackBerry Curve 8530 Black     ','BlackBerry Curve 9330 Gray      ','BlackBerry Storm                ','BlackBerry Storm2 9550          ','CASIO ROCK C731                 ','CDM8630                         ','CalAmp - LMU-200                ','CalAmp - LMU-2120               ','CalAmp - LMU-2620               ','CalAmp - LMU-2630               ','CalAmp - LMU-2720               ','CalAmp - LMU-3030               ','CalAmp - LMU2610                ','CalAmp - PL641                  ','CalAmp - TTU-2830               ','CalAmp TTU-720                  ','Casio GzOne Commando            ','Casio GzOne Ravine              ','Casio GzOne Ravine 2            ','Casio GzOne Ravine II           ','Connected Holdings - ARROWCV002 ','Crane - WAN Module CDMA         ','DMP - 263C                      ','DMP - 263C 2nd Generation       ','DMP - CellComSL                 ','DROID X by Motorola             ','DuraXVPlus by Kyocera           ','Enfora - MT4100                 ','G and D 4FF BULK SIM CARD       ','G and D 4G 3FF SIM - DF         ','G and D 4G 3FF SIM Retail Stores','G and D 4G MFF2 SIM             ','G and D 4G NFC SIM - DF         ','G and D 4G NFC SIM Retail Stores','G and D 4G SIM Card - DF        ','GEMALTO 4FF BULK SIM CARD       ','GEMALTO 4FF DFILL SIM CARD      ','GND 4FF NFC SIM Retail Stores   ','GND M2M 2FF NONRUG SIM          ','GTO 4FF NFC SIM Retail Stores   ','GTO 4G M2M NONRUG CLOUD SIM     ','GTO Multi-Form-Factor SIM       ','Gemalto 4G 2FF-HD Cloud SIM     ','Gemalto 4G 2FF-HD SIM           ','Gemalto 4G 3FF SIM - DF         ','Gemalto 4G 3FF SIM Retail Stores','Gemalto 4G MFF2 Cloud SIM       ','Gemalto 4G MFF2 SIM             ','Gemalto 4G NFC SIM - DF         ','Gemalto 4G NFC SIM Retail Stores','Gemalto 4G SIM Card - DF        ','Gemalto 4G SIMCard Retail Stores','GenX Mobile - GNX-5P-C          ','Generac - Mobile Link           ','Geotab - GO7 CDMA_Verizon       ','GzOne Boulder C711SLXB          ','HTC DROID Incredible 2          ','HTC Incredible ADR6300          ','HTC Incredible ADR6300 SLCD     ','Home Phone Connect F256         ','IPHONE 4 BLACK 8 GB             ','IPHONE 4 BLACK 8GB              ','IPHONE 4 WHITE 8 GB             ','IPHONE 4S BLACK 16GB            ','IPHONE 4S BLACK 32GB            ','IPHONE 4S BLACK 8GB             ','IPHONE 4S WHITE 16GB            ','InOne - IrisConnect             ','Invensys - CTLM                 ','IpDatatel - IPD BAT CU          ','Itron - 1210-AMP                ','Itron - OpenWay 3.1             ','Knack                           ','LG Ally VS740                   ','LG Cosmos - VN250               ','LG Cosmos 2                     ','LG Cosmos 3                     ','LG Cosmos Touch - VN270         ','LG Octane                       ','LG Optimus Zone 2               ','LG Revere - VN150               ','LG Revere 3                     ','LG enV3 - VX9200                ','LG env3 Maroon VX9200           ','LG-VX10000                      ','LG-VX10000 Silver               ','LG-VX11000                      ','LG-VX3100                       ','LG-VX3200                       ','LG-VX3300                       ','LG-VX3400                       ','LG-VX4400                       ','LG-VX4500                       ','LG-VX4650                       ','LG-VX5200                       ','LG-VX5300                       ','LG-VX5400                       ','LG-VX5500                       ','LG-VX5600                       ','LG-VX6000                       ','LG-VX6100                       ','LG-VX8100                       ','LG-VX8300                       ','LG-VX8350                       ','LG-VX8350 Red                   ','LG-VX8360                       ','LG-VX8560 Black                 ','LG-VX8575                       ','LG-VX8600                       ','LG-VX8700                       ','LG-VX9100 Black                 ','LG-VX9100 Maroon                ','LG-VX9700                       ','LG-VX9900                       ','Laird - Orion                   ','Linear - 2GIG-CDMAV-A-GC3       ','MEI Group - ADV5000             ','MOBIS - PREMIUM-AVN GEN2.0      ','MOBIS - STD-AVN GEN4.5          ','MiFi2200                        ','Montage - MGCDMAV1              ','Motorola 120e                   ','Motorola DROID 3                ','Motorola DROID X 2GB            ','Motorola DROID X2               ','Motorola Droid 2                ','Motorola Droid 2 Global         ','Motorola E815                   ','Motorola K1m                    ','Motorola Limerick-VU204         ','Motorola MC959B                 ','Motorola RAZR V3c               ','Motorola V325                   ','Motorola V325i                  ','Motorola V3m                    ','Motorola V750                   ','Motorola V860                   ','Motorola W315                   ','Motorola W385                   ','Motorola W755 Black Slate       ','Motorola W755 Purple            ','Motorola a855                   ','Napco - SLE-CDMA-8D             ','Networkfleet - 5000CDMA         ','Networkfleet 5000CDMA-PCS3      ','Networkfleet Inc - 6100         ','Non-Branded 1x Only Module      ','Non-Branded EVDO Module         ','PC5750                          ','Passtime - PTE-3                ','Passtime - TRAX-4               ','Prepaid Samsung Gusto II        ','Q2438                           ','Qolsys - IQPanel                ','Queclink - GV55VC               ','SAMSUNG Gusto                   ','SCH-A870                        ','SCH-U350                        ','SCH-U450                        ','SCH-U450 Red                    ','SCH-U640                        ','SCH-a630                        ','SCH-a650                        ','SCH-a670                        ','SCH-a850                        ','SCH-a930                        ','SCH-a950                        ','SCH-u340                        ','SCH-u410                        ','SCH-u430                        ','SCH-u540                        ','SCH-u740 Black                  ','SCH-u740 Silver                 ','SCH-u750                        ','SCH-u960                        ','STM 3FF SIM Retail Stores       ','STM 4FF NFC SIM Retail Stores   ','STM 4FF SIM Retail Stores       ','Samsung Brightside              ','Samsung Convoy 3                ','Samsung Convoy II               ','Samsung Fascinate               ','Samsung Gusto 3 Prepay          ','Samsung Haven SCH-U320          ','Samsung Intensity II Blue       ','Samsung Intensity II Gray       ','Samsung Reality SCH-U820 Black  ','SimpliSafe - SSCDMA5            ','Smart Synch Inc. - SSI 1210 1x  ','SmartSynch Inc SSI Collector 1X ','SmartSynch Inc SSI kV2c 1X      ','SmartSynch SSI OpenWay 1X       ','Systech - IPG-8111              ','Systech - IPG-8111FO            ','Systech SFG-4x_3x_2x_1x_Fusion  ','Telcare BGM 1.5                 ','Telular - TG1VX003              ','Telular - TG4V0004              ','Test Device                     ','Trilliant - CRDR-1010-SENT      ','UM175                           ','UPS DIAD IV                     ','USA Tech - ePort Telemeter      ','USA Technologies - EDGE         ','USA Technologies - G8-A         ','USB760                          ','Vivint - CP01 Novatel           ','Vivint - CP01 Telit             ','Xirgo - XT-2150CV               ','Xirgo - XT-3250CV               ','Xirgo - XT-3450CV               ','Xirgo - XT-6350CV               ','iPhone 4 White 16GB             '),
      ORIG_SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A','E','H','I','K','L','N','O','S','V','W'),
      REV_GEN_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      BUDGET_CTR_CD VARCHAR(36) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('100.459.2102.50035','123444','FLEETMATICS','HMA','MEDTRONIC CARE MANAGEMENT SERVICES','SAGEQUEST'),
      SLS_DIST_CHNL_TYPE_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A  ','D  ','I  ','M  ','NC ','R  ','T  '),
      CORP_REPORTING_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('V100027N','V101068N','V107296I','V118618D','V119264D','V119265D','V119266D','V120342D','V120343D','V120344D','V123869D','V123871D','V123977D','V124484D','V124485D','V13425R','V13922D','V15307T','V1612D','V1744D','V18035NC','V18063D','V18358D','V18380NC','V18688I','V19070T','V22466NC','V22755D','V22849I','V24455T','V25655NC','V25678D','V28966D','V3008NC','V3341T','V3812D','V4231T','V6071D','V71734D','V71967D','V72133D','V7277T','V74663T','V74667NC','V74816T','V75060T','V75063A','V75064I','V75207D','V75884D','V75922D','V75923M','V75950R','V76077T','V76078T','V76587D','V7737D','V80643R','V80644R','V82491D','V8253N','V84136M','V84904M','V84906D','V84990M','V85016D','V85031D','V85067N','V85673D','V86121D','V8620N','V86439D','V86742D','V88166D','V8865D','V88707D','V88708D','V88710D','V88711D','V9196D','V96532I','V96609M','V96610D','V96611T','V99602I'),
      ESN_REDEMPT_DT DATE FORMAT 'YY/MM/DD' COMPRESS (DATE '9999-12-31'),
      CNTRCT_SLS_OUTLET_ID VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('100025','100027','100028','100029','101068','10390','10461','110066','118618','119264','119265','119266','120343','120344','123869','123871','123977','13922','14569','15307','15308','1744','18063','18358','22755','3008','3341','3812','4231','6071','71734','72133','75207','75209','75884','76078','76583','76585','7737','79918','82491','8253','84855','85016','85031','85067','85245','86121','8620','86442','86743','88166','8865','88707','88708','88710','88711','9196','92060','92406','92632','96609'),
      CNTRCT_SLS_DIST_CHNL_TYPE_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('D  ','I  ','M  ','N  ','NC ','R  '),
      CNTRCT_USER_ID VARCHAR(8) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('00000228','00000241','00000829','00000878','00057234','00094525','00100625','00117718','ACAV840P','ACSTACNP','BGCOAPI','BGCOIOT','BGCOOFFL','CANNJA5','FCST146P','FCST482P','FCST496P','FCST498P','FCST736P','FIGULU2','HINKLPA','MW POS','NORMAL1','NPHASE','POSEMP','PRMVIPVZ','R0078981','R0116506','SE POS','SYSTPOS'),
      STATIC_IP_ADDR VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      STATIC_IP_ADDR_EFF_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      STATIC_IP_ADDR_TERM_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      PORT_STATUS_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      PORT_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      PORT_CONFIRM_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('C','D','P'),
      CNTRCT_END_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      BUS_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      AUTO_PORT_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('F','N','Y'),
      XMKT_ACCT_NUM VARCHAR(36) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('221461140_1','221600254_1','242004212_1','242036245_1','242042978_1','242045800_1','242048616_1','242057322_1','242078291_1','321322047_1','342023651_1','342074703_1','342082451_1','342157206_1','371815028_1','421410740_1','442018439_1','442055186_1','486024466_1','486113084_1','520955734_1','523123022_1','523748267_10','542028174_1','542057243_1','542063202_1','542089085_1','542147069_4','572494133_1','581900154_1','582393461_1','585729371_1','586013243_1','621121445_1','621520320_1','621573084_1','642015857_1','642028006_1','642040113_1','642055166_2','642056016_1','642057533_1','642064515_1','642067947_1','642069342_1','672323346_2','687158971_1','742010031_1','742026243_1','742027525_1','742034421_1','742048882_1','742051081_1','742055842_1','786438601_1','822646749_1','921881770_1','922100958_1','942009052_1','942065516_1','942067604_1','986158284_1'),
      XMKT_ACCT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'N',
      SIM_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CREDIT_CLASS_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A ','B ','C '),
      SCRTY_DEP_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      SCRTY_DEP_AMT DECIMAL(10,2) COMPRESS (0.00 ,125.00 ),
      SCRTY_DEP_STATUS_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SCRTY_DEP_PAY_AMT DECIMAL(10,2) COMPRESS (0.00 ,125.00 ),
      ROLLUP_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS (' ','B','D','F','G','H','I','J','M','N','O','P','R','S','U','X','Z'),
      AGE_INPUT_PREMIER CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      HISP_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      HISP_CONF_IND BYTEINT COMPRESS ,
      LAST_UPD_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2018-04-16',DATE '2018-04-17',DATE '2010-08-01',DATE '2018-04-18',DATE '2010-08-02',DATE '2018-04-19',DATE '2018-04-20',DATE '2013-10-12',DATE '2018-04-21',DATE '2018-04-22',DATE '2017-12-06',DATE '2018-04-23',DATE '2018-04-24',DATE '2018-04-25',DATE '2018-04-26',DATE '2018-04-27',DATE '2018-04-28',DATE '2018-04-29',DATE '2014-10-05',DATE '2018-04-30',DATE '2014-10-06',DATE '2007-11-19',DATE '2017-07-03',DATE '2010-03-08',DATE '2017-12-22',DATE '2014-10-16',DATE '2017-12-28',DATE '2018-07-01',DATE '2018-07-02',DATE '2017-12-30',DATE '2018-07-03',DATE '2018-07-04',DATE '2018-07-05',DATE '2018-07-06',DATE '2018-07-07',DATE '2018-07-08',DATE '2018-07-09',DATE '2018-07-10',DATE '2018-07-11',DATE '2014-10-31',DATE '2018-07-12',DATE '2018-07-13',DATE '2011-03-13',DATE '2018-02-02',DATE '2018-07-14',DATE '2018-07-15',DATE '2018-02-04',DATE '2018-07-16',DATE '2018-07-17',DATE '2018-07-18',DATE '2018-07-19',DATE '2018-02-08',DATE '2018-07-20',DATE '2015-10-24',DATE '2018-02-09',DATE '2018-07-21',DATE '2018-02-10',DATE '2018-07-22',DATE '2018-07-23',DATE '2018-02-12',DATE '2018-07-24',DATE '2018-07-25',DATE '2018-07-26',DATE '2018-07-27',DATE '2018-07-28',DATE '2018-02-20',DATE '2017-10-04',DATE '2017-10-06',DATE '2009-01-11',DATE '2018-02-24',DATE '2017-10-08',DATE '2017-10-10',DATE '2017-10-11',DATE '2006-04-21',DATE '2017-10-13',DATE '2007-09-18',DATE '2017-10-14',DATE '2017-10-15',DATE '2017-10-16',DATE '2017-10-19',DATE '2017-10-22',DATE '2017-10-24',DATE '2017-10-25',DATE '2017-10-26',DATE '2017-10-28',DATE '2018-05-01',DATE '2018-05-02',DATE '2018-05-03',DATE '2018-05-04',DATE '2018-05-05',DATE '2006-12-09',DATE '2018-05-06',DATE '2008-09-22',DATE '2018-05-07',DATE '2018-05-08',DATE '2018-05-09',DATE '2018-05-10',DATE '2018-05-11',DATE '2018-05-12',DATE '2018-05-13',DATE '2018-05-14',DATE '2018-05-15',DATE '2018-05-16',DATE '2018-05-17',DATE '2018-05-18',DATE '2018-05-19',DATE '2018-05-20',DATE '2018-05-21',DATE '2018-05-22',DATE '2018-05-23',DATE '2018-05-24',DATE '2018-05-25',DATE '2018-05-26',DATE '2018-05-27',DATE '2018-05-28',DATE '2009-04-16',DATE '2018-05-29',DATE '2018-05-30',DATE '2018-05-31',DATE '2017-08-08',DATE '2017-08-12',DATE '2015-11-01',DATE '2017-08-13',DATE '2017-08-17',DATE '2017-08-20',DATE '2017-08-23',DATE '2017-08-25',DATE '2017-08-26',DATE '2017-08-27',DATE '2017-08-28',DATE '2017-08-29',DATE '2017-08-30',DATE '2018-03-03',DATE '2018-03-09',DATE '2005-05-17',DATE '2005-05-18',DATE '2018-03-14',DATE '2018-03-15',DATE '2018-03-17',DATE '2017-11-01',DATE '2018-03-18',DATE '2017-11-02',DATE '2018-03-19',DATE '2018-03-20',DATE '2017-11-04',DATE '2018-03-21',DATE '2018-03-22',DATE '2018-03-23',DATE '2018-03-24',DATE '2018-03-25',DATE '2007-10-13',DATE '2018-03-26',DATE '2007-10-14',DATE '2018-03-27',DATE '2018-03-28',DATE '2018-03-29',DATE '2018-03-30',DATE '2018-03-31',DATE '2017-11-15',DATE '2017-11-18',DATE '2017-11-19',DATE '2011-07-03',DATE '2017-11-21',DATE '2017-11-22',DATE '2017-11-23',DATE '2013-04-21',DATE '2017-11-25',DATE '2017-11-26',DATE '2017-11-27',DATE '2017-11-28',DATE '2018-06-01',DATE '2017-01-05',DATE '2017-11-29',DATE '2018-06-02',DATE '2017-11-30',DATE '2018-06-03',DATE '2018-06-04',DATE '2018-06-05',DATE '2018-06-06',DATE '2018-06-07',DATE '2018-06-08',DATE '2018-06-09',DATE '2018-06-10',DATE '2018-06-11',DATE '2014-04-19',DATE '2017-06-27',DATE '2018-06-12',DATE '2018-06-13',DATE '2018-06-14',DATE '2018-01-03',DATE '2018-06-15',DATE '2018-01-04',DATE '2018-06-16',DATE '2018-01-05',DATE '2018-06-17',DATE '2018-06-18',DATE '2018-06-19',DATE '2018-06-20',DATE '2018-01-09',DATE '2018-06-21',DATE '2018-06-22',DATE '2018-06-23',DATE '2018-06-24',DATE '2018-06-25',DATE '2018-06-26',DATE '2018-06-27',DATE '2018-01-16',DATE '2018-06-28',DATE '2018-06-29',DATE '2017-09-01',DATE '2018-06-30',DATE '2017-09-02',DATE '2017-09-03',DATE '2017-09-05',DATE '2018-01-22',DATE '2018-01-23',DATE '2017-09-07',DATE '2018-01-24',DATE '2017-09-08',DATE '2018-01-25',DATE '2017-09-09',DATE '2018-01-26',DATE '2017-09-10',DATE '2018-01-27',DATE '2017-09-13',DATE '2018-01-30',DATE '2018-01-31',DATE '2017-09-15',DATE '2017-09-16',DATE '2017-09-19',DATE '2017-09-21',DATE '2017-09-24',DATE '2017-09-27',DATE '2017-09-28',DATE '2018-04-01',DATE '2013-02-25',DATE '2018-04-02',DATE '2017-09-30',DATE '2018-04-03',DATE '2018-04-04',DATE '2018-04-05',DATE '2018-04-06',DATE '2018-04-07',DATE '2018-04-08',DATE '2017-04-24',DATE '2018-04-09',DATE '2018-04-10',DATE '2018-04-11',DATE '2018-04-12',DATE '2018-04-13',DATE '2018-04-14',DATE '2018-09-26',DATE '2013-10-06',DATE '2018-04-15',DATE '2018-09-27'),
      INSERT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2018-04-16',DATE '2018-04-17',DATE '2010-08-01',DATE '2018-04-18',DATE '2010-08-02',DATE '2018-04-19',DATE '2018-04-20',DATE '2013-10-12',DATE '2018-04-21',DATE '2018-04-22',DATE '2017-12-06',DATE '2018-04-23',DATE '2018-04-24',DATE '2018-04-25',DATE '2018-04-26',DATE '2018-04-27',DATE '2018-04-28',DATE '2018-04-29',DATE '2014-10-05',DATE '2018-04-30',DATE '2014-10-06',DATE '2007-11-19',DATE '2017-07-03',DATE '2010-03-08',DATE '2017-12-22',DATE '2014-10-16',DATE '2017-12-28',DATE '2018-07-01',DATE '2018-07-02',DATE '2017-12-30',DATE '2018-07-03',DATE '2018-07-04',DATE '2018-07-05',DATE '2018-07-06',DATE '2018-07-07',DATE '2018-07-08',DATE '2018-07-09',DATE '2018-07-10',DATE '2018-07-11',DATE '2014-10-31',DATE '2018-07-12',DATE '2018-07-13',DATE '2011-03-13',DATE '2018-02-02',DATE '2018-07-14',DATE '2018-07-15',DATE '2018-02-04',DATE '2018-07-16',DATE '2018-07-17',DATE '2018-07-18',DATE '2018-07-19',DATE '2018-02-08',DATE '2018-07-20',DATE '2015-10-24',DATE '2018-02-09',DATE '2018-07-21',DATE '2018-02-10',DATE '2018-07-22',DATE '2018-07-23',DATE '2018-02-12',DATE '2018-07-24',DATE '2018-07-25',DATE '2018-07-26',DATE '2018-07-27',DATE '2018-07-28',DATE '2017-10-03',DATE '2017-10-04',DATE '2017-10-06',DATE '2009-01-11',DATE '2004-12-15',DATE '2018-02-24',DATE '2017-10-08',DATE '2017-10-10',DATE '2017-10-11',DATE '2006-04-21',DATE '2017-10-13',DATE '2007-09-18',DATE '2017-10-14',DATE '2017-10-15',DATE '2017-10-16',DATE '2017-10-19',DATE '2017-10-22',DATE '2017-10-24',DATE '2017-10-25',DATE '2017-10-26',DATE '2017-10-28',DATE '2018-05-01',DATE '2018-05-02',DATE '2018-05-03',DATE '2018-05-04',DATE '2018-05-05',DATE '2006-12-09',DATE '2018-05-06',DATE '2008-09-22',DATE '2018-05-07',DATE '2018-05-08',DATE '2018-05-09',DATE '2018-05-10',DATE '2018-05-11',DATE '2018-05-12',DATE '2018-05-13',DATE '2018-05-14',DATE '2018-05-15',DATE '2018-05-16',DATE '2018-05-17',DATE '2018-05-18',DATE '2018-05-19',DATE '2018-05-20',DATE '2018-05-21',DATE '2018-05-22',DATE '2018-05-23',DATE '2018-05-24',DATE '2018-05-25',DATE '2018-05-26',DATE '2018-05-27',DATE '2018-05-28',DATE '2009-04-16',DATE '2018-05-29',DATE '2018-05-30',DATE '2018-05-31',DATE '2017-08-08',DATE '2017-08-12',DATE '2015-11-01',DATE '2017-08-13',DATE '2017-08-17',DATE '2017-08-20',DATE '2017-08-23',DATE '2017-08-25',DATE '2017-08-26',DATE '2017-08-27',DATE '2017-08-28',DATE '2017-08-29',DATE '2017-08-30',DATE '2018-03-03',DATE '2018-03-09',DATE '2005-05-17',DATE '2005-05-18',DATE '2018-03-14',DATE '2018-03-15',DATE '2018-03-17',DATE '2017-11-01',DATE '2018-03-18',DATE '2017-11-02',DATE '2018-03-19',DATE '2018-03-20',DATE '2017-11-04',DATE '2018-03-21',DATE '2018-03-22',DATE '2018-03-23',DATE '2018-03-24',DATE '2018-03-25',DATE '2007-10-13',DATE '2018-03-26',DATE '2007-10-14',DATE '2018-03-27',DATE '2018-03-28',DATE '2018-03-29',DATE '2018-03-30',DATE '2018-03-31',DATE '2017-11-15',DATE '2017-11-18',DATE '2017-11-19',DATE '2011-07-03',DATE '2017-11-21',DATE '2017-11-22',DATE '2017-11-23',DATE '2013-04-21',DATE '2017-11-25',DATE '2017-11-26',DATE '2017-11-27',DATE '2017-11-28',DATE '2018-06-01',DATE '2017-01-05',DATE '2017-11-29',DATE '2018-06-02',DATE '2017-11-30',DATE '2018-06-03',DATE '2018-06-04',DATE '2018-06-05',DATE '2018-06-06',DATE '2018-06-07',DATE '2018-06-08',DATE '2018-06-09',DATE '2018-06-10',DATE '2018-06-11',DATE '2017-06-27',DATE '2018-06-12',DATE '2018-06-13',DATE '2018-06-14',DATE '2018-01-03',DATE '2018-06-15',DATE '2018-01-04',DATE '2018-06-16',DATE '2018-01-05',DATE '2018-06-17',DATE '2018-06-18',DATE '2018-06-19',DATE '2018-06-20',DATE '2018-01-09',DATE '2018-06-21',DATE '2018-06-22',DATE '2018-06-23',DATE '2018-06-24',DATE '2018-06-25',DATE '2018-06-26',DATE '2018-06-27',DATE '2018-01-16',DATE '2018-06-28',DATE '2018-06-29',DATE '2017-09-01',DATE '2018-06-30',DATE '2017-09-02',DATE '2017-09-03',DATE '2017-09-05',DATE '2018-01-22',DATE '2018-01-23',DATE '2017-09-07',DATE '2018-01-24',DATE '2017-09-08',DATE '2018-01-25',DATE '2017-09-09',DATE '2018-01-26',DATE '2017-09-10',DATE '2018-01-27',DATE '2017-09-13',DATE '2018-01-30',DATE '2018-01-31',DATE '2017-09-16',DATE '2017-09-19',DATE '2017-09-21',DATE '2017-09-22',DATE '2017-09-24',DATE '2017-09-27',DATE '2017-09-28',DATE '2018-04-01',DATE '2013-02-25',DATE '2018-04-02',DATE '2017-09-30',DATE '2018-04-03',DATE '2018-04-04',DATE '2018-04-05',DATE '2018-04-06',DATE '2018-04-07',DATE '2018-04-08',DATE '2017-04-24',DATE '2018-04-09',DATE '2018-04-10',DATE '2018-04-11',DATE '2018-04-12',DATE '2018-04-13',DATE '2018-04-14',DATE '2018-09-26',DATE '2013-10-06',DATE '2018-04-15',DATE '2018-09-27'),
      ELEC_SIGN_CAPT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      MERIT_EXP_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      SCRTY_DEP_INT_AMT DECIMAL(7,2) COMPRESS 0.00 ,
      ACT_CHANGE_REAS_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      BIRTH_YEAR INTEGER COMPRESS (1937 ,1938 ,1940 ,1941 ,1942 ,1943 ,1944 ,1945 ,1946 ,1947 ,1948 ,1949 ,1950 ,1951 ,1952 ,1953 ,1954 ,1955 ,1956 ,1957 ,1958 ,1959 ,1960 ,1961 ,1962 ,1963 ,1964 ,1965 ,1966 ,1967 ,1968 ,1969 ,1970 ,1971 ,1972 ,1973 ,1974 ,1975 ,1976 ,1977 ,1978 ,1979 ,1980 ,1981 ,1982 ,1983 ,1984 ,1985 ,1986 ,1987 ,1988 ,1989 ,1990 ,1991 ,1992 ,1993 ,1994 ,1995 ,1996 ,1997 ,1998 ,1999 ),
      INSTANCE_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('VB','VE','VN'),
      AREA_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('MW','NM','SO','WE'),
      CPNI_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('I','O'),
      STATIC_IP_ADDR_TYPE CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('R','U'),
      FIN_MKT_CD VARCHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('00H','00I','018','021','023','026','027','029','02A','02F','02G','031','037','039','03Z','040','044','046','048','04A','04B','04C','04E','04F','04G','04I','04J','04M','04O','04P','04Q','04T','04U','053','055','057','059','05A','05J','05K','05L','05M','060','063','065','066','06D','06E','06F','06I','06R','074','075','076','083','084','086','089','159','209','255','274','298','328','329','337','340','341','343','345','347','348','349','351','356','358','362','363','364','365','366','368','369','372','373','374','377','378','379','381','382','383','385','390','391','398','402','405','408','415','418','421','422','428','430','431','435','439','443','455','456','457','459','462','464','468','473','500','506','509','511','515','516','530','534','536','538','542','546','547','549','589','601','604','613','618','619','621','624','625','626','627','628','630','642','645','646','647','648','651','655','664','666','667','668','669','670','671','672','692','693','694','699','701','726','730','732','733','734','735','748','749','750','751','753','761','762','764','766','771','772','773','775','789','790','796','797','803','808','809','823','896','939','942','943','944','945','959','960','961','968','969','973','976','977','981','982','984','986','987','989','AIF','AIY','AJK','CTT','CUP','EFY','EHT'),
      LINE_TYPE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('H','O','T','W'),
      CNTRCT_TERM_ID VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('02','11','12','13','14','15','20','21','35','42','43','45','47','48'),
      CUST_ASSOC_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0','14'),
      ALLTEL_SRC_BILL_ACCT_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ALLTEL_SRC_SUB_UNIQUE_ID VARCHAR(28) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ALLTEL_MAKE VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ALLTEL_MODEL VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CUST_TYPE_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('BN','CO','FS','GV','IN','MJ'),
      VSN_CUST_TYPE_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('BD','BE','FS','NA','PE','SG'),
      MOB_CBR_NUM CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      DEVICE_TYPE_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('4GE','4GS','ATL','ODI','ONG','VZW'),
      VZW_IMSI VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      VF_IMSI VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      NE2_DSCNT_AMT DECIMAL(7,2) COMPRESS (0.00 ,50.00 ),
      AUP_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      SECURED_PROD_NM CHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2GIG Technologies 2GIG-CP21-345 ','4G Smartphone PDI               ','ADR6200                         ','A_V3A                           ','AgSense - Field Commander SL    ','AgSense Wagnet Field Commander  ','Alarm.com - ADC-200H-EVD        ','Alarm.com - ADC-200N-EVD        ','Alarm.com ADC-200C-EVD          ','Ambient X-3100                  ','Ambient X-3100-MC8355           ','Apple iPhone 4 16GB             ','Apple iPhone 4 32GB             ','Autonet - Kanaan 3              ','BlackBerry 8330                 ','BlackBerry 8830                 ','BlackBerry 9630                 ','BlackBerry Bold 9650            ','BlackBerry Bold 9650 6.0        ','BlackBerry Bold 9930            ','BlackBerry Curve 8330 Pink      ','BlackBerry Curve 8530 Black     ','BlackBerry Curve 8530 Violet    ','BlackBerry Curve 9330 Gray      ','BlackBerry Storm                ','BlackBerry Storm2 9550          ','CASIO ROCK C731                 ','CDM8630                         ','CalAmp - LMU-200                ','CalAmp - LMU-2120               ','CalAmp - LMU-2620               ','CalAmp - LMU-2630               ','CalAmp - LMU-2720               ','CalAmp - LMU-3030               ','CalAmp - LMU2610                ','CalAmp - PL641                  ','CalAmp - TTU-2830               ','CalAmp TTU-720                  ','Casio GzOne Commando            ','Casio GzOne Ravine              ','Casio GzOne Ravine 2            ','Casio GzOne Ravine II           ','Connected Holdings - ARROWCV002 ','Crane - WAN Module CDMA         ','DMP - 263C                      ','DMP - 263C 2nd Generation       ','DMP - CellComSL                 ','DROID X by Motorola             ','DuraXVPlus by Kyocera           ','Enfora - MT4100                 ','G and D 4FF BULK SIM CARD       ','G and D 4G 3FF SIM - DF         ','G and D 4G 3FF SIM Retail Stores','G and D 4G MFF2 SIM             ','G and D 4G NFC SIM - DF         ','G and D 4G NFC SIM Retail Stores','G and D 4G SIM Card - DF        ','GEMALTO 4FF BULK SIM CARD       ','GEMALTO 4FF DFILL SIM CARD      ','GND 4FF NFC SIM Retail Stores   ','GND M2M 2FF NONRUG SIM          ','GTO 4FF NFC SIM Retail Stores   ','GTO 4G M2M NONRUG CLOUD SIM     ','GTO Multi-Form-Factor SIM       ','Gemalto 4G 2FF-HD Cloud SIM     ','Gemalto 4G 2FF-HD SIM           ','Gemalto 4G 3FF SIM - DF         ','Gemalto 4G 3FF SIM Retail Stores','Gemalto 4G MFF2 Cloud SIM       ','Gemalto 4G MFF2 SIM             ','Gemalto 4G NFC SIM - DF         ','Gemalto 4G NFC SIM Retail Stores','Gemalto 4G SIM Card - DF        ','Gemalto 4G SIMCard Retail Stores','GenX Mobile - GNX-5P-C          ','Generac - Mobile Link           ','Geotab - GO7 CDMA_Verizon       ','GzOne Boulder C711SLXB          ','HTC DROID Incredible 2          ','HTC Incredible ADR6300          ','HTC Incredible ADR6300 SLCD     ','Home Phone Connect F256         ','IPAD2 WI-FI 3G 16GB BLACK       ','IPHONE 4 BLACK 8 GB             ','IPHONE 4 BLACK 8GB              ','IPHONE 4 WHITE 8 GB             ','IPHONE 4S BLACK 16GB            ','IPHONE 4S BLACK 32GB            ','IPHONE 4S BLACK 8GB             ','IPHONE 4S WHITE 16GB            ','InOne - IrisConnect             ','Invensys - CTLM                 ','IpDatatel - IPD BAT CU          ','Itron - 1210-AMP                ','Itron - OpenWay 3.1             ','Knack                           ','LG Ally VS740                   ','LG Cosmos - VN250               ','LG Cosmos 2                     ','LG Cosmos 3                     ','LG Cosmos Touch - VN270         ','LG Octane                       ','LG Revere - VN150               ','LG Revere 3                     ','LG enV3 - VX9200                ','LG env3 Maroon VX9200           ','LG-VX10000                      ','LG-VX10000 Silver               ','LG-VX11000                      ','LG-VX3200                       ','LG-VX3300                       ','LG-VX3400                       ','LG-VX4400                       ','LG-VX4500                       ','LG-VX4650                       ','LG-VX5200                       ','LG-VX5300                       ','LG-VX5400                       ','LG-VX5500                       ','LG-VX5600                       ','LG-VX6000                       ','LG-VX6100                       ','LG-VX8100                       ','LG-VX8300                       ','LG-VX8350                       ','LG-VX8350 Red                   ','LG-VX8360                       ','LG-VX8560 Black                 ','LG-VX8575                       ','LG-VX8600                       ','LG-VX8700                       ','LG-VX9100 Black                 ','LG-VX9100 Maroon                ','LG-VX9700                       ','LG-VX9900                       ','Laird - Orion                   ','Linear - 2GIG-CDMAV-A-GC3       ','MEI Group - ADV5000             ','MOBIS - PREMIUM-AVN GEN2.0      ','MOBIS - STD-AVN GEN4.5          ','MiFi2200                        ','Montage - MGCDMAV1              ','Motorola 120e                   ','Motorola DROID 3                ','Motorola DROID X 2GB            ','Motorola DROID X2               ','Motorola Droid 2                ','Motorola Droid 2 Global         ','Motorola E815                   ','Motorola K1m                    ','Motorola Limerick-VU204         ','Motorola MC959B                 ','Motorola RAZR V3c               ','Motorola V325                   ','Motorola V325i                  ','Motorola V3m                    ','Motorola V750                   ','Motorola V860                   ','Motorola W315                   ','Motorola W385                   ','Motorola W755 Black Slate       ','Motorola W755 Purple            ','Motorola W766                   ','Motorola a855                   ','Napco - SLE-CDMA-8D             ','Networkfleet - 5000CDMA         ','Networkfleet 5000CDMA-PCS3      ','Networkfleet Inc - 6100         ','Non-Branded 1x Only Module      ','Non-Branded EVDO Module         ','PC5750                          ','Passtime - PTE-3                ','Passtime - TRAX-4               ','Prepaid Samsung Gusto II        ','Q2438                           ','Qolsys - IQPanel                ','Queclink - GV55VC               ','SAMSUNG Gusto                   ','SCH-A870                        ','SCH-U350                        ','SCH-U450                        ','SCH-U450 Red                    ','SCH-U640                        ','SCH-a650                        ','SCH-a670                        ','SCH-a850                        ','SCH-a930                        ','SCH-a950                        ','SCH-u340                        ','SCH-u410                        ','SCH-u540                        ','SCH-u740 Black                  ','SCH-u750                        ','SCH-u960                        ','STM 3FF SIM Retail Stores       ','STM 4FF NFC SIM Retail Stores   ','STM 4FF SIM Retail Stores       ','Samsung Brightside              ','Samsung Convoy 3                ','Samsung Convoy II               ','Samsung Fascinate               ','Samsung Gusto 3 Prepay          ','Samsung Haven SCH-U320          ','Samsung Intensity II Blue       ','Samsung Intensity II Gray       ','Samsung Reality SCH-U820 Black  ','SimpliSafe - SSCDMA5            ','Smart Synch Inc. - SSI 1210 1x  ','SmartSynch Inc SSI Collector 1X ','SmartSynch Inc SSI kV2c 1X      ','SmartSynch SSI OpenWay 1X       ','Systech - IPG-8111              ','Systech - IPG-8111FO            ','Systech SFG-4x_3x_2x_1x_Fusion  ','Telcare BGM 1.5                 ','Telular - TG1VX003              ','Telular - TG4V0004              ','Test Device                     ','Transparent Tech - innov8-VN    ','Trilliant - CRDR-1010-SENT      ','UM175                           ','UPS DIAD IV                     ','USA Tech - ePort Telemeter      ','USA Technologies - EDGE         ','USA Technologies - G8-A         ','USB760                          ','Vivint - CP01 Novatel           ','Vivint - CP01 Telit             ','Xirgo - XT-2150CV               ','Xirgo - XT-3250CV               ','Xirgo - XT-3450CV               ','Xirgo - XT-6350CV               ','iPhone 4 White 16GB             '),
      DEVICE_PROD_NM VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Alarm.com - ADC-450L-A-V','Autonet - Kanaan4','Crane WAN LTE module T CR0028791','ePort Telemeter - LTE','HTC Thunderbolt ADR6400L LTE','IPAD 4G 32GB BLACK','IPAD AIR 16GB SPACE GRAY','IPAD AIR 2 64GB S GRAY','IPAD AIR 32GB SPACE GRAY','IPAD RETINA DISPLAY 16GB BLACK','IPAD RETINA DISPLAY 32GB BLACK','IPHONE 5 BLACK 16GB','IPHONE 5 BLACK 32GB','IPHONE 5 BLACK 64GB','IPHONE 5 WHITE 16GB','IPHONE 5 WHITE 32GB','iPhone 5C Blue 16GB','IPHONE 5C BLUE 8GB-USA','iPhone 5C Green 16GB','iPhone 5C Pink 16GB','iPhone 5C White 16GB','iPhone 5C White 32GB','IPHONE 5C WHITE 8GB -USA','iPhone 5S Gold 16GB','iPhone 5S Gold 32GB','iPhone 5S Silver 16GB','iPhone 5S Silver 32GB','iPhone 5S Space Gray 16GB','iPhone 5S Space Gray 32GB','iPhone 6 16GB Gold','iPhone 6 16GB Silver','iPhone 6 16GB Space Gray','iPhone 6 64GB Gold','iPhone 6 64GB Silver','iPhone 6 64GB Space Gray','iPhone 6 Plus 16GB Gold','iPhone 6 Plus 16GB Space Gray','iPhone 6 Plus 64GB Gold','iPhone 6 Plus 64GB Space Gray','iPhone 6S 16GB Space Gray','iPhone 6S 32GB Space Gray','iPhone 6S 64GB Rose Gold','iPhone 6S 64GB Space Gray','iPhone 7 Black 128GB','iPhone 7 Black 32GB','iPhone 7 Plus Black 128GB','iPhone 7 Plus Black 32GB','IPHONE 8 SPACE GRAY 64GB VZ','IPHONE SE SPACE GRAY 16GB','Itron - OpenWay 3.5 P','Itron - OpenWay 3.5 S','Jetpack 4G LTE MHS MiFi 7730L','LG Lucid','LG Optimus Zone 3 Subsidy Lock','Linear - 2GIG-LTEV-A-GC2','MEDTRONIC COMMDR FLEX CD320','MOBIS - D-Audio LTE','MOBIS - STD_AVN_GEN4.0_LTE','MOBIS D-AUDIO VOLTE','Motorola Droid 4','Motorola Droid Bionic','Motorola Droid Maxx 16GB Black','Motorola DROID RAZR M','Motorola DROID RAZR Maxx','Motorola DROID RAZR','Motorola DROID RAZR-16GB','NORTEK 2GIG-LTEV1-A-GC2','Pantech UML290','Pantech UML290VW-G','Pantech UML295','QolSys - IQPanel 2','SAM Galaxy Note 4 Charcoal Black','Samsung Galaxy Nexus','Samsung Galaxy Note 3','Samsung Galaxy Note II in Silver','SAMSUNG GALAXY NOTE5 BLACK 32 GB','Samsung Galaxy S 4 Black 16GB','Samsung Galaxy S 4 Black Mist','Samsung Galaxy S 4 White Frost','Samsung Galaxy S 5 Black','Samsung Galaxy S 5 White','Samsung Galaxy S III 16GB Black','Samsung Galaxy S III 16GB Blue','Samsung Galaxy S III 16GB White','Samsung Galaxy S6 Black 32GB','Samsung Galaxy S7 Black 32GB','Samsung Galaxy S7 Gold 32GB','Samsung Galaxy S8 Black','Samsung Galaxy Tab 2 7.0','Samsung Galaxy Tab E 8','Samsung SCH-I510','Samsung Stratosphere','Telular-TG4LV001','USB551L 4G USB Modem','Verizon Ellipsis 7','Verizon Ellipsis 8','VIVINT - CC03','VZ JETPACK 4G LTE MHS AC791L','VZ Jetpack 4G MHS 291L','VZ Jetpack 4G MHS 890L','VZ Jetpack 4G MHS MIFI 6620L','VZ Jetpack 4G MHS MIFI4510L','VZ Jetpack 4G MHS MIFI4620L','VZ Jetpack 4G MHS MIFI4620LE','VZ Jetpack 4G MHS MIFI5510L'),
      EQP_DEVICE_ID VARCHAR(256) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      STATIC_IPV6_ADDR VARCHAR(39) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      STATIC_IP_VER_NUM CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      LN_CREDIT_CLASS_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      GEO_OVRIDE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      LINE_BASE_IND VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Y','N'),
      ACSS_CALL_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      LN_ID VARCHAR(60) CHARACTER SET LATIN NOT CASESPECIFIC,
      LN_ID_TYPE VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('MDN','PMD'),
      LN_OF_SVC_ID_NO_P1 VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      LN_OF_SVC_ID_NO_P2 VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      BRAND_TYPE_CD VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC)
PRIMARY INDEX ( CUST_ID ,CUST_LINE_SEQ_ID )
PARTITION BY RANGE_N(EXP_DT  BETWEEN DATE '2002-11-01' AND DATE '2025-12-31' EACH INTERVAL '1' MONTH ,
 NO RANGE OR UNKNOWN)
INDEX ( CUST_ID )
INDEX ( MTN )
INDEX ( CUST_ID ,ACCT_NUM )
INDEX ( SLS_OUTLET_ID );

show view ntl_prd_allvm.cust_acct_v;

REPLACE VIEW NTL_PRD_ALLVM.CUST_ACCT_V
( SOR_ID
 ,CUST_ID
 ,ACCT_NUM
 ,MKT_CD
 ,BUS_NM
 ,NM_PRFX
 ,NM_MDLIN
 ,NM_FIRST
 ,NM_LAST
 ,CNTCT_NM
-- ,BUS_TEL_NUM      /* Removed April 2015 ER */
-- ,HOME_TEL_NUM     /* Removed April 2015 ER */
 ,LINE_IN_SVC_CNT
 ,ACCT_STATUS_IND
 ,ACCT_ESTB_DT
 ,ACCT_TERM_DT
 ,CREDIT_CLASS_IND
 ,CREDIT_CARD_TYPE
 ,CREDIT_SCORE
 ,CREDIT_CLASS_CATS
 ,CREDIT_CARD_FLAG
 ,CREDIT_UPD_DT
 ,EXP_FLAG
 ,BILL_CYCLE_IND
 ,FINAL_BILL_DT
 ,INTERNET_BILL_PRES_ENROLL_CD
 ,SIC_CD
 ,HIGH_VALUE_DT
 ,HIGH_VALUE_IND
 ,DUNS_NUM
 ,PYMNT_SCORE_IND
 ,SINGL_BILL_IND
 ,SINGL_BILL_ENROLL_DT
 ,SINGL_BILL_TERM_DT
-- ,EMAIL_ADDR          -- commented out per Mar 1, 2015 ER
 ,COLL_STATUS_IND
 ,CUST_CLASS_CD
 ,WO_REAS_CD
 ,WO_AMT
 ,WO_DT
 ,CONV_ACCT_STATUS_IND
 ,CONV_ACCT_TERM_DT
 ,SINGL_BILL_BTN
 ,BILL_FORMAT_CD
 ,GEO_CD
 ,GEO_IND
 ,CR_CREDIT_APP_NUM
 ,BUDGET_CTR_IND
 ,DUNS_LOC_NUM
 ,DUNS_TYPE_CD
 ,DUNS_CONF_IND
 ,DUNS_VZ_OWNER_CD
 ,DUNS_VZ_LIAB_CD
 ,LANG_PREF_IND
 ,HIGH_VALUE_SEG_IND
 ,MAJ_MKT_ID
 ,RLTD_ACCT_ID
 ,SUB_ACCT_ACCT_ESTB_DT
 ,SUB_ACCT_ACCT_STATUS_IND
 ,SUB_ACCT_ACCT_TERM_DT
 ,SUB_ACCT_BILL_CYCLE_IND
 ,SUB_ACCT_BILL_FORMAT_CD
 ,SUB_ACCT_BUS_NM
 ,SUB_ACCT_CNTCT_NM
 ,SUB_ACCT_CREDIT_CARD_FLAG
 ,SUB_ACCT_CREDIT_CARD_TYPE
-- ,SUB_ACCT_EMAIL_ADDR  -- commented out per Mar 1, 2015 ER
 ,SUB_ACCT_HOME_TEL_NUM
 ,SUB_ACCT_IBP_ENRL_CD
 ,SUB_ACCT_LANG_PREF_IND
 ,SUB_ACCT_MKT_CD
 ,SUB_ACCT_NM_FIRST
 ,SUB_ACCT_NM_LAST
 ,SUB_ACCT_NM_MDLIN
 ,XMKT_ACCT_IND
 ,XMKT_ACCT_NUM
 ,XMKT_INIT_ACCT_IND
 ,INTER_CO_CD
 ,COST_CTR_CD
 ,XMKT_EFF_DT
 ,SINGL_BILL_CHANGE_DT
 ,LATE_FEE_SPRSS_IND
 ,IBP_TYPE_CD
 ,IBP_ENROLL_DT
 ,SUB_ACCT_IBP_TYPE_CD
 ,SUB_ACCT_IBP_ENRL_DT
 ,CUST_TYPE_CD
 ,PYMNT_ENROLL_VENUE_CD
 ,PYMNT_ENROLL_DT
 ,BILL_METHOD_CD
 ,AFFIL_CD
 ,BILL_IN_ARREAR_IND
 ,REG_DT
 ,INSTANCE_IND
 ,LAST_UPD_DT
 ,HOME_AREA_CD
 ,VSN_CUST_TYPE_CD
 ,SINGL_BL_COMPANY_CD
 ,SINGL_BL_TERM_REAS_CD
 ,CUST_ASSOC_ID
-- ,TAX_ID
-- ,SUB_ACCT_TAX_ID
 ,ALLTEL_SRC_BILL_ACCT_ID
 ,BILL_PRSNT_METH_CD
-- ,MOB_CBR_NUM       /* Removed April 2015 ER */
 ,ECPD_QUAL_EVNT_CD
 ,BASE_BONUS_IND
 ,BASE_BONUS_ENROLL_DT
 ,EMAIL_ADDR_VALID_DT
 ,M2M_BILL_FORMAT_CD
 ,ORIG_ACCT_ESTB_DT
 ,INSERT_DT
 ,CUST_SSN_ESTB_DT
 ,MEDIA_TYPE_CD
 ,NON_MDN_LOS_CNT
 ,GEO_OVRIDE_CD  
 ,EDGE_LOC_ID
 ,DECEASED_IND
 ,DECEASED_REPORT_DT
)
AS LOCKING TABLE UDM_PRD_TBLS.CUST_ACCT FOR ACCESS
SELECT SOR_ID
      ,CUST_ID
      ,ACCT_NUM
      ,MKT_CD
      ,BUS_NM
      ,NM_PRFX
      ,NM_MDLIN
      ,NM_FIRST
      ,NM_LAST
      ,CNTCT_NM
--      ,BUS_TEL_NUM        /* Removed April 2015 ER */
--      ,HOME_TEL_NUM       /* Removed April 2015 ER */
      ,LINE_IN_SVC_CNT
      ,ACCT_STATUS_IND
      ,ACCT_ESTB_DT
      ,ACCT_TERM_DT
      ,CREDIT_CLASS_IND
      ,CREDIT_CARD_TYPE
      ,CREDIT_SCORE
      ,CREDIT_CLASS_CATS
      ,CREDIT_CARD_FLAG
      ,CREDIT_UPD_DT
      ,EXP_FLAG
      ,BILL_CYCLE_IND
      ,FINAL_BILL_DT
      ,INTERNET_BILL_PRES_ENROLL_CD
      ,SIC_CD
      ,HIGH_VALUE_DT
      ,HIGH_VALUE_IND
      ,DUNS_NUM
      ,PYMNT_SCORE_IND
      ,SINGL_BILL_IND
      ,SINGL_BILL_ENROLL_DT
      ,SINGL_BILL_TERM_DT
--      ,EMAIL_ADDR  -- commented out per Mar 1, 2015 ER
      ,COLL_STATUS_IND
      ,CUST_CLASS_CD
      ,WO_REAS_CD
      ,WO_AMT
      ,WO_DT
      ,CONV_ACCT_STATUS_IND
      ,CONV_ACCT_TERM_DT
      ,SINGL_BILL_BTN
      ,BILL_FORMAT_CD
      ,GEO_CD
      ,GEO_IND
      ,CR_CREDIT_APP_NUM
      ,BUDGET_CTR_IND
      ,DUNS_LOC_NUM
      ,DUNS_TYPE_CD
      ,DUNS_CONF_IND
      ,DUNS_VZ_OWNER_CD
      ,DUNS_VZ_LIAB_CD
      ,NULL AS LANG_PREF_IND
      ,HIGH_VALUE_SEG_IND
      ,MAJ_MKT_ID
      ,RLTD_ACCT_ID
      ,SUB_ACCT_ACCT_ESTB_DT
      ,SUB_ACCT_ACCT_STATUS_IND
      ,SUB_ACCT_ACCT_TERM_DT
      ,SUB_ACCT_BILL_CYCLE_IND
      ,SUB_ACCT_BILL_FORMAT_CD
      ,SUB_ACCT_BUS_NM
      ,SUB_ACCT_CNTCT_NM
      ,SUB_ACCT_CREDIT_CARD_FLAG
      ,SUB_ACCT_CREDIT_CARD_TYPE
--      ,SUB_ACCT_EMAIL_ADDR  -- commented per Mar 1, 2015 ER
      ,SUB_ACCT_HOME_TEL_NUM
      ,SUB_ACCT_IBP_ENRL_CD
      ,SUB_ACCT_LANG_PREF_IND
      ,SUB_ACCT_MKT_CD
      ,SUB_ACCT_NM_FIRST
      ,SUB_ACCT_NM_LAST
      ,SUB_ACCT_NM_MDLIN
      ,XMKT_ACCT_IND
      ,XMKT_ACCT_NUM
      ,XMKT_INIT_ACCT_IND
      ,INTER_CO_CD
      ,COST_CTR_CD
      ,XMKT_EFF_DT
      ,SINGL_BILL_CHANGE_DT
      ,LATE_FEE_SPRSS_IND
      ,IBP_TYPE_CD
      ,IBP_ENROLL_DT
      ,SUB_ACCT_IBP_TYPE_CD
      ,SUB_ACCT_IBP_ENRL_DT
      ,CUST_TYPE_CD
      ,PYMNT_ENROLL_VENUE_CD
      ,PYMNT_ENROLL_DT
      ,BILL_METHOD
      ,AFFIL_CD
      ,BILL_IN_ARREAR_IND
      ,REG_DT
      ,INSTANCE_IND
      ,LAST_UPD_DT
      ,HOME_AREA_CD
      ,VSN_CUST_TYPE_CD
      ,SINGL_BL_COMPANY_CD
      ,SINGL_BL_TERM_REAS_CD
      ,CUST_ASSOC_ID
 --   , CASE WHEN SUBSTR(SSN_EIN_ID,3,1) = '-' THEN SSN_EIN_ID ELSE NULL END AS TAX_ID
 --   , CASE WHEN SUBSTR(SUB_ACCT_SSN_EIN_ID,3,1) = '-' THEN SUB_ACCT_SSN_EIN_ID ELSE NULL END AS SUB_ACCT_TAX_ID
      ,ALLTEL_SRC_BILL_ACCT_ID
      ,BILL_PRSNT_METH_CD
 --     ,MOB_CBR_NUM   /* removed April 2015 ER */
      ,ECPD_QUAL_EVNT_CD
      ,BASE_BONUS_IND
      ,BASE_BONUS_ENROLL_DT
      ,EMAIL_ADDR_VALID_DT
      ,M2M_BILL_FORMAT_CD
      ,ORIG_ACCT_ESTB_DT
      ,INSERT_DT
      ,CUST_SSN_ESTB_DT
      ,MEDIA_TYPE_CD
      ,NON_MDN_LOS_CNT
      ,GEO_OVRIDE_CD  
      ,EDGE_LOC_ID
      ,DECEASED_IND
      ,DECEASED_REPORT_DT
  FROM UDM_PRD_TBLS.CUST_ACCT
 WHERE COALESCE(CUST_ASSOC_ID, ' ') <> '12';



show table  UDM_PRD_TBLS.CUST_ACCT;

CREATE SET TABLE UDM_PRD_TBLS.CUST_ACCT ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      CUST_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      ACCT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      MKT_CD CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('005 ','00H ','00I ','00J ','00K ','00L ','00M ','00N ','00O ','00P ','00S ','00T ','00W ','011 ','014 ','018 ','01P ','021 ','023 ','026 ','027 ','02A ','02F ','02G ','031 ','037 ','039 ','03O ','03Z ','040 ','044 ','048 ','053 ','055 ','057 ','05A ','05J ','05K ','05L ','05M ','05N ','05R ','060 ','063 ','065 ','066 ','06D ','06E ','06F ','06I ','06R ','074 ','075 ','076 ','083 ','084 ','086 ','089 ','159 ','161 ','209 ','255 ','274 ','298 ','312 ','325 ','328 ','329 ','337 ','340 ','341 ','345 ','347 ','348 ','349 ','351 ','356 ','358 ','362 ','364 ','365 ','366 ','368 ','369 ','372 ','373 ','374 ','375 ','377 ','378 ','381 ','382 ','383 ','385 ','390 ','391 ','398 ','401 ','402 ','405 ','415 ','418 ','421 ','422 ','428 ','429 ','430 ','431 ','435 ','439 ','441 ','443 ','445 ','455 ','456 ','457 ','458 ','459 ','462 ','463 ','464 ','465 ','466 ','468 ','473 ','500 ','506 ','509 ','511 ','515 ','516 ','529 ','530 ','534 ','536 ','538 ','542 ','544 ','545 ','546 ','547 ','548 ','549 ','589 ','601 ','604 ','610 ','612 ','613 ','617 ','618 ','619 ','621 ','624 ','625 ','626 ','627 ','628 ','629 ','630 ','632 ','635 ','638 ','640 ','642 ','645 ','646 ','647 ','648 ','651 ','655 ','662 ','664 ','666 ','667 ','668 ','669 ','670 ','671 ','672 ','681 ','682 ','692 ','693 ','694 ','697 ','699 ','702 ','717 ','723 ','726 ','730 ','731 ','732 ','733 ','734 ','735 ','736 ','737 ','738 ','739 ','740 ','741 ','742 ','743 ','744 ','745 ','748 ','749 ','751 ','753 ','761 ','762 ','764 ','766 ','768 ','771 ','772 ','773 ','775 ','790 ','796 ','803 ','808 ','809 ','815 ','818 ','823 ','824 ','847 ','853 ','889 ','896 ','938 ','939 ','940 ','942 ','943 ','954 ','959 ','960 ','961 ','968 ','969 ','973 ','974 ','976 ','977 ','981 ','982 ','984 ','986 ','987 ','989 '),
      BUS_NM VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      NM_PRFX VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      NM_MDLIN CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      NM_FIRST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AARON','ADAM','ALAN','ALEX','ALEXANDER','AMANDA','AMBER','AMY','ANDREA','ANDREW','ANGELA','ANN','ANNA','ANTHONY','ASHLEY','AUSTIN','BARBARA','BENJAMIN','BETTY','BRADLEY','BRANDON','BRENDA','BRIAN','BRITTANY','BRUCE','BRYAN','CARL','CARLOS','CAROL','CAROLYN','CATHERINE','CHAD','CHARLES','CHERYL','CHRIS','CHRISTINA','CHRISTINE','CHRISTOPHER','CINDY','CODY','CRAIG','CRYSTAL','CYNTHIA','DANIEL','DANIELLE','DAVID','DAWN','DEBORAH','DEBRA','DENISE','DENNIS','DIANA','DIANE','DONALD','DONNA','DOUGLAS','EDWARD','ELIZABETH','EMILY','EPAY','ERIC','ERIN','FRANK','GARY','GEORGE','GERALD','GREGORY','HEATHER','JACK','JACOB','JACQUELINE','JAMES','JAMIE','JANE','JANET','JANICE','JASON','JEAN','JEFF','JEFFREY','JENNIFER','JEREMY','JERRY','JESSE','JESSICA','JOAN','JOE','JOEL','JOHN','John','JONATHAN','JORDAN','JOSE','JOSEPH','JOSHUA','JOYCE','JUAN','JUDITH','JUDY','JULIE','JUSTIN','KAREN','KATHERINE','KATHLEEN','KATHRYN','KATHY','KEITH','KELLY','KENNETH','KEVIN','KIM','KIMBERLY','KYLE','LARRY','LAURA','LAUREN','LAWRENCE','LESLIE','LINDA','LISA','LORI','LUIS','MARGARET','MARIA','MARK','MARTHA','MARTIN','MARY','MATTHEW','MEGAN','MELISSA','MICHAEL','Michael','MICHELLE','MIKE','NANCY','NATHAN','NICHOLAS','NICOLE','No','NO','OAS','PAMELA','PATRICIA','PATRICK','PAUL','PAULA','PETER','PHILIP','PHILLIP','PHONEINTHEBOX','PREPAID','RACHEL','RANDY','RAYMOND','REBECCA','RICHARD','ROBERT','ROBIN','ROGER','RONALD','RYAN','SAMANTHA','SAMUEL','SANDRA','SARA','SARAH','SCOTT','SEAN','SHANNON','SHARON','SHAWN','SHIRLEY','STEPHANIE','STEPHEN','STEVE','STEVEN','SUSAN','TAMMY','TERESA','TERRY','THERESA','THOMAS','TIFFANY','TIM','TIMOTHY','TINA','TODD','TONY','TRACY','TRAVIS','TYLER','Update','UPDATE','VICTOR','VICTORIA','WALTER','WAYNE','WENDY','WILLIAM','ZACHARY'),
      NM_LAST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('ADAMS','ALEXANDER','ALLEN','ANDERSON','BAILEY','BAKER','BARNES','BELL','BENNETT','BOX','BROOKS','BROWN','BUTLER','CAMPBELL','CARTER','CLARK','COLEMAN','COLLINS','COOK','COOPER','COX','CRUZ','CUSTOMER','DAVIS','DIAZ','EDWARDS','EPAY','EVANS','FISHER','FLORES','FOSTER','GARCIA','GOMEZ','GONZALEZ','GRAHAM','GRAY','GREEN','HALL','HAMILTON','HARRIS','HENDERSON','HERNANDEZ','HILL','HOWARD','HUGHES','IN THE','INFO','Info','JACKSON','JAMES','JENKINS','JOHNSON','Johnson','Jones','JONES','JORDAN','KELLY','KIM','KING','LEE','LEWIS','LONG','LOPEZ','MARTIN','MARTINEZ','MILLER','MITCHELL','MOORE','MORGAN','MORRIS','MURPHY','MYERS','NAME','NELSON','NGUYEN','PARKER','PATTERSON','PEREZ','PERRY','PETERSON','PHILLIPS','PHONEINTHEBOX','POWELL','PRICE','RAMIREZ','REED','REYES','REYNOLDS','RICHARDSON','RIVERA','ROBERTS','ROBINSON','RODRIGUEZ','ROGERS','ROSS','RUSSELL','SANCHEZ','SANDERS','SCOTT','SIMMONS','SMITH','Smith','STEWART','SULLIVAN','TAYLOR','THOMAS','THOMPSON','TORRES','TURNER','UPDATE','USER','VAL','WALKER','WARD','WATSON','WEST','WHITE','WILLIAMS','WILSON','WOOD','WRIGHT','YOUNG'),
      CNTCT_NM VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      BUS_TEL_NUM CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('7777777777','8882946804'),
      HOME_TEL_NUM CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LINE_IN_SVC_CNT INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ),
      ACCT_STATUS_IND VARCHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A','D','FB','G','W'),
      ACCT_ESTB_DT DATE FORMAT 'YYYY/MM/DD',
      ACCT_TERM_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      CREDIT_CLASS_IND VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CREDIT_CARD_TYPE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AE','VM'),
      CREDIT_SCORE INTEGER COMPRESS ,
      CREDIT_CLASS_CATS CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      CREDIT_CARD_FLAG CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      CREDIT_UPD_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      EXP_FLAG CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      BILL_CYCLE_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1 ','10','11','12','13','14','15','16','17','18','19','2 ','20','21','22','23','24','25','26','27','28','29','3 ','30','4 ','5 ','6 ','7 ','8 ','9 '),
      FINAL_BILL_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      SSN_EIN_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      INTERNET_BILL_PRES_ENROLL_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('DE','EN','EP','RN','RP'),
      SIC_CD CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS '    ',
      HIGH_VALUE_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      HIGH_VALUE_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      DUNS_NUM CHAR(9) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      PYMNT_SCORE_IND INTEGER COMPRESS (0 ,1 ),
      SINGL_BILL_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      SINGL_BILL_ENROLL_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      SINGL_BILL_TERM_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      EMAIL_ADDR VARCHAR(60) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('','Decline@vzw.com','DECLINE@VZW.COM','N@n.com','No@no.com','NO@NO.COM','no@no.com','None@none.com','SW@SDA.COM','Update@VZW.com'),
      COLL_STATUS_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CUST_CLASS_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('DCB','E15'),
      LAST_UPD_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2022-09-11',DATE '2022-09-13',DATE '2022-09-14',DATE '2015-10-27',DATE '2022-09-17',DATE '2022-09-18',DATE '2022-09-20',DATE '2022-09-21',DATE '2022-09-22',DATE '2022-09-23',DATE '2022-09-24',DATE '2019-07-17',DATE '2022-09-25',DATE '2022-09-27',DATE '2022-09-28',DATE '2022-09-29',DATE '2022-09-30',DATE '2022-10-01',DATE '2022-10-02',DATE '2022-10-03',DATE '2022-10-04',DATE '2022-10-05',DATE '2022-10-06',DATE '2022-10-07',DATE '2022-10-08',DATE '2022-10-09',DATE '2022-10-10',DATE '2022-10-11',DATE '2022-10-12',DATE '2022-10-13',DATE '2022-10-14'),
      WO_REAS_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      WO_AMT DECIMAL(10,2) COMPRESS 0.00 ,
      WO_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      CONV_ACCT_STATUS_IND CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CONV_ACCT_TERM_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      SINGL_BILL_BTN VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS '9999999999999',
      BILL_FORMAT_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('DT','SM'),
      GEO_CD CHAR(14) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('USA01101510000','USA04013000000','USA04013120000','USA04013274000','USA04013460000','USA04013550000','USA04013650000','USA04019770000','USA06001530000','USA06019270000','USA06029035260','USA06037430000','USA06037440000','USA06059367700','USA06065620000','USA06067640000','USA06073660000','USA06075670000','USA06085680000','USA08005040000','USA08031200000','USA08041A00080','USA09001000000','USA09003000000','USA09009000000','USA10003000000','USA10005000000','USA11001500000','USA12021000000','USA12031350000','USA12057710000','USA12081000000','USA12083000000','USA12095000000','USA12099000000','USA12105000000','USA13067000000','USA13121040000','USA13135000000','USA16001088300','USA17031140000','USA18097360030','USA20173790000','USA21111480060','USA24510040000','USA25017000000','USA25023000000','USA25025070000','USA25027000000','USA26099000000','USA26125000000','USA26163000000','USA26163220000','USA27053430000','USA31055370000','USA31109280000','USA32003319000','USA32003400000','USA33011000000','USA33015000000','USA34005000000','USA34013000000','USA34023000000','USA34025000000','USA34027000000','USA34029000000','USA34035000000','USA35001020000','USA36005510000','USA36027000000','USA36029000000','USA36047510000','USA36055000000','USA36061510000','USA36067000000','USA36081510000','USA36085510000','USA37063190000','USA37067750000','USA37081280000','USA37119120000','USA37183000000','USA37183550000','USA39035160000','USA39049180000','USA39061150000','USA39095770000','USA41051590000','USA42003000000','USA42017000000','USA42029000000','USA42045000000','USA42071000000','USA42091000000','USA42101600000','USA45045000000','USA45083000000','USA47037520060','USA47093000000','USA47157480000','USA48029650000','USA48113190000','USA48141240000','USA48201000000','USA48201350000','USA48439270000','USA48453050000','USA51041000000','USA51059000000','USA51550160000','USA51810820000','USA53033630000','USA55079530000'),
      GEO_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('02','G2'),
      CR_CREDIT_APP_NUM CHAR(9) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      BUDGET_CTR_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DUNS_LOC_NUM VARCHAR(9) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('017569534','079383820','105469758','835543521','A00385117','A00951408'),
      DUNS_TYPE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('PE','SC'),
      DUNS_CONF_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('02','06'),
      DUNS_VZ_OWNER_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      DUNS_VZ_LIAB_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LANG_PREF_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      HIGH_VALUE_SEG_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      MAJ_MKT_ID CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0001','0002','0003','0004','0009','0010','0011','0012','0013','0016','0017','0018','0019','0020','0021','0022','0023','0024','0025','0026','0027','0028','0030','0031','0032','0033','0034','0035','0036','0037','0038','0039','0040','0041','0042','0044','0045','0046','0047','0048','0049','0050','0051','0053','0054','0055','0056','0057','0059','0060','0061','0062','0063','0064','0065','0066','0067','0068','0069','0070','0071','9999'),
      RLTD_ACCT_ID VARCHAR(31) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AMBEL','DELTO','DOD8E','EMFED','FBIZC','FREVL','GID02','NAE17','NPPFE','NPPMC','NPPME','NPRIV','NS5E','NTE01','NYOG3','NYSEM','POSEM','TXECM','UPC01','UPE01','VCEMP','VHANE','WELEP','WEMCA'),
      SUB_ACCT_ACCT_ESTB_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      SUB_ACCT_ACCT_STATUS_IND VARCHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'D',
      SUB_ACCT_ACCT_TERM_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      SUB_ACCT_BILL_CYCLE_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_BILL_FORMAT_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_BUS_NM VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_CNTCT_NM VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_CREDIT_CARD_FLAG CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      SUB_ACCT_CREDIT_CARD_TYPE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_EMAIL_ADDR VARCHAR(60) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_HOME_TEL_NUM CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_IBP_ENRL_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_LANG_PREF_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      SUB_ACCT_MKT_CD CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_NM_FIRST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_NM_LAST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_NM_MDLIN CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SUB_ACCT_SSN_EIN_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      XMKT_ACCT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      XMKT_ACCT_NUM VARCHAR(36) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      XMKT_INIT_ACCT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      XMKT_LAST_UPD_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      INTER_CO_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      COST_CTR_CD CHAR(19) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      XMKT_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      SINGL_BILL_CHANGE_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      LATE_FEE_SPRSS_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      IBP_TYPE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      IBP_ENROLL_DT DATE FORMAT 'yy/mm/dd' COMPRESS ,
      SUB_ACCT_IBP_TYPE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      SUB_ACCT_IBP_ENRL_DT DATE FORMAT 'yy/mm/dd' COMPRESS ,
      CUST_TYPE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'IN',
      PYMNT_ENROLL_VENUE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('HP','MA'),
      PYMNT_ENROLL_DT DATE FORMAT 'yyyy-mm-dd' COMPRESS ,
      BILL_METHOD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CC','DB'),
      AFFIL_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      BILL_IN_ARREAR_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      REG_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      INSTANCE_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('EP','VB','VE','VN','VW'),
      HOME_AREA_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('MW','NM','SO','WE'),
      VSN_CUST_TYPE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'PE',
      SINGL_BL_COMPANY_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      SINGL_BL_TERM_REAS_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CUST_ASSOC_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0','14'),
      ALLTEL_SRC_BILL_ACCT_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      BILL_PRSNT_METH_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      MOB_CBR_NUM CHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ECPD_QUAL_EVNT_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      BASE_BONUS_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      BASE_BONUS_ENROLL_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      EMAIL_ADDR_VALID_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      M2M_BILL_FORMAT_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      ORIG_ACCT_ESTB_DT DATE FORMAT 'YYYY-MM-DD',
      INSERT_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      CUST_SSN_ESTB_DT DATE FORMAT 'YYYY-MM-DD',
      MEDIA_TYPE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      NON_MDN_LOS_CNT INTEGER COMPRESS 0 ,
      GEO_OVRIDE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      EDGE_LOC_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS '',
      DECEASED_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DECEASED_REPORT_DT DATE FORMAT 'YYYY-MM-DD')
PRIMARY INDEX ( CUST_ID ,ACCT_NUM )
INDEX ( CUST_ID )
INDEX ( RLTD_ACCT_ID )
INDEX ( XMKT_ACCT_NUM )
INDEX ( LAST_UPD_DT );

show view ntl_prd_allvm.loan_sum_fact_v;

REPLACE VIEW NTL_PRD_ALLVM.LOAN_SUM_FACT_V
(
RPT_MTH
,LOAN_NUM
,SOR_ID
,CUST_ID
,CUST_LINE_SEQ_ID
,ACCT_NUM
,VINTAGE_MTH
,VSN_CREDIT_CLASS_IND
,CREDIT_RISK_TYPE_CD
,CURR_CONTRACT_TERM
,EQP_PROD_NM
,SLS_OUTLET_ID
,FIN_MKT_CD
--,FICO_SCORE
,ACCT_ESTB_DT
,ORIG_ACCT_ESTB_DT
,CUST_SSN_ESTB_DT
,LOAN_TENURE_MTH
,LOAN_ORIG_ACCT_TENURE_MTH
,LOAN_ORIG_CUST_SSN_TENURE_MTH
,LOAN_CREATE_DT
,LOAN_SALES_DT
,UPG_OPTION_CD
,UPG_ELIG_CD
,TRANCHE_NUM
,TRANCHE_GRP_CD
,TRANCHE_DT
,SECURITIZED_IND
,AGING_CD
,STATE_CD
,LOAN_TERM_MTH_QTY
,LOAN_UPG_PCT
,ITEM_CD
,LOAN_FIRST_COLL_AMT
,LOAN_MTH_PYMNT_AMT
,FIRST_PYMNT_TENDER_INELIG_IND
,LOAN_STATUS_IND
,LEGAL_ENTITY
,LOAN_ISSUED_CNT
,LOAN_ISSUED_EXCL_CANCEL_CNT
,LOAN_W_INS_CNT
,LOAN_OUTSTANDING_CNT
,FULL_INSTALL_SATISFIED_CNT
,INSTALL_PYMNT_OUTSTANDING_CNT
,BUYOUT_CNT
,VOL_BUYOUT_CNT
,INVOL_BUYOUT_CNT
,EU_BUYOUT_CNT
,CANCEL_CNT
,DP_WO_CNT
,CREDIT_CNT
,LOAN_PAID_IN_FULL_CNT
,INSTALL_LOAN_AMT
,ORIG_DEVICE_AMT
,LOAN_DOWN_PYMNT_AMT
,FULL_OUTSTANDING_BAL_AMT
,UNBILLED_LOAN_BAL_AMT
,BILLED_UNCOLLECTED_BAL_AMT
,INSTALL_PAID_AMT
,BUYOUT_AMT
,VOL_BUYOUT_AMT
,INVOL_BUYOUT_AMT
,U_BUYOUT_AMT
,CANCEL_AMT
,DP_WO_AMT
,CREDIT_AMT
,ISSUED_INSTALL_LOAN_AMT
,INSTANCE_IND
,E_BUYOUT_AMT
,E_BUYOUT_REMAIN_AMT
,U_BUYOUT_REMAIN_AMT
,GIFT_CARD_AMT
,LOAN_ORIG_CUST_ID
,LOAN_ORIG_CUST_LINE_SEQ_ID
,LOAN_ORIG_ACCT_NUM
,LOAN_ORIG_EQP_PROD_NM
,FIRST_PYMNT_MADE_IND
,CREDIT_APP_NUM
,CD_CREDIT_CLASS_IND
,CREDIT_SCORE
,CREDIT_SCORE_MODEL
,LOAN_ORIG_ITEM_CD
--,WO_REAS_CD
,RPT_PPLAN_CD
,REQUIRED_DOWN_PYMNT_AMT
--,LOAN_ORIG_FICO_SCORE
--,LOAN_ORIG_FICO_SCORE_EFF_DT
--,LOAN_ORIG_FICO_LAST_UPD_DT
,CUST_ID_LOAN_ASSOC_DT
,CUST_ACCT_LOAN_ASSOC_DT
--,FICO_SCORE_EFF_DT
--,FICO_LAST_UPD_DT
,CREDIT_CLASS_IND
,SCORE_VALUE
,WO_REAS_CLASS_CD
,RISK_PROFILE_ID
,VSN_WO_REAS_CD
,LOAN_ORIG_ACCT_ESTB_DT
,LOAN_ORIG_CUST_SSN_ESTB_DT
,LOAN_ORIG_SSN_MASK_ID
,LOAN_ORIG_TAX_ID_MASK_ID
,LOAN_ORIG_SSN_TOKEN_ID
,LOAN_ORIG_TAX_ID_TOKEN_ID
,LOAN_INACTIVE_DT
,WO_DT
,MANUAL_CONTRACT_IND
,OLDEST_CUST_ESTB_DT
,LOAN_ORIG_OLDEST_CUST_ESTB_DT
--,ACTIVE_LOAN_DP_CNT
--,ACTIVE_FBUYOUT_LOAN_DP_CNT
,BOGO_TYPE_CD
,BOGO_ASSOC_LOAN_NUM
,BOGO_OFFER_STATUS_CD
,LINE_UPG_ADD_CD
,MANAGED_IND
,LOAN_CNT
,VSN_CUST_TYPE_CD 
,MKT_CD
,TREASURY_TENURE_DAYS
,COLL_STATUS_IND
,BK_POST_PETITION_IND
,ECPD_PROFILE_ID
,BUS_DATA_EFF_DT
,BUS_DATA_LAST_UPD_DT
,LN_CREDIT_CLASS_IND
,INSERT_DT
)
AS LOCKING ROW FOR ACCESS
SELECT 
RPT_MTH
,LOAN_NUM
,SOR_ID
,CUST_ID
,CUST_LINE_SEQ_ID
,ACCT_NUM
,VINTAGE_MTH
,VSN_CREDIT_CLASS_IND
,CREDIT_RISK_TYPE_CD
,CURR_CONTRACT_TERM
,EQP_PROD_NM
,SLS_OUTLET_ID
,FIN_MKT_CD
--,FICO_SCORE
,ACCT_ESTB_DT
,ORIG_ACCT_ESTB_DT
,CUST_SSN_ESTB_DT
,LOAN_TENURE_MTH
,LOAN_ORIG_ACCT_TENURE_MTH
,LOAN_ORIG_CUST_SSN_TENURE_MTH
,LOAN_CREATE_DT
,LOAN_SALES_DT
,UPG_OPTION_CD
,UPG_ELIG_CD
,TRANCHE_NUM
,TRANCHE_GRP_CD
,TRANCHE_DT
,SECURITIZED_IND
,AGING_CD
,STATE_CD
,LOAN_TERM_MTH_QTY
,LOAN_UPG_PCT
,ITEM_CD
,LOAN_FIRST_COLL_AMT
,LOAN_MTH_PYMNT_AMT
,FIRST_PYMNT_TENDER_INELIG_IND
,LOAN_STATUS_IND
,LEGAL_ENTITY
,LOAN_ISSUED_CNT
,LOAN_ISSUED_EXCL_CANCEL_CNT
,LOAN_W_INS_CNT
,LOAN_OUTSTANDING_CNT
,FULL_INSTALL_SATISFIED_CNT
,INSTALL_PYMNT_OUTSTANDING_CNT
,BUYOUT_CNT
,VOL_BUYOUT_CNT
,INVOL_BUYOUT_CNT
,EU_BUYOUT_CNT
,CANCEL_CNT
,DP_WO_CNT
,CREDIT_CNT
,LOAN_PAID_IN_FULL_CNT
,INSTALL_LOAN_AMT
,ORIG_DEVICE_AMT
,LOAN_DOWN_PYMNT_AMT
,FULL_OUTSTANDING_BAL_AMT
,UNBILLED_LOAN_BAL_AMT
,BILLED_UNCOLLECTED_BAL_AMT
,INSTALL_PAID_AMT
,BUYOUT_AMT
,VOL_BUYOUT_AMT
,INVOL_BUYOUT_AMT
,U_BUYOUT_AMT
,CANCEL_AMT
,DP_WO_AMT
,CREDIT_AMT
,ISSUED_INSTALL_LOAN_AMT
,INSTANCE_IND
,E_BUYOUT_AMT
,E_BUYOUT_REMAIN_AMT
,U_BUYOUT_REMAIN_AMT
,GIFT_CARD_AMT
,LOAN_ORIG_CUST_ID
,LOAN_ORIG_CUST_LINE_SEQ_ID
,LOAN_ORIG_ACCT_NUM
,LOAN_ORIG_EQP_PROD_NM
,FIRST_PYMNT_MADE_IND
,CREDIT_APP_NUM
,CD_CREDIT_CLASS_IND
,CREDIT_SCORE
,CREDIT_SCORE_MODEL
,LOAN_ORIG_ITEM_CD
--,WO_REAS_CD
,RPT_PPLAN_CD
,REQUIRED_DOWN_PYMNT_AMT
--,LOAN_ORIG_FICO_SCORE
--,LOAN_ORIG_FICO_SCORE_EFF_DT
--,LOAN_ORIG_FICO_LAST_UPD_DT
,CUST_ID_LOAN_ASSOC_DT
,CUST_ACCT_LOAN_ASSOC_DT
--,FICO_SCORE_EFF_DT
--,FICO_LAST_UPD_DT
,CREDIT_CLASS_IND
,SCORE_VALUE
,WO_REAS_CLASS_CD
,RISK_PROFILE_ID
,VSN_WO_REAS_CD
,LOAN_ORIG_ACCT_ESTB_DT
,LOAN_ORIG_CUST_SSN_ESTB_DT
,LOAN_ORIG_SSN_MASK_ID
,LOAN_ORIG_TAX_ID_MASK_ID
,LOAN_ORIG_SSN_TOKEN_ID
,LOAN_ORIG_TAX_ID_TOKEN_ID
,LOAN_INACTIVE_DT
,WO_DT
,MANUAL_CONTRACT_IND
,OLDEST_CUST_ESTB_DT
,LOAN_ORIG_OLDEST_CUST_ESTB_DT
--,ACTIVE_LOAN_DP_CNT
--,ACTIVE_FBUYOUT_LOAN_DP_CNT
,BOGO_TYPE_CD
,BOGO_ASSOC_LOAN_NUM
,BOGO_OFFER_STATUS_CD
,LINE_UPG_ADD_CD
,MANAGED_IND
,LOAN_CNT
,VSN_CUST_TYPE_CD 
,MKT_CD
,TREASURY_TENURE_DAYS
,COLL_STATUS_IND
,BK_POST_PETITION_IND
,ECPD_PROFILE_ID
,BUS_DATA_EFF_DT
,BUS_DATA_LAST_UPD_DT
,LN_CREDIT_CLASS_IND
,INSERT_DT
FROM UDM_PRD_TBLS.LOAN_SUM_FACT;

show table  UDM_PRD_TBLS.LOAN_SUM_FACT;

CREATE SET TABLE UDM_PRD_TBLS.LOAN_SUM_FACT ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      RPT_MTH DATE FORMAT 'YYYY-MM-DD',
      LOAN_NUM VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      CUST_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      CUST_LINE_SEQ_ID CHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      ACCT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      VINTAGE_MTH DATE FORMAT 'YYYY-MM-DD' COMPRESS (DATE '2017-12-01',DATE '2014-10-01',DATE '2016-02-01',DATE '2017-07-01',DATE '2014-05-01',DATE '2015-10-01',DATE '2017-02-01',DATE '2018-07-01',DATE '2015-05-01',DATE '2018-02-01',DATE '2016-10-01',DATE '2016-05-01',DATE '2017-10-01',DATE '2014-08-01',DATE '2017-05-01',DATE '2018-10-01',DATE '2014-03-01',DATE '2015-08-01',DATE '2018-05-01',DATE '2013-11-01',DATE '2015-03-01',DATE '2016-08-01',DATE '2014-11-01',DATE '2016-03-01',DATE '2017-08-01',DATE '2014-06-01',DATE '2015-11-01',DATE '2017-03-01',DATE '2018-08-01',DATE '2014-01-01',DATE '2015-06-01',DATE '2018-03-01',DATE '2016-11-01',DATE '2013-09-01',DATE '2015-01-01',DATE '2016-06-01',DATE '2017-11-01',DATE '2014-09-01',DATE '2016-01-01',DATE '2017-06-01',DATE '2018-11-01',DATE '2014-04-01',DATE '2015-09-01',DATE '2017-01-01',DATE '2018-06-01',DATE '2013-12-01',DATE '2015-04-01',DATE '2018-01-01',DATE '2016-09-01',DATE '2014-12-01',DATE '2016-04-01',DATE '2017-09-01',DATE '2014-07-01',DATE '2015-12-01',DATE '2017-04-01',DATE '2018-09-01',DATE '2014-02-01',DATE '2015-07-01',DATE '2018-04-01',DATE '2016-12-01',DATE '2013-10-01',DATE '2015-02-01',DATE '2016-07-01'),
      VSN_CREDIT_CLASS_IND VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A1','AA','B','C','CA','CB','CC'),
      CREDIT_RISK_TYPE_CD VARCHAR(11) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1','2','3','4','A1','AA','B','BT','C','CA','CB','CC','D1','D2','UNTG'),
      CURR_CONTRACT_TERM VARCHAR(12) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'EDGE',
      EQP_PROD_NM VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('All New HTC One Metal Gray','APPLE WATCH S3 42 SG AL BLK SP','Brigadier by Kyocera','DROID MAXX 2 Blue','DROID MAXX 2 White','Droid Maxx by Motorola','Droid Mini by Motorola in Red','Droid Mini by Motorola','DROID TURBO 2 BLK Leather 32GB','DROID TURBO 2 BLK Soft-Grip 32GB','DROID TURBO 2 Grey Nylon 32GB','DROID TURBO 2 WHT Soft-Grip 32GB','DROID TURBO BY MOT GRAY BN B','DROID TURBO BY MOT SAPPH BL BN','DROID TURBO by MOTOROLA BLACK BN','DROID TURBO by MOTOROLA BLK MGF','DROID TURBO by MOTOROLA RED MGF','DROID TURBO MOTOROLA BLK BN 64GB','Droid Ultra by Motorola','DuraXVPlus by Kyocera','Galaxy S9 Plus Coral Blue','Galaxy S9 Plus Lilac Purple','Galaxy S9 Plus Midnight Black','Google Nexus 6','HTC 10','HTC Desire 526','HTC Desire 626','HTC One M9 Metal Gray','HTC One M9 Silver Gold','HTC ONE','IPAD AIR 2 16GB S GRAY','IPAD AIR 2 64GB GOLD','IPAD AIR 2 64GB S GRAY','IPAD PRO 128GB GRAY','iPhone 5C Blue 16GB','IPHONE 5C BLUE 8GB-USA','iPhone 5C Green 16GB','iPhone 5C Pink 16GB','IPHONE 5C PINK 8GB-USA','iPhone 5C White 16GB','IPHONE 5C WHITE 8GB -USA','iPhone 5S Gold 16GB','iPhone 5S Gold 32GB','iPhone 5S Silver 16GB','iPhone 5S Silver 32GB','iPhone 5S Space Gray 16GB','iPhone 5S Space Gray 32GB','iPhone 5S Space Gray 64GB','iPhone 6 128GB Gold','iPhone 6 128GB Silver','iPhone 6 128GB Space Gray','iPhone 6 16GB Gold','iPhone 6 16GB Silver','iPhone 6 16GB Space Gray','iPhone 6 64GB Gold','iPhone 6 64GB Silver','iPhone 6 64GB Space Gray','iPhone 6 Plus 128GB Gold','iPhone 6 Plus 128GB Space Gray','iPhone 6 Plus 16GB Gold','iPhone 6 Plus 16GB Silver','iPhone 6 Plus 16GB Space Gray','iPhone 6 Plus 64GB Gold','iPhone 6 Plus 64GB Silver','iPhone 6 Plus 64GB Space Gray','iPhone 6S 128GB Gold','iPhone 6S 128GB Rose Gold','iPhone 6S 128GB Silver','iPhone 6S 128GB Space Gray','iPhone 6S 16GB Gold','iPhone 6S 16GB Rose Gold','iPhone 6S 16GB Silver','iPhone 6S 16GB Space Gray','iPhone 6S 32GB Gold','iPhone 6S 32GB Rose Gold','iPhone 6S 32GB Silver','iPhone 6S 32GB Space Gray','iPhone 6S 64GB Gold','iPhone 6S 64GB Rose Gold','iPhone 6S 64GB Silver','iPhone 6S 64GB Space Gray','iPhone 6S Plus 128GB Rose Gold','iPhone 6S Plus 128GB Space Gray','iPhone 6S Plus 16GB Gold','iPhone 6S Plus 16GB Rose Gold','iPhone 6S Plus 16GB Silver','iPhone 6S Plus 16GB Space Gray','iPhone 6S Plus 32GB Rose Gold','iPhone 6S Plus 32GB Space Gray','iPhone 6S Plus 64GB Gold','iPhone 6S Plus 64GB Rose Gold','iPhone 6S Plus 64GB Silver','iPhone 6S Plus 64GB Space Gray','iPhone 7 Black 128GB','iPhone 7 Black 256GB','iPhone 7 Black 32GB','iPhone 7 Gold 128GB','iPhone 7 Gold 32GB','iPhone 7 Jet Black 128GB','iPhone 7 Plus Black 128GB','iPhone 7 Plus Black 256GB','iPhone 7 Plus Black 32GB','iPhone 7 Plus Gold 128GB','iPhone 7 Plus Gold 32GB','iPhone 7 Plus Jet Black 128GB','iPhone 7 Plus Jet Black 256GB','iPhone 7 Plus Red 128GB','iPhone 7 Plus Rose Gold 128GB','iPhone 7 Plus Rose Gold 256GB','iPhone 7 Plus Rose Gold 32GB','iPhone 7 Plus Silver 128GB','iPhone 7 Plus Silver 32GB','iPhone 7 Red 128GB','iPhone 7 Rose Gold 128GB','iPhone 7 Rose Gold 32GB','iPhone 7 Silver 128GB','iPhone 7 Silver 32GB','IPHONE 8 GOLD 256GB VZ','IPHONE 8 GOLD 64GB VZ','IPHONE 8 PLUS 64GB RED VERIZON','IPHONE 8 PLUS GOLD 256GB VZ','IPHONE 8 PLUS GOLD 64GB VZ','IPHONE 8 PLUS SILVER 256GB VZ','IPHONE 8 PLUS SILVER 64GB VZ','IPHONE 8 PLUS SP GRAY 64GB VZ','IPHONE 8 PLUS SP GRY 256GB VZ','IPHONE 8 SILVER 64GB VZ','IPHONE 8 SPACE GRAY 256GB VZ','IPHONE 8 SPACE GRAY 64GB VZ','IPHONE SE GOLD 16GB','IPHONE SE GOLD 64GB','IPHONE SE ROSE GOLD 16GB','IPHONE SE ROSE GOLD 32GB','IPHONE SE ROSE GOLD 64GB','IPHONE SE SILVER 16GB','IPHONE SE SILVER 64GB','IPHONE SE SPACE GRAY 16GB','IPHONE SE SPACE GRAY 32GB','IPHONE SE SPACE GRAY 64GB','IPHONE X SILVER 256GB VZ','IPHONE X SILVER 64GB VZ','IPHONE X SPACE GRAY 256GB VZ','IPHONE X SPACE GRAY 64GB VZ','Kyocera DuraForcePRO','Kyocera DuraXV','LG Cosmos 3','LG Exalt 2','LG Exalt','LG Extravert 2','LG G Vista','LG G2 White','LG G2','LG G3 Metallic Black','LG G3 Silk White','LG G4 Ceramic White','LG G4 Genuine Leather Black','LG G4 Metallic Gray','LG G5 Silver','LG G5 Titanium','LG G6 Black','LG G6 Platinum','LG K20 V','LG K4 LTE','LG K8 V','LG Lancet for Android','LG Lucid 3','LG Revere 3','LG Stylo 2 V','LG Terra','LG V10 Luxe White','LG V10 Space Black','LG V20 Titanium','Moto Z Droid BLACK/LUNAR GREY','Moto Z Force BLACK/LUNAR GREY','Moto Z Force WHITE/FINE GOLD','Moto Z Play Black','Moto Z Play White','MOTO Z2 FORCE BLACK','MOTO Z2 PLAY LUNAR GRAY','Motorola Droid Maxx 16GB Black','Motorola Droid Maxx 16GB Red','N_A','PIXEL 2 JUST BLACK 64GB','PIXEL 2 XL BLACK AND WHITE 64GB','PIXEL 2 XL JUST BLACK 64GB','Pixel Black 128GB','Pixel Black 32GB','Pixel Silver 32GB','Pixel XL Black 32GB','SAM Galaxy Note 4 Charcoal Black','SAM Galaxy Note 4 Frost White','SAM GALAXY S6 EDGE PLUS BLK 32GB','SAM GALAXY S6 EDGE PLUS BLK 64GB','SAM GALAXY S6 EDGE PLUS GLD 32GB','SAM Galaxy S8 Plus Orchid Gray','SAM Galaxy Tab S Dazzling White','SAM S7 EDGE BLUE CORAL 32GB','Samsung Convoy 3','Samsung Convoy 4','Samsung Galaxy Core Prime','SAMSUNG GALAXY J3 ECLIPSE','Samsung Galaxy J3 V','Samsung Galaxy J7 V','Samsung Galaxy Note 3 in White','Samsung Galaxy Note 3','SAMSUNG Galaxy Note 7 BLACK','SAMSUNG Galaxy Note 7 BLUE','Samsung Galaxy Note Edge Black','SAMSUNG GALAXY NOTE5 BLACK 32 GB','SAMSUNG GALAXY NOTE5 BLACK 64 GB','SAMSUNG GALAXY NOTE5 GOLD 32 GB','SAMSUNG GALAXY NOTE5 WHITE 32 GB','SAMSUNG Galaxy Note7 BLACK','SAMSUNG Galaxy Note7 BLUE','SAMSUNG Galaxy Note7 SILVER','Samsung Galaxy S 4 Black 16GB','Samsung Galaxy S 4 Black Mist','Samsung Galaxy S 4 Mini','Samsung Galaxy S 4 White 16GB','Samsung Galaxy S 4 White Frost','Samsung Galaxy S 5 Black','Samsung Galaxy S 5 Copper Gold','Samsung Galaxy S 5 Electric Blue','Samsung Galaxy S 5 White','Samsung Galaxy S III Mini','Samsung Galaxy S6 Black 32GB','Samsung Galaxy S6 Black 64GB','Samsung Galaxy S6 Edge BLK 32GB','Samsung Galaxy S6 Edge BLK 64GB','Samsung Galaxy S6 Edge GLD 32GB','Samsung Galaxy S6 Edge WHT 32GB','Samsung Galaxy S6 Gold 32GB','Samsung Galaxy S6 White 32GB','Samsung Galaxy S6 White 64GB','Samsung Galaxy S7 Black 32GB','Samsung Galaxy S7 edge BLK 32GB','Samsung Galaxy S7 edge Gold 32GB','Samsung Galaxy S7 edge SLV 32GB','Samsung Galaxy S7 Gold 32GB','Samsung Galaxy S8 Black','Samsung Galaxy S8 Orchid Gray','Samsung Galaxy S8 Plus Black','Samsung Galaxy S8 Plus Silver','Samsung Galaxy S8 Silver','Samsung Galaxy S9 Coral Blue','Samsung Galaxy S9 Lilac Purple','Samsung Galaxy S9 Midnight Black','Samsung Galaxy Tab S2 White','Samsung Gusto 3','SAMSUNG NOTE 8 MIDNIGHT BLACK','SAMSUNG NOTE 8 ORCHID GRAY','The New Moto X BLACK','Verizon Ellipsis 8'),
      SLS_OUTLET_ID VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('10000','100025','100027','100028','100029','100856','101068','10176','10390','10585','109453','110772','117642','118263','118718','119481','122971','122973','122976','124629','124630','124632','124633','124634','124635','124636','124641','124642','124643','124644','124645','124646','124647','124648','124654','124657','124659','124662','124671','124672','125256','125258','126826','128058','128303','13920','13925','14275','14286','14349','14568','14569','15259','15260','15269','15305','15308','16321','18198','18201','18835','21757','22520','22544','24776','24782','24796','24833','2521','272','27608','28003','28061','28960','3771','3901','3902','4231','4733','5656','6201','6661','7021','7031','7091','71047','7120','7277','74694','75209','75220','75230','76078','76585','79918','8253','84136','84888','84913','84990','84996','84999','85001','85067','85245','8620','86239','86640','87786','87869','88249','88260','88268','88272','88274','88276','88282','90524','91596','91883','92060','92406','92632','94801','94875','97949','99929'),
      FIN_MKT_CD VARCHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('000','005','009','00H','010','018','021','023','026','027','02A','02C','02F','02G','031','037','039','03Z','040','044','046','048','053','055','057','059','05A','05C','05J','05K','05L','05M','05N','05P','05R','060','063','065','066','06D','06E','06I','06R','06S','071','074','076','086','089','091','154','159','161','170','198','255','274','287','317','323','328','329','332','335','337','339','340','341','343','345','347','348','349','351','356','358','362','364','365','366','367','368','369','371','372','373','374','375','377','378','379','381','382','383','385','390','391','398','402','405','409','412','415','418','421','422','424','428','430','431','435','439','441','443','445','448','454','455','456','457','459','462','463','464','465','466','468','473','500','506','509','511','515','516','530','532','534','536','538','542','544','546','547','548','549','564','570','589','601','604','610','613','614','618','619','621','624','625','626','627','628','629','630','632','635','640','641','642','645','646','647','648','649','651','655','656','666','667','668','669','670','671','672','681','682','688','692','693','694','696','697','699','717','730','732','733','734','735','737','740','744','745','748','749','750','751','752','753','761','762','763','764','766','768','771','772','773','774','775','786','789','790','796','797','803','806','808','809','818','823','824','847','896','923','939','942','943','944','959','960','961','968','969','971','973','974','976','977','981','982','983','984','986','987','989'),
      FICO_SCORE INTEGER COMPRESS (0 ,768 ,769 ,2 ,770 ,771 ,4 ,772 ,773 ,774 ,775 ,776 ,777 ,778 ,779 ,780 ,781 ,782 ,783 ,784 ,785 ,786 ,787 ,788 ,789 ,790 ,791 ,792 ,793 ,794 ,795 ,796 ,44444444 ,797 ,798 ,799 ,800 ,801 ,802 ,803 ,804 ,805 ,806 ,807 ,808 ,809 ,810 ,811 ,812 ,813 ,814 ,815 ,816 ,817 ,818 ,819 ,820 ,821 ,822 ,823 ,824 ,825 ,826 ,827 ,828 ,829 ,830 ,831 ,832 ,833 ,834 ,579 ,835 ,836 ,837 ,838 ,839 ,840 ,841 ,842 ,843 ,844 ,589 ,845 ,846 ,847 ,848 ,850 ,598 ,600 ,604 ,605 ,606 ,607 ,608 ,609 ,610 ,611 ,612 ,613 ,614 ,615 ,616 ,617 ,618 ,619 ,620 ,621 ,622 ,623 ,624 ,625 ,626 ,627 ,628 ,629 ,630 ,631 ,632 ,633 ,634 ,635 ,636 ,637 ,638 ,639 ,640 ,641 ,642 ,643 ,644 ,645 ,646 ,647 ,648 ,649 ,650 ,651 ,652 ,653 ,654 ,655 ,656 ,657 ,658 ,659 ,660 ,661 ,662 ,663 ,664 ,665 ,666 ,667 ,668 ,669 ,670 ,671 ,672 ,673 ,674 ,675 ,676 ,677 ,678 ,679 ,680 ,681 ,682 ,683 ,684 ,685 ,686 ,687 ,688 ,689 ,690 ,691 ,692 ,693 ,694 ,695 ,696 ,697 ,698 ,699 ,700 ,701 ,702 ,703 ,704 ,705 ,706 ,707 ,708 ,709 ,710 ,711 ,712 ,713 ,714 ,715 ,716 ,717 ,718 ,719 ,720 ,721 ,722 ,723 ,724 ,725 ,726 ,727 ,728 ,729 ,730 ,731 ,732 ,733 ,734 ,735 ,736 ,737 ,738 ,739 ,740 ,741 ,742 ,743 ,999 ,744 ,745 ,746 ,747 ,748 ,749 ,750 ,751 ,752 ,753 ,754 ,755 ,756 ,757 ,758 ,759 ,760 ,761 ,762 ,763 ,764 ,765 ,766 ,767 ),
      ACCT_ESTB_DT DATE FORMAT 'YYYY-MM-DD',
      ORIG_ACCT_ESTB_DT DATE FORMAT 'YYYY-MM-DD',
      CUST_SSN_ESTB_DT DATE FORMAT 'YYYY-MM-DD',
      LOAN_TENURE_MTH INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ),
      LOAN_ORIG_ACCT_TENURE_MTH INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ,101 ,102 ,103 ,104 ,105 ,106 ,107 ,108 ,109 ,110 ,111 ,112 ,113 ,114 ,115 ,116 ,117 ,118 ,119 ,120 ,121 ,122 ,123 ,124 ,125 ,126 ,127 ,128 ,129 ,130 ,131 ,132 ,133 ,134 ,135 ,136 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,145 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,156 ,157 ,158 ,159 ,160 ,161 ,162 ,163 ,164 ,165 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,174 ,175 ,176 ,177 ,178 ,179 ,180 ,181 ,182 ,183 ,184 ,185 ,186 ,187 ,188 ,189 ,190 ,191 ,192 ,193 ,194 ,195 ,196 ,197 ,198 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,228 ,229 ,230 ,231 ,232 ,233 ,234 ,235 ,236 ,237 ,238 ,239 ,240 ,241 ,242 ,243 ,244 ,245 ,246 ,247 ,248 ,249 ,250 ,252 ),
      LOAN_ORIG_CUST_SSN_TENURE_MTH INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ,101 ,102 ,103 ,104 ,105 ,106 ,107 ,108 ,109 ,110 ,111 ,112 ,113 ,114 ,115 ,116 ,117 ,118 ,119 ,120 ,121 ,122 ,123 ,124 ,125 ,126 ,127 ,128 ,129 ,130 ,131 ,132 ,133 ,134 ,135 ,136 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,145 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,156 ,157 ,158 ,159 ,160 ,161 ,162 ,163 ,164 ,165 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,174 ,175 ,176 ,177 ,178 ,179 ,180 ,181 ,182 ,183 ,184 ,185 ,186 ,187 ,188 ,189 ,190 ,191 ,192 ,193 ,194 ,195 ,196 ,197 ,198 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,228 ,229 ,230 ,231 ,232 ,233 ,234 ,235 ,236 ,237 ,238 ,239 ,240 ,241 ,242 ,243 ,244 ,245 ,246 ,247 ,248 ,249 ,250 ,252 ),
      LOAN_CREATE_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS (DATE '2016-12-16',DATE '2016-12-17',DATE '2016-12-18',DATE '2016-12-19',DATE '2015-07-24',DATE '2016-12-20',DATE '2015-07-25',DATE '2016-12-21',DATE '2015-02-14',DATE '2016-12-22',DATE '2016-12-23',DATE '2016-12-24',DATE '2016-12-26',DATE '2015-07-31',DATE '2015-02-21',DATE '2016-02-06',DATE '2015-02-28',DATE '2016-02-12',DATE '2016-02-13',DATE '2015-10-01',DATE '2015-10-02',DATE '2015-10-03',DATE '2016-02-19',DATE '2015-10-04',DATE '2016-02-20',DATE '2015-10-05',DATE '2015-10-07',DATE '2015-10-08',DATE '2015-10-09',DATE '2015-10-10',DATE '2016-02-27',DATE '2015-10-12',DATE '2015-10-13',DATE '2015-05-02',DATE '2015-10-14',DATE '2015-10-15',DATE '2015-10-16',DATE '2015-10-17',DATE '2015-10-19',DATE '2015-05-08',DATE '2015-10-20',DATE '2015-05-09',DATE '2015-10-21',DATE '2016-10-05',DATE '2015-10-22',DATE '2016-10-06',DATE '2015-10-23',DATE '2015-10-24',DATE '2015-10-25',DATE '2015-10-26',DATE '2016-10-10',DATE '2015-10-27',DATE '2016-10-11',DATE '2015-05-16',DATE '2015-10-28',DATE '2016-10-12',DATE '2015-10-29',DATE '2015-10-30',DATE '2016-10-14',DATE '2015-10-31',DATE '2016-10-17',DATE '2015-05-22',DATE '2016-10-18',DATE '2015-05-23',DATE '2016-10-19',DATE '2016-10-20',DATE '2015-05-29',DATE '2015-05-30',DATE '2015-08-01',DATE '2015-08-03',DATE '2015-08-07',DATE '2015-08-08',DATE '2015-08-10',DATE '2015-08-11',DATE '2015-08-12',DATE '2015-08-13',DATE '2015-08-14',DATE '2015-08-15',DATE '2015-08-17',DATE '2015-03-07',DATE '2015-08-21',DATE '2015-08-22',DATE '2015-08-24',DATE '2015-03-14',DATE '2015-08-28',DATE '2015-08-29',DATE '2015-08-31',DATE '2015-03-21',DATE '2016-03-05',DATE '2016-03-06',DATE '2016-03-07',DATE '2016-08-19',DATE '2016-08-20',DATE '2016-03-11',DATE '2015-03-28',DATE '2016-03-12',DATE '2015-11-01',DATE '2015-11-02',DATE '2016-03-18',DATE '2015-11-03',DATE '2016-03-19',DATE '2015-11-04',DATE '2014-11-21',DATE '2015-11-05',DATE '2014-11-22',DATE '2015-11-06',DATE '2015-11-07',DATE '2015-11-08',DATE '2015-11-09',DATE '2016-03-25',DATE '2014-11-26',DATE '2016-03-26',DATE '2015-11-11',DATE '2014-11-28',DATE '2015-11-12',DATE '2016-03-28',DATE '2014-11-29',DATE '2015-11-13',DATE '2015-11-14',DATE '2016-03-31',DATE '2015-11-16',DATE '2015-06-05',DATE '2015-11-17',DATE '2015-06-06',DATE '2015-11-19',DATE '2015-06-08',DATE '2015-11-20',DATE '2015-11-21',DATE '2015-11-22',DATE '2015-06-11',DATE '2015-11-23',DATE '2015-06-12',DATE '2015-11-24',DATE '2015-06-13',DATE '2015-11-25',DATE '2015-06-14',DATE '2015-06-15',DATE '2015-11-27',DATE '2015-06-16',DATE '2015-11-28',DATE '2015-06-17',DATE '2015-11-29',DATE '2015-06-18',DATE '2015-11-30',DATE '2015-06-19',DATE '2015-06-20',DATE '2016-11-19',DATE '2015-06-26',DATE '2015-06-27',DATE '2015-06-29',DATE '2016-11-25',DATE '2015-06-30',DATE '2016-01-02',DATE '2016-11-26',DATE '2016-11-27',DATE '2016-11-28',DATE '2016-11-29',DATE '2016-01-09',DATE '2015-01-31',DATE '2016-01-16',DATE '2017-11-24',DATE '2014-09-19',DATE '2015-09-04',DATE '2015-09-05',DATE '2015-09-11',DATE '2015-09-12',DATE '2016-01-30',DATE '2015-04-04',DATE '2015-09-18',DATE '2015-09-19',DATE '2015-09-20',DATE '2015-09-21',DATE '2015-04-10',DATE '2015-09-22',DATE '2015-04-11',DATE '2015-09-23',DATE '2015-09-24',DATE '2015-09-25',DATE '2015-09-26',DATE '2015-09-27',DATE '2015-09-28',DATE '2015-04-17',DATE '2015-09-29',DATE '2016-04-01',DATE '2015-04-18',DATE '2015-09-30',DATE '2016-04-02',DATE '2016-09-16',DATE '2016-09-17',DATE '2014-12-06',DATE '2015-04-24',DATE '2015-04-25',DATE '2016-04-09',DATE '2016-09-21',DATE '2016-09-22',DATE '2016-09-23',DATE '2014-12-12',DATE '2016-09-24',DATE '2014-12-13',DATE '2016-09-26',DATE '2016-09-27',DATE '2016-09-28',DATE '2014-12-17',DATE '2015-12-01',DATE '2016-09-29',DATE '2014-12-18',DATE '2015-12-02',DATE '2016-09-30',DATE '2014-12-19',DATE '2015-12-03',DATE '2014-12-20',DATE '2015-12-04',DATE '2014-12-21',DATE '2015-12-05',DATE '2014-12-22',DATE '2015-12-06',DATE '2014-12-23',DATE '2015-12-07',DATE '2014-12-24',DATE '2015-12-09',DATE '2014-12-26',DATE '2015-12-10',DATE '2014-12-27',DATE '2015-12-11',DATE '2015-12-12',DATE '2015-12-13',DATE '2015-12-14',DATE '2016-04-30',DATE '2015-07-03',DATE '2015-12-15',DATE '2015-12-16',DATE '2015-12-17',DATE '2015-12-18',DATE '2015-12-19',DATE '2016-12-03',DATE '2015-12-20',DATE '2015-12-21',DATE '2017-04-21',DATE '2015-07-10',DATE '2015-12-22',DATE '2015-07-11',DATE '2015-12-23',DATE '2015-12-24',DATE '2016-12-09',DATE '2015-12-26',DATE '2016-12-10',DATE '2015-12-27',DATE '2015-12-28',DATE '2015-07-17',DATE '2015-12-29',DATE '2015-07-18',DATE '2015-12-30',DATE '2015-02-07',DATE '2015-12-31',DATE '2016-12-15'),
      LOAN_SALES_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS (DATE '2016-12-16',DATE '2016-12-17',DATE '2016-12-18',DATE '2016-12-19',DATE '2015-07-24',DATE '2016-12-20',DATE '2015-07-25',DATE '2016-12-21',DATE '2015-02-14',DATE '2016-12-22',DATE '2016-12-23',DATE '2016-12-24',DATE '2016-12-26',DATE '2015-07-31',DATE '2015-02-21',DATE '2016-02-06',DATE '2015-02-28',DATE '2016-02-13',DATE '2015-10-01',DATE '2015-10-02',DATE '2015-10-03',DATE '2016-02-19',DATE '2015-10-04',DATE '2016-02-20',DATE '2015-10-05',DATE '2015-10-07',DATE '2015-10-08',DATE '2015-10-09',DATE '2015-10-10',DATE '2016-02-27',DATE '2015-10-12',DATE '2015-10-13',DATE '2015-05-02',DATE '2015-10-14',DATE '2015-10-15',DATE '2015-10-16',DATE '2015-10-17',DATE '2015-10-18',DATE '2015-10-19',DATE '2016-10-03',DATE '2015-05-08',DATE '2015-10-20',DATE '2015-05-09',DATE '2015-10-21',DATE '2016-10-05',DATE '2015-10-22',DATE '2016-10-06',DATE '2015-10-23',DATE '2015-10-24',DATE '2015-10-25',DATE '2015-10-26',DATE '2015-10-27',DATE '2016-10-11',DATE '2015-05-16',DATE '2015-10-28',DATE '2015-10-29',DATE '2015-10-30',DATE '2016-10-14',DATE '2015-10-31',DATE '2016-10-15',DATE '2016-10-17',DATE '2015-05-22',DATE '2016-10-18',DATE '2015-05-23',DATE '2016-05-07',DATE '2016-10-19',DATE '2016-10-20',DATE '2015-05-29',DATE '2015-05-30',DATE '2015-08-01',DATE '2015-08-03',DATE '2015-08-07',DATE '2015-08-08',DATE '2015-08-10',DATE '2015-08-11',DATE '2015-08-12',DATE '2015-08-13',DATE '2015-08-14',DATE '2015-08-15',DATE '2015-08-17',DATE '2015-03-07',DATE '2015-08-21',DATE '2015-08-22',DATE '2015-08-24',DATE '2015-03-14',DATE '2015-08-28',DATE '2015-08-29',DATE '2016-08-13',DATE '2015-08-31',DATE '2015-03-21',DATE '2016-03-05',DATE '2016-03-06',DATE '2016-03-07',DATE '2016-08-19',DATE '2016-08-20',DATE '2016-03-11',DATE '2015-03-28',DATE '2016-03-12',DATE '2015-11-01',DATE '2015-11-02',DATE '2016-03-18',DATE '2015-11-03',DATE '2016-03-19',DATE '2015-11-04',DATE '2014-11-21',DATE '2015-11-05',DATE '2014-11-22',DATE '2015-11-06',DATE '2015-11-07',DATE '2015-11-08',DATE '2015-11-09',DATE '2016-03-25',DATE '2014-11-26',DATE '2016-03-26',DATE '2015-11-11',DATE '2014-11-28',DATE '2015-11-12',DATE '2016-03-28',DATE '2014-11-29',DATE '2015-11-13',DATE '2015-11-14',DATE '2016-03-31',DATE '2015-11-16',DATE '2015-06-05',DATE '2015-06-06',DATE '2015-11-19',DATE '2015-06-08',DATE '2015-11-20',DATE '2015-11-21',DATE '2015-11-22',DATE '2015-06-11',DATE '2015-11-23',DATE '2015-06-12',DATE '2015-11-24',DATE '2015-06-13',DATE '2015-11-25',DATE '2015-06-14',DATE '2015-06-15',DATE '2015-11-27',DATE '2015-06-16',DATE '2015-11-28',DATE '2015-06-17',DATE '2015-11-29',DATE '2015-06-18',DATE '2015-11-30',DATE '2015-06-19',DATE '2015-06-20',DATE '2015-06-21',DATE '2016-11-19',DATE '2015-06-26',DATE '2015-06-27',DATE '2015-06-29',DATE '2016-11-25',DATE '2015-06-30',DATE '2016-01-02',DATE '2016-11-26',DATE '2016-11-27',DATE '2016-11-28',DATE '2016-01-09',DATE '2015-01-31',DATE '2016-01-16',DATE '2017-11-24',DATE '2014-09-19',DATE '2015-09-04',DATE '2015-09-05',DATE '2015-09-11',DATE '2015-09-12',DATE '2016-01-30',DATE '2015-04-04',DATE '2015-09-18',DATE '2015-09-19',DATE '2015-09-20',DATE '2015-09-21',DATE '2015-04-10',DATE '2015-09-22',DATE '2015-04-11',DATE '2015-09-23',DATE '2015-09-24',DATE '2015-09-25',DATE '2015-09-26',DATE '2015-09-27',DATE '2015-09-28',DATE '2015-04-17',DATE '2015-09-29',DATE '2016-04-01',DATE '2015-04-18',DATE '2015-09-30',DATE '2016-04-02',DATE '2016-09-16',DATE '2016-09-17',DATE '2014-12-06',DATE '2015-04-24',DATE '2015-04-25',DATE '2016-04-09',DATE '2016-09-21',DATE '2016-09-22',DATE '2016-09-23',DATE '2014-12-12',DATE '2016-09-24',DATE '2014-12-13',DATE '2016-09-26',DATE '2016-09-27',DATE '2016-09-28',DATE '2015-12-01',DATE '2016-09-29',DATE '2014-12-18',DATE '2015-12-02',DATE '2016-09-30',DATE '2014-12-19',DATE '2015-12-03',DATE '2014-12-20',DATE '2015-12-04',DATE '2014-12-21',DATE '2015-12-05',DATE '2014-12-22',DATE '2015-12-06',DATE '2014-12-23',DATE '2015-12-07',DATE '2014-12-24',DATE '2015-12-09',DATE '2014-12-26',DATE '2015-12-10',DATE '2014-12-27',DATE '2015-12-11',DATE '2015-12-12',DATE '2015-12-13',DATE '2015-12-14',DATE '2016-04-30',DATE '2015-07-03',DATE '2015-12-15',DATE '2015-12-16',DATE '2015-12-17',DATE '2015-12-18',DATE '2015-12-19',DATE '2016-12-03',DATE '2015-12-20',DATE '2015-12-21',DATE '2017-04-21',DATE '2015-07-10',DATE '2015-12-22',DATE '2015-07-11',DATE '2015-12-23',DATE '2015-12-24',DATE '2016-12-09',DATE '2015-12-26',DATE '2016-12-10',DATE '2015-12-27',DATE '2015-12-28',DATE '2015-07-17',DATE '2015-12-29',DATE '2015-07-18',DATE '2015-12-30',DATE '2015-02-07',DATE '2015-12-31',DATE '2016-12-15'),
      UPG_OPTION_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('DP','UO'),
      UPG_ELIG_CD VARCHAR(23) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('100_DP','50_DP','50_UO','60_DP','75_DP'),
      TRANCHE_NUM CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0    ','1    ','16   ','2    ','20   ','23   ','3    ','35   ','4    ','42   ','43   ','66   ','7    ','9    ','92   '),
      TRANCHE_GRP_CD VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0','1','10','11','12','13','14','2','3','4','5','6','7','8','9'),
      TRANCHE_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS (DATE '2017-12-01',DATE '2016-12-19',DATE '2017-07-01',DATE '2017-02-01',DATE '2018-07-01',DATE '2018-02-01',DATE '2017-10-01',DATE '2017-05-01',DATE '2018-10-01',DATE '2018-05-01',DATE '2015-03-15',DATE '2017-08-01',DATE '2016-03-16',DATE '2017-03-01',DATE '2018-08-01',DATE '2018-03-01',DATE '2016-11-01',DATE '2015-06-15',DATE '2017-11-01',DATE '2017-06-01',DATE '2016-06-30',DATE '2018-06-01',DATE '2015-09-11',DATE '2018-01-01',DATE '2016-09-01',DATE '2016-09-15',DATE '2017-09-01',DATE '2017-04-01',DATE '2015-12-14',DATE '2018-04-01'),
      SECURITIZED_IND VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      AGING_CD VARCHAR(7) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('30','Current','UNTG'),
      STATE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AL','AZ','CA','CO','CT','FL','GA','IA','IL','IN','KS','LA','MA','MD','MI','MN','MO','NC','NE','NJ','NY','OH','OR','PA','SC','TN','TX','UT','VA','WA','WI'),
      LOAN_TERM_MTH_QTY INTEGER COMPRESS (12 ,20 ,24 ),
      LOAN_UPG_PCT DECIMAL(5,2) COMPRESS (100.00 ,75.00 ,60.00 ,50.00 ),
      ITEM_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CLNRAPL616','CLNRLGVS986','CLNRMOT1585GBN','CLNRMOTXT1254BN','CLNRMOTXT1585','CLNRSAMG900K','CLNRSAMG900W','CLNRSAMG92032K','CLNRSAMN910','CLNRSAMN92032K','G-2PW2100-021-A','G-2PW4100-021-A','G-2PW4100-021-B','G-2PW4100-022-A','GA00139-US','GA00151-US','HTC6500LVW','HTC6525LVW','HTC6535LVW','HTC6535LVWSG','HTC6545LVW','HTCD100LVW','HTCD200LVW','KYOE4520','KYOE4520PTT','KYOE6782','KYOE6810N','LG-VN170','LG-VN210','LG-VN251S','LG-VN280','LG-VN360','LG-VN370','LG-VS425','LG-VS500','LG-VS501','LG-VS820','LG-VS835','LG-VS876','LG-VS880','LG-VS980','LG-VS980W','LG-VS985','LG-VS985W','LG-VS986','LG-VS986LD','LG-VS986W','LG-VS987','LG-VS987T','LG-VS988','LG-VS988T','LG-VS990','LG-VS990W','LG-VS995','ME341LL/A','ME342LL/A','ME343LL/A','ME344LL/A','ME345LL/A','ME346LL/A','ME347LL/A','ME553LL/A','ME555LL/A','ME556LL/A','ME557LL/A','MG5W2LL/A','MG5X2LL/A','MG5Y2LL/A','MG602LL/A','MG612LL/A','MG622LL/A','MG632LL/A','MG642LL/A','MG652LL/A','MGCK2LL/A','MGCL2LL/A','MGCM2LL/A','MGCN2LL/A','MGCQ2LL/A','MGCR2LL/A','MGCT2LL/A','MGCU2LL/A','MGFG2LL/A','MGFJ2LL/A','MGH62LL/A','MGJY2LL/A','MH1Y2LL/A','MKRR2LL/A','MKRT2LL/A','MKRW2LL/A','MKRX2LL/A','MKRY2LL/A','MKT02LL/A','MKT12LL/A','MKT22LL/A','MKT32LL/A','MKT42LL/A','MKT52LL/A','MKT62LL/A','MKV32LL/A','MKV52LL/A','MKV62LL/A','MKV72LL/A','MKV82LL/A','MKV92LL/A','MKVD2LL/A','MKVE2LL/A','MKVF2LL/A','MKVJ2LL/A','ML3L2LL/A','MLLY2LL/A','MLM02LL/A','MLMF2LL/A','MLMG2LL/A','MLY52LL/A','MLY62LL/A','MLY72LL/A','MLY82LL/A','MN1M2LL/A','MN1Q2LL/A','MN1U2LL/A','MN1V2LL/A','MN382LL/A','MN3D2LL/A','MN5T2LL/A','MN5U2LL/A','MN5V2LL/A','MN5W2LL/A','MN5X2LL/A','MN5Y2LL/A','MN622LL/A','MN632LL/A','MN8G2LL/A','MN8L2LL/A','MNAC2LL/A','MNAD2LL/A','MNAE2LL/A','MNAF2LL/A','MNAJ2LL/A','MNAK2LL/A','MNAL2LL/A','MNAM2LL/A','MNAP2LL/A','MNAQ2LL/A','MNR12LL/A','MNR22LL/A','MNR32LL/A','MNR42LL/A','MOTXT1030','MOTXT1030R','MOTXT1080','MOTXT1080M','MOTXT1080M16','MOTXT1080MR16','MOTXT1254','MOTXT1254BN','MOTXT1254BN64','MOTXT1254GBNB','MOTXT1254R','MOTXT1254VB','MOTXT1565B','MOTXT1565W','MOTXT1585','MOTXT1585BL','MOTXT1585GBN','MOTXT1585W','MOTXT163501','MOTXT163501W','MOTXT1650','MOTXT1650M','MOTXT1650MFG','MOTXT171002','MOTXT178901','MP8K2LL/A','MP8N2LL/A','MPR02LL/A','MPRT2LL/A','MQ722LL/A','MQ732LL/A','MQ742LL/A','MQ7X2LL/A','MQ962LL/A','MQ972LL/A','MQ982LL/A','MQ992LL/A','MQ9A2LL/A','MQ9C2LL/A','MQCK2LL/A','MQCL2LL/A','MQCN2LL/A','MQCP2LL/A','MRTG2LL/A','N_A','QTAQZ3','SCHI435ZKV','SCHI545PKVPS','SCHI545PWVPS','SCHI545ZKV','SCHI545ZWV','SCHU680MAV','SMB311ZKA','SMB690VBKA','SMG360VHAA','SMG730VMBA','SMG900VMBV','SMG900VZDV','SMG900VZKV','SMG900VZWV','SMG920VZDA','SMG920VZKA','SMG920VZKE','SMG920VZWA','SMG920VZWE','SMG925VZDA','SMG925VZKA','SMG925VZKE','SMG925VZWA','SMG928VZDA','SMG928VZKA','SMG930VZDA','SMG930VZKA','SMG935VZBA','SMG935VZDA','SMG935VZKA','SMG935VZSA','SMG950UZKV','SMG950UZSV','SMG950UZVV','SMG955UZKV','SMG955UZSV','SMG955UZVV','SMG960UZBV','SMG960UZKV','SMG960UZPV','SMG965UZBV','SMG965UZKV','SMG965UZPV','SMJ320VZKA','SMJ327VZKA','SMJ727VZSA','SMN900VZKE','SMN900VZWE','SMN910VZKE','SMN910VZWE','SMN915VZKE','SMN920VZDA','SMN920VZKA','SMN920VZKE','SMN920VZWA','SMN930VZBA','SMN930VZKA','SMN930VZKB','SMN930VZSA','SMN950UZKV','SMN950UZVV'),
      LOAN_FIRST_COLL_AMT DECIMAL(7,2) COMPRESS (23.04 ,0.01 ,23.05 ,71.69 ,23.06 ,23.07 ,33.33 ,28.22 ,35.90 ,28.23 ,35.91 ,0.08 ,28.24 ,33.40 ,33.41 ,66.69 ,18.07 ,36.00 ,13.00 ,28.40 ,28.41 ,41.25 ,8.00 ,10.56 ,10.57 ,20.82 ,20.83 ,23.40 ,5.49 ,23.41 ,26.00 ,20.89 ,36.25 ,20.90 ,20.91 ,8.14 ,15.82 ,8.15 ,33.75 ,18.40 ,18.41 ,31.25 ,36.40 ,38.97 ,26.22 ,36.47 ,8.32 ,16.00 ,10.91 ,31.39 ,31.40 ,33.97 ,8.40 ,8.41 ,31.45 ,31.46 ,28.91 ,31.47 ,21.25 ,31.50 ,18.75 ,29.00 ,41.81 ,23.91 ,26.47 ,6.00 ,24.00 ,36.81 ,36.82 ,18.91 ,21.47 ,1.00 ,29.16 ,18.96 ,18.97 ,29.23 ,31.81 ,31.82 ,24.15 ,24.16 ,29.30 ,29.31 ,29.32 ,13.97 ,39.58 ,42.16 ,39.65 ,32.00 ,21.81 ,21.82 ,6.47 ,32.08 ,34.65 ,19.31 ,19.32 ,27.00 ,52.60 ,3.97 ,21.91 ,32.15 ,4.00 ,16.80 ,16.81 ,16.82 ,27.07 ,27.08 ,29.64 ,29.65 ,29.66 ,22.00 ,27.13 ,27.14 ,27.15 ,27.16 ,40.00 ,17.00 ,22.15 ,45.22 ,35.00 ,42.68 ,4.32 ,32.49 ,24.82 ,32.50 ,17.15 ,17.16 ,37.67 ,30.00 ,37.68 ,14.65 ,14.66 ,24.91 ,7.00 ,19.82 ,27.50 ,35.18 ,24.99 ,32.67 ,25.00 ,32.68 ,48.06 ,19.91 ,32.72 ,30.17 ,30.18 ,27.65 ,27.67 ,20.00 ,27.68 ,4.65 ,7.22 ,25.14 ,25.15 ,27.72 ,25.17 ,17.50 ,25.18 ,2.15 ,25.20 ,40.56 ,25.21 ,25.22 ,15.00 ,35.49 ,12.50 ,20.18 ,35.54 ,35.55 ,33.00 ,35.56 ,20.22 ,27.91 ,10.00 ,48.41 ,28.00 ,30.56 ,15.22 ,5.00 ,17.82 ,28.06 ,12.72 ,22.98 ,33.22 ,22.99 ,23.00 ,25.56 ,33.24 ,25.57 ,10.22 ),
      LOAN_MTH_PYMNT_AMT DECIMAL(7,2) COMPRESS (0.01 ,0.04 ,33.33 ,66.66 ,36.00 ,10.41 ,28.33 ,13.00 ,5.37 ,7.95 ,23.33 ,15.66 ,8.00 ,38.74 ,20.83 ,36.20 ,25.99 ,26.00 ,36.24 ,18.33 ,36.25 ,33.74 ,33.75 ,8.16 ,31.20 ,31.24 ,31.25 ,10.83 ,16.00 ,21.12 ,26.24 ,8.33 ,41.66 ,21.25 ,31.49 ,31.50 ,23.83 ,18.74 ,36.66 ,18.75 ,29.00 ,6.00 ,13.74 ,31.66 ,23.99 ,24.00 ,29.12 ,29.16 ,24.08 ,6.24 ,42.08 ,39.54 ,3.74 ,21.66 ,39.58 ,19.16 ,32.00 ,29.45 ,16.66 ,34.58 ,21.83 ,32.08 ,27.00 ,29.58 ,27.04 ,44.99 ,27.08 ,22.00 ,42.49 ,4.16 ,22.08 ,40.00 ,17.00 ,32.37 ,37.49 ,34.99 ,17.08 ,35.00 ,19.66 ,32.49 ,14.58 ,32.50 ,24.83 ,29.99 ,47.91 ,30.00 ,27.45 ,7.00 ,27.49 ,27.50 ,19.83 ,24.95 ,24.99 ,25.00 ,40.41 ,4.58 ,19.99 ,2.08 ,20.00 ,35.37 ,35.41 ,17.50 ,14.99 ,15.00 ,27.83 ,12.49 ,30.41 ,48.33 ,12.50 ,32.99 ,33.00 ,17.66 ,9.99 ,27.91 ,10.00 ,25.41 ,22.87 ,27.99 ,28.00 ,33.12 ,22.91 ,5.00 ,23.00 ,28.12 ,71.66 ,17.91 ,35.83 ),
      FIRST_PYMNT_TENDER_INELIG_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'N',
      LOAN_STATUS_IND VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A','AA','B','C','F','P','U'),
      LEGAL_ENTITY CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('10000','10001','10003','10012','10019','10049','10054','11022','11045','11061','11070','11073','11085','11089','11104','11108','12001','12021','12070','12072','12081','12111','12543','13000','13001','13003','14002','14032','14086','14089','14100'),
      LOAN_ISSUED_CNT BYTEINT COMPRESS 0 ,
      LOAN_ISSUED_EXCL_CANCEL_CNT BYTEINT COMPRESS 0 ,
      LOAN_W_INS_CNT BYTEINT COMPRESS (0 ,1 ),
      LOAN_OUTSTANDING_CNT BYTEINT COMPRESS (0 ,1 ),
      FULL_INSTALL_SATISFIED_CNT INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ),
      INSTALL_PYMNT_OUTSTANDING_CNT INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ),
      BUYOUT_CNT BYTEINT COMPRESS 0 ,
      VOL_BUYOUT_CNT BYTEINT COMPRESS 0 ,
      INVOL_BUYOUT_CNT BYTEINT COMPRESS 0 ,
      EU_BUYOUT_CNT BYTEINT COMPRESS 0 ,
      CANCEL_CNT BYTEINT COMPRESS 0 ,
      DP_WO_CNT BYTEINT COMPRESS 0 ,
      CREDIT_CNT BYTEINT COMPRESS 0 ,
      LOAN_PAID_IN_FULL_CNT BYTEINT COMPRESS 0 ,
      INSTALL_LOAN_AMT DECIMAL(18,2) COMPRESS (768.00 ,192.00 ,960.00 ,384.00 ,576.00 ,849.97 ,849.98 ,849.99 ,529.99 ,100.00 ,420.00 ,949.99 ,629.99 ,0.24 ,199.99 ,519.99 ,840.00 ,200.00 ,1160.00 ,520.00 ,648.00 ,729.99 ,89.99 ,409.99 ,410.00 ,706.99 ,707.00 ,299.99 ,300.00 ,829.99 ,1149.99 ,509.99 ,510.00 ,399.98 ,399.99 ,720.00 ,144.00 ,400.00 ,528.00 ,929.99 ,609.99 ,599.76 ,610.00 ,499.98 ,499.99 ,692.00 ,756.00 ,500.00 ,709.99 ,710.00 ,599.97 ,599.98 ,791.99 ,599.99 ,24.00 ,699.84 ,792.00 ,408.00 ,472.00 ,600.00 ,1.00 ,769.00 ,129.00 ,809.99 ,810.00 ,659.00 ,699.98 ,699.99 ,700.00 ,572.00 ,548.99 ,869.00 ,671.99 ,799.99 ,479.99 ,672.00 ,96.00 ,800.00 ,864.00 ,480.00 ,648.99 ,777.00 ,649.00 ,49.99 ,1010.00 ,795.00 ,196.00 ,260.00 ,452.00 ,748.99 ,749.00 ,149.99 ,190.99 ,191.00 ,679.99 ,167.99 ,999.99 ,359.99 ,680.00 ,168.00 ,360.00 ,424.00 ,552.00 ,849.00 ,249.99 ,250.00 ,674.99 ,675.00 ,779.99 ,459.99 ,780.00 ,460.00 ,524.00 ,949.00 ,669.99 ,349.99 ,990.00 ,350.00 ,879.99 ,239.99 ,559.99 ,623.99 ,880.00 ,240.00 ,496.00 ,560.00 ,624.00 ,449.98 ,769.99 ,449.99 ,577.99 ,450.00 ,578.00 ,659.99 ,660.00 ,596.00 ,549.97 ,549.98 ,869.99 ,549.99 ,870.00 ,550.00 ,759.99 ,1079.99 ,439.99 ,696.00 ,760.00 ,120.00 ,312.00 ,376.00 ,440.00 ,649.97 ,649.98 ,969.99 ,329.99 ,649.99 ,650.00 ,859.99 ,668.00 ,860.00 ,476.00 ,749.97 ,749.98 ,749.99 ,109.99 ,429.99 ,750.00 ,430.00 ,598.99 ,599.00 ),
      ORIG_DEVICE_AMT DECIMAL(18,2) COMPRESS (768.00 ,192.00 ,960.00 ,384.00 ,576.00 ,849.97 ,849.98 ,849.99 ,529.99 ,850.00 ,274.00 ,699.00 ,949.99 ,629.99 ,199.99 ,840.00 ,200.00 ,1160.00 ,648.00 ,729.99 ,89.99 ,409.99 ,410.00 ,706.99 ,707.00 ,299.99 ,108.00 ,300.00 ,829.99 ,1149.99 ,510.00 ,399.98 ,399.99 ,720.00 ,144.00 ,400.00 ,528.00 ,929.99 ,609.99 ,599.76 ,610.00 ,499.98 ,499.99 ,692.00 ,756.00 ,500.00 ,709.99 ,710.00 ,599.97 ,599.98 ,791.99 ,599.99 ,699.84 ,792.00 ,408.00 ,472.00 ,600.00 ,769.00 ,129.00 ,809.99 ,810.00 ,659.00 ,699.98 ,699.99 ,700.00 ,572.00 ,869.00 ,549.00 ,671.99 ,799.99 ,672.00 ,800.00 ,864.00 ,480.00 ,777.00 ,649.00 ,49.99 ,1010.00 ,795.00 ,196.00 ,260.00 ,452.00 ,749.00 ,149.99 ,190.99 ,191.00 ,167.99 ,999.99 ,680.00 ,168.00 ,936.00 ,424.00 ,552.00 ,849.00 ,249.99 ,250.00 ,674.99 ,675.00 ,779.99 ,459.99 ,780.00 ,460.00 ,524.00 ,949.00 ,669.99 ,349.99 ,990.00 ,350.00 ,879.99 ,239.99 ,559.99 ,623.99 ,816.00 ,880.00 ,240.00 ,496.00 ,560.00 ,624.00 ,449.98 ,769.99 ,449.99 ,577.99 ,450.00 ,578.00 ,659.99 ,660.00 ,596.00 ,549.97 ,549.98 ,869.99 ,549.99 ,870.00 ,550.00 ,759.99 ,1079.99 ,696.00 ,760.00 ,120.00 ,312.00 ,376.00 ,649.97 ,649.98 ,969.99 ,329.99 ,649.99 ,650.00 ,859.99 ,668.00 ,860.00 ,476.00 ,749.96 ,749.97 ,749.98 ,749.99 ,109.99 ,429.99 ,750.00 ,430.00 ,959.99 ),
      LOAN_DOWN_PYMNT_AMT DECIMAL(18,2) COMPRESS (0.00 ,0.01 ,100.00 ,200.00 ,300.00 ,1.00 ,150.00 ),
      FULL_OUTSTANDING_BAL_AMT DECIMAL(18,2) COMPRESS (0.00 ,192.00 ,448.00 ,458.26 ,105.00 ,156.20 ,849.99 ,210.00 ,312.40 ,471.12 ,524.88 ,435.29 ,348.26 ,99.96 ,189.56 ,468.60 ,420.00 ,624.80 ,632.50 ,696.52 ,379.08 ,412.38 ,949.99 ,199.92 ,379.12 ,630.00 ,522.50 ,724.80 ,840.00 ,200.00 ,264.00 ,392.00 ,412.50 ,814.43 ,389.47 ,299.88 ,443.24 ,568.68 ,601.97 ,389.51 ,54.16 ,154.00 ,302.50 ,300.00 ,364.00 ,366.56 ,399.84 ,507.36 ,31.24 ,189.96 ,243.72 ,612.36 ,1149.99 ,126.00 ,187.44 ,343.64 ,499.80 ,343.65 ,538.22 ,399.99 ,144.00 ,336.00 ,433.28 ,466.56 ,499.84 ,528.00 ,656.04 ,761.04 ,74.97 ,958.18 ,320.74 ,320.76 ,622.84 ,779.02 ,284.94 ,499.99 ,108.32 ,308.00 ,566.56 ,354.10 ,605.00 ,174.93 ,566.61 ,297.83 ,543.60 ,633.20 ,599.94 ,297.88 ,495.00 ,599.99 ,633.27 ,792.00 ,280.00 ,408.00 ,600.00 ,274.89 ,666.60 ,274.92 ,385.00 ,62.48 ,326.16 ,379.92 ,487.44 ,699.93 ,147.00 ,218.68 ,275.00 ,554.04 ,374.85 ,733.26 ,699.99 ,797.28 ,252.00 ,374.88 ,252.01 ,728.18 ,766.59 ,165.00 ,531.08 ,687.28 ,162.48 ,408.24 ,743.61 ,474.81 ,531.15 ,119.00 ,318.69 ,229.10 ,799.99 ,672.00 ,96.00 ,160.00 ,224.00 ,480.00 ,579.84 ,474.90 ,352.04 ,574.77 ,49.98 ,206.19 ,196.00 ,362.40 ,541.60 ,644.00 ,149.94 ,221.62 ,27.08 ,577.50 ,150.00 ,833.52 ,183.28 ,641.52 ,93.72 ,569.88 ,249.90 ,467.50 ,999.99 ,168.00 ,216.64 ,249.92 ,360.00 ,616.00 ,708.20 ,406.12 ,495.72 ,160.37 ,357.50 ,495.74 ,283.28 ,562.32 ,616.08 ,349.86 ,718.52 ,316.60 ,406.20 ,247.50 ,140.00 ,588.00 ,137.46 ,693.00 ,664.86 ,449.82 ,398.64 ,595.76 ,81.24 ,416.60 ,114.55 ,112.00 ,240.00 ,560.00 ,549.78 ,24.99 ,411.58 ,769.99 ,449.99 ,270.80 ,91.64 ,672.79 ,124.95 ,660.00 ,84.00 ,124.96 ,532.00 ,583.20 ,652.32 ,460.33 ,247.87 ,281.16 ,460.36 ,526.93 ,158.30 ,869.99 ,549.99 ,437.36 ,550.00 ,68.73 ,224.91 ,437.40 ,593.56 ,437.43 ,56.00 ,760.00 ,120.00 ,312.00 ,434.88 ,440.00 ,504.00 ,506.56 ,504.02 ,135.40 ,161.00 ,45.82 ,324.87 ,649.99 ,291.60 ,330.00 ,481.11 ,28.00 ,220.00 ,253.28 ,324.96 ,476.00 ,22.91 ,424.83 ,749.99 ,688.56 ,110.00 ,601.54 ,637.38 ,670.68 ,424.92 ,458.20 ,514.52 ,212.46 ,524.79 ),
      UNBILLED_LOAN_BAL_AMT DECIMAL(18,2) COMPRESS (0.00 ,448.00 ,458.26 ,105.00 ,156.20 ,916.52 ,210.00 ,312.40 ,471.12 ,524.88 ,435.29 ,348.26 ,99.96 ,189.56 ,468.60 ,420.00 ,624.80 ,632.50 ,696.52 ,379.08 ,525.00 ,412.38 ,199.92 ,379.12 ,630.00 ,522.50 ,724.80 ,200.00 ,264.00 ,392.00 ,412.50 ,814.43 ,389.47 ,299.88 ,443.24 ,568.68 ,601.97 ,389.51 ,54.16 ,154.00 ,177.05 ,302.50 ,300.00 ,364.00 ,366.56 ,399.84 ,507.36 ,192.50 ,31.24 ,189.96 ,243.72 ,612.36 ,126.00 ,187.44 ,343.64 ,499.80 ,343.65 ,538.22 ,144.00 ,289.92 ,336.00 ,433.28 ,466.56 ,499.84 ,528.00 ,656.04 ,761.04 ,74.97 ,958.18 ,320.74 ,320.76 ,622.84 ,779.02 ,284.94 ,108.32 ,180.00 ,308.00 ,533.28 ,566.56 ,354.10 ,605.00 ,174.93 ,566.61 ,297.83 ,543.60 ,633.20 ,599.94 ,297.88 ,495.00 ,633.27 ,280.00 ,274.89 ,666.60 ,274.92 ,385.00 ,62.48 ,326.16 ,379.92 ,487.44 ,699.93 ,147.00 ,218.68 ,275.00 ,554.04 ,374.85 ,733.26 ,699.99 ,797.28 ,252.00 ,374.88 ,252.01 ,728.18 ,766.59 ,165.00 ,531.08 ,374.94 ,687.28 ,162.48 ,408.24 ,743.61 ,474.81 ,531.15 ,119.00 ,318.69 ,229.10 ,799.99 ,96.00 ,160.00 ,224.00 ,480.00 ,579.84 ,474.90 ,352.04 ,574.77 ,49.98 ,206.19 ,196.00 ,362.40 ,541.60 ,644.00 ,149.94 ,221.62 ,27.08 ,577.50 ,150.00 ,833.52 ,183.28 ,641.52 ,395.77 ,93.72 ,569.88 ,249.90 ,467.50 ,168.00 ,216.64 ,249.92 ,360.00 ,616.00 ,708.20 ,406.12 ,495.72 ,160.37 ,357.50 ,495.74 ,283.28 ,562.32 ,616.08 ,349.86 ,718.52 ,316.60 ,406.20 ,247.50 ,140.00 ,349.92 ,588.00 ,137.46 ,693.00 ,664.86 ,449.82 ,398.64 ,595.76 ,81.24 ,416.60 ,874.86 ,114.55 ,112.00 ,240.00 ,560.00 ,549.78 ,24.99 ,411.58 ,270.80 ,91.64 ,672.79 ,124.95 ,660.00 ,84.00 ,124.96 ,532.00 ,583.20 ,652.32 ,460.33 ,247.87 ,281.16 ,460.36 ,526.93 ,158.30 ,549.99 ,437.36 ,550.00 ,68.73 ,224.91 ,437.40 ,593.56 ,437.43 ,56.00 ,760.00 ,120.00 ,312.00 ,434.88 ,440.00 ,504.00 ,506.56 ,504.02 ,135.40 ,161.00 ,45.82 ,324.87 ,649.99 ,291.60 ,330.00 ,481.11 ,28.00 ,220.00 ,253.28 ,324.96 ,476.00 ,22.91 ,424.83 ,749.99 ,688.56 ,110.00 ,601.54 ,637.38 ,670.68 ,424.92 ,458.20 ,514.52 ,212.46 ,524.79 ),
      BILLED_UNCOLLECTED_BAL_AMT DECIMAL(18,2) COMPRESS (0.00 ,23.06 ,33.32 ,33.33 ,66.66 ,33.40 ,64.16 ,10.41 ,28.33 ,7.95 ,23.33 ,8.00 ,38.74 ,20.83 ,26.00 ,36.24 ,54.16 ,36.25 ,33.75 ,31.20 ,31.24 ,31.25 ,10.83 ,36.47 ,16.00 ,26.24 ,8.33 ,41.66 ,31.47 ,31.50 ,23.83 ,72.48 ,18.74 ,36.66 ,18.75 ,29.00 ,6.00 ,70.00 ,31.66 ,24.00 ,29.16 ,24.08 ,62.48 ,31.82 ,6.24 ,42.08 ,29.31 ,21.66 ,39.58 ,14.00 ,19.16 ,55.00 ,32.00 ,29.45 ,16.66 ,49.98 ,21.83 ,32.08 ,29.58 ,27.04 ,27.08 ,22.00 ,27.15 ,22.08 ,40.00 ,17.00 ,37.48 ,37.49 ,70.82 ,17.08 ,35.00 ,32.49 ,14.58 ,32.50 ,24.83 ,29.99 ,47.91 ,30.00 ,27.45 ,7.00 ,63.32 ,27.49 ,27.50 ,19.83 ,24.99 ,25.00 ,58.32 ,66.00 ,40.41 ,19.99 ,2.08 ,20.00 ,35.37 ,35.41 ,25.22 ,56.00 ,12.49 ,30.41 ,33.00 ,35.56 ,45.82 ,27.91 ,10.00 ,25.41 ,27.99 ,28.00 ,33.12 ,22.91 ,5.00 ,23.00 ,28.12 ,71.66 ,35.83 ),
      INSTALL_PAID_AMT DECIMAL(18,2) COMPRESS (0.00 ,23.06 ,0.04 ,33.32 ,33.33 ,66.66 ,33.40 ,64.16 ,10.41 ,28.33 ,7.95 ,23.33 ,8.00 ,38.74 ,20.83 ,25.99 ,26.00 ,36.24 ,54.16 ,36.25 ,33.75 ,8.16 ,31.20 ,31.24 ,31.25 ,10.83 ,36.47 ,16.00 ,26.24 ,8.33 ,41.66 ,31.47 ,21.25 ,31.50 ,23.83 ,72.48 ,18.74 ,36.66 ,18.75 ,29.00 ,6.00 ,31.66 ,24.00 ,29.16 ,24.08 ,62.48 ,31.82 ,6.24 ,42.08 ,29.31 ,3.74 ,21.66 ,39.58 ,14.00 ,19.16 ,55.00 ,32.00 ,29.45 ,16.66 ,49.98 ,21.83 ,32.08 ,27.00 ,29.58 ,27.04 ,27.08 ,22.00 ,27.15 ,4.16 ,22.08 ,40.00 ,17.00 ,37.48 ,37.49 ,70.82 ,17.08 ,35.00 ,19.66 ,32.49 ,14.58 ,32.50 ,24.83 ,29.99 ,47.91 ,30.00 ,27.45 ,7.00 ,63.32 ,27.49 ,27.50 ,19.83 ,24.95 ,24.99 ,25.00 ,58.32 ,66.00 ,40.41 ,4.58 ,19.99 ,2.08 ,20.00 ,35.37 ,35.41 ,25.22 ,56.00 ,12.49 ,30.41 ,33.00 ,35.56 ,17.66 ,45.82 ,9.99 ,27.91 ,10.00 ,25.41 ,22.87 ,27.99 ,28.00 ,33.12 ,22.91 ,5.00 ,23.00 ,28.12 ,71.66 ,17.91 ,35.83 ),
      BUYOUT_AMT DECIMAL(18,2) COMPRESS 0.00 ,
      VOL_BUYOUT_AMT DECIMAL(18,2) COMPRESS 0.00 ,
      INVOL_BUYOUT_AMT DECIMAL(18,2) COMPRESS 0.00 ,
      U_BUYOUT_AMT DECIMAL(18,2) COMPRESS 0.00 ,
      CANCEL_AMT DECIMAL(18,2) COMPRESS 0.00 ,
      DP_WO_AMT DECIMAL(18,2) COMPRESS 0.00 ,
      CREDIT_AMT DECIMAL(18,2) COMPRESS 0.00 ,
      INSERT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2017-12-02',DATE '2018-07-02',DATE '2018-02-02',DATE '2017-10-02',DATE '2017-10-06',DATE '2017-10-07',DATE '2018-10-02',DATE '2018-05-03',DATE '2018-08-02',DATE '2018-03-02',DATE '2017-11-02',DATE '2018-11-02',DATE '2018-06-02',DATE '2018-01-02',DATE '2018-11-26',DATE '2018-11-27',DATE '2017-09-08',DATE '2017-09-13',DATE '2018-09-02',DATE '2017-09-26',DATE '2018-04-02'),
      ISSUED_INSTALL_LOAN_AMT DECIMAL(18,2) COMPRESS 0.00 ,
      INSTANCE_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('VE','VN','VW'),
      E_BUYOUT_AMT DECIMAL(12,2) COMPRESS 0.00 ,
      E_BUYOUT_REMAIN_AMT DECIMAL(12,2) COMPRESS 0.00 ,
      U_BUYOUT_REMAIN_AMT DECIMAL(12,2) COMPRESS (0.00 ,212.50 ,156.20 ,425.00 ,312.40 ,348.26 ,189.56 ,100.00 ,420.00 ,200.00 ,54.16 ,299.99 ,300.00 ,31.24 ,243.72 ,405.00 ,187.44 ,190.00 ,343.64 ,187.50 ,336.00 ,400.00 ,505.00 ,374.50 ,75.00 ,108.32 ,500.00 ,390.00 ,175.00 ,297.88 ,280.00 ,385.00 ,62.48 ,326.16 ,379.92 ,62.50 ,218.68 ,275.00 ,252.00 ,374.88 ,380.00 ,165.00 ,485.00 ,162.48 ,162.50 ,374.98 ,375.00 ,480.00 ,50.00 ,475.00 ,260.00 ,362.40 ,580.00 ,149.94 ,27.08 ,150.00 ,93.72 ,575.00 ,216.64 ,249.92 ,360.00 ,250.00 ,378.00 ,316.60 ,355.00 ,140.00 ,396.00 ,137.50 ,350.00 ,398.64 ,434.50 ,81.24 ,239.99 ,240.00 ,324.50 ,270.80 ,124.96 ,424.50 ,125.00 ,281.16 ,337.50 ,434.88 ,440.00 ,135.40 ,225.00 ,330.00 ,435.00 ,220.00 ,324.96 ,112.50 ,324.99 ,325.00 ,430.00 ),
      GIFT_CARD_AMT DECIMAL(12,2) COMPRESS 0.00 ,
      LOAN_ORIG_CUST_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      LOAN_ORIG_CUST_LINE_SEQ_ID CHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0                   ','1                   ','10                  ','11                  ','12                  ','13                  ','14                  ','2                   ','3                   ','4                   ','5                   ','6                   ','7                   ','8                   ','9                   '),
      LOAN_ORIG_ACCT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1','2','3'),
      LOAN_ORIG_EQP_PROD_NM VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('All New HTC One Metal Gray','APPLE WATCH S3 42 SG AL BLK SP','Brigadier by Kyocera','DROID MAXX 2 Blue','DROID MAXX 2 White','Droid Maxx by Motorola','Droid Mini by Motorola in Red','Droid Mini by Motorola','DROID TURBO 2 BLK Leather 32GB','DROID TURBO 2 BLK Soft-Grip 32GB','DROID TURBO 2 Grey Nylon 32GB','DROID TURBO 2 WHT Soft-Grip 32GB','DROID TURBO BY MOT GRAY BN B','DROID TURBO BY MOT SAPPH BL BN','DROID TURBO by MOTOROLA BLACK BN','DROID TURBO by MOTOROLA BLK MGF','DROID TURBO by MOTOROLA RED MGF','DROID TURBO MOTOROLA BLK BN 64GB','Droid Ultra by Motorola','DuraXVPlus by Kyocera','Galaxy S9 Plus Coral Blue','Galaxy S9 Plus Lilac Purple','Galaxy S9 Plus Midnight Black','Google Nexus 6','HTC 10','HTC Desire 526','HTC Desire 626','HTC One M9 Metal Gray','HTC One M9 Silver Gold','HTC ONE','IPAD AIR 2 16GB S GRAY','IPAD AIR 2 64GB GOLD','IPAD AIR 2 64GB S GRAY','IPAD MINI 16GB WHITE','IPAD PRO 128GB GRAY','iPhone 5C Blue 16GB','IPHONE 5C BLUE 8GB-USA','iPhone 5C Green 16GB','iPhone 5C Pink 16GB','IPHONE 5C PINK 8GB-USA','iPhone 5C White 16GB','IPHONE 5C WHITE 8GB -USA','iPhone 5S Gold 16GB','iPhone 5S Gold 32GB','iPhone 5S Silver 16GB','iPhone 5S Silver 32GB','iPhone 5S Space Gray 16GB','iPhone 5S Space Gray 32GB','iPhone 5S Space Gray 64GB','iPhone 6 128GB Gold','iPhone 6 128GB Silver','iPhone 6 128GB Space Gray','iPhone 6 16GB Gold','iPhone 6 16GB Silver','iPhone 6 16GB Space Gray','iPhone 6 64GB Gold','iPhone 6 64GB Silver','iPhone 6 64GB Space Gray','iPhone 6 Plus 128GB Gold','iPhone 6 Plus 128GB Space Gray','iPhone 6 Plus 16GB Gold','iPhone 6 Plus 16GB Silver','iPhone 6 Plus 16GB Space Gray','iPhone 6 Plus 64GB Gold','iPhone 6 Plus 64GB Silver','iPhone 6 Plus 64GB Space Gray','iPhone 6S 128GB Gold','iPhone 6S 128GB Rose Gold','iPhone 6S 128GB Silver','iPhone 6S 128GB Space Gray','iPhone 6S 16GB Gold','iPhone 6S 16GB Rose Gold','iPhone 6S 16GB Silver','iPhone 6S 16GB Space Gray','iPhone 6S 32GB Gold','iPhone 6S 32GB Rose Gold','iPhone 6S 32GB Silver','iPhone 6S 32GB Space Gray','iPhone 6S 64GB Gold','iPhone 6S 64GB Rose Gold','iPhone 6S 64GB Silver','iPhone 6S 64GB Space Gray','iPhone 6S Plus 128GB Rose Gold','iPhone 6S Plus 128GB Space Gray','iPhone 6S Plus 16GB Gold','iPhone 6S Plus 16GB Rose Gold','iPhone 6S Plus 16GB Silver','iPhone 6S Plus 16GB Space Gray','iPhone 6S Plus 32GB Rose Gold','iPhone 6S Plus 32GB Space Gray','iPhone 6S Plus 64GB Gold','iPhone 6S Plus 64GB Rose Gold','iPhone 6S Plus 64GB Silver','iPhone 6S Plus 64GB Space Gray','iPhone 7 Black 128GB','iPhone 7 Black 256GB','iPhone 7 Black 32GB','iPhone 7 Gold 128GB','iPhone 7 Gold 32GB','iPhone 7 Jet Black 128GB','iPhone 7 Plus Black 128GB','iPhone 7 Plus Black 256GB','iPhone 7 Plus Black 32GB','iPhone 7 Plus Gold 128GB','iPhone 7 Plus Gold 32GB','iPhone 7 Plus Jet Black 128GB','iPhone 7 Plus Jet Black 256GB','iPhone 7 Plus Red 128GB','iPhone 7 Plus Rose Gold 128GB','iPhone 7 Plus Rose Gold 256GB','iPhone 7 Plus Rose Gold 32GB','iPhone 7 Plus Silver 128GB','iPhone 7 Plus Silver 32GB','iPhone 7 Red 128GB','iPhone 7 Rose Gold 128GB','iPhone 7 Rose Gold 32GB','iPhone 7 Silver 128GB','iPhone 7 Silver 32GB','IPHONE 8 GOLD 256GB VZ','IPHONE 8 GOLD 64GB VZ','IPHONE 8 PLUS 64GB RED VERIZON','IPHONE 8 PLUS GOLD 256GB VZ','IPHONE 8 PLUS GOLD 64GB VZ','IPHONE 8 PLUS SILVER 256GB VZ','IPHONE 8 PLUS SILVER 64GB VZ','IPHONE 8 PLUS SP GRAY 64GB VZ','IPHONE 8 PLUS SP GRY 256GB VZ','IPHONE 8 SILVER 64GB VZ','IPHONE 8 SPACE GRAY 256GB VZ','IPHONE 8 SPACE GRAY 64GB VZ','IPHONE SE GOLD 16GB','IPHONE SE GOLD 64GB','IPHONE SE ROSE GOLD 16GB','IPHONE SE ROSE GOLD 32GB','IPHONE SE ROSE GOLD 64GB','IPHONE SE SILVER 16GB','IPHONE SE SILVER 64GB','IPHONE SE SPACE GRAY 16GB','IPHONE SE SPACE GRAY 32GB','IPHONE SE SPACE GRAY 64GB','IPHONE X SILVER 256GB VZ','IPHONE X SILVER 64GB VZ','IPHONE X SPACE GRAY 256GB VZ','IPHONE X SPACE GRAY 64GB VZ','Kyocera DuraForcePRO','Kyocera DuraXV','LG Cosmos 3','LG Exalt 2','LG Exalt','LG Extravert 2','LG G Vista','LG G2 White','LG G2','LG G3 Metallic Black','LG G3 Silk White','LG G4 Ceramic White','LG G4 Genuine Leather Black','LG G4 Metallic Gray','LG G5 Silver','LG G5 Titanium','LG G6 Black','LG G6 Platinum','LG K20 V','LG K4 LTE','LG K8 V','LG Lancet for Android','LG Lucid 3','LG Revere 3','LG Stylo 2 V','LG Terra','LG V10 Luxe White','LG V10 Space Black','LG V20 Titanium','Moto Z Droid BLACK/LUNAR GREY','Moto Z Force BLACK/LUNAR GREY','Moto Z Force WHITE/FINE GOLD','Moto Z Play Black','Moto Z Play White','MOTO Z2 FORCE BLACK','MOTO Z2 PLAY LUNAR GRAY','Motorola Droid Maxx 16GB Black','Motorola Droid Maxx 16GB Red','PIXEL 2 JUST BLACK 64GB','PIXEL 2 XL BLACK AND WHITE 64GB','PIXEL 2 XL JUST BLACK 64GB','Pixel Black 128GB','Pixel Black 32GB','Pixel Silver 32GB','Pixel XL Black 32GB','SAM Galaxy Note 4 Charcoal Black','SAM Galaxy Note 4 Frost White','SAM GALAXY S6 EDGE PLUS BLK 32GB','SAM GALAXY S6 EDGE PLUS BLK 64GB','SAM GALAXY S6 EDGE PLUS GLD 32GB','SAM Galaxy S8 Plus Orchid Gray','SAM Galaxy Tab S Dazzling White','SAM S7 EDGE BLUE CORAL 32GB','Samsung Convoy 3','Samsung Convoy 4','Samsung Galaxy Core Prime','SAMSUNG GALAXY J3 ECLIPSE','Samsung Galaxy J3 V','Samsung Galaxy J7 V','Samsung Galaxy Note 3 in White','Samsung Galaxy Note 3','SAMSUNG Galaxy Note 7 BLACK','Samsung Galaxy Note Edge Black','Samsung Galaxy Note Pro Tablet','SAMSUNG GALAXY NOTE5 BLACK 32 GB','SAMSUNG GALAXY NOTE5 BLACK 64 GB','SAMSUNG GALAXY NOTE5 GOLD 32 GB','SAMSUNG GALAXY NOTE5 WHITE 32 GB','SAMSUNG Galaxy Note7 BLACK','SAMSUNG Galaxy Note7 BLUE','SAMSUNG Galaxy Note7 SILVER','Samsung Galaxy S 4 Black 16GB','Samsung Galaxy S 4 Black Mist','Samsung Galaxy S 4 Mini','Samsung Galaxy S 4 White 16GB','Samsung Galaxy S 4 White Frost','Samsung Galaxy S 5 Black','Samsung Galaxy S 5 Copper Gold','Samsung Galaxy S 5 Electric Blue','Samsung Galaxy S 5 White','Samsung Galaxy S III Mini','Samsung Galaxy S6 Black 32GB','Samsung Galaxy S6 Black 64GB','Samsung Galaxy S6 Edge BLK 32GB','Samsung Galaxy S6 Edge BLK 64GB','Samsung Galaxy S6 Edge GLD 32GB','Samsung Galaxy S6 Edge WHT 32GB','Samsung Galaxy S6 Gold 32GB','Samsung Galaxy S6 White 32GB','Samsung Galaxy S6 White 64GB','Samsung Galaxy S7 Black 32GB','Samsung Galaxy S7 edge BLK 32GB','Samsung Galaxy S7 edge Gold 32GB','Samsung Galaxy S7 edge SLV 32GB','Samsung Galaxy S7 Gold 32GB','Samsung Galaxy S8 Black','Samsung Galaxy S8 Orchid Gray','Samsung Galaxy S8 Plus Black','Samsung Galaxy S8 Plus Silver','Samsung Galaxy S8 Silver','Samsung Galaxy S9 Coral Blue','Samsung Galaxy S9 Lilac Purple','Samsung Galaxy S9 Midnight Black','Samsung Galaxy Tab S2 White','Samsung Gusto 3','SAMSUNG NOTE 8 MIDNIGHT BLACK','SAMSUNG NOTE 8 ORCHID GRAY','The New Moto X BLACK','Verizon Ellipsis 8'),
      FIRST_PYMNT_MADE_IND VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      CREDIT_APP_NUM CHAR(9) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      CD_CREDIT_CLASS_IND VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A1','AA','AM','AR','B','C','CA','CB','CC','D','H','RD','RN','X'),
      CREDIT_SCORE INTEGER COMPRESS ,
      CREDIT_SCORE_MODEL CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      LOAN_ORIG_ITEM_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('G-2PW2100-021-A','G-2PW4100-021-A','G-2PW4100-021-B','G-2PW4100-022-A','GA00139-US','GA00151-US','GA00152-US','HTC6500LVW','HTC6525LVW','HTC6535LVW','HTC6535LVWSG','HTC6545LVW','HTCD100LVW','HTCD200LVW','KYOE4520','KYOE4520PTT','KYOE6782','KYOE6810N','LG-VN170','LG-VN210','LG-VN251S','LG-VN280','LG-VN360','LG-VN370','LG-VS425','LG-VS500','LG-VS501','LG-VS820','LG-VS835','LG-VS876','LG-VS880','LG-VS980','LG-VS980W','LG-VS985','LG-VS985W','LG-VS986','LG-VS986LD','LG-VS986W','LG-VS987','LG-VS987T','LG-VS988','LG-VS988T','LG-VS990','LG-VS990W','LG-VS995','ME341LL/A','ME342LL/A','ME343LL/A','ME344LL/A','ME345LL/A','ME346LL/A','ME347LL/A','ME553LL/A','ME555LL/A','ME556LL/A','ME557LL/A','MG5W2LL/A','MG5X2LL/A','MG5Y2LL/A','MG602LL/A','MG612LL/A','MG622LL/A','MG632LL/A','MG642LL/A','MG652LL/A','MGCK2LL/A','MGCL2LL/A','MGCM2LL/A','MGCN2LL/A','MGCQ2LL/A','MGCR2LL/A','MGCT2LL/A','MGCU2LL/A','MGFG2LL/A','MGFJ2LL/A','MGFL2LL/A','MGH62LL/A','MGJY2LL/A','MH1Y2LL/A','MKRR2LL/A','MKRT2LL/A','MKRW2LL/A','MKRX2LL/A','MKRY2LL/A','MKT02LL/A','MKT12LL/A','MKT22LL/A','MKT32LL/A','MKT42LL/A','MKT52LL/A','MKT62LL/A','MKV32LL/A','MKV52LL/A','MKV62LL/A','MKV72LL/A','MKV82LL/A','MKV92LL/A','MKVD2LL/A','MKVE2LL/A','MKVF2LL/A','MKVJ2LL/A','ML3L2LL/A','MLLY2LL/A','MLM02LL/A','MLMF2LL/A','MLMG2LL/A','MLY52LL/A','MLY62LL/A','MLY72LL/A','MLY82LL/A','MN1M2LL/A','MN1Q2LL/A','MN1U2LL/A','MN1V2LL/A','MN382LL/A','MN3D2LL/A','MN5T2LL/A','MN5U2LL/A','MN5V2LL/A','MN5W2LL/A','MN5X2LL/A','MN5Y2LL/A','MN622LL/A','MN632LL/A','MN8G2LL/A','MN8L2LL/A','MNAC2LL/A','MNAD2LL/A','MNAE2LL/A','MNAF2LL/A','MNAJ2LL/A','MNAK2LL/A','MNAL2LL/A','MNAM2LL/A','MNAP2LL/A','MNAQ2LL/A','MNR12LL/A','MNR22LL/A','MNR32LL/A','MNR42LL/A','MOTXT1030','MOTXT1030R','MOTXT1080','MOTXT1080M','MOTXT1080M16','MOTXT1080MR16','MOTXT1096','MOTXT1103','MOTXT1254','MOTXT1254BN','MOTXT1254BN64','MOTXT1254GBNB','MOTXT1254R','MOTXT1254VB','MOTXT1565B','MOTXT1565W','MOTXT1585','MOTXT1585BL','MOTXT1585GBN','MOTXT1585W','MOTXT163501','MOTXT163501W','MOTXT1650','MOTXT1650M','MOTXT1650MFG','MOTXT171002','MOTXT178901','MP8K2LL/A','MP8N2LL/A','MPR02LL/A','MPRT2LL/A','MQ722LL/A','MQ732LL/A','MQ742LL/A','MQ7X2LL/A','MQ802LL/A','MQ962LL/A','MQ972LL/A','MQ982LL/A','MQ992LL/A','MQ9A2LL/A','MQ9C2LL/A','MQCK2LL/A','MQCL2LL/A','MQCN2LL/A','MQCP2LL/A','MQK22LL/A','MRTG2LL/A','N_A','QTAQZ3','SCHI435ZKV','SCHI545PKVPS','SCHI545PWVPS','SCHI545ZKV','SCHI545ZWV','SCHU680MAV','SMB311ZKA','SMB690VBKA','SMG360VHAA','SMG730VMBA','SMG900VMBV','SMG900VZDV','SMG900VZKV','SMG900VZWV','SMG920VZDA','SMG920VZKA','SMG920VZKE','SMG920VZWA','SMG920VZWE','SMG925VZDA','SMG925VZKA','SMG925VZKE','SMG925VZWA','SMG928VZDA','SMG928VZKA','SMG928VZKE','SMG930VZDA','SMG930VZKA','SMG935VZBA','SMG935VZDA','SMG935VZKA','SMG935VZSA','SMG950UZKV','SMG950UZSV','SMG950UZVV','SMG955UZKV','SMG955UZSV','SMG955UZVV','SMG960UZBV','SMG960UZKV','SMG960UZPV','SMG965UZBV','SMG965UZKV','SMG965UZPV','SMJ320VZKA','SMJ327VZKA','SMJ727VZSA','SMN900VZKE','SMN900VZWE','SMN910VZKE','SMN910VZWE','SMN915VZKE','SMN920VZDA','SMN920VZKA','SMN920VZKE','SMN920VZWA','SMN930VZBA','SMN930VZBB','SMN930VZKA','SMN930VZKB','SMN930VZSA','SMN950UZKV','SMN950UZVV','SMT567VZKA','SMT807VZWA'),
      RPT_PPLAN_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('ST.POST.V.13610','ST.POST.V.17991','ST.POST.V.17993','ST.POST.V.73436','ST.POST.V.73442','ST.POST.V.86491','ST.POST.V.86492','ST.POST.V.86494','ST.POST.V.86495','ST.POST.V.86496','ST.POST.V.86497','ST.POST.V.86498','ST.POST.V.86499','ST.POST.V.86500','ST.POST.V.86502','ST.POST.V.86503','ST.POST.V.87269','ST.POST.V.88005','ST.POST.V.88605','ST.POST.V.89742','ST.POST.V.89849','ST.POST.V.89850','ST.POST.V.90003','ST.POST.V.90004','ST.POST.V.90132','ST.POST.V.90186','ST.POST.V.91382','ST.POST.V.91641','ST.POST.V.91644','ST.POST.V.91701','ST.POST.V.91702','ST.POST.V.91821','ST.POST.V.91822','ST.POST.V.91824','ST.POST.V.91945','ST.POST.V.91953','ST.POST.V.91954','ST.POST.V.92039','ST.POST.V.92040','ST.POST.V.92042','ST.POST.V.92756','ST.POST.V.92765','ST.POST.V.92770','ST.POST.V.92772','ST.POST.V.92775','ST.POST.V.92780','ST.POST.V.92784','ST.POST.V.94156','ST.POST.V.94157','ST.POST.V.94158','ST.POST.V.94159','ST.POST.V.94162','ST.POST.V.94163','ST.POST.V.94171','ST.POST.V.94679','ST.POST.V.96325','ST.POST.V.96327','ST.POST.V.96328','ST.POST.V.96329','ST.POST.V.96331','ST.POST.V.96333','ST.POST.V.96334','ST.POST.V.96335','ST.POST.V.96345','ST.POST.V.97105','ST.POST.V.97928','ST.POST.V.98127','ST.POST.V.98129','ST.POST.V.98245','ST.POST.V.99230','ST.POST.V.99231','ST.POST.V.99304','UNTG'),
      REQUIRED_DOWN_PYMNT_AMT DECIMAL(12,2) COMPRESS 0.00 ,
      LOAN_ORIG_FICO_SCORE INTEGER COMPRESS (0 ,768 ,769 ,2 ,770 ,771 ,4 ,772 ,773 ,774 ,775 ,776 ,777 ,778 ,779 ,780 ,781 ,782 ,783 ,784 ,785 ,786 ,787 ,788 ,789 ,790 ,791 ,792 ,793 ,794 ,795 ,796 ,44444444 ,797 ,798 ,799 ,800 ,801 ,802 ,803 ,804 ,805 ,806 ,807 ,808 ,809 ,810 ,811 ,812 ,813 ,814 ,815 ,816 ,817 ,818 ,819 ,820 ,821 ,822 ,823 ,824 ,825 ,826 ,827 ,828 ,829 ,830 ,831 ,832 ,833 ,834 ,579 ,835 ,836 ,837 ,838 ,839 ,840 ,841 ,842 ,843 ,844 ,589 ,845 ,846 ,847 ,848 ,850 ,598 ,600 ,604 ,605 ,606 ,607 ,608 ,609 ,610 ,611 ,612 ,613 ,614 ,615 ,616 ,617 ,618 ,619 ,620 ,621 ,622 ,623 ,624 ,625 ,626 ,627 ,628 ,629 ,630 ,631 ,632 ,633 ,634 ,635 ,636 ,637 ,638 ,639 ,640 ,641 ,642 ,643 ,644 ,645 ,646 ,647 ,648 ,649 ,650 ,651 ,652 ,653 ,654 ,655 ,656 ,657 ,658 ,659 ,660 ,661 ,662 ,663 ,664 ,665 ,666 ,667 ,668 ,669 ,670 ,671 ,672 ,673 ,674 ,675 ,676 ,677 ,678 ,679 ,680 ,681 ,682 ,683 ,684 ,685 ,686 ,687 ,688 ,689 ,690 ,691 ,692 ,693 ,694 ,695 ,696 ,697 ,698 ,699 ,700 ,701 ,702 ,703 ,704 ,705 ,706 ,707 ,708 ,709 ,710 ,711 ,712 ,713 ,714 ,715 ,716 ,717 ,718 ,719 ,720 ,721 ,722 ,723 ,724 ,725 ,726 ,727 ,728 ,729 ,730 ,731 ,732 ,733 ,734 ,735 ,736 ,737 ,738 ,739 ,740 ,741 ,742 ,743 ,999 ,744 ,745 ,746 ,747 ,748 ,749 ,750 ,751 ,752 ,753 ,754 ,755 ,756 ,757 ,758 ,759 ,760 ,761 ,762 ,763 ,764 ,765 ,766 ,767 ),
      LOAN_ORIG_FICO_SCORE_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2018-04-18',DATE '2016-12-20',DATE '2017-12-05',DATE '2018-04-25',DATE '2016-12-27',DATE '2017-12-12',DATE '2017-07-04',DATE '2017-12-19',DATE '2017-07-11',DATE '2017-12-26',DATE '2017-07-18',DATE '2018-07-04',DATE '2017-02-08',DATE '2017-07-25',DATE '2017-02-14',DATE '2018-07-11',DATE '2016-10-04',DATE '2017-02-20',DATE '2018-02-06',DATE '2018-07-18',DATE '2016-10-12',DATE '2018-02-13',DATE '2018-07-25',DATE '2016-10-18',DATE '2017-10-03',DATE '2018-02-20',DATE '2016-10-26',DATE '2017-10-10',DATE '2018-02-27',DATE '2017-05-02',DATE '2017-10-17',DATE '2018-10-03',DATE '2017-05-09',DATE '2017-10-24',DATE '2017-05-16',DATE '2018-05-02',DATE '2017-10-31',DATE '2017-05-23',DATE '2018-05-09',DATE '2016-08-02',DATE '2017-05-30',DATE '2018-05-16',DATE '2018-05-23',DATE '2016-08-17',DATE '2017-08-01',DATE '2018-05-30',DATE '2017-08-08',DATE '2017-03-01',DATE '2016-08-30',DATE '2017-08-15',DATE '2018-08-01',DATE '2017-03-07',DATE '2017-08-22',DATE '2018-08-08',DATE '2017-03-15',DATE '2016-11-01',DATE '2017-08-29',DATE '2018-08-15',DATE '2017-03-21',DATE '2018-03-06',DATE '2016-11-08',DATE '2018-08-22',DATE '2017-03-28',DATE '2018-03-13',DATE '2016-11-15',DATE '2018-08-29',DATE '2018-03-20',DATE '2016-11-22',DATE '2017-11-08',DATE '2018-03-27',DATE '2016-11-30',DATE '2017-11-14',DATE '2017-06-06',DATE '2017-11-21',DATE '2017-06-13',DATE '2017-01-03',DATE '2017-11-28',DATE '2017-06-20',DATE '2018-06-06',DATE '2017-01-10',DATE '2017-06-27',DATE '2018-06-13',DATE '2017-01-17',DATE '2018-01-02',DATE '2016-09-06',DATE '2018-06-20',DATE '2017-01-24',DATE '2018-01-09',DATE '2016-09-14',DATE '2018-06-27',DATE '2016-04-03',DATE '2017-01-31',DATE '2016-04-05',DATE '2016-09-21',DATE '2017-09-05',DATE '2018-01-23',DATE '2016-09-28',DATE '2017-09-12',DATE '2018-01-30',DATE '2017-04-04',DATE '2017-09-19',DATE '2017-04-11',DATE '2017-09-27',DATE '2017-04-18',DATE '2018-04-03',DATE '2016-12-06',DATE '2017-04-25',DATE '2018-04-10',DATE '2016-12-13',DATE '2018-09-26'),
      LOAN_ORIG_FICO_LAST_UPD_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2016-12-22',DATE '2018-04-23',DATE '2017-12-08',DATE '2018-04-26',DATE '2016-12-29',DATE '2017-12-14',DATE '2017-07-07',DATE '2017-12-21',DATE '2017-07-13',DATE '2017-02-02',DATE '2017-12-28',DATE '2017-07-20',DATE '2018-07-05',DATE '2017-02-09',DATE '2017-07-27',DATE '2017-02-16',DATE '2018-02-01',DATE '2018-07-13',DATE '2016-10-06',DATE '2018-07-19',DATE '2017-02-23',DATE '2018-02-08',DATE '2016-10-13',DATE '2018-07-26',DATE '2018-02-15',DATE '2016-10-20',DATE '2017-10-05',DATE '2018-02-22',DATE '2016-10-27',DATE '2017-10-12',DATE '2017-05-04',DATE '2017-10-19',DATE '2018-10-04',DATE '2017-05-12',DATE '2017-10-26',DATE '2017-05-18',DATE '2018-05-03',DATE '2017-05-25',DATE '2018-05-11',DATE '2018-05-17',DATE '2018-05-24',DATE '2018-05-31',DATE '2017-08-03',DATE '2017-08-10',DATE '2016-08-27',DATE '2017-03-02',DATE '2017-08-17',DATE '2018-08-02',DATE '2017-03-09',DATE '2017-08-24',DATE '2018-08-10',DATE '2017-03-16',DATE '2018-03-01',DATE '2016-11-03',DATE '2017-08-31',DATE '2018-08-16',DATE '2017-03-23',DATE '2018-03-08',DATE '2016-11-10',DATE '2018-08-23',DATE '2017-03-30',DATE '2018-03-15',DATE '2016-11-17',DATE '2018-08-30',DATE '2017-11-02',DATE '2018-03-22',DATE '2016-11-24',DATE '2017-11-09',DATE '2018-03-29',DATE '2017-06-02',DATE '2017-11-16',DATE '2017-06-08',DATE '2017-11-23',DATE '2017-06-15',DATE '2017-01-05',DATE '2017-11-30',DATE '2017-06-22',DATE '2018-06-07',DATE '2017-01-12',DATE '2017-06-29',DATE '2018-06-14',DATE '2016-09-02',DATE '2018-01-04',DATE '2017-01-21',DATE '2016-09-08',DATE '2018-06-21',DATE '2017-01-26',DATE '2018-01-11',DATE '2016-09-15',DATE '2018-06-28',DATE '2016-09-22',DATE '2017-09-07',DATE '2018-01-25',DATE '2016-09-29',DATE '2017-09-14',DATE '2017-04-06',DATE '2017-09-21',DATE '2017-04-13',DATE '2017-09-28',DATE '2016-12-02',DATE '2017-04-20',DATE '2018-04-05',DATE '2016-12-08',DATE '2017-04-27',DATE '2018-04-12',DATE '2018-09-27',DATE '2016-12-15'),
      CUST_ID_LOAN_ASSOC_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2016-12-16',DATE '2016-12-17',DATE '2016-12-18',DATE '2016-12-19',DATE '2015-07-24',DATE '2016-12-20',DATE '2015-07-25',DATE '2016-12-21',DATE '2015-02-14',DATE '2016-12-22',DATE '2016-12-23',DATE '2016-12-24',DATE '2016-12-26',DATE '2015-07-31',DATE '2015-02-21',DATE '2016-02-06',DATE '2015-02-28',DATE '2016-02-13',DATE '2015-10-01',DATE '2015-10-02',DATE '2015-10-03',DATE '2016-02-19',DATE '2015-10-04',DATE '2016-02-20',DATE '2015-10-05',DATE '2015-10-07',DATE '2015-10-08',DATE '2015-10-09',DATE '2015-10-10',DATE '2016-02-27',DATE '2015-10-12',DATE '2015-10-13',DATE '2015-05-02',DATE '2015-10-14',DATE '2015-10-15',DATE '2015-10-16',DATE '2015-10-17',DATE '2015-10-18',DATE '2015-10-19',DATE '2016-10-03',DATE '2015-05-08',DATE '2015-10-20',DATE '2015-05-09',DATE '2015-10-21',DATE '2016-10-05',DATE '2015-10-22',DATE '2016-10-06',DATE '2015-10-23',DATE '2015-10-24',DATE '2015-10-25',DATE '2015-10-26',DATE '2016-10-10',DATE '2015-10-27',DATE '2016-10-11',DATE '2015-05-16',DATE '2015-10-28',DATE '2015-10-29',DATE '2015-10-30',DATE '2016-10-14',DATE '2015-10-31',DATE '2016-10-15',DATE '2016-10-17',DATE '2015-05-22',DATE '2016-10-18',DATE '2015-05-23',DATE '2016-05-07',DATE '2016-10-19',DATE '2016-10-20',DATE '2015-05-29',DATE '2015-05-30',DATE '2015-08-01',DATE '2015-08-03',DATE '2015-08-07',DATE '2015-08-08',DATE '2015-08-10',DATE '2015-08-11',DATE '2015-08-12',DATE '2015-08-13',DATE '2015-08-14',DATE '2015-08-15',DATE '2015-08-17',DATE '2015-03-07',DATE '2015-08-21',DATE '2015-08-22',DATE '2015-08-24',DATE '2015-03-14',DATE '2015-08-28',DATE '2015-08-29',DATE '2016-08-13',DATE '2015-08-31',DATE '2015-03-21',DATE '2016-03-05',DATE '2016-03-06',DATE '2016-03-07',DATE '2016-08-19',DATE '2016-08-20',DATE '2016-03-11',DATE '2015-03-28',DATE '2016-03-12',DATE '2015-11-01',DATE '2015-11-02',DATE '2016-03-18',DATE '2015-11-03',DATE '2016-03-19',DATE '2015-11-04',DATE '2015-11-05',DATE '2014-11-22',DATE '2015-11-06',DATE '2015-11-07',DATE '2015-11-08',DATE '2015-11-09',DATE '2016-03-25',DATE '2014-11-26',DATE '2016-03-26',DATE '2015-11-11',DATE '2014-11-28',DATE '2015-11-12',DATE '2016-03-28',DATE '2014-11-29',DATE '2015-11-13',DATE '2015-11-14',DATE '2016-03-31',DATE '2015-11-16',DATE '2015-06-05',DATE '2015-06-06',DATE '2015-11-19',DATE '2015-06-08',DATE '2015-11-20',DATE '2015-11-21',DATE '2015-11-22',DATE '2015-06-11',DATE '2015-11-23',DATE '2015-06-12',DATE '2015-11-24',DATE '2015-06-13',DATE '2015-11-25',DATE '2015-06-14',DATE '2015-06-15',DATE '2015-11-27',DATE '2015-06-16',DATE '2015-11-28',DATE '2015-11-29',DATE '2015-06-18',DATE '2015-11-30',DATE '2015-06-19',DATE '2015-06-20',DATE '2015-06-21',DATE '2016-11-19',DATE '2015-06-26',DATE '2015-06-27',DATE '2015-06-29',DATE '2016-11-25',DATE '2015-06-30',DATE '2016-01-02',DATE '2016-11-26',DATE '2016-11-27',DATE '2016-11-28',DATE '2016-01-09',DATE '2015-01-31',DATE '2016-01-16',DATE '2017-11-24',DATE '2016-01-18',DATE '2014-09-19',DATE '2015-09-04',DATE '2015-09-05',DATE '2015-09-11',DATE '2015-09-12',DATE '2016-01-30',DATE '2015-04-04',DATE '2015-09-18',DATE '2015-09-19',DATE '2015-09-20',DATE '2015-09-21',DATE '2015-04-10',DATE '2015-09-22',DATE '2015-04-11',DATE '2015-09-23',DATE '2015-09-24',DATE '2015-09-25',DATE '2015-09-26',DATE '2015-09-27',DATE '2015-09-28',DATE '2015-04-17',DATE '2015-09-29',DATE '2016-04-01',DATE '2015-04-18',DATE '2015-09-30',DATE '2016-04-02',DATE '2016-09-16',DATE '2016-09-17',DATE '2014-12-06',DATE '2015-04-24',DATE '2015-04-25',DATE '2016-04-09',DATE '2016-09-21',DATE '2016-09-22',DATE '2016-09-23',DATE '2014-12-12',DATE '2016-09-24',DATE '2014-12-13',DATE '2016-09-26',DATE '2016-09-27',DATE '2016-09-28',DATE '2015-12-01',DATE '2016-09-29',DATE '2014-12-18',DATE '2015-12-02',DATE '2016-09-30',DATE '2014-12-19',DATE '2015-12-03',DATE '2014-12-20',DATE '2015-12-04',DATE '2014-12-21',DATE '2015-12-05',DATE '2014-12-22',DATE '2015-12-06',DATE '2014-12-23',DATE '2015-12-07',DATE '2014-12-24',DATE '2015-12-09',DATE '2014-12-26',DATE '2015-12-10',DATE '2014-12-27',DATE '2015-12-11',DATE '2015-12-12',DATE '2015-12-13',DATE '2015-12-14',DATE '2016-04-30',DATE '2015-07-03',DATE '2015-12-15',DATE '2015-12-16',DATE '2015-12-17',DATE '2015-12-18',DATE '2015-12-19',DATE '2016-12-03',DATE '2015-12-20',DATE '2015-12-21',DATE '2017-04-21',DATE '2015-07-10',DATE '2015-12-22',DATE '2015-07-11',DATE '2015-12-23',DATE '2015-12-24',DATE '2016-12-09',DATE '2015-12-26',DATE '2016-12-10',DATE '2015-12-27',DATE '2015-12-28',DATE '2015-07-17',DATE '2015-12-29',DATE '2015-07-18',DATE '2015-12-30',DATE '2015-02-07',DATE '2015-12-31',DATE '2016-12-15'),
      FICO_SCORE_EFF_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2018-04-18',DATE '2016-12-20',DATE '2017-12-05',DATE '2018-04-25',DATE '2016-12-27',DATE '2017-12-12',DATE '2017-07-04',DATE '2017-12-19',DATE '2017-07-11',DATE '2017-12-26',DATE '2017-07-18',DATE '2018-07-04',DATE '2017-02-08',DATE '2017-07-25',DATE '2017-02-14',DATE '2018-07-11',DATE '2016-10-04',DATE '2017-02-20',DATE '2018-02-06',DATE '2018-07-18',DATE '2016-10-12',DATE '2018-02-13',DATE '2018-07-25',DATE '2016-10-18',DATE '2017-10-03',DATE '2018-02-20',DATE '2016-10-26',DATE '2017-10-10',DATE '2018-02-27',DATE '2017-05-02',DATE '2017-10-17',DATE '2018-10-03',DATE '2017-05-09',DATE '2017-10-24',DATE '2017-05-16',DATE '2018-05-02',DATE '2017-10-31',DATE '2017-05-23',DATE '2018-05-09',DATE '2016-08-02',DATE '2017-05-30',DATE '2018-05-16',DATE '2018-05-23',DATE '2016-08-17',DATE '2017-08-01',DATE '2018-05-30',DATE '2017-08-08',DATE '2017-03-01',DATE '2016-08-30',DATE '2017-08-15',DATE '2018-08-01',DATE '2017-03-07',DATE '2017-08-22',DATE '2018-08-08',DATE '2017-03-15',DATE '2016-11-01',DATE '2017-08-29',DATE '2018-08-15',DATE '2017-03-21',DATE '2018-03-06',DATE '2016-11-08',DATE '2018-08-22',DATE '2017-03-28',DATE '2018-03-13',DATE '2016-11-15',DATE '2018-08-29',DATE '2018-03-20',DATE '2016-11-22',DATE '2017-11-08',DATE '2018-03-27',DATE '2016-11-30',DATE '2017-11-14',DATE '2017-06-06',DATE '2017-11-21',DATE '2017-06-13',DATE '2017-01-03',DATE '2017-11-28',DATE '2017-06-20',DATE '2018-06-06',DATE '2017-01-10',DATE '2017-06-27',DATE '2018-06-13',DATE '2017-01-17',DATE '2018-01-02',DATE '2016-09-06',DATE '2018-06-20',DATE '2017-01-24',DATE '2018-01-09',DATE '2016-09-14',DATE '2018-06-27',DATE '2016-04-03',DATE '2017-01-31',DATE '2016-04-05',DATE '2016-09-21',DATE '2017-09-05',DATE '2018-01-23',DATE '2016-09-28',DATE '2017-09-12',DATE '2018-01-30',DATE '2017-04-04',DATE '2017-09-19',DATE '2017-04-11',DATE '2017-09-27',DATE '2017-04-18',DATE '2018-04-03',DATE '2016-12-06',DATE '2017-04-25',DATE '2018-04-10',DATE '2016-12-13',DATE '2018-09-26'),
      FICO_LAST_UPD_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2016-12-22',DATE '2018-04-23',DATE '2017-12-08',DATE '2018-04-26',DATE '2016-12-29',DATE '2017-12-14',DATE '2017-07-07',DATE '2017-12-21',DATE '2017-07-13',DATE '2017-02-02',DATE '2017-12-28',DATE '2017-07-20',DATE '2018-07-05',DATE '2017-02-09',DATE '2017-07-27',DATE '2017-02-16',DATE '2018-02-01',DATE '2018-07-13',DATE '2016-10-06',DATE '2018-07-19',DATE '2017-02-23',DATE '2018-02-08',DATE '2016-10-13',DATE '2018-07-26',DATE '2018-02-15',DATE '2018-02-19',DATE '2016-10-20',DATE '2017-10-05',DATE '2018-02-22',DATE '2016-10-27',DATE '2017-10-12',DATE '2017-05-04',DATE '2017-10-19',DATE '2018-10-04',DATE '2017-05-12',DATE '2017-10-26',DATE '2017-05-18',DATE '2018-05-03',DATE '2017-05-25',DATE '2018-05-11',DATE '2018-05-17',DATE '2018-05-24',DATE '2018-05-31',DATE '2017-08-03',DATE '2017-08-10',DATE '2016-08-27',DATE '2017-03-02',DATE '2017-08-17',DATE '2018-08-02',DATE '2017-03-09',DATE '2017-08-24',DATE '2018-08-10',DATE '2017-03-16',DATE '2018-03-01',DATE '2016-11-03',DATE '2017-08-31',DATE '2018-08-16',DATE '2017-03-23',DATE '2018-03-08',DATE '2016-11-10',DATE '2018-08-23',DATE '2017-03-30',DATE '2018-03-15',DATE '2016-11-17',DATE '2018-08-30',DATE '2017-11-02',DATE '2018-03-22',DATE '2016-11-24',DATE '2017-11-09',DATE '2018-03-29',DATE '2017-06-02',DATE '2017-11-16',DATE '2017-06-08',DATE '2017-11-23',DATE '2017-06-15',DATE '2017-01-05',DATE '2017-11-30',DATE '2017-06-22',DATE '2018-06-07',DATE '2017-01-12',DATE '2017-06-29',DATE '2018-06-14',DATE '2016-09-02',DATE '2018-01-04',DATE '2017-01-21',DATE '2016-09-08',DATE '2018-06-21',DATE '2017-01-26',DATE '2018-01-11',DATE '2016-09-15',DATE '2018-06-28',DATE '2016-09-22',DATE '2017-09-07',DATE '2018-01-25',DATE '2016-09-29',DATE '2017-09-14',DATE '2017-04-06',DATE '2017-09-21',DATE '2017-04-13',DATE '2017-09-28',DATE '2016-12-02',DATE '2017-04-20',DATE '2018-04-05',DATE '2016-12-08',DATE '2017-04-27',DATE '2018-04-12',DATE '2018-09-27',DATE '2016-12-15'),
      CREDIT_CLASS_IND VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A1','AA','B','BB','BT','C','CA','CB','CC','CD','D','D1','D2','D3','UNTG'),
      SCORE_VALUE INTEGER COMPRESS (768 ,769 ,770 ,771 ,772 ,773 ,774 ,775 ,776 ,777 ,778 ,779 ,780 ,781 ,782 ,783 ,784 ,785 ,786 ,787 ,788 ,789 ,790 ,791 ,792 ,793 ,794 ,795 ,796 ,44444444 ,797 ,798 ,799 ,800 ,801 ,802 ,803 ,804 ,805 ,806 ,807 ,808 ,809 ,810 ,811 ,812 ,813 ,814 ,815 ,816 ,817 ,818 ,819 ,820 ,821 ,822 ,823 ,824 ,825 ,826 ,827 ,828 ,829 ,830 ,831 ,832 ,833 ,834 ,835 ,836 ,837 ,838 ,839 ,840 ,841 ,842 ,843 ,844 ,845 ,846 ,847 ,848 ,849 ,850 ,851 ,852 ,853 ,854 ,855 ,856 ,857 ,858 ,859 ,860 ,861 ,862 ,863 ,864 ,865 ,866 ,867 ,868 ,869 ,870 ,871 ,872 ,873 ,874 ,875 ,876 ,877 ,878 ,879 ,880 ,881 ,882 ,883 ,884 ,885 ,886 ,887 ,888 ,889 ,890 ,891 ,892 ,893 ,894 ,895 ,896 ,897 ,898 ,899 ,900 ,901 ,902 ,903 ,904 ,905 ,906 ,907 ,908 ,909 ,910 ,911 ,912 ,913 ,914 ,915 ,916 ,917 ,918 ,919 ,920 ,921 ,922 ,923 ,924 ,925 ,926 ,927 ,928 ,929 ,930 ,931 ,932 ,933 ,934 ,935 ,936 ,937 ,938 ,939 ,940 ,941 ,942 ,943 ,944 ,945 ,946 ,947 ,948 ,949 ,950 ,951 ,952 ,953 ,954 ,955 ,956 ,957 ,958 ,959 ,960 ,961 ,962 ,963 ,964 ,965 ,966 ,967 ,968 ,969 ,970 ,971 ,972 ,973 ,974 ,975 ,976 ,977 ,978 ,979 ,980 ,981 ,982 ,983 ,984 ,985 ,986 ,987 ,988 ,989 ,990 ,991 ,992 ,993 ,994 ,995 ,742 ,743 ,744 ,745 ,746 ,747 ,748 ,749 ,750 ,751 ,752 ,753 ,754 ,755 ,756 ,757 ,758 ,759 ,760 ,761 ,762 ,763 ,764 ,765 ,766 ,767 ),
      WO_REAS_CLASS_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Fraud','Non-Fraud','UNTG'),
      RISK_PROFILE_ID VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1','2','3','4','UNTG'),
      VSN_WO_REAS_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('FRAUD1','NPAY1','UNTG'),
      LOAN_ORIG_ACCT_ESTB_DT DATE FORMAT 'YYYY-MM-DD',
      LOAN_ORIG_CUST_SSN_ESTB_DT DATE FORMAT 'YYYY-MM-DD',
      LOAN_ORIG_SSN_MASK_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LOAN_ORIG_TAX_ID_MASK_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LOAN_ORIG_SSN_TOKEN_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LOAN_ORIG_TAX_ID_TOKEN_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LOAN_INACTIVE_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS ,
      WO_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      MANUAL_CONTRACT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      OLDEST_CUST_ESTB_DT DATE FORMAT 'YYYY-MM-DD',
      LOAN_ORIG_OLDEST_CUST_ESTB_DT DATE FORMAT 'YYYY-MM-DD',
      BOGO_TYPE_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      BOGO_ASSOC_LOAN_NUM VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      BOGO_OFFER_STATUS_CD VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LINE_UPG_ADD_CD VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AAL','NEW','UPG'),
      MANAGED_IND VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('C','U','UNK.DMY'),
      LOAN_CNT BYTEINT COMPRESS 1 ,
      VSN_CUST_TYPE_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('BE','ME','PE'),
      MKT_CD CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('005 ','00H ','00I ','00J ','00K ','00M ','00N ','00O ','00P ','00S ','00T ','00W ','018 ','021 ','023 ','026 ','027 ','02A ','02F ','02G ','031 ','037 ','039 ','03O ','03Z ','040 ','044 ','046 ','048 ','053 ','055 ','057 ','059 ','05A ','05C ','05J ','05K ','05L ','05M ','05N ','05P ','05R ','060 ','061 ','063 ','065 ','066 ','06D ','06E ','06F ','06I ','06R ','06S ','073 ','074 ','075 ','076 ','083 ','084 ','086 ','089 ','091 ','128 ','140 ','154 ','155 ','159 ','161 ','201 ','209 ','255 ','274 ','287 ','317 ','328 ','329 ','337 ','340 ','341 ','342 ','343 ','345 ','347 ','348 ','349 ','351 ','356 ','358 ','362 ','364 ','365 ','366 ','368 ','369 ','372 ','373 ','374 ','375 ','377 ','378 ','381 ','382 ','383 ','385 ','388 ','390 ','391 ','398 ','402 ','405 ','412 ','415 ','418 ','421 ','422 ','424 ','428 ','429 ','430 ','431 ','435 ','439 ','443 ','445 ','454 ','455 ','456 ','457 ','458 ','459 ','462 ','463 ','464 ','468 ','473 ','494 ','500 ','506 ','509 ','511 ','515 ','516 ','529 ','530 ','534 ','536 ','538 ','542 ','544 ','546 ','547 ','548 ','549 ','589 ','601 ','604 ','610 ','613 ','617 ','618 ','619 ','621 ','624 ','625 ','626 ','627 ','628 ','630 ','632 ','635 ','638 ','640 ','641 ','642 ','645 ','646 ','647 ','648 ','651 ','655 ','664 ','666 ','667 ','668 ','669 ','670 ','671 ','672 ','681 ','682 ','692 ','693 ','694 ','699 ','723 ','726 ','730 ','732 ','733 ','734 ','735 ','737 ','744 ','748 ','749 ','750 ','751 ','753 ','761 ','762 ','763 ','764 ','766 ','768 ','771 ','772 ','773 ','774 ','775 ','786 ','789 ','790 ','795 ','796 ','797 ','803 ','808 ','809 ','823 ','824 ','847 ','853 ','889 ','896 ','897 ','939 ','942 ','943 ','945 ','954 ','959 ','960 ','961 ','968 ','969 ','973 ','976 ','977 ','981 ','982 ','983 ','984 ','986 ','987 ','989 '),
      TREASURY_TENURE_DAYS INTEGER COMPRESS 1 ,
      COLL_STATUS_IND VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A','D','NOT_IN_COLL'),
      BK_POST_PETITION_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      BK_STATUS_EFF_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS (DATE '2016-12-22',DATE '2018-04-23',DATE '2017-12-08',DATE '2018-04-26',DATE '2016-12-29',DATE '2017-12-14',DATE '2017-07-07',DATE '2017-12-21',DATE '2017-07-13',DATE '2017-02-02',DATE '2017-12-28',DATE '2017-07-20',DATE '2018-07-05',DATE '2017-02-09',DATE '2017-07-27',DATE '2017-02-16',DATE '2018-02-01',DATE '2018-07-13',DATE '2016-10-06',DATE '2018-07-19',DATE '2017-02-23',DATE '2018-02-08',DATE '2016-10-13',DATE '2018-07-26',DATE '2018-02-15',DATE '2018-02-19',DATE '2016-10-20',DATE '2017-10-05',DATE '2018-02-22',DATE '2016-10-27',DATE '2017-10-12',DATE '2017-05-04',DATE '2017-10-19',DATE '2018-10-04',DATE '2017-05-12',DATE '2017-10-26',DATE '2017-05-18',DATE '2018-05-03',DATE '2017-05-25',DATE '2018-05-11',DATE '2018-05-17',DATE '2018-05-24',DATE '2018-05-31',DATE '2017-08-03',DATE '2017-08-10',DATE '2016-08-27',DATE '2017-03-02',DATE '2017-08-17',DATE '2018-08-02',DATE '2017-03-09',DATE '2017-08-24',DATE '2018-08-10',DATE '2017-03-16',DATE '2018-03-01',DATE '2016-11-03',DATE '2017-08-31',DATE '2018-08-16',DATE '2017-03-23',DATE '2018-03-08',DATE '2016-11-10',DATE '2018-08-23',DATE '2017-03-30',DATE '2018-03-15',DATE '2016-11-17',DATE '2018-08-30',DATE '2017-11-02',DATE '2018-03-22',DATE '2016-11-24',DATE '2017-11-09',DATE '2018-03-29',DATE '2017-06-02',DATE '2017-11-16',DATE '2017-06-08',DATE '2017-11-23',DATE '2017-06-15',DATE '2017-01-05',DATE '2017-11-30',DATE '2017-06-22',DATE '2018-06-07',DATE '2017-01-12',DATE '2017-06-29',DATE '2018-06-14',DATE '2016-09-02',DATE '2018-01-04',DATE '2017-01-21',DATE '2016-09-08',DATE '2018-06-21',DATE '2017-01-26',DATE '2018-01-11',DATE '2016-09-15',DATE '2018-06-28',DATE '2016-09-22',DATE '2017-09-07',DATE '2018-01-25',DATE '2016-09-29',DATE '2017-09-14',DATE '2017-04-06',DATE '2017-09-21',DATE '2017-04-13',DATE '2017-09-28',DATE '2016-12-02',DATE '2017-04-20',DATE '2018-04-05',DATE '2016-12-08',DATE '2017-04-27',DATE '2018-04-12',DATE '2018-09-27',DATE '2016-12-15'),
      ECPD_PROFILE_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('117818','3186257'),
      BUS_DATA_EFF_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      BUS_DATA_LAST_UPD_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      CUST_ACCT_LOAN_ASSOC_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      LN_CREDIT_CLASS_IND CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS )
PRIMARY INDEX ( RPT_MTH ,LOAN_NUM ,SOR_ID ,CUST_ID ,CUST_LINE_SEQ_ID ,
ACCT_NUM )
PARTITION BY RANGE_N(RPT_MTH  BETWEEN DATE '2013-08-01' AND DATE '2025-12-31' EACH INTERVAL '1' MONTH ,
 NO RANGE OR UNKNOWN);

show view ntl_prd_allvm.price_plan_v;

REPLACE VIEW NTL_PRD_ALLVM.PRICE_PLAN_V
(
SOR_ID
,PPLAN_CD
,PPLAN_MKT_CD
,PPLAN_TYPE_CD
,PPLAN_DESC
,ACCESS_AMT
,ANLG_DGTL_IND
,PK_ALLOW_MIN
,OFF_PK_ALLOW_MIN
,TOT_ALLOW_MIN
,FIRST_INCNMG_MIN_FREE_IND
,PK_MIN_RT
,OFF_PK_MIN_RT
,WKEND_RT_IND
,WKEND_MIN_RT
,MTN_TO_MTN_MIN_RT
,VZ_LD_PK_RT
,VZ_LD_OFF_PK_RT
,VZ_LD_RT_ID
,VZ_LD_RT_DESC
,NON_VZ_OFF_PK_RT
,NON_VZ_PK_RT
,MOBREACH_OFF_PK_RT
,MOBREACH_PK_RT
,EFF_DT
,ACCESS_TIER_NUM
,ALLOW_TIER_NUM
,TERM_IND
,CNTRCT_TERM_IND
,MTN_TO_MTN_OPTN_IND
,ACT_FEE
,PREPAID_IND
,CTGRY_CD
,SPRSS_IND
,SEGMT_CD
,SINGL_RT_USA
,LAST_UPD_DT
,STD_ACCESS_TIER_NUM
,BUDGET_ACCESS_TIER_NUM
,OMNI_ROAMER_TYP_CD
,PPLAN_HANDSET_REQ_CD
,PPLAN_GEO_CD
,PPLAN_HOME_RT_CVRG_CD
,PPLAN_BRAND_NM_CD
,PPLAN_SHARE_CD
,PPLAN_PYMNT_TYPE_CD
,PPLAN_PROD_LINE_CD
,PPLAN_CLASS_CD
,PPLAN_FOOTPRINT_NM
,PPLAN_PROMO_CD
,PPLAN_BNDL_TYPE_CD
,EIS_INC_IND
,BILL_IN_ARREAR_IND
,ALLTEL_PRODUCT_GRP_KEY
,COLLECT_CD
,DATA_ACCESS_AMT
,PRI_SEC_IND
,PPLAN_PROCESSING_TYPE_CD
,PPLAN_LINE_ACCT_CD
,MSG_ALLOW_CNT
,MSG_INCOMING_RT
,MSG_OUTGOING_RT
,DATA_ALLOW_CNT
,DATA_PEAK_RT
,DATA_OFF_PEAK_RT
,DATA_ANYTIME_RT
,DATA_UNIT_MEAS_DESC
,COE_PPLAN_CLASS_DESC
,COE_PPLAN_CTGRY_DESC
,COE_PPLAN_TYPE_DESC
,COE_PPLAN_SUB_TYPE_DESC
,COE_PROD_TYPE_CD
,COE_PPLAN_GROUP
,COE_VOICE_PPLAN_ACCESS_AMT
,COE_DATA_PPLAN_ACCESS_AMT
,COE_PPLAN_SEGMT_DESC
,COE_PPLAN_SERVICE_TYPE_DESC
,BI_PPLAN_DESC
,BI_PPLAN_DESC_ABBRV
,BI_PPLAN_SERVICE_TYPE_CD
,BI_PPLAN_SERVICE_TYPE_DESC
,BI_PPLAN_SERVICE_TYPE_DESC_ABR
,BI_PPLAN_TYPE_CD
,BI_PPLAN_TYPE_DESC
,BI_PPLAN_TYPE_DESC_ABBRV
,BI_PPLAN_SUB_TYPE_CD
,BI_PPLAN_SUB_TYPE_DESC
,BI_PPLAN_SUB_TYPE_DESC_ABBRV
,BI_PPLAN_CLASS_CD
,BI_PPLAN_CLASS_DESC
,BI_PPLAN_CLASS_DESC_ABBRV
,BI_PPLAN_CTGRY_CD
,BI_PPLAN_CTGRY_DESC
,BI_PPLAN_CTGRY_DESC_ABBRV
,BI_PPLAN_SEGMT_KEY
,BI_PPLAN_SEGMT_CD
,BI_PPLAN_SEGMT_DESC
,BI_PPLAN_SEGMT_GRP_CD
,BI_PPLAN_SEGMT_GRP_DESC
,BI_DATA_ALLOW_TIER_CD
,BI_DATA_ALLOW_TIER_DESC
,BI_DATA_ALLOW_TIER_DESC_ABBRV
,BI_DATA_ALLOW_TIER_VALUE
,BI_DATA_ALLOW_TIER_UNIT_MEAS
,BI_PPLAN_TERM_IND
,BI_PPLAN_RPT_KEY
,BI_RPT_PPLAN_CD
,BI_RPT_PPLAN_DESC
,BI_RPT_PPLAN_DESC_ABBRV
,BI_PPLAN_ACCESS_AMT
,BI_PPLAN_TOT_ALLOW_MIN
,BI_PPLAN_PK_ALLOW_MIN
,BI_PPLAN_MSG_ALLOW_CNT
,MSG_ALLOW_SHARE_IND
,DATA_ALLOW_SHARE_IND
,VOICE_ALLOW_SHARE_IND
,DATA_OVG_UNIT_OF_MEAS_DESC
,PRICE_PLAN_DESC
)
AS LOCKING ROW FOR ACCESS
SELECT
SOR_ID
,PPLAN_CD
,PPLAN_MKT_CD
,PPLAN_TYPE_CD
,PPLAN_DESC
,ACCESS_AMT
,ANLG_DGTL_IND
,PK_ALLOW_MIN
,OFF_PK_ALLOW_MIN
,TOT_ALLOW_MIN
,FIRST_INCNMG_MIN_FREE_IND
,PK_MIN_RT
,OFF_PK_MIN_RT
,WKEND_RT_IND
,WKEND_MIN_RT
,MTN_TO_MTN_MIN_RT
,VZ_LD_PK_RT
,VZ_LD_OFF_PK_RT
,VZ_LD_RT_ID
,VZ_LD_RT_DESC
,NON_VZ_OFF_PK_RT
,NON_VZ_PK_RT
,MOBREACH_OFF_PK_RT
,MOBREACH_PK_RT
,EFF_DT
,ACCESS_TIER_NUM
,ALLOW_TIER_NUM
,TERM_IND
,CNTRCT_TERM_IND
,MTN_TO_MTN_OPTN_IND
,ACT_FEE
,PREPAID_IND
,CTGRY_CD
,SPRSS_IND
,PPLAN_SEGMT_CD
,SINGL_RT_USA
,LAST_UPD_DT
,STD_ACCESS_TIER_NUM
,BUDGET_ACCESS_TIER_NUM
,OMNI_ROAMER_TYP_CD
,PPLAN_HANDSET_REQ_CD
,PPLAN_GEO_CD
,PPLAN_HOME_RT_CVRG_CD
,PPLAN_BRAND_NM_CD
,PPLAN_SHARE_CD
,PPLAN_PYMNT_TYPE_CD
,PPLAN_PROD_LINE_CD
,PPLAN_CLASS_CD
,PPLAN_FOOTPRINT_NM
,PPLAN_PROMO_CD
,PPLAN_BNDL_TYPE_CD
,CASE WHEN CTGRY_CD IN ('26', '28', '40') THEN 'N' ELSE 'Y' END
,BILL_IN_ARREAR_IND
,ALLTEL_PRODUCT_GRP_KEY
,COLLECT_CD
,DATA_ACCESS_AMT
,PRI_SEC_IND
,PPLAN_PROCESSING_TYPE_CD
,PPLAN_LINE_ACCT_CD
,MSG_ALLOW_CNT
,MSG_INCOMING_RT
,MSG_OUTGOING_RT
,DATA_ALLOW_CNT
,DATA_PEAK_RT
,DATA_OFF_PEAK_RT
,DATA_ANYTIME_RT
,DATA_UNIT_MEAS_DESC
,COE_PPLAN_CLASS_DESC
,COE_PPLAN_CTGRY_DESC
,COE_PPLAN_TYPE_DESC
,COE_PPLAN_SUB_TYPE_DESC
,COE_PROD_TYPE_CD
,COE_PPLAN_GROUP
,COE_VOICE_PPLAN_ACCESS_AMT
,COE_DATA_PPLAN_ACCESS_AMT
,COE_PPLAN_SEGMT_DESC
,COE_PPLAN_SERVICE_TYPE_DESC
,BI_PPLAN_DESC
,BI_PPLAN_DESC_ABBRV
,BI_PPLAN_SERVICE_TYPE_CD
,BI_PPLAN_SERVICE_TYPE_DESC
,BI_PPLAN_SERVICE_TYPE_DESC_ABR
,BI_PPLAN_TYPE_CD
,BI_PPLAN_TYPE_DESC
,BI_PPLAN_TYPE_DESC_ABBRV
,BI_PPLAN_SUB_TYPE_CD
,BI_PPLAN_SUB_TYPE_DESC
,BI_PPLAN_SUB_TYPE_DESC_ABBRV
,BI_PPLAN_CLASS_CD
,BI_PPLAN_CLASS_DESC
,BI_PPLAN_CLASS_DESC_ABBRV
,BI_PPLAN_CTGRY_CD
,BI_PPLAN_CTGRY_DESC
,BI_PPLAN_CTGRY_DESC_ABBRV
,BI_PPLAN_SEGMT_KEY
,BI_PPLAN_SEGMT_CD
,BI_PPLAN_SEGMT_DESC
,BI_PPLAN_SEGMT_GRP_CD
,BI_PPLAN_SEGMT_GRP_DESC
,BI_DATA_ALLOW_TIER_CD
,BI_DATA_ALLOW_TIER_DESC
,BI_DATA_ALLOW_TIER_DESC_ABBRV
,BI_DATA_ALLOW_TIER_VALUE
,BI_DATA_ALLOW_TIER_UNIT_MEAS
,BI_PPLAN_TERM_IND
,BI_PPLAN_RPT_KEY
,BI_RPT_PPLAN_CD
,BI_RPT_PPLAN_DESC
,BI_RPT_PPLAN_DESC_ABBRV
,BI_PPLAN_ACCESS_AMT
,BI_PPLAN_TOT_ALLOW_MIN
,BI_PPLAN_PK_ALLOW_MIN
,BI_PPLAN_MSG_ALLOW_CNT
,MSG_ALLOW_SHARE_IND
,DATA_ALLOW_SHARE_IND
,VOICE_ALLOW_SHARE_IND
,DATA_OVG_UNIT_OF_MEAS_DESC
,PRICE_PLAN_DESC
FROM UDM_PRD_TBLS.PRICE_PLAN;

show table UDM_PRD_TBLS.PRICE_PLAN;

CREATE SET TABLE UDM_PRD_TBLS.PRICE_PLAN ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      PPLAN_MKT_CD VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      PPLAN_TYPE_CD CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_DESC VARCHAR(75) CHARACTER SET LATIN NOT CASESPECIFIC,
      ACCESS_AMT DECIMAL(10,2),
      ANLG_DGTL_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PK_ALLOW_MIN INTEGER,
      OFF_PK_ALLOW_MIN INTEGER,
      TOT_ALLOW_MIN INTEGER,
      FIRST_INCNMG_MIN_FREE_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PK_MIN_RT DECIMAL(10,2),
      OFF_PK_MIN_RT DECIMAL(10,2),
      WKEND_RT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      WKEND_MIN_RT DECIMAL(10,2),
      MTN_TO_MTN_MIN_RT DECIMAL(10,2),
      VZ_LD_PK_RT DECIMAL(10,2),
      VZ_LD_OFF_PK_RT DECIMAL(10,2),
      VZ_LD_RT_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      VZ_LD_RT_DESC VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      NON_VZ_OFF_PK_RT DECIMAL(10,2),
      NON_VZ_PK_RT DECIMAL(10,2),
      MOBREACH_OFF_PK_RT DECIMAL(10,2),
      MOBREACH_PK_RT DECIMAL(10,2),
      EFF_DT DATE FORMAT 'YYYY/MM/DD',
      ACCESS_TIER_NUM SMALLINT,
      ALLOW_TIER_NUM SMALLINT,
      TERM_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      CNTRCT_TERM_IND BYTEINT,
      MTN_TO_MTN_OPTN_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      ACT_FEE DECIMAL(10,2),
      PREPAID_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      CTGRY_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      SPRSS_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_SEGMT_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      SINGL_RT_USA CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      LAST_UPD_DT DATE FORMAT 'YYYY/MM/DD',
      STD_ACCESS_TIER_NUM BYTEINT,
      BUDGET_ACCESS_TIER_NUM BYTEINT,
      OMNI_ROAMER_TYP_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_HANDSET_REQ_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_GEO_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_HOME_RT_CVRG_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_BRAND_NM_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_SHARE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_PYMNT_TYPE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_PROD_LINE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_CLASS_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_FOOTPRINT_NM VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_PROMO_CD VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_BNDL_TYPE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      BILL_IN_ARREAR_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      LAST_UPD_TIMESTAMP TIMESTAMP(0) FORMAT 'yyyy-mm-ddbhh:mi:ss',
      INSERT_TIMESTAMP TIMESTAMP(0) FORMAT 'yyyy-mm-ddbhh:mi:ss',
      INSERT_DT DATE FORMAT 'YYYY/MM/DD',
      ALLTEL_PRODUCT_GRP_KEY INTEGER,
      COLLECT_CD VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      DATA_ACCESS_AMT DECIMAL(10,2),
      PRI_SEC_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_PROCESSING_TYPE_CD VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC,
      PPLAN_LINE_ACCT_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      MSG_ALLOW_CNT DECIMAL(10,0),
      MSG_INCOMING_RT DECIMAL(5,2),
      MSG_OUTGOING_RT DECIMAL(5,2),
      DATA_ALLOW_CNT DECIMAL(10,0),
      DATA_PEAK_RT DECIMAL(15,11),
      DATA_OFF_PEAK_RT DECIMAL(15,11),
      DATA_ANYTIME_RT DECIMAL(15,11),
      DATA_UNIT_MEAS_DESC VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_DESC_ABBRV VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SERVICE_TYPE_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SERVICE_TYPE_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SERVICE_TYPE_DESC_ABR VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_TYPE_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_TYPE_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_TYPE_DESC_ABBRV VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SUB_TYPE_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SUB_TYPE_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SUB_TYPE_DESC_ABBRV VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_CLASS_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_CLASS_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_CLASS_DESC_ABBRV VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_CTGRY_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_CTGRY_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_CTGRY_DESC_ABBRV VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SEGMT_KEY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SEGMT_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SEGMT_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SEGMT_GRP_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_SEGMT_GRP_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_DATA_ALLOW_TIER_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_DATA_ALLOW_TIER_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_DATA_ALLOW_TIER_DESC_ABBRV VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_DATA_ALLOW_TIER_VALUE DECIMAL(10,0),
      BI_DATA_ALLOW_TIER_UNIT_MEAS VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_TERM_IND VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_RPT_KEY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_RPT_PPLAN_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_RPT_PPLAN_DESC VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_RPT_PPLAN_DESC_ABBRV VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      BI_PPLAN_ACCESS_AMT DECIMAL(10,2),
      BI_PPLAN_TOT_ALLOW_MIN INTEGER,
      BI_PPLAN_PK_ALLOW_MIN INTEGER,
      BI_PPLAN_MSG_ALLOW_CNT DECIMAL(10,0),
      MSG_ALLOW_SHARE_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DATA_ALLOW_SHARE_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      VOICE_ALLOW_SHARE_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DATA_OVG_UNIT_OF_MEAS_DESC VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      COE_PPLAN_CLASS_DESC VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      COE_PPLAN_CTGRY_DESC VARCHAR(28) CHARACTER SET LATIN NOT CASESPECIFIC,
      COE_PPLAN_TYPE_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      COE_PPLAN_SUB_TYPE_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      COE_PROD_TYPE_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      COE_PPLAN_GROUP VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      COE_VOICE_PPLAN_ACCESS_AMT DECIMAL(11,2),
      COE_DATA_PPLAN_ACCESS_AMT DECIMAL(10,2),
      COE_PPLAN_SEGMT_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      COE_PPLAN_SERVICE_TYPE_DESC VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC,
      PRICE_PLAN_DESC VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC)
PRIMARY INDEX ( PPLAN_CD ,PPLAN_MKT_CD )
INDEX ( PPLAN_CD )
INDEX ( SOR_ID );

show view ntl_prd_allvm.edge_qualify_detail_v;

REPLACE  VIEW NTL_PRD_ALLVM.EDGE_QUALIFY_DETAIL_V 
( 
CUST_ID 
  ,ACCT_NUM 
  ,ACCT_STATUS_IND
  ,CUST_TYPE_CD 
  ,ACCT_ESTB_DT 
  ,ACCT_TERM_DT 
  ,VSN_CUST_TYPE_CD 
  ,SSN_MASK_ID 
  ,REGION_CD
  ,SSN_CREDIT_IND 
  ,CREDIT_LIMIT_AMT
  ,TOT_DELINQ_AMT 
  ,BAD_SSN
  ,OLDER_THAN_6
  ,PREPAID_ACCT
  ,SB_ACCT 
  ,QUALIFIED_CHK_IND
  ,DISQUALIFY_STEP 
  ,EDGE_CRDT_CLS_IND
  ,EDGE_PYMNT_RVSL_IND
  ,EDGE_SUSPD_IND 
  ,EDGE_RC
  ,EDGE_SECDEP_IND 
  ,EDGE_EQP_CHRGS_IND
  ,EDGE_LOANOCC_IND
  ,EDGE_DELINQ_IND 
  ,EDGE_WO_IND 
  ,EDGE_COLLECT_IND 
  ,INSERT_DT
        ,  FRAUD_ACCT 
      ,CASH_ONLY_ACCT
      ,QUAL_CUST_TYPE_CD 
      ,QUAL_CREDIT_IND 
      ,CUST_SEG_CD 
      ,SCORE_RPT_MTH 
      ,SCORE_VALUE 
      ,RISK_PROFILE_ID
      ,BTA_LIMIT_AMT 
      ,CREDIT_LIMIT_AMT_FIN
      ,DOWN_PYMNT_PCT 
      ,LOAN_OVERRIDE_IND 
      ,REMAINING_SPNDG_LIMIT_AMT 
      ,DVS_ELIG_TRANS_DT 
      ,DVS_EDGE_ELIG_IND 
      ,DVS_RISK_PROFILE_CD 
      ,DVS_CREDIT_CLASS_CD 
      ,DVS_DOWN_PYMNT_PCT 
      ,DVS_SPEND_LIMIT_AMT
      ,DVS_REMAIN_SPEND_LIMIT_AMT 
      ,CUST_TENURE_CD 
      ,CUST_REQUESTED_IND 
      ,EDGE_ELIG_REAS_CD1 
      ,EDGE_ELIG_REAS_CD2 
      ,EDGE_ELIG_REAS_CD3 
      ,EDGE_ELIG_REAS_CD4 
      ,EDGE_ELIG_REAS_CD5 
      ,EDGE_ELIG_REAS_CD6 
      ,EDGE_ELIG_REAS_CD7 
      ,EDGE_ELIG_REAS_CD8 
      ,EDGE_ELIG_REAS_CD9 
      ,EDGE_ELIG_REAS_CD10
,  CREDIT_REAS_CD 
 ,     PRGM_ELIG_CD 
  ,    ECPD_PROFILE_ACTV_LINES 
, ACCT_SCORE_VALUE
,TOKEN_ID
,SSN_TAX_ID_IND
, LN_CREDIT_CLASS_IND
,LN_SPEND_LIMIT_AMT
,DEVICE_LIMIT_USE_CD
,AVG_SCORE_TYPE
,ACCT_SCORE_TYPE
) 
AS 
LOCKING  TABLE  UDM_PRD_TBLS.EDGE_QUALIFY_DETAIL  FOR ACCESS 
SELECT  
 
CUST_ID 
  ,ACCT_NUM 
  ,ACCT_STATUS_IND
  ,CUST_TYPE_CD 
  ,ACCT_ESTB_DT 
  ,ACCT_TERM_DT 
  ,VSN_CUST_TYPE_CD 
  ,SSN_MASK_ID 
  ,REGION_CD
  ,SSN_CREDIT_IND 
  ,CREDIT_LIMIT_AMT
  ,TOT_DELINQ_AMT 
  ,BAD_SSN
  ,OLDER_THAN_6
  ,PREPAID_ACCT
  ,SB_ACCT 
  ,QUALIFIED_CHK_IND
  ,DISQUALIFY_STEP 
  ,EDGE_CRDT_CLS_IND
  ,EDGE_PYMNT_RVSL_IND
  ,EDGE_SUSPD_IND 
  ,EDGE_RC
  ,EDGE_SECDEP_IND 
  ,EDGE_EQP_CHRGS_IND
  ,EDGE_LOANOCC_IND
  ,EDGE_DELINQ_IND 
  ,EDGE_WO_IND 
  ,EDGE_COLLECT_IND 
  ,INSERT_DT 
        ,  FRAUD_ACCT 
      ,CASH_ONLY_ACCT
      ,QUAL_CUST_TYPE_CD 
      ,QUAL_CREDIT_IND 
      ,CUST_SEG_CD 
      ,SCORE_RPT_MTH 
      ,SCORE_VALUE 
      ,RISK_PROFILE_ID
      ,BTA_LIMIT_AMT 
      ,CREDIT_LIMIT_AMT_FIN
      ,DOWN_PYMNT_PCT 
      ,LOAN_OVERRIDE_IND 
      ,REMAINING_SPNDG_LIMIT_AMT 
      ,DVS_ELIG_TRANS_DT 
      ,DVS_EDGE_ELIG_IND 
      ,DVS_RISK_PROFILE_CD 
      ,DVS_CREDIT_CLASS_CD 
      ,DVS_DOWN_PYMNT_PCT 
      ,DVS_SPEND_LIMIT_AMT
      ,DVS_REMAIN_SPEND_LIMIT_AMT 
      ,CUST_TENURE_CD 
      ,CUST_REQUESTED_IND 
      ,EDGE_ELIG_REAS_CD1 
      ,EDGE_ELIG_REAS_CD2 
      ,EDGE_ELIG_REAS_CD3 
      ,EDGE_ELIG_REAS_CD4 
      ,EDGE_ELIG_REAS_CD5 
      ,EDGE_ELIG_REAS_CD6 
      ,EDGE_ELIG_REAS_CD7 
      ,EDGE_ELIG_REAS_CD8 
      ,EDGE_ELIG_REAS_CD9 
      ,EDGE_ELIG_REAS_CD10
,  CREDIT_REAS_CD 
 ,     PRGM_ELIG_CD 
  ,    ECPD_PROFILE_ACTV_LINES 
  , ACCT_SCORE_VALUE
,TOKEN_ID
,SSN_TAX_ID_IND
, LN_CREDIT_CLASS_IND
,LN_SPEND_LIMIT_AMT
,DEVICE_LIMIT_USE_CD
,AVG_SCORE_TYPE
,ACCT_SCORE_TYPE
FROM  UDM_PRD_TBLS.EDGE_QUALIFY_DETAIL;

show table UDM_PRD_TBLS.EDGE_QUALIFY_DETAIL;

CREATE MULTISET TABLE UDM_PRD_TBLS.EDGE_QUALIFY_DETAIL ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      CUST_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      ACCT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      ACCT_STATUS_IND VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      CUST_TYPE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      ACCT_ESTB_DT DATE FORMAT 'yyyy-mm-dd',
      ACCT_TERM_DT DATE FORMAT 'yyyy-mm-dd',
      VSN_CUST_TYPE_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      SSN_MASK_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      REGION_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      SSN_CREDIT_IND VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      CREDIT_LIMIT_AMT DECIMAL(12,2),
      TOT_DELINQ_AMT DECIMAL(12,2),
      BAD_SSN INTEGER,
      OLDER_THAN_6 INTEGER,
      PREPAID_ACCT INTEGER,
      SB_ACCT INTEGER,
      QUALIFIED_CHK_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DISQUALIFY_STEP CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      EDGE_CRDT_CLS_IND INTEGER,
      EDGE_PYMNT_RVSL_IND INTEGER,
      EDGE_SUSPD_IND INTEGER,
      EDGE_RC INTEGER,
      EDGE_SECDEP_IND INTEGER,
      EDGE_EQP_CHRGS_IND INTEGER,
      EDGE_LOANOCC_IND INTEGER,
      EDGE_DELINQ_IND INTEGER,
      EDGE_WO_IND INTEGER,
      EDGE_COLLECT_IND INTEGER,
      INSERT_DT DATE FORMAT 'yyyy-mm-dd',
      FRAUD_ACCT INTEGER,
      CASH_ONLY_ACCT INTEGER,
      QUAL_CUST_TYPE_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      QUAL_CREDIT_IND VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      CUST_SEG_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      SCORE_RPT_MTH DATE FORMAT 'yyyy-mm-dd',
      SCORE_VALUE INTEGER,
      RISK_PROFILE_ID INTEGER,
      BTA_LIMIT_AMT DECIMAL(9,2),
      CREDIT_LIMIT_AMT_FIN DECIMAL(9,2),
      DOWN_PYMNT_PCT INTEGER,
      LOAN_OVERRIDE_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      REMAINING_SPNDG_LIMIT_AMT DECIMAL(12,2),
      DVS_ELIG_TRANS_DT DATE FORMAT 'yyyy-mm-dd',
      DVS_EDGE_ELIG_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DVS_RISK_PROFILE_CD INTEGER,
      DVS_CREDIT_CLASS_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      DVS_DOWN_PYMNT_PCT INTEGER,
      DVS_SPEND_LIMIT_AMT DECIMAL(10,2),
      DVS_REMAIN_SPEND_LIMIT_AMT DECIMAL(10,2),
      CUST_TENURE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      CUST_REQUESTED_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      EDGE_ELIG_REAS_CD1 INTEGER,
      EDGE_ELIG_REAS_CD2 INTEGER,
      EDGE_ELIG_REAS_CD3 INTEGER,
      EDGE_ELIG_REAS_CD4 INTEGER,
      EDGE_ELIG_REAS_CD5 INTEGER,
      EDGE_ELIG_REAS_CD6 INTEGER,
      EDGE_ELIG_REAS_CD7 INTEGER,
      EDGE_ELIG_REAS_CD8 INTEGER,
      EDGE_ELIG_REAS_CD9 INTEGER,
      EDGE_ELIG_REAS_CD10 INTEGER,
      CREDIT_REAS_CD CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PRGM_ELIG_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      ECPD_PROFILE_ACTV_LINES INTEGER,
      ACCT_SCORE_VALUE INTEGER DEFAULT 0 ,
      TOKEN_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SSN_TAX_ID_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      LN_CREDIT_CLASS_IND VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      LN_SPEND_LIMIT_AMT DECIMAL(12,2),
      DEVICE_LIMIT_USE_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      AVG_SCORE_TYPE INTEGER,
      ACCT_SCORE_TYPE INTEGER)
PRIMARY INDEX ( CUST_ID ,ACCT_NUM )
INDEX ( TOKEN_ID )
INDEX ( VSN_CUST_TYPE_CD );

show view udm_prdusr_allvm.crm_cust_acct_phog_v;

REPLACE VIEW UDM_PRDUSR_ALLVM.CRM_CUST_ACCT_PHOG_V AS
SELECT CUST_ID, ACCT_NUM
FROM TNTL_PRDUSR_ALLVM.CRM_CONSUMER_ACCOUNT_SEGMENT
WHERE
CURR_PREV_IND = 'Y'
AND DATE BETWEEN INSERT_DT AND PHOG_DT
GROUP BY 1, 2;

show view TNTL_PRDUSR_ALLVM.CRM_CONSUMER_ACCOUNT_SEGMENT;

REPLACE VIEW TNTL_PRDUSR_ALLVM.CRM_CONSUMER_ACCOUNT_SEGMENT 
    AS
   LOCK ROW FOR ACCESS
   SELECT
     CUST_ID                       
    ,ACCT_NUM                      
    ,SOR_ID                        
    ,SCORE_DT                      
    ,FIRST_CONTRACT                
    ,TECH_SEGMT                    
    ,MAIL_SEGMT                    
    ,CASE WHEN CURRENT_SEGMENT_ID = 0 THEN 'Y' ELSE 'N' END AS CURR_PREV_IND        
    ,HISPANIC_IND       
    ,CT_RI_IND
    ,PHOG_DT                       
    ,SLI_IND                       
    ,ACCULTURATION_CD              
    ,ACCULTURATION_CD2    
    ,OOC7_IND   
       ,IVR_SLI_IND 
       ,INSERT_DT
    FROM  TNTL_PRDUSR_TBLS.CRM_CONSUMER_ACCOUNT_SEGMENT
UNION
   SELECT
     CUST_ID                       
    ,ACCT_NUM                      
    ,SOR_ID                        
    ,SCORE_DT                      
    ,FIRST_CONTRACT                
    ,TECH_SEGMT                    
    ,MAIL_SEGMT                    
    ,CASE WHEN CURRENT_SEGMENT_ID = 0 THEN 'Y' ELSE 'N' END AS CURR_PREV_IND        
    ,HISPANIC_IND       
    ,CT_RI_IND
    ,PHOG_DT                       
    ,SLI_IND                       
    ,ACCULTURATION_CD              
    ,ACCULTURATION_CD2    
    ,OOC7_IND   
       ,IVR_SLI_IND 
       ,INSERT_DT
    FROM  CNTLDW_PRDUSR_TBLS.CRM_CONSUMER_ACCOUNT_SEGMENT;

show table CNTLDW_PRDUSR_TBLS.CRM_CONSUMER_ACCOUNT_SEGMENT;

CREATE SET TABLE CNTLDW_PRDUSR_TBLS.CRM_CONSUMER_ACCOUNT_SEGMENT ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_1AmpSparseMap_150Nodes COLOCATE USING TD_1AmpSparseMap_150Nodes
     (
      CUST_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      ACCT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SCORE_DT DATE FORMAT 'YYYY/MM/DD',
      FIRST_CONTRACT VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      TECH_SEGMT VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      MAIL_SEGMT VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      CURRENT_SEGMENT_ID INTEGER,
      HISPANIC_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC DEFAULT 'N' COMPRESS ('N','Y'),
      PHOG_DT DATE FORMAT 'YYYY/MM/DD',
      SLI_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC DEFAULT 'N' COMPRESS ('N','Y'),
      ACCULTURATION_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('HA1','HA2','HA3','HA4','HA5','HA6','HA7','HA8','HA9'),
      ACCULTURATION_CD2 CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('HA1','HA2','HA3','HA4','HA5','HA6','HA7','HA8','HA9'),
      FIRST_CONTACT VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      OOC7_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      IVR_SLI_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CT_RI_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('N','Y'),
      INSERT_DT DATE FORMAT 'YY/MM/DD' DEFAULT DATE )
PRIMARY INDEX ( CUST_ID ,ACCT_NUM )
PARTITION BY RANGE_N(CURRENT_SEGMENT_ID  BETWEEN 0  AND 12  EACH 1 );

show view udm_prdusr_allvm.crm_cust_acct_ohog_v;



REPLACE VIEW UDM_PRDUSR_ALLVM.CRM_CUST_ACCT_OHOG_V AS 
LOCKING UDM_PRDUSR_TBLS.CRM_CUST_ACCT_OHOG FOR ACCESS
--CARHOG and DHOG
SELECT SCORE_DATE   ,                 
CUST_ID                       ,
ACCT_NUM                  ,    
OHOG_DT                    ,   
CURR_PREV_IND       ,          
INSERT_DATE              ,     
OHOG_CTRGY_TYPE   ,            
OHOG_LIST_CD                  
FROM UDM_PRDUSR_TBLS.CRM_CUST_ACCT_OHOG
UNION
--current PHOG including daily PHOG
SEL  SCORE_DT   ,                 
CUST_ID                       ,
ACCT_NUM                  ,    
PHOG_DT                    ,   
'C' CURR_PREV_IND       ,          
SCORE_DT AS INSERT_DATE              ,     
'PHOG' AS OHOG_CTRGY_TYPE   ,            
Cast(NULL AS VARCHAR(20))  AS OHOG_LIST_CD                  
FROM TNTL_PRD_ALLVM.CRM_CONSUMER_ACCOUNT_SEGMENT;

show view  TNTL_PRD_ALLVM.CRM_CONSUMER_ACCOUNT_SEGMENT;

REPLACE VIEW  TNTL_PRD_ALLVM.CRM_CONSUMER_ACCOUNT_SEGMENT 
	AS
	LOCK ROW FOR ACCESS
	SELECT
	 CUST_ID                       
	,ACCT_NUM                      
	,SOR_ID                        
	,SCORE_DT                      
	,FIRST_CONTRACT                
	,TECH_SEGMT                    
	,MAIL_SEGMT                          
	,HISPANIC_IND                  
	,PHOG_DT                       
	,SLI_IND                       
	,ACCULTURATION_CD                     
	FROM  TNTL_PRDUSR_TBLS.CRM_CONSUMER_ACCOUNT_SEGMENT
	WHERE CURRENT_SEGMENT_ID = 0;

show table TNTL_PRDUSR_TBLS.CRM_CONSUMER_ACCOUNT_SEGMENT;

CREATE SET TABLE TNTL_PRDUSR_TBLS.CRM_CONSUMER_ACCOUNT_SEGMENT ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      CUST_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      ACCT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SOR_ID CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SCORE_DT DATE FORMAT 'YYYY/MM/DD',
      FIRST_CONTRACT VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      TECH_SEGMT VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      MAIL_SEGMT VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      CURRENT_SEGMENT_ID INTEGER,
      HISPANIC_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC DEFAULT 'N' COMPRESS ('N','Y'),
      PHOG_DT DATE FORMAT 'YYYY/MM/DD',
      SLI_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC DEFAULT 'N' COMPRESS ('N','Y'),
      ACCULTURATION_CD CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('HA1','HA2','HA3','HA4','HA5','HA6','HA7','HA8','HA9'),
      ACCULTURATION_CD2 CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('HA1','HA2','HA3','HA4','HA5','HA6','HA7','HA8','HA9'),
      FIRST_CONTACT VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      OOC7_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      IVR_SLI_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CT_RI_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ('N','Y'),
      INSERT_DT DATE FORMAT 'YY/MM/DD' DEFAULT DATE )
PRIMARY INDEX ( CUST_ID ,ACCT_NUM )
PARTITION BY RANGE_N(CURRENT_SEGMENT_ID  BETWEEN 0  AND 28  EACH 1 );

show view udm_prdusr_allvm.dm_subs_fact_v;

REPLACE VIEW UDM_PRDUSR_ALLVM.DM_SUBS_FACT_V
AS LOCKING UDM_PRDUSR_TBLS.DM_SUBS_FACT FOR ACCESS
SELECT
BASE_MTH,
RPT_MTH,
MTH_TYPE,
CUST_ID,
ACCT_NUM,
CUST_LINE_SEQ_ID,
MTN,
BASE_MTH_BOM_CUSTOMERS,
GROSS_ADDS,
PORT_INS,
PORT_OUTS,
FIN_VOLUNTARY_DISCONNECTS,
FIN_INVOLUNTARY_DISCONNECTS,
CRM_VOLUNTARY_DISCONNECTS,
CRM_INVOLUNTARY_DISCONNECTS,
UPGRADES,
ACCT_FRACTION,
SP_ACCT_FRACTION,
STNDRD_BUS_UNIV,
PREPAID_IND,
LINE_TYPE_CD,
MKT_CD,
MANAGED_IND,
VZ_MKT_DESC,
LN_LVL_ZIP_CD,
CMA,
CMA_NAME,
CMA_TIER,
DMA,
DMA_NAME,
DMA_TIER,
TOTAL_LINES_ON_ACCT,
TOTAL_VOICE_LINES_ON_ACCT,
TOTAL_BASIC_LINES_ON_ACCT,
TOTAL_SMARTPHONE_LINES_ON_ACCT,
TOTAL_MBB_LINES_ON_ACCT,
TOTAL_TABLET_LINES_ON_ACCT,
TOTAL_HUM_LINES_ON_ACCT,
TOTAL_HPC_LINES_ON_ACCT,
TOTAL_CANTENNA_LINES_ON_ACCT,
TOTAL_CONNECTED_LINES_ON_ACCT,
TOTAL_OTHER_LINES_ON_ACCT,
ACCT_LINE_TYPE,
PRIMARY_LINE,
ACCT_ACTIVE_LOAN_CNT,
ACCT_DP_BAL_OUTSTANDING_AMT,
OUTSTANDING_BAL_IND,
COLL_STATUS_IND,
RISK_PROFILE_CD,
I_RISK,
CREDIT_RISK_TYPE_CD,
VZ_ACCT_CLUSTER,
VL1_LINE_CLUSTER,
PROD_NM,
TRADE_IN_VALUE,
DEVICE_ID,
DEVICE_TYPE,
DEVICE_GENERATION,
OS,
EDW_EDGE_QUALIFIED_IND,
CURR_CONTRACT_TERM,
CONTRACT_TYPE,
CONTRACT_MTHS_REM,
CONTRACT_REM_PENALTY,
CONTRACT_START_DT,
CONTRACT_END_DT,
LOAN_STATUS_IND,
LOAN_NUM,
LOAN_CREATE_DT,
LOAN_SALES_DT,
LOAN_ORIG_DEVICE_AMT,
LOAN_DOWN_PYMNT_AMT,
INITIAL_LOAN_AMT,
LOAN_MTH_PYMNT_AMT,
LOAN_TERM_MTH_QTY,
LOAN_UPGRADE_PCT,
LOAN_PROD_NM,
REMAINING_LOAN_BAL,
PYMNTS_MADE_ON_LOAN,
PYMNTS_LEFT_ON_LOAN,
LOAN_ACTIVE_CNT,
LOAN_PAID_IN_FULL_CNT,
LOAN_BUYOUT_CNT,
LOAN_BUYOUT_AMT,
LOAN_CANCEL_CNT,
LOAN_WO_CNT,
LOAN_WO_AMT,
CNTRCT_EFF_DT,
CNTRCT_END_DT,
CNTRCT_PRD_MTH,
SERVICE_T_BUCKET,
CNTRCT_TERM_FEE,
DECREMENT_ETF,
UPG_ELIG_DT,
LAST_UPG_DT,
LAST_UPG_SLS_OUTLET_ID,
LAST_UPG_CHANNEL,
LAST_UPG_MASTER_AGENT_ID,
LAST_UPG_PROD_NM,
LAST_UPG_DEVICE_TYPE,
LAST_UPG_OS,
CONSUMER_IND,
LIABILITY,
VSN_CUST_TYPE_CD,
PAPERLESS_BILLING_IND,
BILL_PYMNT_TYPE,
TELCO_SINGL_BILL_IND,
FIOS_INTERNET,
FIOS_TV,
VZT_PHONE,
MYVERIZON_ROLE,
HAS_NTWK_EXTENDER,
REWARD_ENROLLED,
EVER_REDEEMED_PTS,
VZUP_ENROLLED,
EVER_REDEEMED_VZUP_PTS,
GO90_REGISTERED,
DOWNLOADED_NFL_MOBILE,
DOWNLOADED_POP_DATA_LAST_MTH,
TMP_FLAG,
OTH_INSURANCE_FLAG,
FAMILY_BASE_FLAG,
LEGACY_USAGE_CONTROL_FLAG,
VOLTE_PROVISION_FLAG,
ACCT_HAS_TRAVEL_PASS,
NPS_SCORE,
LAST_NPS_SURVEY_DT,
ECPD_PROFILE_ID,
ECPD_ACCESS_DISC,
ECPD_FEAT_DISC,
FORMER_ECPD,
EVG_CD,
HRCHY_SEGMT,
MGD_SEGMT,
CONSUMER_LINK,
ADDRESS_LINK,
Cast (Null As Varchar(1)) As LANG_PREF_IND,
Cast (Null As Varchar(50) ) As ETHNICITY,
Cast (Null As Varchar(20) ) As ETHNICITY_SUBSEGMENT,
Cast (Null As Varchar(1) ) As MULTI_CULTURAL,
ACCT_BIRTH_YEAR,
ACCT_GENERATION,
LINE_AGE,
LIFE_STAGE,
HSHLD_TYPE,
ACXIOM_18_25_IN_HSHLD,
LAST_LOGIN_DOMAIN,
E_ONE_CD,
PERSONICX_NM,
INCOME,
HIGHEST_EDUCATION_LVL,
CHILD_IN_HSHLD,
HSHLD_SIZE,
MARITAL_STATUS,
'Unk' RECENT_DIVORCE_FLAG,
OWN_RENT_IND,
GENDER_OF_ACCT_HOLDER,
LINE_GENDER,
OWN_SATELLITE_DISH,
ACXIOM_DTV_DECILE,
SOCIAL_INFLUENCER_DECILE,
SOCIALLY_INFLUENCED_DECILE,
SOCIAL_NETWORK_USER_DECILE,
HVY_FACEBOOK_USER_DECILE,
HVY_TWITTER_USER_DECILE,
HVY_LINKEDIN_USER_DECILE,
HVY_YOUTUBE_USER_DECILE,
UNLIM_DATA_IND,
ACCT_UNLIM_DATA_IND,
PPLAN_CD,
PPLAN_MKT_CD,
LINE_PLAN_TYPE,
PRICE_PLAN_ACCESS_AMT,
SAFETY_MODE,
MOBILE_FIRST_USER,
PLAN_DATA_ALLOW,
BONUS_DATA_ALLOW,
BONUS_DATA_ALLOW_MB,
TOTAL_DATA_ALLOW,
TOTAL_DATA_ALLOW_MB,
PPLAN_CHANGES_LAST_6_MONTHS,
PPLAN_CHANGES_LAST_12_MONTHS,
LAST_DT_CUST_DESKTOP_LOGIN,
LAST_DT_CUST_MV_APP_LOGIN,
LAST_DT_ACCT_CALLED_CARE,
LAST_DT_ACCT_HAD_COMPASS_SESSION,
LAST_DT_ACCT_HAD_MYOFFER_SESSION,
LAST_DT_ACCT_VISIT_DIRECT_STORE,
LAST_DT_ACCT_VISIT_INDIRECT_STORE,
LAST_DT_ACCT_HAD_ECHAT,
CHANNEL_PREF_ACCT,
CHANNEL_PREF_LINE,
USG_ALERTS_LAST_30_DAYS,
USG_ALERTS_LAST_90_DAYS,
USG_ALERTS_LAST_180_DAYS,
LINE_ACT_DT,
LINE_TENURE_MTHS,
LINE_TENURE,
NM_FIRST,
NM_LAST,
ACTIVATING_SLS_OUTLET_ID,
ACTIVATING_CHANNEL,
ACTIVATING_MASTER_AGENT_ID,
ORIG_CUST_ID,
ORIG_CUST_LINE_SEQ_ID,
ACCT_ESTB_DT,
ACCT_TENURE_MTHS,
ACCT_TENURE,
ACCT_NM_FIRST,
ACCT_NM_LAST,
NM_LAST_MATCH_FLAG,
NM_FIRST_MATCH_FLAG,
CUST_SSN_ESTB_DT,
CUST_SSN_TENURE_MTH,
MTHLY_REV_INFLOW,
MTHLY_REV_BASE,
MTHLY_REV_RETENTION,
MTHLY_REV_OUTFLOW,
LAST_CYCLE_ARPU,
LAST_CYCLE_IARPU,
LINE_AVG_3MTH_ARPU,
LINE_AVG_3MTH_IARPU,
LINE_AVG_3MTH_DOMESTIC_VOICE_OVRG,
LINE_MAX_3MTH_DOMESTIC_VOICE_OVRG,
LINE_AVG_3MTH_INTL_VOICE_OVRG,
LINE_AVG_3MTH_MSG_OVRG,
LINE_AVG_3MTH_DOMESTIC_DATA_OVRG,
LINE_MAX_3MTH_DOMESTIC_DATA_OVRG,
LINE_AVG_3MTH_INTL_DATA_OVRG,
LINE_AVG_3MTH_VOICE_USG,
LINE_MAX_3MTH_VOICE_USG,
LINE_AVG_3MTH_MSG_USG,
LINE_AVG_3MTH_DOMESTIC_DATA_USG,
LINE_MAX_3MTH_DOMESTIC_DATA_USG,
LINE_AVG_3MTH_INTL_DATA_USG,
LINE_MAX_3MTH_INTL_DATA_USG,
LINE_AVG_6MTH_ARPU,
LINE_AVG_6MTH_IARPU,
LINE_AVG_6MTH_DOMESTIC_VOICE_OVRG,
LINE_AVG_6MTH_INTL_VOICE_OVRG,
LINE_AVG_6MTH_MSG_OVRG,
LINE_AVG_6MTH_DOMESTIC_DATA_OVRG,
LINE_AVG_6MTH_INTL_DATA_OVRG,
LINE_AVG_6MTH_VOICE_USG,
LINE_AVG_6MTH_MSG_USG,
LINE_AVG_6MTH_DOMESTIC_DATA_USG,
LINE_AVG_6MTH_INTL_DATA_USG,
NUM_CYCLES_INTL_VOICE_OVG,
NUM_CYCLES_DOMESTIC_DATA_OVG,
NUM_CYCLES_INTL_DATA_OVG,
LAST_CYCLE_ARPA,
LAST_CYCLE_IARPA,
LAST_CYCLE_DOMESTIC_DATA_USG,
LAST_CYCLE_DOMESTIC_DATA_OVRG,
ACCT_AVG_3MTH_ARPA,
ACCT_AVG_3MTH_IARPA,
ACCT_AVG_3MTH_DOMESTIC_VOICE_OVRG,
ACCT_MAX_3MTH_DOMESTIC_VOICE_OVRG,
ACCT_AVG_3MTH_INTL_VOICE_OVRG,
ACCT_AVG_3MTH_MSG_OVRG,
ACCT_AVG_3MTH_DOMESTIC_DATA_OVRG,
ACCT_MAX_3MTH_DOMESTIC_DATA_OVRG,
ACCT_AVG_3MTH_INTL_DATA_OVRG,
ACCT_AVG_3MTH_VOICE_USG,
ACCT_MAX_3MTH_VOICE_USG,
ACCT_AVG_3MTH_MSG_USG,
ACCT_AVG_3MTH_DOMESTIC_DATA_USG,
ACCT_MAX_3MTH_DOMESTIC_DATA_USG,
ACCT_AVG_3MTH_INTL_DATA_USG,
ACCT_MAX_3MTH_INTL_DATA_USG,
ACCT_AVG_6MTH_ARPA,
ACCT_AVG_6MTH_IARPA,
ACCT_AVG_6MTH_DOMESTIC_VOICE_OVRG,
ACCT_AVG_6MTH_INTL_VOICE_OVRG,
ACCT_AVG_6MTH_MSG_OVRG,
ACCT_AVG_6MTH_DOMESTIC_DATA_OVRG,
ACCT_AVG_6MTH_INTL_DATA_OVRG,
ACCT_AVG_6MTH_VOICE_USG,
ACCT_AVG_6MTH_MSG_USG,
ACCT_AVG_6MTH_DOMESTIC_DATA_USG,
ACCT_AVG_6MTH_INTL_DATA_USG,
ACCT_NUM_CYCLES_INTL_VOICE_OVG,
ACCT_NUM_CYCLES_DOMESTIC_DATA_OVG,
ACCT_NUM_CYCLES_INTL_DATA_OVG,
AAL_V,
MBB_AAL,
AAL_TBL,
HUM,
INFLUENCER,
ATTPO,
SPRINT,
TMOBIL,
IN_MKT,
HIGHEST_IN_MKT_SCORE_ON_ACCT,
IN_TBL_MKT,
IN_0USG,
IN_DATA,
IN_ACCT,
ASTER_C,
B2B_ALL_C,
LTV_IN_L,
MG6M_L,
MP6M_L,
LINE_MARGIN,
LTV_IN_A,
MG6M_A,
MP6M_A,
ACCT_MARGIN,
MG6M_E,
MP6M_E,
HSHLD_MARGIN,
DISC_TRANS_DT,
DISC_ACTIVITY_DT,
DISC_REAS_CD,
DISC_PORT_CARRIER_NM,
DISC_REP_DEPT,
JOIN_DT,
INSERT_DT ,
VZ2_AREA_CD,
VZ2_AREA_DESC
FROM UDM_PRDUSR_TBLS.DM_SUBS_FACT;

show table UDM_PRDUSR_TBLS.DM_SUBS_FACT;

CREATE MULTISET TABLE UDM_PRDUSR_TBLS.DM_SUBS_FACT ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP2
     (
      BASE_MTH DATE FORMAT 'YY/MM/DD',
      RPT_MTH DATE FORMAT 'YY/MM/DD',
      MTH_TYPE VARCHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CURR','PREV'),
      CUST_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      ACCT_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1','2','3','4','5','6','7'),
      CUST_LINE_SEQ_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      MTN VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      BASE_MTH_BOM_CUSTOMERS INTEGER COMPRESS 1 ,
      GROSS_ADDS INTEGER COMPRESS 0 ,
      PORT_INS INTEGER COMPRESS 0 ,
      PORT_OUTS INTEGER COMPRESS 0 ,
      FIN_VOLUNTARY_DISCONNECTS INTEGER COMPRESS 0 ,
      FIN_INVOLUNTARY_DISCONNECTS INTEGER COMPRESS 0 ,
      CRM_VOLUNTARY_DISCONNECTS INTEGER COMPRESS 0 ,
      CRM_INVOLUNTARY_DISCONNECTS INTEGER COMPRESS 0 ,
      UPGRADES INTEGER COMPRESS 0 ,
      ACCT_FRACTION DECIMAL(18,8) COMPRESS (0.00000000 ,0.04000000 ,0.20000000 ,1.00000000 ,0.02083333 ,0.03846154 ,0.04166667 ,0.06250000 ,0.07692308 ,0.08333333 ,0.12500000 ,0.16666667 ,0.04761905 ,0.05263158 ,0.01000000 ,0.05000000 ,0.25000000 ,0.33333333 ,0.09090909 ,0.05555556 ,0.02000000 ,0.10000000 ,0.50000000 ,0.14285714 ,0.06666667 ,0.04545455 ,0.04347826 ,0.11111111 ,0.07142857 ,0.02040816 ,0.05882353 ),
      SP_ACCT_FRACTION DECIMAL(18,8) COMPRESS (0.00000000 ,0.04000000 ,0.20000000 ,1.00000000 ,0.04166667 ,0.12500000 ,0.16666667 ,0.25000000 ,0.33333333 ,0.02000000 ,0.10000000 ,0.50000000 ,0.14285714 ,0.04347826 ,0.11111111 ),
      STNDRD_BUS_UNIV VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      PREPAID_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      LINE_TYPE_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('H','I','T','U','W'),
      MKT_CD VARCHAR(6) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('005','00H','00I','00J','00K','00M','00N','00O','00P','00S','00T','014','018','021','023','026','027','02A','02F','02G','031','037','039','03Z','040','044','046','048','04A','04E','04J','04P','04T','04U','053','055','057','059','05A','05J','05K','05L','05M','05N','05P','05R','060','063','065','066','06D','06E','06F','06I','06R','06S','071','073','074','075','076','083','084','086','089','091','128','140','154','159','161','201','209','255','274','287','317','328','329','337','340','341','343','345','347','348','349','351','356','358','362','364','365','366','368','369','372','373','374','375','377','378','379','381','382','383','385','390','391','398','401','402','405','415','418','421','422','424','428','429','430','431','435','439','443','445','454','455','456','457','458','459','462','463','464','468','473','494','500','506','509','511','515','516','529','530','534','536','538','542','544','546','547','548','549','589','601','604','610','613','617','618','619','621','624','625','626','627','628','630','632','635','640','642','645','646','647','648','651','655','664','666','667','668','669','670','671','672','681','692','693','694','699','701','723','726','730','732','733','734','735','737','744','748','749','750','751','753','761','762','763','764','766','768','771','772','773','774','775','786','789','790','796','797','803','808','809','823','824','847','889','896','939','942','943','945','954','959','960','961','968','969','973','976','977','981','982','983','984','986','987','989','AIF','EFY','EHT'),
      MANAGED_IND CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'C  ',
      VZ_MKT_DESC VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Great Lakes','North Central','North East','Pacific','South Central','South East'),
      LN_LVL_ZIP_CD VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      CMA INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,267 ,12 ,268 ,13 ,14 ,15 ,527 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,549 ,38 ,550 ,39 ,551 ,40 ,552 ,41 ,553 ,42 ,43 ,44 ,556 ,45 ,46 ,558 ,47 ,559 ,48 ,49 ,561 ,50 ,562 ,51 ,307 ,563 ,52 ,53 ,565 ,54 ,55 ,56 ,568 ,57 ,58 ,314 ,59 ,571 ,60 ,572 ,61 ,62 ,574 ,63 ,319 ,64 ,65 ,577 ,66 ,322 ,67 ,323 ,579 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,586 ,75 ,76 ,588 ,77 ,589 ,78 ,590 ,79 ,591 ,80 ,336 ,81 ,82 ,83 ,339 ,84 ,340 ,85 ,86 ,87 ,88 ,89 ,90 ,92 ,93 ,94 ,350 ,95 ,96 ,97 ,609 ,98 ,99 ,611 ,100 ,101 ,102 ,103 ,359 ,104 ,360 ,105 ,617 ,106 ,618 ,107 ,363 ,619 ,108 ,109 ,111 ,113 ,114 ,626 ,115 ,371 ,116 ,372 ,117 ,629 ,118 ,375 ,120 ,376 ,632 ,121 ,633 ,122 ,123 ,124 ,125 ,126 ,382 ,127 ,384 ,130 ,131 ,643 ,132 ,388 ,644 ,133 ,645 ,134 ,646 ,135 ,136 ,392 ,648 ,137 ,393 ,649 ,138 ,394 ,139 ,142 ,144 ,400 ,145 ,401 ,658 ,148 ,149 ,661 ,151 ,152 ,408 ,153 ,154 ,410 ,155 ,156 ,668 ,157 ,158 ,159 ,163 ,164 ,676 ,166 ,167 ,168 ,171 ,172 ,686 ,175 ,690 ,691 ,692 ,693 ,182 ,183 ,190 ,449 ,198 ,716 ,208 ,721 ,210 ,211 ,212 ,468 ,469 ,471 ,218 ,221 ,478 ,486 ,487 ,491 ,492 ,242 ,243 ,245 ),
      CMA_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Akron, OH','Albany, NY','Albuquerque, NM','Allentown, PA-NJ','Atlanta, GA','Austin, TX','Baltimore, MD','Birmingham, AL','Boston, MA-NH','Bridgeport, CT','Buffalo, NY','Cabarrus, NC-15','Charleston, SC','Charlotte, NC','Chicago, IL','Cincinnati, OH','Cleveland, OH','Columbia, SC','Columbus, OH','Dallas, TX','Dayton, OH','Denver, CO','Des Moines, IA','Detroit, MI','Grand Rapids, MI','Greensboro, NC','Greenville, SC','Hartford, CT','Houston, TX','Indianapolis, IN','Jackson, MS','Jacksonville, FL','Johnson City, TN-VA','Kansas City, MO','Kent, MD-2','Knoxville, TN','Las Vegas, NV','Long Branch, NJ','Los Angeles, CA','Louisville, KY','Miami, FL','Milwaukee, WI','Minneapolis, MN-WI','Morrow, OH-6','Nashville, TN','New Brunswick, NJ','New Haven, CT','New York, NY','Norfolk, VA','Northeast, PA','Omaha, NE','Orlando, FL','Oxnard, CA','Peoria, IL','Philadelphia, PA','Phoenix, AZ','Pittsburgh, PA','Portland, OR-WA','Providence, RI','Provo-Orem, UT','Raleigh-Durham, NC','Richmond, VA','Rochester, NY','Sacramento, CA','Salt Lake City, UT','San Antonio, TX','San Diego, CA','San Francisco, CA','San Jose, CA','Seattle, WA','Spokane, WA','St. Louis, MO','Syracuse, NY','Tacoma, WA','Tampa, FL','Toledo, OH','Tucson, AZ','W. Palm Beach, FL','Washington DC CMA','Wilmington, DE-NJ-MD','Worcester, MA'),
      CMA_TIER INTEGER COMPRESS (1 ,2 ,3 ),
      DMA INTEGER COMPRESS (512 ,513 ,514 ,770 ,515 ,771 ,516 ,517 ,773 ,518 ,519 ,520 ,521 ,522 ,523 ,524 ,525 ,526 ,527 ,528 ,529 ,530 ,531 ,532 ,533 ,789 ,534 ,790 ,535 ,536 ,537 ,538 ,539 ,540 ,541 ,542 ,543 ,544 ,800 ,545 ,801 ,546 ,802 ,547 ,803 ,548 ,804 ,549 ,550 ,551 ,807 ,553 ,554 ,810 ,555 ,811 ,556 ,557 ,813 ,558 ,560 ,561 ,563 ,819 ,564 ,820 ,565 ,821 ,566 ,567 ,569 ,825 ,570 ,571 ,828 ,573 ,574 ,575 ,576 ,577 ,581 ,839 ,584 ,588 ,592 ,855 ,602 ,603 ,605 ,606 ,862 ,609 ,610 ,866 ,611 ,612 ,868 ,613 ,616 ,617 ,618 ,619 ,622 ,623 ,624 ,625 ,881 ,627 ,628 ,630 ,632 ,633 ,634 ,635 ,636 ,637 ,639 ,640 ,641 ,642 ,648 ,649 ,650 ,651 ,652 ,656 ,658 ,659 ,669 ,670 ,671 ,673 ,675 ,676 ,678 ,679 ,682 ,686 ,687 ,691 ,692 ,693 ,698 ,702 ,705 ,709 ,710 ,716 ,718 ,722 ,724 ,725 ,734 ,737 ,744 ,751 ,752 ,753 ,754 ,755 ,500 ,756 ,501 ,757 ,502 ,758 ,503 ,759 ,504 ,760 ,505 ,506 ,762 ,507 ,508 ,764 ,509 ,765 ,510 ,511 ,767 ),
      DMA_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Albany-Schenectady-Troy NY','Albuquerque-Santa Fe NM','Atlanta GA','Austin TX','Baltimore MD','Birmingham (Anniston & Tuscaloosa) AL','Boston MA (Manchester NH)','Buffalo NY','Charleston SC','Charlotte NC','Chattanooga TN','Chicago IL','Cincinnati OH','Cleveland-Akron (Canton) OH','Columbia SC','Columbus OH','Dallas-Ft.Worth TX','Dayton OH','Denver CO','Des Moines-Ames IA','Detroit MI','Fargo-Valley City ND','Flint-Saginaw-Bay City MI','Fresno-Visalia CA','Ft. Myers-Naples FL','Grand Rapids-Kalamazoo-Battle Creek MI','Greensboro-High Point-Winston Salem NC','Greenville-Spartanburg SC-Asheville NC-Anderson SC','Harrisburg-Lancaster-Lebanon-York PA','Hartford & New Haven CT','Honolulu HI','Houston TX','Huntsville-Decatur (Florence) AL','Indianapolis IN','Jacksonville FL','Kansas City MO','Knoxville TN','Las Vegas NV','Lincoln & Hastings-Kearney NE','Los Angeles CA','Louisville KY','Memphis TN','Miami-Ft. Lauderdale FL','Milwaukee WI','Minneapolis-St. Paul MN','Mobile AL-Pensacola (Ft. Walton Beach) FL','Nashville TN','New Orleans LA','New York NY','Norfolk-Portsmouth-Newport News VA','Omaha NE','Orlando-Daytona Beach-Melbourne FL','Peoria-Bloomington IL','Philadelphia PA','Phoenix (Prescott) AZ','Pittsburgh PA','Portland OR','ProvidenceRi-New Bedford MA','Raleigh-Durham (Fayetteville) NC','Richmond-Petersburg VA','Roanoke-Lynchburg VA','Rochester NY','Sacramento-Stockton-Modesto CA','Salt Lake City UT','San Diego CA','San Francisco-Oakland-San Jose CA','Savannah GA','Seattle-Tacoma WA','Sioux Falls (Mitchell) SD','Spokane WA','Springfield MO','St. Louis MO','Syracuse NY','Tampa-St.Petersburg (Sarasota) FL','Toledo OH','Tri-Cities TN-VA','Tucson (Sierra Vista) AZ','Washington DC (Hagerstown MD)','West Palm Beach-Fort Pierce FL','Wichita-Hutchinson KS','Wilkes Barre-Scranton PA'),
      DMA_TIER INTEGER COMPRESS (1 ,2 ,3 ),
      TOTAL_LINES_ON_ACCT INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,23 ,24 ,25 ,50 ),
      TOTAL_VOICE_LINES_ON_ACCT INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,12 ,13 ,14 ,190 ),
      TOTAL_BASIC_LINES_ON_ACCT INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ),
      TOTAL_SMARTPHONE_LINES_ON_ACCT INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,15 ,18 ),
      TOTAL_MBB_LINES_ON_ACCT INTEGER COMPRESS (0 ,1 ,2 ),
      TOTAL_TABLET_LINES_ON_ACCT INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ),
      TOTAL_HUM_LINES_ON_ACCT INTEGER COMPRESS 0 ,
      TOTAL_HPC_LINES_ON_ACCT INTEGER COMPRESS (0 ,1 ,2 ),
      TOTAL_CANTENNA_LINES_ON_ACCT INTEGER COMPRESS 0 ,
      TOTAL_CONNECTED_LINES_ON_ACCT INTEGER COMPRESS 0 ,
      TOTAL_OTHER_LINES_ON_ACCT INTEGER COMPRESS 0 ,
      ACCT_LINE_TYPE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('ML','SL'),
      PRIMARY_LINE VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      ACCT_ACTIVE_LOAN_CNT INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ),
      ACCT_DP_BAL_OUTSTANDING_AMT DECIMAL(20,2) COMPRESS (0.00 ,849.99 ,435.29 ,468.60 ,624.80 ,412.38 ,379.12 ,814.43 ,299.88 ,568.68 ,399.84 ,499.80 ,433.28 ,499.84 ,656.04 ,622.84 ,779.02 ,297.88 ,599.99 ,487.44 ,374.88 ,531.08 ,687.28 ,672.00 ,352.04 ,574.77 ,541.60 ,406.12 ,562.32 ,349.86 ,718.52 ,406.20 ,449.82 ,595.76 ,560.00 ,549.78 ,270.80 ,660.00 ,460.36 ,526.93 ,549.99 ,437.36 ,550.00 ,593.56 ,504.02 ,649.99 ,481.11 ,324.96 ,749.99 ,458.20 ,514.52 ,524.79 ),
      OUTSTANDING_BAL_IND VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      COLL_STATUS_IND VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('A','NOT_IN_COLL'),
      RISK_PROFILE_CD INTEGER COMPRESS (1 ,2 ,3 ,4 ,10 ),
      I_RISK INTEGER COMPRESS ,
      CREDIT_RISK_TYPE_CD VARCHAR(11) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1','2','3','4','A1','AA','B','CA','CB','CC','OTHER','UNMP','UNTG','XX'),
      VZ_ACCT_CLUSTER VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Aging Low-Tech','Always Connected Strivers','Disconnected Mature','Diverse Tech Averse','Established Urban Families','Informed Techies','Middle-Class Early Adopters','Thrifty Switchers','Up-and-Coming Families','Working Class Multicultural Families'),
      VL1_LINE_CLUSTER VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Busy Online Managers','Highly Connected Families','Lower Loyalty Light Users','Loyal Security Seekers','Mature Loyalists','Millennial Quality Streamers','Millennial Value Streamers','Premium Spenders','Prepaid Basics','Prepaid Streamers','Status Multi-culturals','Tablets','Thrifty Multi-cultural','Unknown'),
      PROD_NM VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('2GIG Technologies 2GIG-CP21-345','Alarm.com - ADC-200H-EVD','Alarm.com ADC-200C-EVD','All New HTC One Metal Gray','Ambient X-3100','Apple iPhone 4 16GB','BlackBerry Bold 9930','Brigadier by Kyocera','CalAmp - LMU-2620','CalAmp - PL641','Casio GzOne Commando 4G LTE','Casio GzOne Ravine 2','Casio GzOne Ravine II','Casio GzOne Ravine','Crane - WAN Module CDMA','DROID MAXX 2 Blue','Droid Maxx by Motorola','Droid Mini by Motorola in Red','Droid Mini by Motorola','DROID RAZR MAXX HD by MOTOROLA','DROID TURBO 2 BLK Soft-Grip 32GB','DROID TURBO 2 Grey Nylon 32GB','DROID TURBO by MOTOROLA BLACK BN','DROID TURBO by MOTOROLA BLK MGF','DROID TURBO by MOTOROLA RED MGF','DROID TURBO MOTOROLA BLK BN 64GB','Droid Ultra by Motorola','DuraXVPlus by Kyocera','Ellipsis Jetpack MHS800L','Geotab - GO7 CDMA_Verizon','Home Phone Connect F256','Home Phone Connect FT2260','Honeywell - Dolphin 99EX','HTC ONE','Hum by Verizon','IPAD 4G 16GB BLACK','IPAD 4G 32GB BLACK','IPAD 4G 64GB BLACK','IPAD AIR 16GB SILVER','IPAD AIR 16GB SPACE GRAY','IPAD AIR 2 16GB S GRAY','IPAD AIR 2 64GB S GRAY','IPAD AIR 32GB SPACE GRAY','IPAD AIR 64GB SPACE GRAY','IPAD MINI 16GB SPC GRAY','IPAD MINI 16GB WHITE','IPAD MINI RETINA 16GB SILVER','IPAD MINI RETINA 16GB SPC GRAY','IPAD RETINA DISPLAY 16GB BLACK','IPAD RETINA DISPLAY 32GB BLACK','IPAD2 WI-FI 3G 16GB BLACK','IPAD2 WI-FI 3G 32GB BLACK','IPAD2 WI-FI 3G 64GB BLACK','IpDatatel - IPD BAT CU','IPHONE 4 BLACK 8 GB','IPHONE 4 BLACK 8GB','iPhone 4 White 16GB','IPHONE 4 WHITE 8 GB','IPHONE 4S BLACK 16GB','IPHONE 4S BLACK 8GB','IPHONE 4S WHITE 16GB','IPHONE 4S WHITE 8GB','IPHONE 5 BLACK 16GB','IPHONE 5 BLACK 32GB','IPHONE 5 WHITE 16GB','IPHONE 5 WHITE 32GB','iPhone 5C Blue 16GB','iPhone 5C Blue 32GB','IPHONE 5C BLUE 8GB-USA','iPhone 5C Green 16GB','IPHONE 5C GREEN 8GB-USA','iPhone 5C Pink 16GB','iPhone 5C Pink 32GB','IPHONE 5C PINK 8GB-USA','iPhone 5C White 16GB','iPhone 5C White 32GB','IPHONE 5C WHITE 8GB -USA','iPhone 5C Yellow 16GB','iPhone 5S Gold 16GB','iPhone 5S Gold 32GB','iPhone 5S Silver 16GB','iPhone 5S Silver 32GB','iPhone 5S Space Gray 16GB','iPhone 5S Space Gray 32GB','iPhone 5S Space Gray 64GB','iPhone 6 128GB Gold','iPhone 6 128GB Silver','iPhone 6 128GB Space Gray','iPhone 6 16GB Gold','iPhone 6 16GB Silver','iPhone 6 16GB Space Gray','iPhone 6 64GB Gold','iPhone 6 64GB Silver','iPhone 6 64GB Space Gray','iPhone 6 Plus 128GB Space Gray','iPhone 6 Plus 16GB Gold','iPhone 6 Plus 16GB Silver','iPhone 6 Plus 16GB Space Gray','iPhone 6 Plus 64GB Gold','iPhone 6 Plus 64GB Silver','iPhone 6 Plus 64GB Space Gray','iPhone 6S 128GB Space Gray','iPhone 6S 16GB Gold','iPhone 6S 16GB Rose Gold','iPhone 6S 16GB Silver','iPhone 6S 16GB Space Gray','iPhone 6S 64GB Gold','iPhone 6S 64GB Rose Gold','iPhone 6S 64GB Silver','iPhone 6S 64GB Space Gray','iPhone 6S Plus 16GB Rose Gold','iPhone 6S Plus 16GB Space Gray','iPhone 6S Plus 64GB Gold','iPhone 6S Plus 64GB Rose Gold','iPhone 6S Plus 64GB Silver','iPhone 6S Plus 64GB Space Gray','IPHONE SE SPACE GRAY 16GB','Itron - 1210-AMP','Itron - OpenWay 3.1','Itron - OpenWay 3.5 S','Knack','Kyocera DuraXV','LG Cosmos - VN250','LG Cosmos 2','LG Cosmos 3 Prepay','LG Cosmos 3','LG Exalt','LG Extravert 2','LG G Pad X8.3','LG G Vista','LG G2 White','LG G2','LG G3 Metallic Black','LG G3 Silk White','LG G4 Metallic Gray','LG GPad 10.1 LTE','LG GPad 7.0 LTE','LG GPad 8.3 LTE','LG Lucid 2','LG Lucid 3','LG Lucid','LG Octane','LG Optimus Exceed 2','LG Optimus Zone 2','LG Revere - VN150','LG Revere 2','LG Revere 3','LG-VX5500','LG-VX5600','LG-VX8300','MOBIS - D-Audio LTE','Montage - MGCDMAV1','Moto G','Moto X by Motorola','Motorola Droid Maxx 16GB Black','Motorola Droid Maxx 16GB Red','Motorola DROID RAZR M WHITE','Motorola DROID RAZR M','Motorola DROID RAZR Maxx','Motorola MC959B','Motorola V860','Networkfleet - 5000CDMA','Networkfleet 5000CDMA-PCS3','Non-Branded EVDO Module','Pantech UML290VW-G','Pantech UML295','Passtime - PTE-3','Philips - 100204C 2.xx','Philips - 100204C','Philips - 100605C','Prepaid Samsung Gusto II','Prepay LG Transpyre','Prepay Moto E','SAM Galaxy Note 4 Charcoal Black','SAM Galaxy Note 4 Frost White','SAM GALAXY S6 EDGE PLUS BLK 32GB','SAM GALAXY S6 EDGE PLUS GLD 32GB','SAM Galaxy Tab 4 10.1 Pure Black','SAM Galaxy Tab 4 8.0 Pure Black','Samsung Brightside Sapphire Blue','Samsung Brightside','Samsung Convoy 3','Samsung Convoy II','Samsung Galaxy Core Prime','Samsung Galaxy J1 PP','Samsung Galaxy Note 3 in White','Samsung Galaxy Note 3','Samsung Galaxy Note II in Silver','SAMSUNG GALAXY NOTE5 BLACK 32 GB','SAMSUNG GALAXY NOTE5 GOLD 32 GB','SAMSUNG GALAXY NOTE5 WHITE 32 GB','Samsung Galaxy S 4 Black 16GB','Samsung Galaxy S 4 Black Mist','Samsung Galaxy S 4 Mini','Samsung Galaxy S 4 White 16GB','Samsung Galaxy S 4 White Frost','Samsung Galaxy S 5 Black','Samsung Galaxy S 5 Copper Gold','Samsung Galaxy S 5 Electric Blue','Samsung Galaxy S 5 White','Samsung Galaxy S III 16GB Black','Samsung Galaxy S III 16GB Blue','Samsung Galaxy S III 16GB White','Samsung Galaxy S III Mini','Samsung Galaxy S6 Black 32GB','Samsung Galaxy S6 Black 64GB','Samsung Galaxy S6 Edge BLK 32GB','Samsung Galaxy S6 Gold 32GB','Samsung Galaxy S6 White 32GB','Samsung Galaxy S7 Black 32GB','Samsung Galaxy S7 edge BLK 32GB','Samsung Galaxy S7 edge Gold 32GB','Samsung Galaxy S7 edge SLV 32GB','Samsung Galaxy S7 Gold 32GB','Samsung Galaxy Stellar','Samsung Galaxy Tab 2 10.1','Samsung Galaxy Tab 2 7.0','Samsung Galaxy Tab E 8','Samsung Gusto 3 Prepay','Samsung Gusto 3','Samsung Gusto II Snow Silver','Samsung Gusto II','SAMSUNG Gusto','Samsung Haven SCH-U320','Samsung Intensity 3 Steel Gray','Samsung Intensity 3','Samsung Intensity II Blue','Samsung Intensity II Gray','SCH-U350','SCH-U640','Smart Synch Inc. - SSI 1210 1x','SmartSynch Inc SSI kV2c 1X','Test Device','USA Tech - ePort Telemeter','USB551L 4G USB Modem','USB760','Verizon Ellipsis 10','Verizon Ellipsis 7','Verizon Ellipsis 8','Verizon Ellipsis Jetpack','Vivint - CP01 Novatel','Vivint - CP01 Telit','VZ Jetpack 4G MHS 291L','VZ Jetpack 4G MHS 890L','VZ Jetpack 4G MHS MIFI 6620L','VZ Jetpack 4G MHS MIFI4510L','VZ Jetpack 4G MHS MIFI4620L','VZ Jetpack 4G MHS MIFI4620LE','VZ Jetpack 4G MHS MIFI5510L','Wireless Home Phone','Xirgo - XT-2150CV','Xirgo - XT-3250CV','Xirgo - XT-3450CV'),
      DEVICE_ID VARCHAR(14) CHARACTER SET LATIN NOT CASESPECIFIC,
      DEVICE_TYPE VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Basic','Connected Devices','HPC','Hum','MBB','Smartphone','Tablet'),
      DEVICE_GENERATION CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('3G','4G'),
      OS VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Android','Apple','Blackberry','Other','Windows'),
      EDW_EDGE_QUALIFIED_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      CURR_CONTRACT_TERM VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1 Yr Contract','2 Yr Contract','Edge','MTM Contract','No Contract','Out of Contract'),
      CONTRACT_TYPE VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('DP','OOC','Service'),
      CONTRACT_MTHS_REM INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ),
      CONTRACT_REM_PENALTY DECIMAL(20,2) COMPRESS (0.00 ,320.00 ,105.00 ,210.00 ,312.40 ,435.29 ,189.56 ,468.60 ,100.00 ,624.80 ,696.52 ,412.38 ,199.92 ,310.00 ,379.12 ,95.00 ,200.00 ,814.43 ,389.47 ,299.88 ,568.68 ,90.00 ,300.00 ,366.56 ,399.84 ,85.00 ,243.72 ,190.00 ,343.64 ,499.80 ,343.65 ,80.00 ,433.28 ,499.84 ,656.04 ,290.00 ,320.74 ,75.00 ,622.84 ,779.02 ,180.00 ,174.93 ,297.83 ,70.00 ,175.00 ,297.88 ,280.00 ,274.89 ,65.00 ,274.92 ,170.00 ,487.44 ,374.85 ,60.00 ,374.88 ,728.18 ,165.00 ,531.08 ,687.28 ,162.48 ,270.00 ,743.61 ,474.81 ,160.00 ,352.04 ,574.77 ,50.00 ,155.00 ,260.00 ,541.60 ,644.00 ,149.94 ,150.00 ,249.90 ,40.00 ,216.64 ,249.92 ,616.00 ,708.20 ,145.00 ,406.12 ,250.00 ,562.32 ,349.86 ,718.52 ,406.20 ,140.00 ,449.82 ,350.00 ,595.76 ,135.00 ,240.00 ,549.78 ,130.00 ,270.80 ,672.79 ,340.00 ,125.00 ,281.16 ,460.36 ,526.93 ,230.00 ,437.36 ,224.91 ,593.56 ,120.00 ,504.02 ,324.87 ,649.99 ,330.00 ,115.00 ,481.11 ,220.00 ,324.96 ,424.83 ,749.99 ,110.00 ,458.20 ,514.52 ,524.79 ),
      CONTRACT_START_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS (DATE '2015-02-08',DATE '2015-02-09',DATE '2015-02-10',DATE '2015-02-11',DATE '2015-02-12',DATE '2015-07-24',DATE '2015-02-13',DATE '2015-02-14',DATE '2015-02-16',DATE '2014-10-01',DATE '2014-10-02',DATE '2014-10-03',DATE '2015-02-19',DATE '2015-07-31',DATE '2014-10-04',DATE '2015-02-20',DATE '2015-02-21',DATE '2014-10-06',DATE '2014-10-07',DATE '2015-02-23',DATE '2014-10-08',DATE '2015-02-24',DATE '2014-10-09',DATE '2014-10-10',DATE '2015-02-26',DATE '2014-10-11',DATE '2015-02-27',DATE '2015-02-28',DATE '2014-10-13',DATE '2014-10-14',DATE '2014-10-15',DATE '2014-10-16',DATE '2014-10-17',DATE '2014-10-18',DATE '2015-10-02',DATE '2014-10-20',DATE '2014-10-21',DATE '2014-10-22',DATE '2014-10-23',DATE '2014-10-24',DATE '2014-10-25',DATE '2014-10-27',DATE '2014-10-28',DATE '2014-10-29',DATE '2015-05-01',DATE '2014-10-30',DATE '2014-10-31',DATE '2015-10-15',DATE '2015-05-04',DATE '2015-10-16',DATE '2015-05-06',DATE '2015-05-08',DATE '2015-10-20',DATE '2015-05-09',DATE '2015-05-11',DATE '2015-10-23',DATE '2015-05-13',DATE '2015-05-15',DATE '2015-05-18',DATE '2015-10-30',DATE '2015-05-19',DATE '2015-05-20',DATE '2015-05-21',DATE '2015-05-22',DATE '2015-05-26',DATE '2015-05-27',DATE '2015-05-28',DATE '2015-05-29',DATE '2015-05-30',DATE '2014-08-22',DATE '2015-08-10',DATE '2015-08-11',DATE '2015-08-12',DATE '2014-08-29',DATE '2015-03-02',DATE '2015-03-04',DATE '2015-03-06',DATE '2015-03-07',DATE '2015-03-09',DATE '2015-08-21',DATE '2015-03-10',DATE '2015-03-11',DATE '2015-03-13',DATE '2015-03-14',DATE '2015-03-16',DATE '2014-11-01',DATE '2014-11-03',DATE '2015-03-19',DATE '2014-11-04',DATE '2015-03-20',DATE '2014-11-05',DATE '2014-11-06',DATE '2014-11-07',DATE '2015-03-23',DATE '2014-11-08',DATE '2014-11-10',DATE '2014-11-11',DATE '2015-03-27',DATE '2014-11-12',DATE '2013-11-29',DATE '2014-11-13',DATE '2014-11-14',DATE '2015-03-30',DATE '2014-11-15',DATE '2015-03-31',DATE '2014-11-17',DATE '2014-06-06',DATE '2014-11-18',DATE '2014-11-19',DATE '2014-11-20',DATE '2014-11-21',DATE '2014-11-22',DATE '2014-11-23',DATE '2014-11-24',DATE '2014-06-13',DATE '2014-11-25',DATE '2014-11-26',DATE '2014-11-28',DATE '2014-11-29',DATE '2015-06-01',DATE '2014-11-30',DATE '2015-06-02',DATE '2015-06-04',DATE '2015-06-05',DATE '2015-06-08',DATE '2015-06-10',DATE '2015-06-11',DATE '2015-06-12',DATE '2015-11-24',DATE '2015-06-13',DATE '2015-01-02',DATE '2015-01-03',DATE '2015-06-15',DATE '2015-11-27',DATE '2015-06-16',DATE '2015-11-28',DATE '2015-01-05',DATE '2015-06-17',DATE '2015-01-06',DATE '2015-06-18',DATE '2015-11-30',DATE '2015-01-07',DATE '2015-06-19',DATE '2015-01-08',DATE '2015-06-20',DATE '2015-01-09',DATE '2015-01-10',DATE '2015-06-22',DATE '2015-06-23',DATE '2015-01-12',DATE '2015-06-24',DATE '2015-01-13',DATE '2015-01-14',DATE '2015-06-26',DATE '2015-01-15',DATE '2015-01-16',DATE '2015-01-17',DATE '2015-06-29',DATE '2015-06-30',DATE '2015-01-19',DATE '2015-01-20',DATE '2015-01-21',DATE '2015-01-22',DATE '2015-01-23',DATE '2015-01-24',DATE '2015-01-26',DATE '2015-01-27',DATE '2014-09-13',DATE '2015-01-29',DATE '2015-01-30',DATE '2014-09-15',DATE '2015-01-31',DATE '2014-09-16',DATE '2014-09-19',DATE '2014-09-20',DATE '2014-09-22',DATE '2014-09-23',DATE '2014-09-24',DATE '2014-09-25',DATE '2014-09-26',DATE '2014-09-27',DATE '2015-09-11',DATE '2014-09-28',DATE '2014-09-29',DATE '2015-04-01',DATE '2014-09-30',DATE '2015-04-03',DATE '2015-09-18',DATE '2015-09-19',DATE '2015-04-09',DATE '2015-09-21',DATE '2015-04-10',DATE '2015-09-22',DATE '2015-04-11',DATE '2015-09-24',DATE '2015-04-13',DATE '2015-09-25',DATE '2015-04-14',DATE '2015-09-26',DATE '2015-04-15',DATE '2015-04-16',DATE '2015-09-28',DATE '2014-12-01',DATE '2015-04-17',DATE '2015-09-29',DATE '2014-12-02',DATE '2015-09-30',DATE '2014-12-03',DATE '2014-12-04',DATE '2015-04-20',DATE '2014-12-05',DATE '2015-04-21',DATE '2014-12-06',DATE '2014-12-08',DATE '2015-04-24',DATE '2014-12-09',DATE '2015-04-25',DATE '2014-12-10',DATE '2014-12-11',DATE '2015-04-27',DATE '2014-12-12',DATE '2015-04-28',DATE '2014-12-13',DATE '2014-12-14',DATE '2015-04-30',DATE '2014-12-15',DATE '2014-12-16',DATE '2014-12-17',DATE '2014-12-18',DATE '2014-12-19',DATE '2014-12-20',DATE '2014-12-21',DATE '2014-12-22',DATE '2014-07-11',DATE '2014-12-23',DATE '2014-12-24',DATE '2014-12-26',DATE '2014-12-27',DATE '2014-12-29',DATE '2014-12-30',DATE '2014-12-31',DATE '2015-12-18',DATE '2015-12-19',DATE '2015-12-21',DATE '2015-12-22',DATE '2015-12-23',DATE '2015-12-24',DATE '2015-07-13',DATE '2015-02-03',DATE '2015-02-04',DATE '2015-02-05',DATE '2015-07-17',DATE '2015-02-06',DATE '2015-02-07'),
      CONTRACT_END_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS (DATE '2016-12-16',DATE '2016-12-17',DATE '2016-12-18',DATE '2016-12-19',DATE '2016-12-20',DATE '2016-12-21',DATE '2016-12-22',DATE '2016-12-23',DATE '2016-12-24',DATE '2016-12-26',DATE '2016-12-27',DATE '2016-12-29',DATE '2017-07-01',DATE '2016-12-30',DATE '2016-12-31',DATE '2017-12-18',DATE '2017-12-19',DATE '2017-12-21',DATE '2017-12-22',DATE '2017-12-23',DATE '2017-07-13',DATE '2017-02-02',DATE '2017-02-03',DATE '2017-02-04',DATE '2017-02-05',DATE '2017-02-06',DATE '2017-02-07',DATE '2017-02-08',DATE '2017-02-09',DATE '2017-02-10',DATE '2017-02-11',DATE '2017-02-12',DATE '2017-07-24',DATE '2017-02-13',DATE '2017-02-14',DATE '2017-02-16',DATE '2016-10-01',DATE '2016-10-02',DATE '2016-10-03',DATE '2017-02-19',DATE '2017-07-31',DATE '2017-02-20',DATE '2017-02-21',DATE '2016-10-06',DATE '2016-10-07',DATE '2017-02-23',DATE '2016-10-08',DATE '2017-02-24',DATE '2016-10-09',DATE '2017-02-25',DATE '2016-10-10',DATE '2017-02-26',DATE '2017-02-27',DATE '2017-02-28',DATE '2016-10-13',DATE '2016-10-15',DATE '2016-10-16',DATE '2016-10-17',DATE '2016-10-18',DATE '2016-10-20',DATE '2016-05-09',DATE '2016-10-21',DATE '2016-05-10',DATE '2016-10-22',DATE '2016-10-23',DATE '2016-05-12',DATE '2016-10-24',DATE '2016-10-25',DATE '2016-10-27',DATE '2016-10-28',DATE '2016-10-29',DATE '2016-10-30',DATE '2016-05-19',DATE '2016-10-31',DATE '2017-05-04',DATE '2017-05-06',DATE '2017-05-08',DATE '2017-05-09',DATE '2017-05-11',DATE '2016-05-29',DATE '2016-05-30',DATE '2017-05-15',DATE '2017-05-18',DATE '2017-10-30',DATE '2017-05-19',DATE '2017-05-20',DATE '2017-05-22',DATE '2017-05-26',DATE '2017-05-27',DATE '2017-05-28',DATE '2017-05-29',DATE '2017-05-30',DATE '2017-08-10',DATE '2017-08-11',DATE '2017-08-12',DATE '2016-08-29',DATE '2017-03-02',DATE '2017-03-04',DATE '2017-03-06',DATE '2017-03-07',DATE '2017-03-09',DATE '2017-08-21',DATE '2017-03-10',DATE '2017-03-11',DATE '2017-03-13',DATE '2017-03-14',DATE '2017-03-16',DATE '2016-11-01',DATE '2016-11-03',DATE '2016-11-04',DATE '2017-03-20',DATE '2016-11-05',DATE '2017-03-21',DATE '2016-11-06',DATE '2016-11-07',DATE '2017-03-23',DATE '2016-11-08',DATE '2017-03-24',DATE '2016-11-10',DATE '2016-11-11',DATE '2017-03-27',DATE '2016-11-12',DATE '2017-03-28',DATE '2015-11-29',DATE '2016-11-13',DATE '2016-06-02',DATE '2016-11-14',DATE '2017-03-30',DATE '2016-11-15',DATE '2017-03-31',DATE '2016-06-04',DATE '2016-11-17',DATE '2016-06-06',DATE '2016-11-18',DATE '2016-11-19',DATE '2016-11-20',DATE '2016-11-21',DATE '2016-06-10',DATE '2016-11-22',DATE '2016-06-11',DATE '2016-11-23',DATE '2016-11-24',DATE '2016-06-13',DATE '2016-11-25',DATE '2016-11-26',DATE '2016-11-28',DATE '2016-11-29',DATE '2017-06-01',DATE '2016-11-30',DATE '2017-06-02',DATE '2017-06-05',DATE '2017-06-08',DATE '2017-06-10',DATE '2017-06-11',DATE '2017-06-12',DATE '2017-06-13',DATE '2017-01-02',DATE '2017-01-03',DATE '2017-06-15',DATE '2017-11-27',DATE '2017-06-16',DATE '2017-11-28',DATE '2017-01-05',DATE '2017-06-17',DATE '2017-01-06',DATE '2017-06-18',DATE '2017-11-30',DATE '2017-01-07',DATE '2017-06-19',DATE '2017-01-08',DATE '2017-06-20',DATE '2017-01-09',DATE '2017-01-10',DATE '2017-06-22',DATE '2017-06-23',DATE '2017-01-12',DATE '2017-06-24',DATE '2017-01-13',DATE '2017-01-14',DATE '2017-06-26',DATE '2017-01-15',DATE '2017-01-16',DATE '2017-01-17',DATE '2017-06-29',DATE '2017-06-30',DATE '2017-01-19',DATE '2017-01-20',DATE '2017-01-21',DATE '2017-01-22',DATE '2017-01-23',DATE '2017-01-24',DATE '2017-01-26',DATE '2017-01-27',DATE '2017-01-28',DATE '2016-09-13',DATE '2017-01-29',DATE '2017-01-30',DATE '2016-09-15',DATE '2017-01-31',DATE '2016-09-16',DATE '2016-09-19',DATE '2016-09-20',DATE '2016-09-22',DATE '2016-04-11',DATE '2016-09-24',DATE '2016-09-25',DATE '2016-09-26',DATE '2016-09-27',DATE '2016-09-28',DATE '2016-09-29',DATE '2017-04-01',DATE '2016-09-30',DATE '2017-04-03',DATE '2017-09-19',DATE '2017-04-09',DATE '2017-09-21',DATE '2017-04-10',DATE '2017-09-22',DATE '2017-04-11',DATE '2017-04-13',DATE '2017-09-25',DATE '2017-04-14',DATE '2017-09-26',DATE '2017-04-15',DATE '2017-04-16',DATE '2017-09-28',DATE '2016-12-01',DATE '2017-04-17',DATE '2017-09-29',DATE '2016-12-02',DATE '2017-04-18',DATE '2017-09-30',DATE '2016-12-03',DATE '2016-12-04',DATE '2017-04-20',DATE '2016-12-05',DATE '2017-04-21',DATE '2016-12-06',DATE '2017-04-22',DATE '2016-12-07',DATE '2016-12-08',DATE '2017-04-24',DATE '2016-12-09',DATE '2017-04-25',DATE '2016-12-10',DATE '2016-12-11',DATE '2017-04-27',DATE '2016-12-12',DATE '2017-04-28',DATE '2016-12-13',DATE '2017-04-29',DATE '2016-12-14',DATE '2017-04-30',DATE '2016-12-15'),
      LOAN_STATUS_IND VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Active','Not Active'),
      LOAN_NUM VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      LOAN_CREATE_DT DATE FORMAT 'YY/MM/DD' COMPRESS ,
      LOAN_SALES_DT DATE FORMAT 'YY/MM/DD' COMPRESS ,
      LOAN_ORIG_DEVICE_AMT DECIMAL(18,2) COMPRESS (768.00 ,192.00 ,384.00 ,576.00 ,849.99 ,529.99 ,949.99 ,629.99 ,199.99 ,729.99 ,707.00 ,299.99 ,399.99 ,144.00 ,499.98 ,499.99 ,500.00 ,599.98 ,599.99 ,792.00 ,600.00 ,699.98 ,699.99 ,700.00 ,799.99 ,672.00 ,480.00 ,649.00 ,49.99 ,749.00 ,149.99 ,168.00 ,552.00 ,249.99 ,250.00 ,524.00 ,349.99 ,559.99 ,560.00 ,624.00 ,449.99 ,450.00 ,659.99 ,660.00 ,549.98 ,549.99 ,550.00 ,759.99 ,696.00 ,760.00 ,649.97 ,649.98 ,649.99 ,650.00 ,859.99 ,860.00 ,476.00 ,749.97 ,749.98 ,749.99 ,750.00 ),
      LOAN_DOWN_PYMNT_AMT DECIMAL(18,2) COMPRESS (0.00 ,1.00 ),
      INITIAL_LOAN_AMT DECIMAL(18,2) COMPRESS (768.00 ,192.00 ,384.00 ,576.00 ,849.99 ,529.99 ,949.99 ,629.99 ,199.99 ,729.99 ,707.00 ,299.99 ,399.99 ,144.00 ,499.98 ,499.99 ,500.00 ,599.98 ,599.99 ,792.00 ,600.00 ,699.98 ,699.99 ,700.00 ,799.99 ,672.00 ,480.00 ,648.99 ,649.00 ,49.99 ,749.00 ,149.99 ,168.00 ,552.00 ,249.99 ,250.00 ,524.00 ,349.99 ,559.99 ,560.00 ,624.00 ,449.99 ,450.00 ,659.99 ,660.00 ,549.98 ,549.99 ,550.00 ,759.99 ,696.00 ,760.00 ,649.97 ,649.98 ,649.99 ,650.00 ,859.99 ,860.00 ,476.00 ,749.97 ,749.98 ,749.99 ,750.00 ),
      LOAN_MTH_PYMNT_AMT DECIMAL(7,2) COMPRESS (20.83 ,31.24 ,18.74 ,31.66 ,29.16 ,16.66 ,27.08 ,27.49 ,27.50 ,24.99 ,25.00 ,35.41 ,28.00 ,22.91 ),
      LOAN_TERM_MTH_QTY INTEGER COMPRESS (20 ,24 ),
      LOAN_UPGRADE_PCT DECIMAL(5,2) COMPRESS (100.00 ,75.00 ,60.00 ,50.00 ),
      LOAN_PROD_NM VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Brigadier by Kyocera','DROID MAXX 2 Blue','DROID TURBO 2 BLK Soft-Grip 32GB','DROID TURBO 2 Grey Nylon 32GB','DROID TURBO by MOTOROLA BLACK BN','DROID TURBO by MOTOROLA BLK MGF','DROID TURBO by MOTOROLA RED MGF','DROID TURBO MOTOROLA BLK BN 64GB','iPhone 5S Gold 16GB','iPhone 5S Silver 16GB','iPhone 5S Space Gray 16GB','iPhone 5S Space Gray 32GB','iPhone 6 128GB Space Gray','iPhone 6 16GB Gold','iPhone 6 16GB Silver','iPhone 6 16GB Space Gray','iPhone 6 64GB Gold','iPhone 6 64GB Silver','iPhone 6 64GB Space Gray','iPhone 6 Plus 128GB Space Gray','iPhone 6 Plus 16GB Gold','iPhone 6 Plus 16GB Silver','iPhone 6 Plus 16GB Space Gray','iPhone 6 Plus 64GB Gold','iPhone 6 Plus 64GB Silver','iPhone 6 Plus 64GB Space Gray','iPhone 6S 128GB Space Gray','iPhone 6S 16GB Gold','iPhone 6S 16GB Rose Gold','iPhone 6S 16GB Silver','iPhone 6S 16GB Space Gray','iPhone 6S 64GB Gold','iPhone 6S 64GB Rose Gold','iPhone 6S 64GB Silver','iPhone 6S 64GB Space Gray','iPhone 6S Plus 16GB Rose Gold','iPhone 6S Plus 16GB Space Gray','iPhone 6S Plus 64GB Gold','iPhone 6S Plus 64GB Rose Gold','iPhone 6S Plus 64GB Silver','iPhone 6S Plus 64GB Space Gray','iPhone 7 Black 128GB','iPhone 7 Black 32GB','LG Cosmos 3','LG Exalt','LG Extravert 2','LG G3 Metallic Black','LG G4 Metallic Gray','LG Revere 3','LG V10 Space Black','Motorola Droid Maxx 16GB Black','SAM Galaxy Note 4 Charcoal Black','SAM Galaxy Note 4 Frost White','SAM GALAXY S6 EDGE PLUS BLK 32GB','SAM GALAXY S6 EDGE PLUS GLD 32GB','Samsung Convoy 3','Samsung Galaxy Core Prime','Samsung Galaxy J3 V','Samsung Galaxy Note 3 in White','Samsung Galaxy Note 3','Samsung Galaxy Note Edge Black','SAMSUNG GALAXY NOTE5 BLACK 32 GB','SAMSUNG GALAXY NOTE5 BLACK 64 GB','SAMSUNG GALAXY NOTE5 GOLD 32 GB','SAMSUNG GALAXY NOTE5 WHITE 32 GB','Samsung Galaxy S 4 Black 16GB','Samsung Galaxy S 4 Mini','Samsung Galaxy S 4 White 16GB','Samsung Galaxy S 5 Black','Samsung Galaxy S 5 Copper Gold','Samsung Galaxy S 5 White','Samsung Galaxy S6 Black 32GB','Samsung Galaxy S6 Black 64GB','Samsung Galaxy S6 Edge BLK 32GB','Samsung Galaxy S6 Edge WHT 32GB','Samsung Galaxy S6 Gold 32GB','Samsung Galaxy S6 White 32GB','Samsung Galaxy S7 Black 32GB','Samsung Galaxy S7 edge BLK 32GB','Samsung Galaxy S7 edge Gold 32GB','Samsung Galaxy S7 edge SLV 32GB','Samsung Galaxy S7 Gold 32GB','Samsung Gusto 3','TABLET'),
      REMAINING_LOAN_BAL DECIMAL(18,2) COMPRESS ,
      PYMNTS_MADE_ON_LOAN INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ),
      PYMNTS_LEFT_ON_LOAN INTEGER COMPRESS (0 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ),
      LOAN_ACTIVE_CNT INTEGER COMPRESS (0 ,1 ),
      LOAN_PAID_IN_FULL_CNT INTEGER COMPRESS (0 ,1 ),
      LOAN_BUYOUT_CNT INTEGER COMPRESS 0 ,
      LOAN_BUYOUT_AMT DECIMAL(18,2) COMPRESS 0.00 ,
      LOAN_CANCEL_CNT INTEGER COMPRESS 0 ,
      LOAN_WO_CNT INTEGER COMPRESS 0 ,
      LOAN_WO_AMT DECIMAL(18,2) COMPRESS 0.00 ,
      CNTRCT_EFF_DT DATE FORMAT 'YY/MM/DD' COMPRESS (DATE '2015-02-08',DATE '2015-02-09',DATE '2015-02-10',DATE '2015-02-11',DATE '2014-02-28',DATE '2015-02-13',DATE '2014-10-01',DATE '2014-10-02',DATE '2014-10-03',DATE '2015-02-19',DATE '2014-10-04',DATE '2015-02-20',DATE '2014-10-05',DATE '2014-10-06',DATE '2014-10-07',DATE '2014-10-08',DATE '2015-02-24',DATE '2014-10-09',DATE '2014-10-10',DATE '2014-10-11',DATE '2015-02-27',DATE '2014-05-01',DATE '2014-10-13',DATE '2014-05-02',DATE '2014-10-14',DATE '2014-05-03',DATE '2014-10-15',DATE '2014-10-16',DATE '2014-10-17',DATE '2014-10-18',DATE '2013-05-23',DATE '2014-05-07',DATE '2013-05-24',DATE '2014-05-08',DATE '2014-10-20',DATE '2014-05-09',DATE '2014-10-21',DATE '2014-05-10',DATE '2014-10-22',DATE '2014-10-23',DATE '2014-05-12',DATE '2014-10-24',DATE '2014-10-25',DATE '2014-10-27',DATE '2014-05-16',DATE '2014-10-28',DATE '2014-10-29',DATE '2014-10-30',DATE '2014-10-31',DATE '2015-05-04',DATE '2015-05-06',DATE '2014-05-23',DATE '2014-05-28',DATE '2014-05-29',DATE '2014-05-30',DATE '2014-05-31',DATE '2013-08-09',DATE '2015-05-28',DATE '2015-05-29',DATE '2014-08-05',DATE '2014-08-07',DATE '2014-08-08',DATE '2014-08-11',DATE '2014-08-12',DATE '2014-08-13',DATE '2014-08-14',DATE '2014-08-15',DATE '2014-08-18',DATE '2014-08-19',DATE '2014-08-20',DATE '2014-08-21',DATE '2014-08-22',DATE '2014-08-23',DATE '2014-08-25',DATE '2014-03-14',DATE '2014-08-26',DATE '2014-08-27',DATE '2014-08-28',DATE '2014-08-29',DATE '2014-08-30',DATE '2015-03-04',DATE '2014-03-21',DATE '2012-11-23',DATE '2014-03-26',DATE '2014-03-28',DATE '2014-03-29',DATE '2015-03-13',DATE '2014-03-31',DATE '2014-11-03',DATE '2014-11-04',DATE '2014-11-05',DATE '2014-11-06',DATE '2014-11-07',DATE '2014-11-08',DATE '2013-06-14',DATE '2014-11-10',DATE '2013-11-27',DATE '2014-11-11',DATE '2014-11-12',DATE '2013-11-29',DATE '2014-11-13',DATE '2013-11-30',DATE '2014-06-02',DATE '2014-11-14',DATE '2015-03-30',DATE '2014-06-03',DATE '2014-11-15',DATE '2014-06-04',DATE '2014-06-05',DATE '2014-11-17',DATE '2014-06-06',DATE '2014-11-18',DATE '2014-11-19',DATE '2014-11-20',DATE '2014-06-09',DATE '2014-11-21',DATE '2014-06-10',DATE '2014-11-22',DATE '2014-06-11',DATE '2014-06-12',DATE '2014-11-24',DATE '2014-06-13',DATE '2014-11-25',DATE '2014-06-14',DATE '2014-11-26',DATE '2014-06-16',DATE '2014-11-28',DATE '2014-11-29',DATE '2014-11-30',DATE '2014-06-20',DATE '2014-06-23',DATE '2015-06-12',DATE '2014-06-30',DATE '2015-01-02',DATE '2015-11-27',DATE '2015-01-05',DATE '2015-01-06',DATE '2015-01-07',DATE '2015-06-19',DATE '2014-01-24',DATE '2015-01-08',DATE '2014-01-25',DATE '2015-01-09',DATE '2015-01-12',DATE '2015-01-13',DATE '2015-01-14',DATE '2015-01-15',DATE '2015-01-16',DATE '2015-06-30',DATE '2015-01-19',DATE '2013-09-20',DATE '2015-01-20',DATE '2013-09-21',DATE '2015-01-22',DATE '2013-09-23',DATE '2015-01-23',DATE '2015-01-26',DATE '2015-01-27',DATE '2014-09-13',DATE '2015-01-29',DATE '2014-09-14',DATE '2015-01-30',DATE '2014-09-15',DATE '2014-09-16',DATE '2014-09-17',DATE '2014-09-18',DATE '2014-09-19',DATE '2014-09-20',DATE '2014-09-22',DATE '2014-04-11',DATE '2014-09-23',DATE '2014-09-24',DATE '2014-09-25',DATE '2014-09-26',DATE '2014-09-27',DATE '2014-04-16',DATE '2014-09-28',DATE '2014-09-29',DATE '2013-12-02',DATE '2014-04-18',DATE '2014-09-30',DATE '2012-12-21',DATE '2014-04-21',DATE '2012-12-22',DATE '2015-04-10',DATE '2013-12-13',DATE '2015-09-25',DATE '2013-12-16',DATE '2013-07-05',DATE '2014-12-01',DATE '2013-12-18',DATE '2014-12-02',DATE '2015-09-30',DATE '2013-12-19',DATE '2014-12-03',DATE '2013-12-20',DATE '2014-12-04',DATE '2013-12-21',DATE '2014-12-05',DATE '2013-12-22',DATE '2014-12-06',DATE '2013-12-23',DATE '2013-12-24',DATE '2014-12-08',DATE '2015-04-24',DATE '2014-12-09',DATE '2013-12-26',DATE '2014-12-10',DATE '2013-12-27',DATE '2014-12-11',DATE '2014-12-12',DATE '2014-12-13',DATE '2013-12-30',DATE '2014-07-02',DATE '2014-12-14',DATE '2014-07-03',DATE '2014-12-15',DATE '2014-12-16',DATE '2014-12-17',DATE '2014-12-18',DATE '2014-07-07',DATE '2014-12-19',DATE '2014-12-20',DATE '2014-12-21',DATE '2014-07-10',DATE '2014-12-22',DATE '2014-07-11',DATE '2014-12-23',DATE '2014-12-24',DATE '2014-07-14',DATE '2014-12-26',DATE '2014-07-15',DATE '2014-12-27',DATE '2014-07-16',DATE '2014-07-17',DATE '2014-12-29',DATE '2014-07-18',DATE '2014-12-30',DATE '2014-02-07',DATE '2014-12-31',DATE '2014-07-21',DATE '2014-07-22',DATE '2014-07-23',DATE '2014-02-12',DATE '2014-07-24',DATE '2014-07-25',DATE '2014-02-14',DATE '2014-07-26',DATE '2014-02-17',DATE '2014-07-29',DATE '2015-02-04',DATE '2015-02-05',DATE '2015-02-06',DATE '2015-02-07'),
      CNTRCT_END_DT DATE FORMAT 'YY/MM/DD' COMPRESS (DATE '2016-12-16',DATE '2016-12-17',DATE '2016-12-18',DATE '2016-07-07',DATE '2016-12-19',DATE '2016-07-08',DATE '2016-12-20',DATE '2016-12-21',DATE '2016-12-22',DATE '2016-07-11',DATE '2016-12-23',DATE '2016-12-24',DATE '2016-07-14',DATE '2016-12-26',DATE '2016-07-15',DATE '2016-12-27',DATE '2016-07-16',DATE '2016-07-17',DATE '2016-12-29',DATE '2016-07-18',DATE '2016-12-30',DATE '2016-02-07',DATE '2016-02-08',DATE '2016-07-21',DATE '2016-02-10',DATE '2016-07-22',DATE '2016-02-11',DATE '2016-07-23',DATE '2016-02-12',DATE '2016-07-24',DATE '2016-07-25',DATE '2016-02-14',DATE '2016-02-15',DATE '2016-02-17',DATE '2016-07-29',DATE '2015-10-02',DATE '2017-02-04',DATE '2017-02-05',DATE '2017-02-06',DATE '2017-02-07',DATE '2016-02-24',DATE '2015-10-09',DATE '2017-02-09',DATE '2015-10-10',DATE '2016-02-26',DATE '2016-02-27',DATE '2016-02-28',DATE '2015-10-16',DATE '2015-10-17',DATE '2016-10-01',DATE '2016-10-02',DATE '2016-10-03',DATE '2016-10-04',DATE '2016-10-05',DATE '2015-10-22',DATE '2016-10-06',DATE '2015-10-23',DATE '2016-10-07',DATE '2015-10-24',DATE '2016-10-08',DATE '2015-10-25',DATE '2016-10-09',DATE '2016-10-10',DATE '2016-10-11',DATE '2015-10-28',DATE '2015-10-29',DATE '2016-10-13',DATE '2015-10-30',DATE '2016-05-02',DATE '2016-10-14',DATE '2015-10-31',DATE '2016-05-03',DATE '2016-10-15',DATE '2016-10-16',DATE '2016-05-05',DATE '2016-10-17',DATE '2016-05-06',DATE '2016-10-18',DATE '2015-05-23',DATE '2016-05-07',DATE '2016-05-08',DATE '2016-10-20',DATE '2016-05-09',DATE '2016-10-21',DATE '2016-05-10',DATE '2016-10-22',DATE '2016-10-23',DATE '2016-05-12',DATE '2016-10-24',DATE '2015-05-29',DATE '2016-05-13',DATE '2016-10-25',DATE '2016-10-27',DATE '2016-05-16',DATE '2016-10-28',DATE '2016-10-29',DATE '2016-10-30',DATE '2016-10-31',DATE '2016-05-23',DATE '2016-05-27',DATE '2016-05-28',DATE '2016-05-29',DATE '2016-05-30',DATE '2016-05-31',DATE '2016-08-08',DATE '2016-08-11',DATE '2016-08-12',DATE '2016-03-01',DATE '2016-08-13',DATE '2016-08-14',DATE '2016-08-15',DATE '2016-03-05',DATE '2016-08-18',DATE '2016-08-19',DATE '2016-03-08',DATE '2016-08-20',DATE '2016-08-21',DATE '2016-08-22',DATE '2016-03-11',DATE '2016-08-23',DATE '2016-08-25',DATE '2016-03-14',DATE '2016-08-26',DATE '2016-08-27',DATE '2016-08-28',DATE '2016-03-17',DATE '2016-08-29',DATE '2016-03-18',DATE '2016-08-30',DATE '2016-03-19',DATE '2016-03-21',DATE '2014-11-23',DATE '2016-03-25',DATE '2016-03-26',DATE '2016-03-28',DATE '2016-03-29',DATE '2016-03-31',DATE '2016-11-03',DATE '2016-11-04',DATE '2016-11-05',DATE '2016-11-06',DATE '2016-11-07',DATE '2016-11-10',DATE '2015-11-27',DATE '2016-11-11',DATE '2016-11-12',DATE '2015-11-29',DATE '2016-11-13',DATE '2015-11-30',DATE '2016-06-02',DATE '2016-11-14',DATE '2016-06-03',DATE '2016-06-04',DATE '2016-06-05',DATE '2016-11-17',DATE '2016-06-06',DATE '2016-11-18',DATE '2016-06-07',DATE '2016-11-19',DATE '2016-11-20',DATE '2016-06-09',DATE '2016-11-21',DATE '2016-06-10',DATE '2016-11-22',DATE '2016-06-11',DATE '2016-06-12',DATE '2016-11-24',DATE '2016-06-13',DATE '2016-11-25',DATE '2016-06-14',DATE '2016-11-26',DATE '2016-06-16',DATE '2016-11-28',DATE '2016-11-29',DATE '2016-11-30',DATE '2016-06-20',DATE '2016-06-23',DATE '2016-06-24',DATE '2016-06-30',DATE '2016-01-24',DATE '2016-01-25',DATE '2015-09-20',DATE '2015-09-21',DATE '2015-09-23',DATE '2015-09-25',DATE '2015-09-26',DATE '2016-04-01',DATE '2016-09-13',DATE '2015-09-30',DATE '2016-09-14',DATE '2016-09-15',DATE '2016-09-16',DATE '2016-09-17',DATE '2016-09-18',DATE '2016-09-19',DATE '2016-09-20',DATE '2016-09-22',DATE '2016-04-11',DATE '2016-09-23',DATE '2016-09-24',DATE '2016-09-25',DATE '2016-04-14',DATE '2016-09-26',DATE '2014-12-15',DATE '2016-09-27',DATE '2016-04-16',DATE '2016-09-28',DATE '2015-12-01',DATE '2016-09-29',DATE '2015-12-02',DATE '2016-04-18',DATE '2016-09-30',DATE '2014-12-19',DATE '2015-12-03',DATE '2014-12-20',DATE '2015-12-04',DATE '2014-12-21',DATE '2016-04-21',DATE '2014-12-22',DATE '2014-12-24',DATE '2015-12-09',DATE '2015-12-10',DATE '2015-12-11',DATE '2015-12-12',DATE '2015-07-01',DATE '2015-12-13',DATE '2015-12-14',DATE '2015-12-16',DATE '2015-07-05',DATE '2015-12-17',DATE '2016-12-01',DATE '2015-12-18',DATE '2016-12-02',DATE '2015-12-19',DATE '2016-12-03',DATE '2015-12-20',DATE '2016-12-04',DATE '2015-12-21',DATE '2016-12-05',DATE '2015-12-22',DATE '2015-12-23',DATE '2015-12-24',DATE '2016-12-08',DATE '2016-12-09',DATE '2015-12-26',DATE '2016-12-10',DATE '2015-12-27',DATE '2016-12-11',DATE '2016-12-12',DATE '2016-12-13',DATE '2015-12-30',DATE '2016-07-02',DATE '2016-12-14',DATE '2016-12-15'),
      CNTRCT_PRD_MTH INTEGER COMPRESS (0 ,12 ,24 ,36 ),
      SERVICE_T_BUCKET INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,-38 ,-37 ,-36 ,-35 ,-34 ,-33 ,-32 ,-31 ,-30 ,-29 ,-28 ,-27 ,-26 ,-25 ,-24 ,-23 ,-22 ,-21 ,-20 ,-19 ,-18 ,-17 ,-16 ,-15 ,-14 ,-13 ,-12 ,-11 ,-10 ,-9 ,-8 ,-7 ,-6 ,-5 ,-4 ,-3 ,-2 ,-1 ),
      CNTRCT_TERM_FEE DECIMAL(10,2) COMPRESS (0.00 ,200.00 ,175.00 ,50.00 ,350.00 ),
      DECREMENT_ETF DECIMAL(20,2) COMPRESS (0.00 ,320.00 ,105.00 ,210.00 ,100.00 ,310.00 ,95.00 ,200.00 ,90.00 ,300.00 ,85.00 ,190.00 ,80.00 ,290.00 ,75.00 ,180.00 ,70.00 ,175.00 ,280.00 ,65.00 ,170.00 ,60.00 ,165.00 ,270.00 ,160.00 ,155.00 ,260.00 ,150.00 ,40.00 ,145.00 ,250.00 ,140.00 ,350.00 ,135.00 ,240.00 ,130.00 ,340.00 ,125.00 ,230.00 ,120.00 ,330.00 ,115.00 ,220.00 ,110.00 ),
      UPG_ELIG_DT DATE FORMAT 'YY/MM/DD' COMPRESS (DATE '2016-12-16',DATE '2016-12-17',DATE '2016-12-18',DATE '2016-12-19',DATE '2016-12-20',DATE '2016-12-21',DATE '2016-07-10',DATE '2016-12-22',DATE '2016-07-11',DATE '2016-12-23',DATE '2016-07-12',DATE '2016-12-24',DATE '2016-12-26',DATE '2016-12-27',DATE '2016-12-28',DATE '2016-07-17',DATE '2016-12-29',DATE '2016-07-18',DATE '2016-12-30',DATE '2016-07-19',DATE '2016-12-31',DATE '2017-07-03',DATE '2016-07-20',DATE '2016-07-21',DATE '2016-07-22',DATE '2017-12-18',DATE '2017-12-19',DATE '2016-07-24',DATE '2017-12-20',DATE '2016-07-25',DATE '2017-12-21',DATE '2016-02-14',DATE '2016-07-26',DATE '2017-12-22',DATE '2017-12-23',DATE '2016-07-29',DATE '2017-12-26',DATE '2017-02-07',DATE '2017-02-11',DATE '2016-02-28',DATE '2017-02-12',DATE '2017-02-13',DATE '2017-02-14',DATE '2017-02-16',DATE '2016-10-02',DATE '2016-10-03',DATE '2017-02-19',DATE '2016-10-04',DATE '2016-10-05',DATE '2017-02-21',DATE '2016-10-06',DATE '2016-10-07',DATE '2017-02-23',DATE '2015-10-25',DATE '2016-10-09',DATE '2016-10-10',DATE '2017-02-26',DATE '2016-10-11',DATE '2017-02-28',DATE '2016-10-13',DATE '2016-05-02',DATE '2016-05-03',DATE '2016-10-16',DATE '2016-10-17',DATE '2016-10-18',DATE '2016-10-20',DATE '2016-05-09',DATE '2016-05-10',DATE '2016-10-23',DATE '2016-05-12',DATE '2016-10-24',DATE '2016-10-25',DATE '2016-10-27',DATE '2018-02-28',DATE '2017-05-01',DATE '2016-05-19',DATE '2016-10-31',DATE '2016-05-23',DATE '2016-05-24',DATE '2017-05-08',DATE '2017-05-09',DATE '2016-05-29',DATE '2016-05-30',DATE '2017-05-15',DATE '2017-05-16',DATE '2017-05-22',DATE '2017-05-23',DATE '2017-05-25',DATE '2016-08-01',DATE '2017-05-29',DATE '2017-05-30',DATE '2016-08-08',DATE '2016-08-09',DATE '2016-03-01',DATE '2016-08-15',DATE '2016-08-16',DATE '2016-08-17',DATE '2016-08-18',DATE '2016-08-19',DATE '2016-03-08',DATE '2016-08-20',DATE '2016-08-22',DATE '2016-08-23',DATE '2016-03-14',DATE '2016-03-15',DATE '2016-08-29',DATE '2016-08-30',DATE '2016-03-21',DATE '2016-03-22',DATE '2017-03-06',DATE '2017-03-07',DATE '2017-08-21',DATE '2016-03-29',DATE '2017-03-13',DATE '2017-03-14',DATE '2016-11-01',DATE '2016-11-02',DATE '2016-11-03',DATE '2016-11-04',DATE '2017-03-20',DATE '2016-11-05',DATE '2017-03-21',DATE '2016-11-06',DATE '2016-11-07',DATE '2016-11-08',DATE '2015-11-25',DATE '2016-11-10',DATE '2015-06-15',DATE '2016-11-11',DATE '2017-03-27',DATE '2016-11-12',DATE '2017-03-28',DATE '2015-11-29',DATE '2016-06-01',DATE '2016-11-13',DATE '2015-11-30',DATE '2016-06-02',DATE '2016-11-14',DATE '2016-11-15',DATE '2016-11-16',DATE '2016-11-17',DATE '2016-06-06',DATE '2016-11-18',DATE '2016-06-07',DATE '2016-11-19',DATE '2016-11-20',DATE '2016-06-09',DATE '2016-11-21',DATE '2016-06-10',DATE '2016-11-22',DATE '2016-11-23',DATE '2016-11-24',DATE '2016-06-13',DATE '2016-11-25',DATE '2016-06-14',DATE '2016-11-26',DATE '2014-09-04',DATE '2016-11-28',DATE '2016-11-29',DATE '2016-11-30',DATE '2016-06-21',DATE '2017-06-05',DATE '2014-09-13',DATE '2014-09-14',DATE '2016-06-28',DATE '2017-06-12',DATE '2017-06-13',DATE '2016-06-30',DATE '2017-01-02',DATE '2017-06-15',DATE '2017-11-27',DATE '2017-01-04',DATE '2017-06-16',DATE '2017-11-28',DATE '2015-09-05',DATE '2017-01-05',DATE '2017-11-30',DATE '2017-01-07',DATE '2017-06-19',DATE '2017-01-08',DATE '2017-06-20',DATE '2016-01-25',DATE '2017-01-09',DATE '2017-01-10',DATE '2017-06-22',DATE '2017-01-12',DATE '2015-09-13',DATE '2017-01-13',DATE '2017-01-14',DATE '2017-01-15',DATE '2017-01-17',DATE '2016-09-02',DATE '2017-06-30',DATE '2017-01-19',DATE '2015-09-20',DATE '2016-09-07',DATE '2016-09-08',DATE '2017-01-24',DATE '2016-09-13',DATE '2016-09-14',DATE '2017-01-30',DATE '2016-09-15',DATE '2017-01-31',DATE '2016-09-16',DATE '2016-09-19',DATE '2016-09-20',DATE '2016-09-21',DATE '2016-09-22',DATE '2016-04-11',DATE '2016-09-25',DATE '2016-09-26',DATE '2016-09-27',DATE '2016-09-28',DATE '2016-09-29',DATE '2016-04-18',DATE '2016-09-30',DATE '2016-04-19',DATE '2017-04-03',DATE '2017-04-04',DATE '2016-04-21',DATE '2017-09-19',DATE '2016-04-25',DATE '2016-04-26',DATE '2017-04-10',DATE '2017-04-11',DATE '2017-09-25',DATE '2017-09-26',DATE '2016-12-01',DATE '2017-04-17',DATE '2016-12-02',DATE '2017-04-18',DATE '2016-12-03',DATE '2016-12-04',DATE '2015-12-21',DATE '2016-12-05',DATE '2016-12-06',DATE '2015-12-23',DATE '2016-12-07',DATE '2015-12-24',DATE '2016-12-08',DATE '2017-04-24',DATE '2016-12-09',DATE '2017-04-25',DATE '2016-12-10',DATE '2016-12-11',DATE '2017-04-27',DATE '2016-12-12',DATE '2016-07-01',DATE '2016-12-13',DATE '2016-12-14',DATE '2017-04-30',DATE '2016-07-03',DATE '2016-12-15',DATE '9999-12-31'),
      LAST_UPG_DT DATE FORMAT 'YY/MM/DD' COMPRESS ,
      LAST_UPG_SLS_OUTLET_ID VARCHAR(12) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('100025','100027','100028','100029','101068','10390','109950','109958','119481','122971','122973','124630','124632','124633','124634','124636','124644','124645','124646','124647','124648','124659','124672','125258','14349','14569','15255','15259','15305','15308','1744','18063','21536','22755','28061','3812','4231','4232','6201','72133','74694','75207','75209','75884','76078','76585','79918','8253','85016','85067','85245','8620','88166','88707','88708','88710','88711','9196','92060','92406','92632','94801'),
      LAST_UPG_CHANNEL VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Communications Store Insi','Direct Sales','Indirect Internet','Internet','Local Agent','Local Retailer','National Retailer','Non-Commissionable','Telemarketing Inbound'),
      LAST_UPG_MASTER_AGENT_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('01617','01638','04804','05731','47965GP','4870','7146','ABCPHONES','AMAZON','APPLE','ATIWRLS','BESTBUY','BJSCLUB','CSKNX','DIAMOND','DM5029','FLEXICOM','GOWRLS','MOOREHEAD','NW4981','RADIOSHAK','RUSSELL','SAMSCLUB','SC4424','SC6677','TARGET','WALMART','WRLSADV','ZWRLS'),
      LAST_UPG_PROD_NM CHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('All New HTC One Metal Gray      ','Apple iPhone 4 16GB             ','BlackBerry Bold 9930            ','Brigadier by Kyocera            ','Casio GzOne Commando 4G LTE     ','Casio GzOne Ravine              ','Casio GzOne Ravine 2            ','Casio GzOne Ravine II           ','DROID MAXX 2 Blue               ','DROID RAZR MAXX HD by MOTOROLA  ','DROID TURBO 2 BLK Soft-Grip 32GB','DROID TURBO 2 Grey Nylon 32GB   ','DROID TURBO MOTOROLA BLK BN 64GB','DROID TURBO by MOTOROLA BLACK BN','DROID TURBO by MOTOROLA BLK MGF ','DROID TURBO by MOTOROLA RED MGF ','Droid Maxx by Motorola          ','Droid Mini by Motorola          ','Droid Mini by Motorola in Red   ','Droid Ultra by Motorola         ','DuraXVPlus by Kyocera           ','HTC ONE                         ','IPHONE 4 BLACK 8 GB             ','IPHONE 4 WHITE 8 GB             ','IPHONE 4S BLACK 16GB            ','IPHONE 4S BLACK 8GB             ','IPHONE 4S WHITE 16GB            ','IPHONE 4S WHITE 8GB             ','IPHONE 5 BLACK 16GB             ','IPHONE 5 BLACK 32GB             ','IPHONE 5 WHITE 16GB             ','IPHONE 5 WHITE 32GB             ','IPHONE 5C BLUE 8GB-USA          ','IPHONE 5C GREEN 8GB-USA         ','IPHONE 5C PINK 8GB-USA          ','IPHONE 5C WHITE 8GB -USA        ','IPHONE SE SPACE GRAY 16GB       ','Kyocera DuraXV                  ','LG Cosmos - VN250               ','LG Cosmos 2                     ','LG Cosmos 3                     ','LG Exalt                        ','LG Extravert - VN271            ','LG Extravert 2                  ','LG G Vista                      ','LG G2                           ','LG G2 White                     ','LG G3 Metallic Black            ','LG G3 Silk White                ','LG G4 Metallic Gray             ','LG Lucid                        ','LG Lucid 2                      ','LG Lucid 3                      ','LG Octane                       ','LG Revere - VN150               ','LG Revere 2                     ','LG Revere 3                     ','LG V10 Space Black              ','LG-VX5600                       ','Moto X by Motorola              ','Motorola DROID RAZR M           ','Motorola DROID RAZR M WHITE     ','Motorola DROID RAZR Maxx        ','Motorola DROID RAZR-16GB        ','Motorola Droid 4                ','Motorola Droid Maxx 16GB Black  ','Motorola Droid Maxx 16GB Red    ','SAM GALAXY S6 EDGE PLUS BLK 32GB','SAM GALAXY S6 EDGE PLUS GLD 32GB','SAM Galaxy Note 4 Charcoal Black','SAM Galaxy Note 4 Frost White   ','SAMSUNG GALAXY NOTE5 BLACK 32 GB','SAMSUNG GALAXY NOTE5 BLACK 64 GB','SAMSUNG GALAXY NOTE5 GOLD 32 GB ','SAMSUNG GALAXY NOTE5 WHITE 32 GB','SAMSUNG Gusto                   ','SCH-U640                        ','Samsung Brightside              ','Samsung Brightside Sapphire Blue','Samsung Convoy 3                ','Samsung Convoy II               ','Samsung Galaxy Core Prime       ','Samsung Galaxy Note 3           ','Samsung Galaxy Note 3 in White  ','Samsung Galaxy Note Edge Black  ','Samsung Galaxy Note II in Silver','Samsung Galaxy S 4 Black 16GB   ','Samsung Galaxy S 4 Black Mist   ','Samsung Galaxy S 4 Mini         ','Samsung Galaxy S 4 White 16GB   ','Samsung Galaxy S 4 White Frost  ','Samsung Galaxy S 5 Black        ','Samsung Galaxy S 5 Copper Gold  ','Samsung Galaxy S 5 Electric Blue','Samsung Galaxy S 5 White        ','Samsung Galaxy S III 16GB Black ','Samsung Galaxy S III 16GB Blue  ','Samsung Galaxy S III 16GB White ','Samsung Galaxy S III Mini       ','Samsung Galaxy S6 Black 32GB    ','Samsung Galaxy S6 Black 64GB    ','Samsung Galaxy S6 Edge BLK 32GB ','Samsung Galaxy S6 Gold 32GB     ','Samsung Galaxy S6 White 32GB    ','Samsung Galaxy S7 Black 32GB    ','Samsung Galaxy S7 Gold 32GB     ','Samsung Galaxy S7 edge BLK 32GB ','Samsung Galaxy S7 edge Gold 32GB','Samsung Galaxy S7 edge SLV 32GB ','Samsung Galaxy Stellar          ','Samsung Galaxy Stratosphere II  ','Samsung Gusto 3                 ','Samsung Gusto II                ','Samsung Gusto II Snow Silver    ','Samsung Haven SCH-U320          ','Samsung Intensity 3             ','Samsung Intensity 3 Steel Gray  ','Samsung Intensity II Blue       ','Samsung Intensity II Gray       ','Samsung Stratosphere            ','USB551L 4G USB Modem            ','VZ Jetpack 4G MHS 291L          ','VZ Jetpack 4G MHS 890L          ','VZ Jetpack 4G MHS MIFI 6620L    ','VZ Jetpack 4G MHS MIFI4510L     ','VZ Jetpack 4G MHS MIFI4620L     ','VZ Jetpack 4G MHS MIFI5510L     ','iPhone 5C Blue 16GB             ','iPhone 5C Blue 32GB             ','iPhone 5C Green 16GB            ','iPhone 5C Green 32GB            ','iPhone 5C Pink 16GB             ','iPhone 5C Pink 32GB             ','iPhone 5C White 16GB            ','iPhone 5C White 32GB            ','iPhone 5C Yellow 16GB           ','iPhone 5S Gold 16GB             ','iPhone 5S Gold 32GB             ','iPhone 5S Silver 16GB           ','iPhone 5S Silver 32GB           ','iPhone 5S Space Gray 16GB       ','iPhone 5S Space Gray 32GB       ','iPhone 5S Space Gray 64GB       ','iPhone 6 128GB Gold             ','iPhone 6 128GB Silver           ','iPhone 6 128GB Space Gray       ','iPhone 6 16GB Gold              ','iPhone 6 16GB Silver            ','iPhone 6 16GB Space Gray        ','iPhone 6 64GB Gold              ','iPhone 6 64GB Silver            ','iPhone 6 64GB Space Gray        ','iPhone 6 Plus 128GB Space Gray  ','iPhone 6 Plus 16GB Gold         ','iPhone 6 Plus 16GB Silver       ','iPhone 6 Plus 16GB Space Gray   ','iPhone 6 Plus 64GB Gold         ','iPhone 6 Plus 64GB Silver       ','iPhone 6 Plus 64GB Space Gray   ','iPhone 6S 128GB Space Gray      ','iPhone 6S 16GB Gold             ','iPhone 6S 16GB Rose Gold        ','iPhone 6S 16GB Silver           ','iPhone 6S 16GB Space Gray       ','iPhone 6S 64GB Gold             ','iPhone 6S 64GB Rose Gold        ','iPhone 6S 64GB Silver           ','iPhone 6S 64GB Space Gray       ','iPhone 6S Plus 16GB Rose Gold   ','iPhone 6S Plus 16GB Space Gray  ','iPhone 6S Plus 64GB Gold        ','iPhone 6S Plus 64GB Rose Gold   ','iPhone 6S Plus 64GB Silver      ','iPhone 6S Plus 64GB Space Gray  ','iPhone 7 Black 128GB            ','iPhone 7 Black 32GB             '),
      LAST_UPG_DEVICE_TYPE VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Basic','HPC','MBB','Smartphone','Tablet'),
      LAST_UPG_OS VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Android','Apple','Blackberry','Other','Windows'),
      CONSUMER_IND VARCHAR(8) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('B2B','Consumer'),
      LIABILITY VARCHAR(28) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CNC (CRM B2B Treat)','CNC 1-4 (CRM Consumer Treat)','Consumer w/o ELEU','Corporate','ELEU','Non Contracted IN'),
      VSN_CUST_TYPE_CD VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('BE','NA','PE'),
      PAPERLESS_BILLING_IND VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      BILL_PYMNT_TYPE VARCHAR(12) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Cash Only','Credit Card','Debit Card','Home Banking','No APO'),
      TELCO_SINGL_BILL_IND VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'N',
      FIOS_INTERNET CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      FIOS_TV CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      VZT_PHONE CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      MYVERIZON_ROLE VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AH','MS'),
      HAS_NTWK_EXTENDER CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      REWARD_ENROLLED CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      EVER_REDEEMED_PTS CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      GO90_REGISTERED CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      DOWNLOADED_NFL_MOBILE CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      TMP_FLAG CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      OTH_INSURANCE_FLAG CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      FAMILY_BASE_FLAG CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      LEGACY_USAGE_CONTROL_FLAG CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      VOLTE_PROVISION_FLAG CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      ACCT_HAS_TRAVEL_PASS CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      NPS_SCORE INTEGER COMPRESS (9 ,10 ),
      LAST_NPS_SURVEY_DT DATE FORMAT 'YYYY-MM-DD' COMPRESS ,
      ECPD_PROFILE_ID VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('117818','121576','1270','1507721','1621','1968','2070','2125','2206','2344','2466467','2481446','2735','2756','2791622','2840912','2974358','3032424','3064374','3071','3117986','3123528','3141912','3161585','3186257','3200070','3201482','3267435','3288514','3307599','3316094','3347463','3378684','3384459','3403294','3438528','3443279','3460391','3474073','3616','39400','39604','40950','4262','42934','521501','55582','559201','5705','603412','6282','631662','648596','70093','704518','720320','751349','757783','815125','890617','89408','965847','Untagged'),
      ECPD_ACCESS_DISC DECIMAL(20,2) COMPRESS (0.00 ,18.00 ,8.00 ,21.00 ,24.00 ,19.00 ,22.00 ,17.00 ,12.00 ,25.00 ,20.00 ,15.00 ,10.00 ,23.00 ),
      ECPD_FEAT_DISC INTEGER COMPRESS (0 ,8 ,10 ,12 ,15 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ),
      FORMER_ECPD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      HRCHY_SEGMT VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CC Ent 1 (1000-9999)                              ','CC Ent 2 (10k up)                                 ','CC Federal Corp                                   ','CC Government Corp                                ','CC Med 1 (50-99)                                  ','CC Med 2 (100-499)                                ','CC Med 3 (500-999)                                ','CC Sml 1 (1-4)                                    ','CC Sml 2 (5-49)                                   ','CC Undetermined                                   ','CN Sml 1 (1-4)                                    ','CN Sml 2 (5-49)                                   ','CN Undetermined                                   ','CO Consumer                                       ','EC Ent 1 (1000-9999)                              ','EC Ent 2 (10k up)                                 ','EC Government Emp                                 ','EC Med 1 (50-99)                                  ','EC Med 2 (100-499)                                ','EC Med 3 (500-999)                                ','EC Sml 1 (1-4)                                    ','EC Sml 2 (5-49)                                   ','EC Undetermined                                   ','EC VZW Emp                                        '),
      CONSUMER_LINK VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('00K3US01S6QPGX7R','00K3US01TTXNKPJR','00K3US110N3NP4CB','00K3US110P3JPMXC','00K3US1115NEPPTE','00K3US1118MBPRQS','00K3US111Y210GGH','00K3US112TC2DGDG','00K3US113VVHRBXF','00K3US11830FDTN6','00K3US119HC7CVE0','00K3US11BPFJHBZQ','00K3US11CNWDMFJ8','00K3US11E6F4G0CC','00K3US11ETDMKWF9','00K3US11FCGQ75MR','00K3US11FT5P9TM5','00K3US11H1ZX5ZF7','00K3US11JYCMS5PB','00K3US11KR7QBW06','00K3US11NKJQDXV7','00K3US11PFB8D5FJ','00K3US11PVE485F9','00K3US11QW536XEK','00K3US11R0EFRX4X','00K3US11V22QDY4P','00K3US11YYPK05XT','00K3US11ZFQJPWGF'),
      ADDRESS_LINK VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('00K3US030LNJPEBN','00K3US030Y7K52KH','00K3US0320QN3KQM','00K3US032KWM3MC8','00K3US032WVGEN46','00K3US032X7C3F1C','00K3US0336ECMNQ4','00K3US034QMKGYHG','00K3US037PFEXECD','00K3US037Z03MFBF','00K3US03CER27SSQ','00K3US03CK624D1D','00K3US03CKB21B3C','00K3US03DQS5XB9T','00K3US03DW2WWBX7','00K3US03FSB7KJCR','00K3US03JRSCQB9M','00K3US03LM443B96','00K3US03MSQDKWFT','00K3US03NWEYY914','00K3US03NWVN2WDK','00K3US03PJG7GYCR','00K3US03V824RB8X','00K3US03VW684X6X','00K3US03VXQ945E3','00K3US03Z111GYLC','00K3US03Z430SRCT','00K3US03ZXRF35HQ','00K3US13T4BJRXFL','00K3US13V1G7TPBN'),
      LANG_PREF_IND VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'E         ',
      ETHNICITY VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('African-American','Asian-American','Hispanic','Other'),
      ETHNICITY_SUBSEGMENT VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('African American','Asian (Non-Oriental)','Asian','French','German','Hispanic','Italian','Jewish','Northern European','Scottish/Irish','Southern European','Unknown'),
      MULTI_CULTURAL VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      ACCT_BIRTH_YEAR INTEGER COMPRESS (1934 ,1935 ,1936 ,1937 ,1938 ,1939 ,1940 ,1941 ,1942 ,1943 ,1944 ,1945 ,1946 ,1947 ,1948 ,1949 ,1950 ,1951 ,1952 ,1953 ,1954 ,1955 ,1956 ,1957 ,1958 ,1959 ,1960 ,1961 ,1962 ,1963 ,1964 ,1965 ,1966 ,1967 ,1968 ,1969 ,1970 ,1971 ,1972 ,1973 ,1974 ,1975 ,1976 ,1977 ,1978 ,1979 ,1980 ,1981 ,1982 ,1983 ,1984 ,1985 ,1986 ,1987 ,1988 ,1989 ,1990 ,1991 ,1992 ,1993 ,1994 ,1995 ),
      ACCT_GENERATION VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Baby Boomers','Generation X','Greatest Generation','Millennial','N/A','Silent Generation'),
      LIFE_STAGE VARCHAR(31) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Families with Tweens and Teens.','Families with Young Children','Mature Adult','Single/Couple without Kids','Unscored','Young Adult'),
      ACXIOM_18_25_IN_HSHLD VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Unk','Y'),
      E_ONE_CD VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1','10','100','102','103','104','105','106','107','109','11','110','111','112','113','114','115','116','117','118','12','124','125','127','129','13','132','134','135','136','139','14','141','143','146','15','150','151','152','156','157','158','159','16','160','168','17','170','171','18','19','2','20','21','22','23','24','25','26','28','29','3','30','31','33','34','35','36','37','38','39','4','40','41','44','45','46','47','48','49','5','50','51','52','53','54','55','56','57','58','59','6','60','61','62','63','64','66','67','68','69','7','70','71','72','73','74','75','76','77','78','79','8','81','82','84','85','86','87','89','9','90','91','92','95','96'),
      PERSONICX_NM VARCHAR(23) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Acred Couples','Apple Pie Families','Career Building','Career Centered Singles','Cartoons and Carpools','Children First','City Mixers','Clubs and Causes','Collegiate Crowd','Community Singles','Corporate Clout','Country Comfort','Country Single','Country Ways','Devoted Duos','Downtown Dwellers','Dynamic Duos','Early Parents','Established Elite','Family Matters','Farmland Families','First Digs','First Mortgage','Full Steaming','Fun and Games','Hard Chargers','Home Cooking','Humble Homes','Kids and Clout','Kids and Rent','Lavish Lifestyles','Married Sophisticates','Metro Mix','Metro Parents','Mid Americana','Midtown Minivanners','Mobile Mixers','Modest Wages','Outward Bound','Pennywise Mortgagees','Pennywise Proprietors','Platinum Oldies','Resilient Renters','Resolute Renters','Rolling Stones','Rural Everlasting','Rural Parents','Rural Retirement','Rural Rovers','Savvy Singles','Shooting Stars','Sitting Pretty','Skyboxes and Suburbans','Soccer and SUVs','Solid Single Parents','Solo and Stable','Spouses & Houses','Still Truckin','Suburban Seniors','Summit Estates','The Great Outdoors','Thrifty Elders','Timeless Elders','Tots and Toys','Urban Scramble','Urban Tenants','Work and Causes','Young Workboots'),
      INCOME VARCHAR(19) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('$100,000 - $124,999','$15,000 - $19,999','$20,000 - $29,999','$30,000 - $39,999','$40,000 - $49,999','$50,000 - $74,999','$75,000 - $99,999','< $15,000','< \$15,000','> $124,999','> \$124,999','Unknown','\$100,000 - \$124,9','\$15,000 - \$19,999','\$20,000 - \$29,999','\$30,000 - \$39,999','\$40,000 - \$49,999','\$50,000 - \$74,999','\$75,000 - \$99,999'),
      HIGHEST_EDUCATION_LVL VARCHAR(22) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('College','Grad School','High School','Unk','Vocational/Tech School'),
      CHILD_IN_HSHLD VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      HSHLD_SIZE CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1','2','3','4','5','6','7','8','9'),
      MARITAL_STATUS VARCHAR(7) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Married','Single','Unk'),
      RECENT_DIVORCE_FLAG VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'N',
      OWN_RENT_IND VARCHAR(8) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Own Home','Rent'),
      GENDER_OF_ACCT_HOLDER VARCHAR(6) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Female','Male','Unk'),
      OWN_SATELLITE_DISH VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      ACXIOM_DTV_DECILE INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      SOCIAL_INFLUENCER_DECILE INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      SOCIALLY_INFLUENCED_DECILE INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      SOCIAL_NETWORK_USER_DECILE INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      HVY_FACEBOOK_USER_DECILE INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      HVY_TWITTER_USER_DECILE INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      HVY_LINKEDIN_USER_DECILE INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      HVY_YOUTUBE_USER_DECILE INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      UNLIM_DATA_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      ACCT_UNLIM_DATA_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      PPLAN_CD VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('10034','10037','10102','10117','10166','10172','10173','10174','10175','10176','10177','18245','20245','24245','28261','28263','28265','28267','28271','73436','73437','73442','73454','73736','73737','73766','74048','74051','74054','74511','74539','83155','83234','83611','84114','84298','84356','84357','84734','85168','85191','85320','85321','85352','85548','86156','86244','86487','86489','86491','86492','86494','86495','86496','86497','86498','86499','86500','86502','86503','86504','86790','86994','87180','87181','87182','87184','87211','87214','87269','87527','87561','87640','87645','87658','87695','87873','88005','88605','88863','88907','89346','89424','89642','89674','89690','89716','89741','89742','89849','89850','89852','89967','90001','90002','90003','90004','90006','90015','90022','90132','90186','90426','90427','90428','91055','91126','91337','91382','91518','91519','91641','91644','91701','91702','91821','91822','91824','91830','91831','91903','91907','91910','91945','91953','91954','92039','92040','92042','92346','92609','92731','92732','92736','92741','92742','92744','92747','92756','92765','92770','92772','92775','92780','92784','93103','93240','93527','94156','94157','94158','94159','94162','94163','94164','94171','94679','95435','95750','96325','96327','96328','96329','96331','96333','96334','96523','97105'),
      PPLAN_MKT_CD VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1010','616','663','666','668','978','AAA'),
      LINE_PLAN_TYPE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Business Flex','Legacy','More Everything','Verizon Plan 1.0','Verizon Plan 2.0'),
      SAFETY_MODE CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      MOBILE_FIRST_USER CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      PLAN_DATA_ALLOW VARCHAR(26) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0 GB','1 GB','1.00 GB','10 GB','10.00 GB','100 GB','12 GB','12.00 GB','120 GB','14 GB','15 GB','15.00 GB','150 GB','16 GB','16.00 GB','18 GB','18.00 GB','2 GB','2.00 GB','20 GB','20.00 GB','200 GB','24 GB','24.00 GB','25 GB','25.00 GB','250 MB','3 GB','3.00 GB','30 GB','30.00 GB','300 GB','300 MB','4 GB','4.00 GB','40 GB','40.00 GB','400 GB','50 GB','50.00 GB','500 MB','6 GB','6.00 GB','60 GB','60.00 GB','8 GB','8.00 GB','80 GB','No Data','PREPAID'),
      BONUS_DATA_ALLOW VARCHAR(26) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0.49 GB','1 GB','1.00 GB','1.49 GB','10 GB','10.00 GB','11 GB','12 GB','12.00 GB','2 GB','2.00 GB','2.49 GB','3 GB','3.00 GB','4 GB','4.00 GB','5 GB','500 MB','6 GB','6.00 GB','8 GB','8.00 GB','No Data','PREPAID'),
      BONUS_DATA_ALLOW_MB DECIMAL(20,5) COMPRESS (0.00000 ,10240.00000 ,2048.00000 ,12288.00000 ,4096.00000 ,14336.00000 ,6144.00000 ,8192.00000 ,1525.76000 ,1024.00000 ,11264.00000 ,3072.00000 ,5120.00000 ,500.00000 ),
      TOTAL_DATA_ALLOW VARCHAR(26) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0 GB','1 GB','1 KB','1 MB','1.00 GB','1.00 KB','1.00 MB','1.49 GB','10 GB','10 MB','10.00 GB','10.49 GB','100 GB','100 MB','100.00 MB','11 GB','11.00 GB','12 GB','12.00 GB','120 GB','121 GB','13 GB','14 GB','14.00 GB','15 GB','15.00 GB','15.49 GB','150 GB','150 KB','150 MB','150.00 KB','16 GB','16.00 GB','17 GB','18 GB','18.00 GB','19 GB','2 GB','2 MB','2.00 GB','2.00 MB','2.49 GB','20 GB','20.00 GB','20.49 GB','200 GB','21 GB','22 GB','22.00 GB','24 GB','24.00 GB','25 GB','25 MB','25.00 GB','250 KB','250 MB','26 GB','26.00 GB','27 GB','3 GB','3 MB','3.00 GB','3.49 GB','30 GB','30.00 GB','300 GB','300 MB','31 GB','32 GB','4 GB','4.00 GB','4.49 GB','40 GB','40.00 GB','41 GB','42 GB','5 GB','5 MB','5.00 GB','50 GB','50 MB','500 KB','500 MB','500.00 KB','6 GB','6.00 GB','6.49 GB','60 GB','60.00 GB','61 GB','62 GB','7 GB','7.00 GB','8 GB','8.00 GB','80 GB','9 GB','No Data','PAYGO','PREPAID','UNLIMITED'),
      TOTAL_DATA_ALLOW_MB DECIMAL(20,5) COMPRESS (0.00000 ,10240.00000 ,307200.00000 ,20480.00000 ,30720.00000 ,40960.00000 ,51200.00000 ,2048.00000 ,61440.00000 ,12288.00000 ,22528.00000 ,81920.00000 ,32768.00000 ,102400.00000 ,4096.00000 ,63488.00000 ,122880.00000 ,14336.00000 ,24576.00000 ,153600.00000 ,6144.00000 ,16384.00000 ,26624.00000 ,204800.00000 ,8192.00000 ,18432.00000 ,1525.76000 ,3573.76000 ,15861.76000 ,1024.00000 ,11264.00000 ,21504.00000 ,31744.00000 ,41984.00000 ,3072.00000 ,62464.00000 ,13312.00000 ,5120.00000 ,15360.00000 ,25600.00000 ,7168.00000 ,17408.00000 ,27648.00000 ,9216.00000 ,19456.00000 ,10741.76000 ,6645.76000 ,5.00000 ,0.14648 ,2.00000 ,50.00000 ,250.00000 ,0.24414 ,9999999999.00000 ,0.00098 ,100.00000 ,500.00000 ,25.00000 ,1.00000 ,0.48828 ,150.00000 ,3.00000 ),
      LAST_DT_ACCT_CALLED_CARE DATE FORMAT 'YY/MM/DD' COMPRESS ,
      LAST_DT_ACCT_VISIT_DIRECT_STORE DATE FORMAT 'YY/MM/DD' COMPRESS ,
      LAST_DT_ACCT_VISIT_INDIRECT_STORE DATE FORMAT 'YY/MM/DD' COMPRESS ,
      LAST_DT_ACCT_HAD_ECHAT DATE FORMAT 'YY/MM/DD' COMPRESS ,
      USG_ALERTS_LAST_30_DAYS INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ),
      USG_ALERTS_LAST_90_DAYS INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ),
      USG_ALERTS_LAST_180_DAYS INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ),
      LINE_ACT_DT DATE FORMAT 'YY/MM/DD',
      LINE_TENURE_MTHS INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ,101 ,102 ,103 ,104 ,105 ,106 ,107 ,108 ,109 ,110 ,111 ,112 ,113 ,114 ,115 ,116 ,117 ,118 ,119 ,120 ,121 ,122 ,123 ,124 ,125 ,126 ,127 ,128 ,129 ,130 ,131 ,132 ,133 ,134 ,135 ,136 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,145 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,156 ,157 ,158 ,159 ,160 ,161 ,162 ,163 ,164 ,165 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,174 ,175 ,176 ,177 ,178 ,179 ,180 ,181 ,182 ,183 ,184 ,185 ,186 ,187 ,188 ,189 ,190 ,191 ,192 ,193 ,194 ,195 ,196 ,197 ,198 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,215 ,216 ,217 ,218 ,219 ,220 ),
      LINE_TENURE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1-2 Years','1-3 Mths','10-11 Years','10-12 Mths','11-12 Years','12-13 Years','13-14 Years','14-15 Years','15+ Years','2-3 Years','3-4 Years','4-5 Years','4-6 Mths','5-6 Years','6-7 Years','7-8 Years','7-9 Mths','8-9 Years','9-10 Years'),
      NM_FIRST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('.','AARON','ADAM','AL','ALAN','ALARM','ALEX','AMANDA','AMY','ANDREA','ANDREW','ANGELA','ANN','ANNA','ANTHONY','ASHLEY','BARBARA','BENJAMIN','BETTY','BILL','BOB','BRAD','BRANDON','BRENDA','BRIAN','BRUCE','BRYAN','CAMPBELL','CARL','CAROL','CAROLYN','CATHERINE','CHAD','CHARLES','CHERYL','CHRIS','CHRISTINA','CHRISTINE','CHRISTOPHER','CINDY','CRAIG','CYNTHIA','DALE','DAN','DANIEL','DAVE','DAVID','DAWN','DEBBIE','DEBORAH','DEBRA','DENISE','DENNIS','DIANA','DIANE','DON','DONALD','DONNA','DOUGLAS','EDWARD','ELIZABETH','EMILY','ERIC','ERIN','FRANK','GARY','GEORGE','GERALD','GORDON','GREG','GREGORY','HEATHER','HYUNDAI','IP','JACK','JACOB','JAMES','JAMIE','JANE','JANET','JANICE','JASON','JEAN','JEFF','JEFFREY','JENNIFER','JEREMY','JERRY','JESSICA','JILL','JIM','JOAN','JOE','JOHN','JON','JONATHAN','JOSE','JOSEPH','JOSHUA','JOYCE','JUAN','JUDITH','JUDY','JULIE','JUSTIN','KAREN','KATHERINE','KATHLEEN','KATHY','KEITH','KELLY','KENNETH','KEVIN','KIM','KIMBERLY','KYLE','LARRY','LAURA','LAUREN','LESLIE','LINDA','LISA','LORI','LYNN','MARGARET','MARIA','MARK','MARTIN','MARY','MATT','MATTHEW','MEGAN','MELISSA','MICHAEL','MICHELLE','MIKE','NANCY','NATHAN','NEW','NICHOLAS','NICK','NICOLE','NPHASE','OAS','PAMELA','PATRICIA','PATRICK','PAUL','PAULA','PETER','PROGRESSIVE','RACHEL','RANDY','RAYMOND','REBECCA','RICHARD','RICK','ROBERT','ROBIN','ROGER','RON','RONALD','RYAN','SANDRA','SARA','SARAH','SCOTT','SEAN','SHANNON','SHARON','SHAWN','SHIRLEY','SMARTSYNCH','STEPHANIE','STEPHEN','STEVE','STEVEN','SUSAN','TAMMY','TERESA','TERRY','THERESA','THOMAS','TIM','TIMOTHY','TINA','TODD','TOM','TONY','TRACY','TRAVIS','TYLER','Update','UPS','USA','VIVINT','WALTER','WAYNE','WENDY','WILLIAM','WIRELESS'),
      NM_LAST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('.','1','ACCT','ADAMS','ALLEN','ANDERSON','AUTOEVER','BAILEY','BAKER','BARNES','BELL','BENNETT','BOX','BOYD','BROOKS','BROWN','BURDIEK','BUTLER','CAMPBELL','CARTER','CAWSE','CLARK','COLE','COLLINS','COM','CONSUMERS','COOK','COOPER','COX','DATATEL','DAVIS','DOBBERT','EDWARDS','ENGG','EVANS','FISHER','FLORES','FOSTER','GALMAN','GARCIA','GOLDEN','GONZALEZ','GRAHAM','GRAY','GREEN','HALL','HAMILTON','HARRIS','HAYES','HENDERSON','HERNANDEZ','HILL','HOWARD','HUGHES','INC','Info','INS','IPAD','IPHONE','JACKSON','JAMES','JENKINS','JOHNSON','JONES','JORDAN','KELLY','KENNEDY','KIM','KING','LEE','LEWIS','LINE','LONG','LOPEZ','LUOMA','MARTIN','MARTINEZ','MASTERS','MCCOOL','MIFI','MILLER','MITCHELL','MOORE','MORGAN','MORRIS','MURPHY','MURRAY','MYERS','NELSON','OLSON','PARKER','PATTERSON','PEREZ','PERRY','PETERSON','PHILLIPS','PHONE','PHONEINTHEBOX','POWELL','PRICE','RAMIREZ','REED','REYNOLDS','RICHARDSON','RIVERA','ROBERTS','ROBINSON','RODRIGUEZ','ROGERS','ROSS','RUSSELL','SANCHEZ','SANDERS','SCHWARZ','SCOTT','SMITH','SNYDER','STEVENS','STEWART','SUBSCRIBER','SULLIVAN','TABLET','TAYLOR','TECHNOLOGIES INC','TEST','THOMAS','THOMPSON','TORRES','TURNER','USA','USER','VER','WALKER','WARD','WATSON','WEST','WHITE','WILLIAMS','WILSON','WIRELESS','WOOD','WRIGHT','YOUNG','ZAPATERO'),
      ACTIVATING_SLS_OUTLET_ID VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('100025','100027','100028','100029','101068','10176','118618','119264','119265','119266','119470','119476','119481','120343','120344','122938','123871','124252','124484','124485','13425','13920','13922','14349','14568','14569','15255','15260','15269','15307','1612','1744','18035','18063','18358','18380','18381','18688','19385','21757','22755','25655','25678','3008','301','302','3341','3812','3902','395','4231','4232','4751','6071','6202','673','71734','72127','72132','72133','72355','72382','7277','74584','74663','74664','74667','74686','74816','75060','75063','75064','75207','75727','75884','75922','75923','75950','76077','76078','76082','76583','7737','79430','79927','80643','80644','82491','8253','82537','84136','84888','84904','84990','84996','84999','85016','85067','85673','86121','8620','86439','86640','86742','88166','88260','8865','88707','88708','88710','88711','9196','95480','95578','96532','96609','96610','96611','98238','99602','9971'),
      ACTIVATING_CHANNEL VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Communications Store Insi','Direct Sales','Indirect Internet','Internet','Local Agent','Local Retailer','National Retailer','Non-Commissionable','Telemarketing Inbound'),
      ACTIVATING_MASTER_AGENT_ID VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('00670','01638','04804','05731','0581','08145GP','11093','2473','47965GP','4870','67800GP','7387','ABCPHONES','AMAZON','APPLE','ATIWRLS','BESTBUY','BJSCLUB','CARTOYS','CSKNX','DIAMOND','DM4607','DM5029','FLEXICOM','GOWRLS','INPHONIC','MOOREHEAD','NW4981','PM400','QWESTC','RADIOSHAK','RUSSELL','SAMSCLUB','SC4424','SC6677','TARGET','TARGET-P','TERMALLLO','W-AW','WALMART','WRLSADV','ZWRLS'),
      ORIG_CUST_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('222878125','223564045','242004212','242036245','242042978','242048616','272402317','342023651','442018439','542028174','542063202','642015857','642048712','642057533','642067947','686741117','687158971','742027525','742034421','742048882','822646749','842042373','942004484','942009052','942050205'),
      ORIG_CUST_LINE_SEQ_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0_1','0_2','0_3','1','10','11','12','13','14','15','16','17','18','19','2','20','21','22','23','24','25','26','27','28','3','4','5','6','7','8','9'),
      ACCT_ESTB_DT DATE FORMAT 'YY/MM/DD',
      ACCT_TENURE_MTHS INTEGER COMPRESS (256 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ,101 ,102 ,103 ,104 ,105 ,106 ,107 ,108 ,109 ,110 ,111 ,112 ,113 ,114 ,115 ,116 ,117 ,118 ,119 ,120 ,121 ,122 ,123 ,124 ,125 ,126 ,127 ,128 ,129 ,130 ,131 ,132 ,133 ,134 ,135 ,136 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,145 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,156 ,157 ,158 ,159 ,160 ,161 ,162 ,163 ,164 ,165 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,174 ,175 ,176 ,177 ,178 ,179 ,180 ,181 ,182 ,183 ,184 ,185 ,186 ,187 ,188 ,189 ,190 ,191 ,192 ,193 ,194 ,195 ,196 ,197 ,198 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,228 ,229 ,230 ,231 ,232 ,233 ,234 ,235 ,236 ,237 ,238 ,239 ,240 ,241 ,242 ,243 ,244 ,245 ,246 ,247 ,248 ,249 ,250 ,251 ,252 ,253 ,254 ),
      ACCT_TENURE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('1-2 Years','1-3 Mths','10-11 Years','10-12 Mths','11-12 Years','12-13 Years','13-14 Years','14-15 Years','15+ Years','2-3 Years','3-4 Years','4-5 Years','4-6 Mths','5-6 Years','6-7 Years','7-8 Years','7-9 Mths','8-9 Years','9-10 Years'),
      ACCT_NM_FIRST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AMANDA','AMY','ANDREW','ANGELA','ANTHONY','BARBARA','BRENDA','BRIAN','CAROL','CHARLES','CHERYL','CHRIS','CHRISTINE','CHRISTOPHER','CYNTHIA','DANIEL','DAVID','DEBORAH','DEBRA','DENNIS','DIANE','DONALD','DONNA','DOUGLAS','EDWARD','ELIZABETH','ERIC','FRANK','GARY','GEORGE','GREGORY','HEATHER','JAMES','JASON','JEFFREY','JENNIFER','JESSICA','JOHN','JOSE','JOSEPH','JOSHUA','JULIE','KAREN','KATHLEEN','KELLY','KENNETH','KEVIN','KIMBERLY','LARRY','LAURA','LINDA','LISA','MARIA','MARK','MARY','MATTHEW','MELISSA','MICHAEL','MICHELLE','NANCY','PAMELA','PATRICIA','PATRICK','PAUL','PETER','REBECCA','RICHARD','ROBERT','RONALD','RYAN','SANDRA','SARAH','SCOTT','SHARON','STEPHANIE','STEPHEN','STEVE','STEVEN','SUSAN','THOMAS','TIMOTHY','Update','WILLIAM'),
      ACCT_NM_LAST VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('ANDERSON','BROWN','DAVIS','Info','JOHNSON','JONES','LEE','MARTIN','MILLER','MOORE','SMITH','TAYLOR','WILLIAMS','WILSON'),
      NM_LAST_MATCH_FLAG CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      NM_FIRST_MATCH_FLAG CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      CUST_SSN_ESTB_DT DATE FORMAT 'YY/MM/DD',
      CUST_SSN_TENURE_MTH INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ,101 ,102 ,103 ,104 ,105 ,106 ,107 ,108 ,109 ,110 ,111 ,112 ,113 ,114 ,115 ,116 ,117 ,118 ,119 ,120 ,121 ,122 ,123 ,124 ,125 ,126 ,127 ,128 ,129 ,130 ,131 ,132 ,133 ,134 ,135 ,136 ,137 ,138 ,139 ,140 ,141 ,142 ,143 ,144 ,145 ,146 ,147 ,148 ,149 ,150 ,151 ,152 ,153 ,154 ,155 ,156 ,157 ,158 ,159 ,160 ,161 ,162 ,163 ,164 ,165 ,166 ,167 ,168 ,169 ,170 ,171 ,172 ,173 ,174 ,175 ,176 ,177 ,178 ,179 ,180 ,181 ,182 ,183 ,184 ,185 ,186 ,187 ,188 ,189 ,190 ,191 ,192 ,193 ,194 ,195 ,196 ,197 ,198 ,199 ,200 ,201 ,202 ,203 ,204 ,205 ,206 ,207 ,208 ,209 ,210 ,211 ,212 ,213 ,214 ,215 ,216 ,217 ,218 ,219 ,220 ,221 ,222 ,223 ,224 ,225 ,226 ,227 ,228 ,229 ,230 ,231 ,232 ,233 ,234 ,235 ,236 ,237 ,238 ,239 ,240 ,241 ,242 ,243 ,244 ,245 ,246 ,247 ,248 ,249 ,250 ,251 ,252 ,253 ,255 ),
      LAST_CYCLE_ARPU DECIMAL(20,2) COMPRESS (0.00 ,64.00 ,0.01 ,105.00 ,33.33 ,33.34 ,18.00 ,56.40 ,38.50 ,66.66 ,66.67 ,66.68 ,35.99 ,36.00 ,61.60 ,100.00 ,0.20 ,13.00 ,54.00 ,0.25 ,30.99 ,31.00 ,95.00 ,31.01 ,72.00 ,56.66 ,0.35 ,48.99 ,56.67 ,56.68 ,0.37 ,41.33 ,89.99 ,0.40 ,26.00 ,90.00 ,0.44 ,0.45 ,31.20 ,44.00 ,0.50 ,85.00 ,13.33 ,0.55 ,23.60 ,62.00 ,18.50 ,46.66 ,0.60 ,39.00 ,46.68 ,79.99 ,16.00 ,80.00 ,0.65 ,56.99 ,57.00 ,57.01 ,0.70 ,41.66 ,49.35 ,34.00 ,41.68 ,0.75 ,74.99 ,36.60 ,75.00 ,0.80 ,52.00 ,36.66 ,36.67 ,29.00 ,0.85 ,69.99 ,70.00 ,0.90 ,47.00 ,67.50 ,0.95 ,24.00 ,64.98 ,64.99 ,1.00 ,65.00 ,42.00 ,26.66 ,62.50 ,26.67 ,39.50 ,59.98 ,59.99 ,60.00 ,60.01 ,36.99 ,37.00 ,57.50 ,21.67 ,62.66 ,54.99 ,62.67 ,55.00 ,55.01 ,31.99 ,32.00 ,57.60 ,52.50 ,16.67 ,26.95 ,49.99 ,50.00 ,50.01 ,27.00 ,47.50 ,68.00 ,44.99 ,45.00 ,45.01 ,22.00 ,42.49 ,42.50 ,42.51 ,62.99 ,63.00 ,39.99 ,40.00 ,40.01 ,37.50 ,19.60 ,58.00 ,27.29 ,27.30 ,34.99 ,35.00 ,35.01 ,12.00 ,32.50 ,68.34 ,52.99 ,53.00 ,37.66 ,29.99 ,30.00 ,55.60 ,30.01 ,7.00 ,63.32 ,27.50 ,63.34 ,47.99 ,48.00 ,24.99 ,25.00 ,45.50 ,48.07 ,65.99 ,2.00 ,22.49 ,22.50 ,22.51 ,42.99 ,43.00 ,50.70 ,19.99 ,20.00 ,40.50 ,60.99 ,53.33 ,17.50 ,53.34 ,37.99 ,38.00 ,58.50 ,14.99 ,15.00 ,55.99 ,56.00 ,120.00 ,56.01 ,33.00 ,9.99 ,10.00 ,115.00 ,43.33 ,43.34 ,28.00 ,5.00 ,56.20 ,61.33 ,45.99 ,46.00 ,110.00 ,38.34 ),
      LAST_CYCLE_IARPU DECIMAL(20,2) COMPRESS (0.00 ,64.00 ,0.01 ,105.00 ,33.33 ,18.00 ,56.40 ,66.65 ,38.50 ,66.66 ,66.67 ,66.68 ,35.99 ,36.00 ,61.60 ,100.00 ,0.20 ,13.00 ,54.00 ,0.25 ,95.00 ,72.00 ,56.66 ,0.35 ,56.67 ,56.68 ,0.37 ,89.99 ,0.40 ,26.00 ,90.00 ,0.44 ,0.45 ,44.00 ,0.50 ,84.99 ,85.00 ,13.33 ,0.55 ,61.99 ,23.60 ,62.00 ,46.66 ,0.60 ,39.00 ,79.99 ,16.00 ,80.00 ,0.65 ,56.99 ,57.00 ,57.01 ,0.70 ,49.35 ,34.00 ,0.75 ,74.99 ,75.00 ,0.80 ,52.00 ,36.66 ,0.85 ,69.99 ,70.00 ,0.90 ,67.50 ,0.95 ,24.00 ,64.98 ,64.99 ,1.00 ,65.00 ,62.49 ,26.66 ,62.50 ,26.67 ,59.98 ,59.99 ,60.00 ,60.01 ,37.00 ,57.50 ,21.67 ,62.66 ,54.99 ,62.67 ,55.00 ,32.00 ,57.60 ,52.50 ,16.67 ,26.95 ,49.99 ,50.00 ,50.01 ,27.00 ,47.50 ,68.00 ,44.99 ,45.00 ,65.49 ,22.00 ,42.50 ,62.99 ,63.00 ,39.99 ,40.00 ,40.01 ,73.32 ,73.33 ,37.50 ,19.60 ,58.00 ,27.29 ,27.30 ,34.99 ,35.00 ,35.01 ,12.00 ,32.50 ,68.34 ,29.99 ,30.00 ,55.60 ,30.01 ,7.00 ,63.32 ,27.50 ,63.34 ,47.99 ,24.99 ,25.00 ,48.07 ,2.00 ,22.49 ,22.50 ,22.51 ,42.99 ,50.70 ,19.99 ,20.00 ,40.50 ,60.99 ,53.33 ,17.50 ,53.34 ,37.99 ,38.00 ,58.50 ,14.99 ,15.00 ,55.99 ,56.00 ,120.00 ,56.01 ,9.99 ,10.00 ,61.24 ,61.26 ,28.00 ,5.00 ,56.20 ,61.33 ,45.99 ,46.00 ,110.00 ),
      LINE_AVG_3MTH_ARPU DECIMAL(18,2) COMPRESS 0.00 ,
      LINE_AVG_3MTH_IARPU DECIMAL(18,2) COMPRESS 0.00 ,
      LINE_AVG_3MTH_DOMESTIC_VOICE_OVRG DECIMAL(18,2) COMPRESS 0.00 ,
      LINE_MAX_3MTH_DOMESTIC_VOICE_OVRG DECIMAL(15,2) COMPRESS 0.00 ,
      LINE_AVG_3MTH_INTL_VOICE_OVRG DECIMAL(18,2) COMPRESS 0.00 ,
      LINE_AVG_3MTH_MSG_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.07 ),
      LINE_AVG_3MTH_DOMESTIC_DATA_OVRG DECIMAL(18,2) COMPRESS (0.00 ,5.00 ),
      LINE_MAX_3MTH_DOMESTIC_DATA_OVRG DECIMAL(18,2) COMPRESS (0.00 ,15.00 ),
      LINE_AVG_3MTH_INTL_DATA_OVRG DECIMAL(18,2) COMPRESS 0.00 ,
      LINE_AVG_3MTH_VOICE_USG INTEGER COMPRESS (0 ,1 ),
      LINE_MAX_3MTH_VOICE_USG INTEGER COMPRESS (0 ,2 ),
      LINE_AVG_3MTH_MSG_USG INTEGER COMPRESS (0 ,1 ),
      LINE_AVG_3MTH_DOMESTIC_DATA_USG BIGINT COMPRESS (0 ,1 ),
      LINE_MAX_3MTH_DOMESTIC_DATA_USG BIGINT COMPRESS (0 ,1 ),
      LINE_AVG_3MTH_INTL_DATA_USG BIGINT COMPRESS 0 ,
      LINE_MAX_3MTH_INTL_DATA_USG BIGINT COMPRESS 0 ,
      LINE_AVG_6MTH_ARPU DECIMAL(18,2) COMPRESS 0.00 ,
      LINE_AVG_6MTH_IARPU DECIMAL(18,2) COMPRESS 0.00 ,
      LINE_AVG_6MTH_DOMESTIC_VOICE_OVRG DECIMAL(18,2) COMPRESS 0.00 ,
      LINE_AVG_6MTH_INTL_VOICE_OVRG DECIMAL(18,2) COMPRESS 0.00 ,
      LINE_AVG_6MTH_MSG_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.01 ),
      LINE_AVG_6MTH_DOMESTIC_DATA_OVRG DECIMAL(18,2) COMPRESS (0.00 ,2.50 ),
      LINE_AVG_6MTH_INTL_DATA_OVRG DECIMAL(18,2) COMPRESS 0.00 ,
      LINE_AVG_6MTH_VOICE_USG INTEGER COMPRESS (0 ,1 ),
      LINE_AVG_6MTH_MSG_USG INTEGER COMPRESS (0 ,1 ),
      LINE_AVG_6MTH_DOMESTIC_DATA_USG DECIMAL(18,0) COMPRESS (0. ,1. ),
      LINE_AVG_6MTH_INTL_DATA_USG BIGINT COMPRESS 0 ,
      NUM_CYCLES_INTL_VOICE_OVG INTEGER COMPRESS (0 ,1 ),
      NUM_CYCLES_DOMESTIC_DATA_OVG INTEGER COMPRESS (0 ,1 ),
      NUM_CYCLES_INTL_DATA_OVG INTEGER COMPRESS (0 ,1 ),
      LAST_CYCLE_ARPA DECIMAL(20,2) COMPRESS (0.00 ,128.00 ,105.00 ,210.00 ,123.00 ,100.00 ,141.00 ,205.00 ,118.00 ,95.00 ,1440706.87 ,136.00 ,200.00 ,113.00 ,89.99 ,90.00 ,131.00 ,195.00 ,108.00 ,85.00 ,126.00 ,190.00 ,79.99 ,80.00 ,144.00 ,991995.52 ,1480561.29 ,121.00 ,185.00 ,1338532.53 ,98.00 ,75.00 ,116.00 ,180.00 ,1303017.78 ,69.99 ,70.00 ,134.00 ,111.00 ,175.00 ,280.00 ,1394921.95 ,65.00 ,170.00 ,1176313.36 ,275.00 ,59.98 ,59.99 ,60.00 ,124.00 ,188.00 ,101.00 ,165.00 ,270.00 ,55.00 ,119.00 ,139.50 ,1025506.54 ,96.00 ,160.00 ,1105818.92 ,265.00 ,1482545.99 ,50.00 ,114.00 ,178.00 ,91.00 ,155.00 ,260.00 ,45.00 ,150.00 ,255.00 ,39.99 ,40.00 ,142.40 ,168.00 ,145.00 ,250.00 ,35.00 ,137.40 ,163.00 ,140.00 ,245.00 ,29.99 ,30.00 ,158.00 ,135.00 ,1165055.32 ,240.00 ,25.00 ,153.00 ,130.00 ,1123867.61 ,235.00 ,19.99 ,20.00 ,122.40 ,148.00 ,1103559.21 ,125.00 ,230.00 ,122.50 ,143.00 ,120.00 ,184.00 ,1332763.87 ,225.00 ,138.00 ,1156784.41 ,115.00 ,220.00 ,133.00 ,1195847.56 ,1371548.05 ,110.00 ,1229432.24 ,151.00 ,215.00 ),
      LAST_CYCLE_IARPA DECIMAL(20,2) COMPRESS (0.00 ,128.00 ,105.00 ,210.00 ,100.00 ,205.00 ,95.00 ,1440706.87 ,136.00 ,200.00 ,89.99 ,90.00 ,131.00 ,195.00 ,85.00 ,190.00 ,79.99 ,80.00 ,991995.52 ,1480561.29 ,185.00 ,1338532.53 ,75.00 ,180.00 ,1303017.78 ,69.99 ,70.00 ,175.00 ,1394921.95 ,65.00 ,170.00 ,1176313.36 ,59.98 ,59.99 ,60.00 ,165.00 ,55.00 ,1025506.54 ,160.00 ,1105818.92 ,1482545.99 ,50.00 ,155.00 ,260.00 ,45.00 ,150.00 ,39.99 ,40.00 ,145.00 ,250.00 ,35.00 ,140.00 ,245.00 ,29.99 ,30.00 ,135.00 ,1165055.32 ,240.00 ,25.00 ,130.00 ,1123867.61 ,235.00 ,19.99 ,20.00 ,148.00 ,1103559.21 ,125.00 ,230.00 ,122.50 ,120.00 ,1332763.87 ,225.00 ,1156784.41 ,115.00 ,220.00 ,1195847.56 ,1371548.05 ,110.00 ,1229432.24 ,215.00 ),
      ACCT_AVG_3MTH_ARPA DECIMAL(18,2) COMPRESS (0.00 ,128.00 ,105.00 ,210.00 ,1190266.97 ,66.67 ,1277209.74 ,100.00 ,205.00 ,133.33 ,61.67 ,95.00 ,136.00 ,200.00 ,161.67 ,90.00 ,131.00 ,195.00 ,123.33 ,1279132.62 ,85.00 ,1248092.71 ,190.00 ,79.99 ,151.67 ,80.00 ,185.00 ,113.33 ,75.00 ,1467938.05 ,1096036.62 ,180.00 ,1148309.30 ,986397.02 ,141.67 ,70.00 ,1439391.60 ,175.00 ,103.33 ,1111081.91 ,65.00 ,931001.33 ,170.00 ,1366411.29 ,131.67 ,60.00 ,1130827.38 ,165.00 ,126.67 ,55.00 ,1402392.29 ,160.00 ,121.67 ,50.00 ,155.00 ,1058095.49 ,45.00 ,150.00 ,39.99 ,111.67 ,40.00 ,145.00 ,35.00 ,140.00 ,29.99 ,101.67 ,1335776.57 ,1254604.11 ,135.00 ,63.33 ,1128823.65 ,240.00 ,25.00 ,130.00 ,19.99 ,91.67 ,20.00 ,148.00 ,125.00 ,230.00 ,120.00 ,225.00 ,153.33 ,115.00 ,220.00 ,110.00 ,215.00 ,143.33 ),
      ACCT_AVG_3MTH_IARPA DECIMAL(18,2) COMPRESS (0.00 ,105.00 ,210.00 ,1190266.97 ,1277209.74 ,100.00 ,61.67 ,95.00 ,200.00 ,90.00 ,1279132.62 ,85.00 ,1248092.71 ,190.00 ,79.99 ,80.00 ,75.00 ,1467938.05 ,1096036.62 ,180.00 ,1148309.30 ,986397.02 ,70.00 ,1439391.60 ,175.00 ,1111081.91 ,65.00 ,931001.33 ,170.00 ,1366411.29 ,60.00 ,1130827.38 ,165.00 ,55.00 ,1402392.29 ,160.00 ,50.00 ,155.00 ,1058095.49 ,45.00 ,150.00 ,39.99 ,40.00 ,145.00 ,35.00 ,140.00 ,29.99 ,1335776.57 ,1254604.11 ,135.00 ,63.33 ,1128823.65 ,240.00 ,25.00 ,130.00 ,19.99 ,20.00 ,125.00 ,120.00 ,115.00 ,220.00 ,110.00 ),
      ACCT_AVG_3MTH_DOMESTIC_VOICE_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.08 ),
      ACCT_MAX_3MTH_DOMESTIC_VOICE_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.25 ),
      ACCT_AVG_3MTH_INTL_VOICE_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.60 ),
      ACCT_AVG_3MTH_MSG_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.01 ,0.02 ,0.03 ,0.05 ,0.07 ,0.08 ,0.10 ,0.12 ,0.13 ,0.15 ,0.17 ,0.18 ,0.20 ,0.22 ,0.23 ,8847.60 ,0.25 ,0.27 ,22423.32 ,8025.90 ,8691.52 ,0.33 ,0.35 ,0.37 ,0.40 ,0.42 ,0.47 ,23217.15 ,0.53 ,0.60 ,0.67 ,0.73 ,0.80 ,8981.30 ,0.87 ,3.47 ,10000.28 ,0.93 ,1.00 ,20867.57 ,20875.28 ,1.07 ,8661.55 ,1.13 ,1.20 ,8905.27 ,21444.20 ,1.93 ,6675.88 ,2.00 ,8368.32 ,7390.45 ,21926.17 ,8299.35 ,15549.30 ),
      ACCT_AVG_3MTH_DOMESTIC_DATA_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.17 ,23.33 ,0.34 ,13.33 ,80.00 ,0.66 ,0.67 ,0.68 ,75.00 ,3.33 ,70.00 ,65.00 ,60.00 ,55.00 ,16.67 ,1.33 ,50.00 ,91.04 ,45.00 ,6.67 ,40.00 ,35.00 ,30.00 ,25.00 ,20.00 ,15.00 ,2.22 ,10.00 ,5.00 ),
      ACCT_MAX_3MTH_DOMESTIC_DATA_OVRG DECIMAL(18,2) COMPRESS (0.00 ,105.00 ,210.00 ,0.10 ,90.00 ,195.00 ,0.51 ,75.00 ,180.00 ,70.00 ,1.02 ,60.00 ,165.00 ,50.00 ,3.98 ,45.00 ,1540.07 ,150.00 ,1.53 ,6.67 ,40.00 ,273.11 ,30.00 ,135.00 ,1.99 ,2.00 ,20.00 ,15.00 ,120.00 ,10.00 ),
      ACCT_AVG_3MTH_INTL_DATA_OVRG DECIMAL(18,2) COMPRESS (0.00 ,8.33 ),
      ACCT_AVG_3MTH_VOICE_USG INTEGER COMPRESS (0 ,1 ),
      ACCT_MAX_3MTH_VOICE_USG INTEGER COMPRESS (0 ,1 ),
      ACCT_AVG_3MTH_MSG_USG INTEGER COMPRESS (0 ,1 ),
      ACCT_AVG_3MTH_DOMESTIC_DATA_USG BIGINT COMPRESS (0 ,255493795 ),
      ACCT_MAX_3MTH_DOMESTIC_DATA_USG BIGINT COMPRESS (0 ,195475141 ),
      ACCT_AVG_3MTH_INTL_DATA_USG BIGINT COMPRESS (0 ,1 ),
      ACCT_MAX_3MTH_INTL_DATA_USG BIGINT COMPRESS (0 ,1456 ),
      ACCT_AVG_6MTH_ARPA DECIMAL(18,2) COMPRESS 0.00 ,
      ACCT_AVG_6MTH_IARPA DECIMAL(18,2) COMPRESS 0.00 ,
      ACCT_AVG_6MTH_DOMESTIC_VOICE_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.04 ),
      ACCT_AVG_6MTH_INTL_VOICE_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.30 ),
      ACCT_AVG_6MTH_MSG_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.01 ,0.02 ,0.03 ,0.04 ,8573.48 ,0.05 ,0.06 ,0.07 ,0.08 ,0.09 ,0.10 ,0.11 ,0.12 ,0.13 ,0.14 ,0.15 ,0.17 ,0.18 ,0.19 ,0.20 ,0.21 ,0.22 ,0.23 ,0.25 ,0.27 ,0.28 ,0.29 ,0.30 ,0.32 ,0.33 ,0.37 ,0.38 ,22820.23 ,0.40 ,0.42 ,0.43 ,0.47 ,0.48 ,0.50 ,0.57 ,0.58 ,0.60 ,0.67 ,8343.72 ,18496.75 ,0.83 ,11469.88 ,1.43 ,8720.83 ,13771.72 ,8769.56 ,8390.68 ,16211.80 ,9013.09 ,8636.79 ,8273.29 ,21685.18 ,7487.62 ,8821.42 ,7879.38 ,20871.42 ),
      ACCT_AVG_6MTH_DOMESTIC_DATA_OVRG DECIMAL(18,2) COMPRESS (0.00 ,0.05 ,0.08 ,0.21 ,0.33 ,0.34 ,18.33 ,0.51 ,13.33 ,8.33 ,0.66 ,0.67 ,0.68 ,75.00 ,3.33 ,70.00 ,67.50 ,1.00 ,65.00 ,62.50 ,1.11 ,60.00 ,57.50 ,21.67 ,55.00 ,257.27 ,52.50 ,16.67 ,1.33 ,50.00 ,47.50 ,11.67 ,45.00 ,42.50 ,6.67 ,40.00 ,4.17 ,37.50 ,1.67 ,35.00 ,32.50 ,30.00 ,27.50 ,25.00 ,45.52 ,22.50 ,20.00 ,45.60 ,17.50 ,15.00 ,12.50 ,10.00 ,7.50 ,5.00 ,2.50 ),
      ACCT_AVG_6MTH_INTL_DATA_OVRG DECIMAL(18,2) COMPRESS (0.00 ,4.17 ),
      ACCT_AVG_6MTH_VOICE_USG INTEGER COMPRESS (0 ,1 ),
      ACCT_AVG_6MTH_MSG_USG INTEGER COMPRESS (0 ,1 ),
      ACCT_AVG_6MTH_DOMESTIC_DATA_USG BIGINT COMPRESS (0 ,236746748 ),
      ACCT_AVG_6MTH_INTL_DATA_USG BIGINT COMPRESS (0 ,1 ),
      ACCT_NUM_CYCLES_INTL_VOICE_OVG INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,6 ),
      ACCT_NUM_CYCLES_DOMESTIC_DATA_OVG INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,6 ),
      ACCT_NUM_CYCLES_INTL_DATA_OVG INTEGER COMPRESS (0 ,1 ,2 ,3 ,5 ,6 ),
      AAL_V INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      MBB_AAL INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      AAL_TBL INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      HUM INTEGER COMPRESS ,
      INFLUENCER INTEGER COMPRESS ,
      ATTPO INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      SPRINT INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      TMOBIL INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      IN_MKT INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      HIGHEST_IN_MKT_SCORE_ON_ACCT INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      IN_TBL_MKT INTEGER COMPRESS ,
      IN_0USG INTEGER COMPRESS ,
      IN_DATA INTEGER COMPRESS ,
      IN_ACCT INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      ASTER_C INTEGER COMPRESS 100 ,
      B2B_ALL_C INTEGER COMPRESS ,
      LTV_IN_L INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      MG6M_L INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      MP6M_L INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      LINE_MARGIN DECIMAL(20,2) COMPRESS ,
      LTV_IN_A INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      MG6M_A INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      MP6M_A INTEGER COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,66 ,67 ,68 ,69 ,70 ,71 ,72 ,73 ,74 ,75 ,76 ,77 ,78 ,79 ,80 ,81 ,82 ,83 ,84 ,85 ,86 ,87 ,88 ,89 ,90 ,91 ,92 ,93 ,94 ,95 ,96 ,97 ,98 ,99 ,100 ),
      ACCT_MARGIN INTEGER COMPRESS ,
      MG6M_E INTEGER COMPRESS (1 ,100 ),
      MP6M_E INTEGER COMPRESS ,
      HSHLD_MARGIN DECIMAL(20,2) COMPRESS ,
      DISC_TRANS_DT DATE FORMAT 'YY/MM/DD' COMPRESS ,
      DISC_ACTIVITY_DT DATE FORMAT 'YY/MM/DD' COMPRESS ,
      DISC_REAS_CD VARCHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ,
      DISC_PORT_CARRIER_NM VARCHAR(150) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('AT&T','Sprint/Nextel'),
      DISC_REP_DEPT VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Generic/System ID','Prepay'),
      JOIN_DT DATE FORMAT 'YY/MM/DD' COMPRESS (DATE '2016-12-22',DATE '2015-07-31',DATE '2015-02-28',DATE '2016-07-31',DATE '2016-02-29',DATE '2015-10-31',DATE '2015-05-31',DATE '2016-10-31',DATE '2016-05-31',DATE '2015-08-31',DATE '2015-03-31',DATE '2016-08-31',DATE '2016-03-31',DATE '2015-11-30',DATE '2015-06-30',DATE '2016-11-30',DATE '2015-01-31',DATE '2016-06-30',DATE '2016-01-31',DATE '2015-09-30',DATE '2015-04-30',DATE '2016-09-30',DATE '2016-04-30',DATE '2014-12-31',DATE '2015-12-31'),
      INSERT_DT DATE FORMAT 'YYYY/MM/DD' COMPRESS (DATE '2016-12-21',DATE '2016-10-01',DATE '2016-10-16',DATE '2016-10-29',DATE '2016-11-30',DATE '2016-09-01'),
      DOWNLOADED_POP_DATA_LAST_MTH CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC DEFAULT 'N' COMPRESS ('N','Y'),
      LINE_GENDER VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('F','M'),
      LINE_AGE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('10_17','18_34','35_50','51_64','65+'),
      LAST_CYCLE_DOMESTIC_DATA_USG BIGINT COMPRESS (0 ,1 ),
      LAST_CYCLE_DOMESTIC_DATA_OVRG BIGINT COMPRESS (0 ,15 ),
      CHANNEL_PREF_ACCT VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CARE','CARE, MOBILE FIRST','CARE, STORE','CARE, STORE, MOBILE FIRST','CARE, STORE, WEB','CARE, STORE, WEB, MOBILE FIRST','CARE, WEB','CARE, WEB, MOBILE FIRST','MOBILE FIRST','NO EVENT','STORE','STORE, MOBILE FIRST','STORE, WEB','STORE, WEB, MOBILE FIRST','WEB','WEB, MOBILE FIRST'),
      CHANNEL_PREF_LINE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CARE','CARE, MOBILE FIRST','CARE, STORE','CARE, STORE, MOBILE FIRST','CARE, STORE, WEB','CARE, STORE, WEB, MOBILE FIRST','CARE, WEB','CARE, WEB, MOBILE FIRST','MOBILE FIRST','NO EVENT','STORE','STORE, MOBILE FIRST','STORE, WEB','STORE, WEB, MOBILE FIRST','WEB','WEB, MOBILE FIRST'),
      HSHLD_TYPE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Millennials w/Kids','Senior Only','Middle AGE HH w/Seniors AND Kids or Millennials','Senior w/Kids or Millennials','Middle AGE HH','Millennials Only','Senior AND Middle AGE','Middle AGE HH w/Kids or Millennials'),
      PPLAN_CHANGES_LAST_6_MONTHS INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      PPLAN_CHANGES_LAST_12_MONTHS INTEGER COMPRESS (0 ,1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      TRADE_IN_VALUE DECIMAL(18,2) COMPRESS 0.00 ,
      PRICE_PLAN_ACCESS_AMT DECIMAL(20,2) COMPRESS (0.00 ,100.00 ,90.00 ,85.00 ,80.00 ,70.00 ,60.00 ,55.00 ,45.00 ,35.00 ,30.00 ,25.00 ,20.00 ,120.00 ,10.00 ,5.00 ,110.00 ),
      LAST_LOGIN_DOMAIN VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('comcast.net','rr.com','sbcglobal.net','verizon.net','charter.com','cox.net','qwest.net','comcastbusiness.net','optonline.net','t-mobile.com','bhn.net','mycingular.net','embarqhsd.net','windstream.net','suddenlink.net','mchsi.com','nortelnetworks.com','spcsdns.net','wayport.net','sprint.com','frontiernet.net','bellsouth.net','cableone.net','twtelecom.net','att.com','centurytel.net','wideopenwest.com','direcway.com','level3.net','verizonbusiness.com','att.net','fuse.net','asurion.com','sprint.net','ptd.net','bresnan.net','zoominternet.net','midco.net','prcnet.com','rcn.com','direcpc.com','cisco.com','knology.net','tds.net','xspedius.net','tmodns.net','atlanticbb.net','telekenex.com','cogentco.com','wildblue.net'),
      EVG_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('E','G','N','V','Y'),
      MGD_SEGMT VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('CC Ent 1 (1000-9999)','CC Ent 2 (10k up)','CC Federal','CC Med 1 (50-99)','CC Med 2 (100-499)','CC Med 3 (500-999)','CC Sml 1 (1-4)','CC Sml 2 (5-49)','CC Sml 2 (5-9)','CC Sml 3 (10-24)','CC Sml 4 (25-49)','CC State Local','CC Undetermined','CC VzW Corp','CN B2B Ent 1 (1000-9999)','CN B2B Ent 2 (10k up)','CN B2B Med 1 (50-99)','CN B2B Med 2 (100-499)','CN B2B Med 3 (500-999)','CN B2B Sml 1 (1-4)','CN B2B Sml 2 (5-9)','CN B2B Sml 3 (10-24)','CN B2B Sml 4 (25-49)','CN B2B Undetermined','CN CO Med 1 (50-99)','CN CO Med 2 (100-499)','CN CO Med 3 (500-999)','CN CO Sml 1 (1-4)','CN CO Sml 2 (5-9)','CN CO Sml 3 (10-24)','CN CO Sml 4 (25-49)','CN CO Undetermined','CN Federal','CN Sml 2 (5-49)','CN State Local','CN VZW Corp','CO Consumer','EC Ent 1 (1000-9999)','EC Ent 2 (10k up)','EC Federal','EC Med 1 (50-99)','EC Med 2 (100-499)','EC Med 3 (500-999) ','EC Med 3 (500-999)','EC Sml 1 (1-4)','EC Sml 2 (5-49)','EC Sml 2 (5-9)','EC Sml 3 (10-24)','EC Sml 4 (25-49)','EC State Local','EC Undetermined','EC VZW Emp','UNTG'),
      LAST_DT_CUST_DESKTOP_LOGIN DATE FORMAT 'YY/MM/DD',
      LAST_DT_CUST_MV_APP_LOGIN DATE FORMAT 'YY/MM/DD',
      LAST_DT_ACCT_HAD_COMPASS_SESSION DATE FORMAT 'YY/MM/DD',
      LAST_DT_ACCT_HAD_MYOFFER_SESSION DATE FORMAT 'YY/MM/DD',
      VZUP_ENROLLED CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      EVER_REDEEMED_VZUP_PTS CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('N','Y'),
      MTHLY_REV_INFLOW DECIMAL(20,2) COMPRESS 0.00 ,
      MTHLY_REV_BASE DECIMAL(20,2) COMPRESS 0.00 ,
      MTHLY_REV_RETENTION DECIMAL(20,2) COMPRESS 0.00 ,
      MTHLY_REV_OUTFLOW DECIMAL(20,2) COMPRESS 0.00 ,
      VZ2_AREA_CD VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('EA','HQ','SO','WE'),
      VZ2_AREA_DESC VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('East','Headquarters','South','West'))
PRIMARY INDEX ( CUST_ID ,CUST_LINE_SEQ_ID )
PARTITION BY ( RANGE_N(BASE_MTH  BETWEEN DATE '2016-01-01' AND DATE '2025-12-31' EACH INTERVAL '1' MONTH ,
 NO RANGE OR UNKNOWN),RANGE_N(RPT_MTH  BETWEEN DATE '2016-05-01' AND DATE '2025-12-31' EACH INTERVAL '1' MONTH ,
 NO RANGE OR UNKNOWN) );


