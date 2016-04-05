////LEMAS 20013 dataset cleaning and standaridization

clear
set more off
use "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\1. Data\LEMAS Surveys\LEMAS 2013\ICPSR_36164\DS0001\36164-0001-Data.dta", clear

keep ORI7 ORI9 AGENCYID BJS_AGENCYNAME CITY STATECODE ZIPCODE POP2012 FTSWORN ///
FTCIV PTSWORN PTCIV PERS_PDSW_MFT PERS_PDSW_MPT PERS_PDSW_FFT PERS_PDSW_FPT ///
PERS_FTS_WHT PERS_FTS_BLK PERS_FTS_HSP PERS_FTS_IND PERS_FTS_ASN PERS_FTS_TWO PERS_FTS_UNK ///
PERS_UPSW PAY_SAL_OFCR_M* PAY_INCT_EDU PAY_INCT_VOC PAY_INCT_LANG PAY_INCT_MRT ///
HIR_EDU* HIR_BD_VAR HIR_SEP_NMED HIR_SEP_VOL HIR_SEP_DIS HIR_SEP_TTL BDGT_TTL ///
COM_TRN_REC COM_TRN_INSRV COM_MIS COM_SARA COM_NSARA COM_COL COM_PTNR COM_BT COM_NBT COM_SURV ///
TECH_TYP_VVEH TECH_TYP_VPAT TECH_TYP_VWPN TECH_TYP_VOTHR TECH_CRS TECH_CREC_INC TECH_CREC_SUM ///
TECH_REC_NAR TECH_REC_CODE TECH_REC_VIC TECH_REC_SUS TECH_REC_LOC TECH_REC_DATE ///
TECH_WEB_JUR VEH_WPUR VEH_DOC VEH_NPUR VEH_REST_NO SAFE_AUTH_HGN SAFE_AUTH_RFL SAFE_AUTH_SGN ///
SAFE_AUTH_SOFT SAFE_AUTH_SPRAY SAFE_AUTH_TASR SAFE_AUTH_NECK SAFE_AUTH_TKDWN SAFE_AUTH_OHAND ///
SAFE_AUTH_CHAND SAFE_AUTH_LEG SAFE_DOC_DISF SAFE_DOC_DCHF SAFE_DOC_SPRAY SAFE_DOC_DIST SAFE_DOC_DCHT ///
SAFE_FINC NO_RECORD_FORCE SAFE_FTTL SAFE_FTTL_EST SAFE_FTTL_UNK BASEWT NRADJUST FINALWT ///
SAFE_AUTH_IMP SAFE_AUTH_SOFT SAFE_AUTH_SPRAY SAFE_AUTH_CHEM SAFE_AUTH_TASR SAFE_AUTH_NECK

replace BJS_AGENCYNAME= subinstr(BJS_AGENCYNAME, "DEPT", "DEPARTMENT", .)
replace BJS_AGENCYNAME= subinstr(BJS_AGENCYNAME, "Dept", "Department", .)
replace BJS_AGENCYNAME= subinstr(BJS_AGENCYNAME, "OFFICE", "DEPARTMENT", .)
replace BJS_AGENCYNAME= subinstr(BJS_AGENCYNAME, "METRO ", "METROPOLITAN ", .)
replace BJS_AGENCYNAME= subinstr(BJS_AGENCYNAME, "SHERIFF ", "SHERIFF'S ", .)
replace BJS_AGENCYNAME= subinstr(BJS_AGENCYNAME, "SHERIFFS ", "SHERIFF'S ", .)
replace BJS_AGENCYNAME= subinstr(BJS_AGENCYNAME, "PORTLAND POLICE BUREAU", "PORTLAND POLICE DEPARTMENT", .) //name changed to bureau between 03 and 07
replace BJS_AGENCYNAME= subinstr(BJS_AGENCYNAME, "BALTIMORE POLICE DEPARTMENT", "BALTIMORE CITY POLICE DEPARTMENT", .)

rename BJS_AGENCYNAME agency
rename STATECODE state
rename CITY city
rename ZIPCODE zip
rename POP2012 pop12
rename FTSWORN ftsworn12
rename BDGT_TTL bdgt12
rename PAY_SAL_OFCR_MIN minsal12
rename PAY_SAL_OFCR_MAX maxsal12
rename PERS_PDSW_MFT male12
rename PERS_PDSW_FFT female12
egen all_swrn = rowtotal(male12 female12)
gen perc_male12 = male12/all_swrn	// generating a var for percent of FT sworn officers who are male

egen knownrace = rowtotal(PERS_FTS_WHT PERS_FTS_BLK PERS_FTS_HSP PERS_FTS_IND PERS_FTS_ASN PERS_FTS_TWO), missing
gen perc_non_white12 = 1-(PERS_FTS_WHT/all_swrn)	// generating a var for percent of FT sworn officers who are not white
replace perc_non_white12=. if knownrace==0 & PERS_FTS_UNK!=0
drop knownrace PERS_FTS_UNK

