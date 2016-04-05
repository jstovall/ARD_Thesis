////LEMAS 2007 dataset cleaning and standaridization

clear
set more off
use "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\1. Data\LEMAS Surveys\LEMAS 2007\ICPSR_31161\DS0001\31161-0001-Data.dta", clear

keep AGENCY CITY STATE ZIPCODE SWNAUTHEMP SWNFTEMP SWNPTEMP TOTFTEMP TOTPTEMP ///
NUMRESPOFF NUMCPO OPBUDGET MINEDUC WHITE BLACK HISPANIC ASIAN NATHAW AMERIND ///
MULTRACE UNKRACE MALE FEMALE TOTGENDER SWNBILING EDUCPAY MERITPAY SKILLPAY ///
LANGPAY ENTRYMIN ENTRYMAX CPTRNNEW CPTRNINSERV CPMISSION CPSARA CPSARANUM CPACADEMY ///
CPPLAN CPGEO CPGEONUM CPPROBSOLV CPTECHUP CPPARTNER CPSURVEY CPUNIT CPNONE ADVGRP WEBSTATS ///
SOFTPROJ OCPEPPER CED NECKHOLD NUMCARCAM NUMMOBCAM INCREPFILES CMPLNTFILES USEFORCEFILES ///
DEADFORCPLCY LESSTHANPLCY MENTILLPLCY INCUSDTHPLCY NUMUOFTOT ORI CSLLEA04_ID ///
POPULATION FINALWT_PAGE1 IMPMARKED FINALWT_PAGE2ON TRADBATON PR24BATON COLLBATON ///
SOFTPROJ OCPEPPER CED NECKHOLD


replace AGENCY= subinstr(AGENCY, "DEPT", "DEPARTMENT", .)
replace AGENCY= subinstr(AGENCY, "OFFICE", "DEPARTMENT", .)
replace AGENCY= subinstr(AGENCY, "METRO ", "METROPOLITAN ", .)
replace AGENCY= subinstr(AGENCY, "SHERIFF ", "SHERIFF'S ", .)
replace AGENCY= subinstr(AGENCY, "SHERIFFS ", "SHERIFF'S ", .)
replace AGENCY= subinstr(AGENCY, "PORTLAND POLICE BUREAU", "PORTLAND POLICE DEPARTMENT", .) //name changed to bureau between 03 and 07
replace AGENCY= subinstr(AGENCY, "ARIZONA DEPARTMENT OF PUBLIC", "ARIZONA DEPARTMENT OF PUBLIC SAFETY", .)
replace AGENCY= subinstr(AGENCY, "BALTIMORE POLICE DEPARTMENT", "BALTIMORE CITY POLICE DEPARTMENT", .)
replace AGENCY= subinstr(AGENCY, "CLEVELAND DIVISION OF POLICE", "CLEVELAND POLICE DEPARTMENT", .)

rename AGENCY agency
rename CITY city
rename STATE state
rename ZIPCODE zip
rename POPULATION pop06
rename SWNFTEMP ftsworn06
rename OPBUDGET bdgt06
rename ENTRYMIN minsal06
rename ENTRYMAX maxsal06
rename MALE male06
rename FEMALE female06

egen all_swrn = rowtotal(male06 female06)
gen perc_male06 = male06/all_swrn	// generating a var for percent of FT sworn officers who are male

egen knownrace = rowtotal(WHITE BLACK HISP AMERIN ASIAN NATHAW MULTRA), missing
gen perc_non_white06 = 1-(WHITE/all_swrn)	// generating a var for percent of FT sworn officers who are not white
replace perc_non_white06=. if knownrace==0 & UNKRACE!=0
drop knownrace UNKRACE

rename WHITE ftswrn06_white 
rename BLACK ftswrn06_black 
rename HISPANIC ftswrn06_hisp 
rename AMERIND ftswrn06_amerind 
egen ftswrn06_asian = rowtotal(ASIAN NATHAW)
rename MULTRACE ftswrn06_other 
drop ASIAN NATHAW

gen min_edu06=.
replace min_edu=0 if MINEDUC==0	//0 if there are no min education requirements
replace min_edu=1 if MINEDUC==4	//1 if agency's min education requirement is HS
replace min_edu=2 if MINEDUC==2	//2 if agency's min education requirement is AD
replace min_edu=3 if MINEDUC==1	//3 if agency's min education requirement is BD
replace min_edu=4 if MINEDUC==3	//4 if agency's min education requirement is Other
label define min_edu 0 "No Min Edu Requirements" 1 "Min Edu Requirement is HS" 2 "Min Edu Requirement is AD" 3 "Min Edu Requirement is BD" 4 "Min Edu Requirement is Other"
drop MINEDUC

