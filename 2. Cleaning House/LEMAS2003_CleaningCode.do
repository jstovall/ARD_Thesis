////LEMAS 2003 dataset cleaning and standaridization

clear
set more off
use "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\1. Data\LEMAS Surveys\LEMAS 2003\ICPSR_04411\DS0001\DS0001.dta", clear

keep agencyid agencyna city state zip pop v41 v51 v52 v58 v59 v66 v69 v70 ///
v71 v72 v103 v104 v106 v109 v111 v112 v113 v114 v115 v116 v117 v118 v119 v120 ///
v121 v122 v123 v124 v125 v126 v129 v131 v133 v134 v141 v142 v159 v176 v194 v195 ///
v197 v198 v199 v200 v201 v210 v202 v203 v204 v206 v208 v218 v225 v236 v438 v439 ///
v443 v453 v455 v302 v303 v304 v305 v309 v313 v314 v315 v354 v356 v394 v433 weight

replace agencyna= subinstr(agencyna, "DEPT", "DEPARTMENT", .)
replace agencyna= subinstr(agencyna, "OFFICE", "DEPARTMENT", .)
replace agencyna= subinstr(agencyna, "METRO ", "METROPOLITAN ", .)
replace agencyna= subinstr(agencyna, "SHERIFF ", "SHERIFF'S ", .)
replace agencyna= subinstr(agencyna, "SHERIFFS ", "SHERIFF'S ", .)

rename agencyna agency
rename pop pop02
rename v41 ftsworn02
rename v66 bdgt02
rename v141 minsal02
rename v142 maxsal02

egen male02= rowtotal(v111 v113 v115 v117 v119 v121 v123)	// slightly different from v125 & v126
egen female02= rowtotal(v112 v114 v116 v118 v120 v122 v124)
egen white = rowtotal(v111-v112), missing
egen all_swrn = rowtotal(male02 female02)
gen perc_non_white02 = 1-(white/all_swrn)	// generating a var for percent of FT sworn officers who are not white
gen perc_male02 = male02/all_swrn	// generating a var for percent of FT sworn officers who are male
egen ftswrn02_white = rowtotal(v111 v112)
egen ftswrn02_black = rowtotal(v113 v114)
egen ftswrn02_hisp = rowtotal(v115 v116)
egen ftswrn02_amerind = rowtotal(v115 v116)
egen ftswrn02_asian = rowtotal(v119 v120 v121 v122)
egen ftswrn02_other = rowtotal(v123 v124)
drop white v111-v126

gen min_edu02=.
replace min_edu=0 if v69==5	//0 if there are no min education requirements
replace min_edu=1 if v69==4	//1 if agency's min education requirement is HS
replace min_edu=2 if v69==2	//2 if agency's min education requirement is AD
replace min_edu=3 if v69==1	//3 if agency's min education requirement is BD
replace min_edu=4 if v69==3	//4 if agency's min education requirement is Other
label define min_edu 0 "No Min Edu Requirements" 1 "Min Edu Requirement is HS" 2 "Min Edu Requirement is AD" 3 "Min Edu Requirement is BD" 4 "Min Edu Requirement is Other"
drop v69

gen cp_mission02=.
replace cp_mission=0 if v208==0 | v208==8 | v208==9	//I'm making the assumption that this is, in reality, a binary option and if the agency "doesn't know" it's more reasonably "no" than actually missing
replace cp_mission=1 if v208==1
drop v208

gen cp_trn_rec02=.
replace cp_trn=0 if v194==4 | v194==5
replace cp_trn=.25 if v194==3
replace cp_trn=.75 if v194==2
replace cp_trn=1 if v194==1
drop v194

gen cp_trn_insrv02=.
replace cp_trn_ins=0 if v195==4 | v195==5
replace cp_trn_ins=.25 if v195==3
replace cp_trn_ins=.75 if v195==2
replace cp_trn_ins=1 if v195==1
drop v195

gen cp_sara02=.
replace cp_sara=0 if v197==0 | v197==9
replace cp_sara=1 if v197==1
drop v197

gen cp_eval_crit02=.
replace cp_eval=0 if v203==0 | v203==9
replace cp_eval=1 if v203==1
drop v203

gen cp_prob_solv_agrmnt02=.
replace cp_prob=0 if v206==0 | v206==9
replace cp_prob=1 if v206==1
drop v206

gen cp_beats02=.
replace cp_beat=0 if v201==0 | v201==9
replace cp_beat=1 if v201==1
drop v201

gen cp_officers_num02= v59/all_swrn

gen cp_unit02=.
replace cp_unit=0 if v176==4 | v176==9
replace cp_unit=.25 if v176==3
replace cp_unit=.75 if v176==2
replace cp_unit=1 if v176==1
drop v176
						 
gen cp_survey02=.
replace cp_surv=0 if v236==1 | v236==8 | v236==9
replace cp_surv=1 if v236==0
drop v236

egen cp_10_tot02 = rowtotal(cp_*)
egen cp_8_tot02 = rowtotal(cp_mission cp_trn_rec cp_trn_insrv cp_sara cp_eval_crit cp_prob_solv_agrmnt ///
cp_beats cp_survey)

gen cp_10_perc02 = cp_10_tot/10
gen cp_8_perc02 = cp_8_tot/8
							 
gen auth_LTLUOF_impact02=.
replace auth_LTLUOF_imp=0 if v302==0 & v303==0 & v304==0
replace auth_LTLUOF_imp=1 if v302==1 | v303==1 | v304==1							 
drop v302 v303 v304

gen auth_LTLUOF_softproj02=.
replace auth_LTLUOF_soft=0 if v305==0
replace auth_LTLUOF_soft=1 if v305==1
drop v305

gen auth_LTLUOF_ocpep02=.
replace auth_LTLUOF_ocpep=0 if v309==0
replace auth_LTLUOF_ocpep=1 if v309==1
drop v309

gen auth_LTLUOF_taser02=.
replace auth_LTLUOF_taser=0 if v313==0 & v314==0
replace auth_LTLUOF_taser=1 if v313==1 | v314==1
drop v313 v314

gen auth_LTLUOF_neckhold02=.
replace auth_LTLUOF_neck=0 if v315==0
replace auth_LTLUOF_neck=1 if v315==1
drop v315

egen auth_LTLUOF_tot02= rowtotal(auth*)

keep auth_* cp_* min_edu* agency state city zip pop* ftswrn* bdgt* minsal* maxsal* ///
male* female* perc_male* perc_non_white* weight

save "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\LEMAS03.dta"
export excel using "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\LEMAS03_Cleaned.xlsx", firstrow(variables) nolabel