rename PERS_FTS_WHT ftswrn12_white 
rename PERS_FTS_BLK ftswrn12_black 
rename PERS_FTS_HSP ftswrn12_hisp 
rename PERS_FTS_IND ftswrn12_amerind 
rename PERS_FTS_ASN ftswrn12_asian 
rename PERS_FTS_TWO ftswrn12_other 


gen min_edu12=.
replace min_edu=0 if HIR_EDU_NO==1	//0 if there are no min education requirements
replace min_edu=1 if HIR_EDU_HS==1	//1 if agency's min education requirement is HS
replace min_edu=2 if HIR_EDU_AD==1	//2 if agency's min education requirement is AD
replace min_edu=3 if HIR_EDU_BD==1	//3 if agency's min education requirement is BD
replace min_edu=4 if HIR_EDU_OTH==1	//4 if agency's min education requirement is Other
label define min_edu 0 "No Min Edu Requirements" 1 "Min Edu Requirement is HS" 2 "Min Edu Requirement is AD" 3 "Min Edu Requirement is BD" 4 "Min Edu Requirement is Other"
drop HIR_EDU*

gen cp_mission12=COM_MIS
replace cp_mission12=0 if COM_MIS==1 | COM_MIS==2	
replace cp_mission12=1 if COM_MIS==3
drop COM_MIS

gen cp_trn_rec12=.
replace cp_trn=0 if COM_TRN_REC==4 | COM_TRN_REC==-8
replace cp_trn=.25 if COM_TRN_REC==3
replace cp_trn=.75 if COM_TRN_REC==2
replace cp_trn=1 if COM_TRN_REC==1
drop COM_TRN_REC

gen cp_trn_insrv12=.
replace cp_trn_ins=0 if COM_TRN_INSRV==4 | COM_TRN_INSRV==-8
replace cp_trn_ins=.25 if COM_TRN_INSRV==3
replace cp_trn_ins=.75 if COM_TRN_INSRV==2
replace cp_trn_ins=1 if COM_TRN_INSRV==1
drop COM_TRN_INSRV

gen cp_sara12=. 
replace cp_sara=0 if COM_SARA==2
replace cp_sara=1 if COM_SARA==1
drop COM_SARA

gen cp_eval_crit12=.
replace cp_eval=0 if COM_COL==2
replace cp_eval=1 if COM_COL==1
drop COM_COL

gen cp_prob_solv_agrmnt12=.
replace cp_prob=0 if COM_PTNR==2
replace cp_prob=1 if COM_PTNR==1
drop COM_PTNR

gen cp_beats12=.
replace cp_beat=0 if COM_BT==2 
replace cp_beat=1 if COM_BT==1
drop COM_BT

//no cp variables for Num of cp offices or cp unit

gen cp_survey12=.
replace cp_surv=0 if COM_SURV==2 
replace cp_surv=1 if COM_SURV==1
drop COM_SURV

egen cp_8_tot12 = rowtotal(cp_mission cp_trn_rec cp_trn_insrv cp_sara cp_eval_crit cp_prob_solv_agrmnt ///
cp_beats cp_survey)

gen cp_8_perc12 = cp_8_tot/8


gen auth_LTLUOF_impact12=.
replace auth_LTLUOF_imp=0 if SAFE_AUTH_IMP==3
replace auth_LTLUOF_imp=1 if SAFE_AUTH_IMP==1 | SAFE_AUTH_IMP==2							 
drop SAFE_AUTH_IMP

gen auth_LTLUOF_softproj12=.
replace auth_LTLUOF_soft=0 if SAFE_AUTH_SOFT==3
replace auth_LTLUOF_soft=1 if SAFE_AUTH_SOFT==1 | SAFE_AUTH_SOFT==2
drop SAFE_AUTH_SOFT

gen auth_LTLUOF_ocpep12=.
replace auth_LTLUOF_ocpep=0 if SAFE_AUTH_SPRAY==0 & SAFE_AUTH_CHEM==0
replace auth_LTLUOF_ocpep=1 if SAFE_AUTH_SPRAY==1 | SAFE_AUTH_CHEM==1
drop SAFE_AUTH_SPRAY SAFE_AUTH_CHEM

gen auth_LTLUOF_taser12=.
replace auth_LTLUOF_taser=0 if SAFE_AUTH_TASR==3
replace auth_LTLUOF_taser=1 if SAFE_AUTH_TASR==1 | SAFE_AUTH_TASR==2
drop SAFE_AUTH_TASR

gen auth_LTLUOF_neckhold12=.
replace auth_LTLUOF_neck=0 if SAFE_AUTH_NECK==3
replace auth_LTLUOF_neck=1 if SAFE_AUTH_NECK==1 | SAFE_AUTH_NECK==2
drop SAFE_AUTH_NECK

egen auth_LTLUOF_tot12= rowtotal(auth*)

keep auth_* cp_* min_edu* agency state city zip pop* ftswrn* bdgt* minsal* maxsal* ///
male* female* perc_male* perc_non_white* BASEWT NRADJUST FINALWT

save "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\LEMAS13.dta"
export excel using "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\LEMAS13_Cleaned.xlsx", firstrow(variables) nolabel