gen cp_mission06=.
replace cp_mission=0 if CPMISSION==0 | CPMISSION==9	
replace cp_mission=1 if CPMISSION==1
drop CPMISSION

gen cp_trn_rec06=.
replace cp_trn=0 if CPTRNNEW==0
replace cp_trn=.25 if CPTRNNEW==3
replace cp_trn=.75 if CPTRNNEW==2
replace cp_trn=1 if CPTRNNEW==1
drop CPTRNNEW

gen cp_trn_insrv06=.
replace cp_trn_ins=0 if CPTRNINSERV==0
replace cp_trn_ins=.25 if CPTRNINSERV==3
replace cp_trn_ins=.75 if CPTRNINSERV==2
replace cp_trn_ins=1 if CPTRNINSERV==1
drop CPTRNINSERV

gen cp_sara06=. 
replace cp_sara=0 if CPSARA==0 | CPSARA==9
replace cp_sara=1 if CPSARA==1
drop CPSARA

gen cp_eval_crit06=.
replace cp_eval=0 if CPPROBSOLV==0 | CPPROBSOLV==9
replace cp_eval=1 if CPPROBSOLV==1
drop CPPROBSOLV

gen cp_prob_solv_agrmnt06=.		//original var(ADVGRP) has lots of missing
replace cp_prob=0 if ADVGRP==0 | ADVGRP==9
replace cp_prob=1 if ADVGRP==1
drop ADVGRP

gen cp_beats06=.
replace cp_beat=0 if CPGEO==0 | CPGEO==9
replace cp_beat=1 if CPGEO==1
drop CPGEO

gen cp_officers_num06= NUMCPO/all_swrn if NUMCPO!=99999

gen cp_unit06=.
replace cp_unit=0 if CPUNIT==0 | CPUNIT==9
replace cp_unit=1 if CPUNIT==1
drop CPUNIT


gen cp_survey06=.
replace cp_surv=0 if CPSURVEY==0 | CPSURVEY==9
replace cp_surv=1 if CPSURVEY==1
drop CPSURVEY

egen cp_10_tot06 = rowtotal(cp_*)
egen cp_8_tot06 = rowtotal(cp_mission cp_trn_rec cp_trn_insrv cp_sara cp_eval_crit cp_prob_solv_agrmnt ///
cp_beats cp_survey)

gen cp_10_perc06 = cp_10_tot/10
gen cp_8_perc06 = cp_8_tot/8

gen auth_LTLUOF_impact06=.
replace auth_LTLUOF_imp=0 if TRADBAT==0 & PR24BAT==0 & COLLBAT==0
replace auth_LTLUOF_imp=1 if TRADBAT==1 | PR24BAT==1 | COLLBAT==1							 
drop TRADBAT PR24BAT COLLBAT

gen auth_LTLUOF_softproj06=.
replace auth_LTLUOF_soft=0 if SOFTPROJ==0
replace auth_LTLUOF_soft=1 if SOFTPROJ==1
drop SOFTPROJ

gen auth_LTLUOF_ocpep06=.
replace auth_LTLUOF_ocpep=0 if OCPEPPER==0
replace auth_LTLUOF_ocpep=1 if OCPEPPER==1
drop OCPEPPER

gen auth_LTLUOF_taser06=.
replace auth_LTLUOF_taser=0 if CED==0
replace auth_LTLUOF_taser=1 if CED==1
drop CED

gen auth_LTLUOF_neckhold06=.
replace auth_LTLUOF_neck=0 if NECKHOLD==0
replace auth_LTLUOF_neck=1 if NECKHOLD==1
drop NECKHOLD

egen auth_LTLUOF_tot06= rowtotal(auth*)

keep auth_* cp_* min_edu* agency state city zip pop* ftswrn* bdgt* minsal* maxsal* ///
male* female* perc_male* perc_non_white* FINALWT_PAGE1 FINALWT_PAGE2ON

save "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\LEMAS07.dta"
export excel using "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\LEMAS07_Cleaned.xlsx", firstrow(variables) nolabel
