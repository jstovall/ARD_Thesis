//FE victim data set cleaning and standaridization

clear
set more off
import delimited "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\1. Data\Original Victim Data Sets\FATAL ENCOUNTERS SPREADSHEET (Responses) - Form Responses.csv", case(preserve) 

drop UniqueID URLofimageofdeceased Officialdispositionofdeathj v22 DateDescription Uniqueidentifier Uniqueidentifiersubmittedby
drop if Abrief==""

duplicates list
duplicates drop

**Sex
encode Subjectsgender, gen(sex)
replace sex=. if strpos(Subjectsgend, "unknown")
recode sex 2=0
recode sex 3=2
label define sex 0 "Male" 1 "Female"  3 "Transgender", replace
drop Subjectsgender

**Age
replace Subjectsa ="0" if strpos(Subjectsa, "month")	//coding ages >1 as 0
destring Subjectsage, generate(age) ignore('s) force
drop Subjectsage

**Ethnicity
gen ethnicity=.
replace ethn = 1 if strpos(Subjectsra, "Latino") | strpos(Subjectsra, "Latina") | strpos(Subjectsra, "Hispanic") | strpos(Subjectsra, "BHispanic")
replace ethn = 0 if ethn!=1
label define ethnicity 0 "Not Hispanic" 1 "Hispanic"

**Race
encode Subjectsrace, gen(race)
replace race = 0 if strpos(Subjectsra, "White") | strpos(Subjectsra, "European") | strpos(Subjectsra, "HIspanic/Lat") | strpos(Subjectsra, "Hispanic/Lat")	//White
replace race = 1 if strpos(Subjectsra, "Black") | strpos(Subjectsra, "African")	//White
replace race = 2 if strpos(Subjectsra, "Asian")	| strpos(Subjectsra, "Pacific")	//Asian/PI
replace race = 3 if strpos(Subjectsra, "Native") | strpos(Subjectsra, "Alaskan")	//NA/Alaskan
replace race = 4 if strpos(Subjectsra, "Arab") | strpos(Subjectsra, "Middle")	//Middle Eastern
replace race = 5 if strpos(Subjectsra, "other") | strpos(Subjectsra, "Mixed")	//Other
replace race =. if strpos(Subjectsra, "unspecified") | strpos(Subjectsra, "nknown")	//Missing
label define race 0 "White" 1 "Black" 2 "Asian/PI" 3 "NA/Alaskan" 4 "Middle Eastern" 5 "Other", replace
drop Subjectsrace

**Substance Abuse
gen substance_abuse=.	
replace subst = 1 if strpos(Symptoms, "Alcohol") | strpos(Symptoms, "alcohol") | strpos(Symptoms, "Drug") | strpos(Symptoms, "drug") | strpos(Symptoms, "Substance") | strpos(Symptoms, "substance")
replace subst = 0 if substance!=1
label define subst 0 "No" 1 "Yes", replace	
	
**Signs of Mental Illness
gen signs_of_MI=0
replace signs = 1 if strpos(Symptoms, "Yes") | strpos(Symptoms, "yes") | strpos(Symptoms, "Suicidal") | strpos(Symptoms, "suicidal") | strpos(Symptoms, "Traumatic")
label define signs 0 "No" 1 "Yes", replace
drop Symptomsofmentalillness


**Use of Force

//gunshot
gen UOF_gunshot=0
replace UOF_gunshot = 1 if strpos(Abrief, "gunshot") | strpos(Abrief, "Gunshot") | strpos(Abrief, "shot") | strpos(Abrief, "Shot") | strpos(Abrief, "gun") | strpos(Abrief, "Gun") | strpos(Abrief, "gunfire") | strpos(Abrief, "Gunfire") | strpos(Abrief, "opened fire")
replace UOF_gunshot = 1 if Caus=="Gunshot" & UOF_g==0

//taser
gen UOF_taser=0
replace UOF_taser = 1 if strpos(Abrief, "taser") | strpos(Abrief, "Taser") | strpos(Abrief, "tasered") | strpos(Abrief, "Tasered") | strpos(Abrief, "electric") | strpos(Abrief, "Electric") | strpos(Abrief, "stun") | strpos(Abrief, "tased") | strpos(Abrief, "Tased") | strpos(Abrief, "tasing") | strpos(Abrief, "Tasing")
replace UOF_taser = 1 if Caus=="Tasered" & UOF_t==0

//pepper spray
gen UOF_pepper_spray=0
replace UOF_pep = 1 if strpos(Abrief, "pepper") | strpos(Abrief, "tear") | strpos(Abrief, "chemical") | strpos(Abrief, "spray") | strpos(Abrief, "Pepper") | strpos(Abrief, "Tear") | strpos(Abrief, "Chemical") | strpos(Abrief, "Spray")

//vehicle
gen UOF_vehicle=0
replace UOF_veh = 1 if strpos(Abrief, "ran over") | strpos(Abrief, "chased") & strpos(Abrief, "driving") | strpos(Abrief, "attempting to stop") & strpos(Abrief, "chase") | strpos(Abrief, "pull over") | strpos(Abrief, "high-speed") | strpos(Abrief, "high speed") | strpos(Abrief, "pursuing a suspect") & strpos(Abrief, "chase")
replace UOF_veh = 1 if Caus=="Vehicle" & UOF_t==0

//bean bag
gen UOF_beanbag=0
replace UOF_bea = 1 if strpos(Abrief, "bean") | strpos(Abrief, "bag") 

//physical restraint
gen UOF_physical_restraint=0
replace UOF_phy = 1 if strpos(Abrief, "restraint") | strpos(Abrief, "restrain") | strpos(Abrief, "restraining") | strpos(Abrief, "hog-tie") | strpos(Abrief, "hog tie") | strpos(Abrief, "Restraint") | strpos(Abrief, "Restrain") | strpos(Abrief, "restrained") | strpos(Abrief, "Restraining") | strpos(Abrief, "tie") | strpos(Abrief, "tied") 
replace UOF_phy = 1 if strpos(Abrief, "put a knee on his body") | strpos(Abrief, "detained") | strpos(Abrief, "resist") | strpos(Abrief, "resisted") | strpos(Abrief, "physical altercation") | strpos(Abrief, "beaten") | strpos(Abrief, "beat") | strpos(Abrief, "head trauma") | strpos(Abrief, "strikes") | strpos(Abrief, "fought")
replace UOF_phy = 1 if strpos(Abrief, "blunt force trauma") | strpos(Abrief, "handcuff") | strpos(Abrief, "struggle") | strpos(Abrief, "wrestled") | strpos(Abrief, "cuff") | strpos(Abrief, "chokehold") | strpos(Abrief, "choke hold") | strpos(Abrief, "full-body wrap") | strpos(Abrief, "struggle with officer") | strpos(Abrief, "attempted to detain") | strpos(Abrief, "thrown to the ground")

//Unclear: use of force was not reported in the description or details surounding the event were noted to be unclear
gen UOF_unclear=0
replace UOF_unc = 1 if strpos(Abrief, "unclear") | strpos(Abrief, "uncertain")
replace UOF_unc = 1 if UOF_g==0 & UOF_t==0 & UOF_pep==0 & UOF_v==0 & UOF_be==0 & UOF_phy==0


**Unique ID
gen idstr = substr(Subjectsn,1,3)
gen date_of_death = date(Dateofin, "MDY")
egen id= concat(idstr date_of age sex Locationofdeathstate)
drop idstr Dateofin
format date_of_death %td
duplicates drop id Subjectsn Locationofdeathcity, force

//ssc install groups	//might need to be installed
//count
//local nobs=r(N)	// r(N) give total observation
groups id, sel(f>1)
duplicates drop id, force


//list Agencyresponsiblefordeath if strpos(Agencyresponsiblefordeath, ",")

replace Agency= subinstr(Agency, ", 114th Precinct", "", .) 
replace Agency= subinstr(Agency, ", possibly other agencies", "", .) 
replace Agency= subinstr(Agency, ", Orange County Transportation Authority", "", .) 
replace Agency= subinstr(Agency, "Georgia State Patrol, Georgia Bureau of Investigation", "", .) 
replace Agency= subinstr(Agency, "Drug Enforcement Administration, ", "", .) 
replace Agency= subinstr(Agency, ", Drug Enforcement Administration", "", .)
replace Agency= subinstr(Agency, ", Dallas Area Rapid Transit", "", .)  
replace Agency= subinstr(Agency, "Federal Bureau of Investigation, ", "", .) 
replace Agency= subinstr(Agency, ", Federal Bureau of Investigation", "", .)
replace Agency= subinstr(Agency, "California Highway Patrol, ", "", .)
replace Agency= subinstr(Agency, "North Carolina Highway Patrol, ", "", .) 
replace Agency= subinstr(Agency, "North Carolina State Highway Patrol, ", "", .)
replace Agency= subinstr(Agency, "Mississippi State Highway Patrol, ", "", .)  
replace Agency= subinstr(Agency, ", FBI", "", .)
replace Agency= subinstr(Agency, ", U.S. Marshals, ", "", .)
replace Agency= subinstr(Agency, ", U.S. Marshals", "", .)
replace Agency= subinstr(Agency, ", US Marshals", "", .)
replace Agency= subinstr(Agency, "U.S. Marshals Service,", "", .)
replace Agency= subinstr(Agency, "U.S. Marshals, ", "", .)
replace Agency= subinstr(Agency, "Missouri State Highway Patrol, ", "", .)
replace Agency= subinstr(Agency, ", Oregon Police Division", "", .)
replace Agency= subinstr(Agency, "Multiple agencies in MS and AL including Corinth Police Department, ", "", .)
replace Agency= subinstr(Agency, ", Oklahoma Highway Patrol", "", .)
replace Agency= subinstr(Agency, ", Kansas Highway Patrol", "", .)
replace Agency= subinstr(Agency, ", California Highway Patrol", "", .)
replace Agency= subinstr(Agency, " South Carolina Law Enforcement Division, ", "", .)
replace Agency= subinstr(Agency, ", Iowa State Patrol", "", .)
replace Agency= subinstr(Agency, ", Mississippi Highway Patrol", "", .)
replace Agency= subinstr(Agency, ", Bureau of Alcohol, Tobacco, Firearms and Explosives", "", .)
replace Agency= subinstr(Agency, ", U.S. Bureau of Alcohol, Tobacco, Firearms and Explosives", "", .)
replace Agency= subinstr(Agency, "Bureau of Alcohol, Tobacco, Firearms and Explosives, ", "", .)
replace Agency= subinstr(Agency, "Bureau of Alcohol, Tobacco & Firearms, ", "", .)
replace Agency= subinstr(Agency, ", and Bureau of Alcohol, Tobacco and Firearms", "", .)
replace Agency= subinstr(Agency, ", Drug Enforcement Agency", "", .)
replace Agency= subinstr(Agency, "DPS Highway Patrol, ", "", .)
replace Agency= subinstr(Agency, ", U.S. Marshal Service", "", .)
replace Agency= subinstr(Agency, ", Ohio Highway Patrol", "", .)
replace Agency= subinstr(Agency, "Lafayette City Marshal's Office, ", "", .)
replace Agency= subinstr(Agency, ", U.S. Border Patrol", "", .)
replace Agency= subinstr(Agency, ", Missouri Highway Patrol", "", .)
replace Agency= subinstr(Agency, ", Federal Emergency Management Agency", "", .)
replace Agency= subinstr(Agency, "Wake County Alcoholic Beverage Control Board, ", "", .)
replace Agency= subinstr(Agency, "Bureau of Alcohol, Firearms, Tobacco and Explosives", "", .)
replace Agency= subinstr(Agency, ", South Dakota Highway Patrol", "", .)
replace Agency= subinstr(Agency, ", North Carolina State Highway Patrol", "", .)
replace Agency= subinstr(Agency, "Mississippi Highway Patrol, ", "", .)
replace Agency= subinstr(Agency, ", Mississippi Highway Safety Patrol", "", .)
replace Agency= subinstr(Agency, "U.S. Marshal Service, ", "", .)
replace Agency= subinstr(Agency, "U.S. Marshal Task Force, ", "", .)
replace Agency= subinstr(Agency, "Maryland Department of Natural Resources, ", "", .)
replace Agency= subinstr(Agency, "Immigration and Customs Enforcement, ", "", .)
replace Agency= subinstr(Agency, "Department of Housing and Urban Development", "", .)
replace Agency= subinstr(Agency, ", Minnesota State Patrol", "", .)
replace Agency= subinstr(Agency, ", and U.S. Immigration and Customs Enforcement", "", .)
replace Agency= subinstr(Agency, " U.S. Customs and Border Protection, ", "", .)
replace Agency= subinstr(Agency, ", Utah Division of Wildlife Resources", "", .)
replace Agency= subinstr(Agency, ", multiple other agencies", "", .)
replace Agency= subinstr(Agency, "U.S. Park Police, ", "", .)
replace Agency= subinstr(Agency, ", State Parole Board", "", .)
replace Agency= subinstr(Agency, ", Department of Public Safety", "", .)
replace Agency= subinstr(Agency, ", likely other agencies involved", "", .)
replace Agency= subinstr(Agency, "Tennessee Highway Patrol, ", "", .)
replace Agency= subinstr(Agency, ", Tennessee Highway Patrol, other agencies", "", .)
replace Agency= subinstr(Agency, "Bureau of Alcohol, Tobacco and Firearms Service, ", "", .)
replace Agency= subinstr(Agency, "Bureau of Alcohol, Tobacco and Firearms, ", "", .)
replace Agency= subinstr(Agency, ", other agencies", "", .)
replace Agency= subinstr(Agency, ", US Military Police", "", .)
replace Agency= subinstr(Agency, "US Marshals Service, ", "", .)
replace Agency= subinstr(Agency, "U.S. Marshal, ", "", .)
replace Agency= subinstr(Agency, "Bureau of Alcohol, Tobacco, Firearms and Explosives", "", .)
replace Agency= subinstr(Agency, "Homeland Security,", "", .)
replace Agency= subinstr(Agency, " Alabama Alcoholic Beverage Control Board", "", .)
replace Agency= subinstr(Agency, ", 4 other departments", "", .)
replace Agency= subinstr(Agency, "Kansas City, ", "", .)
replace Agency= subinstr(Agency, "Kansas Highway Patrol, ", "", .) 
replace Agency= subinstr(Agency, " 21st Judicial Drug Task Force,", "", .)
replace Agency= subinstr(Agency, ", ATF", "", .)
replace Agency= subinstr(Agency, "U.S. Marshal's Service, ", "", .)
replace Agency= subinstr(Agency, "U.S. Forest Service, ", "", .)
replace Agency= subinstr(Agency, ", WI", "", .)
replace Agency= subinstr(Agency, "SWAT, multiple jurisdictions", "", .)
replace Agency= subinstr(Agency, "Alabama Alcoholic Beverage Control Board, ", "", .)
replace Agency= subinstr(Agency, "Dept", "Department", .)
replace Agency= subinstr(Agency, "Office", "Department", .)
replace Agency= subinstr(Agency, "Metro ", "Metropolitan ", .)
replace Agency= subinstr(Agency, "Sheriff ", "Sheriff's ", .)
replace Agency= subinstr(Agency, "Sherrif ", "Sheriff's ", .)
replace Agency= subinstr(Agency, "sheriff ", "Sheriff's ", .)
replace Agency= subinstr(Agency, "City of New York Police Department", "NEW YORK CITY POLICE DEPARTMENT", .)
replace Agency= subinstr(Agency, "U.S. Border Patrol", "", .)
replace Agency= subinstr(Agency, "U.S. Marshals Service", "", .)
replace Agency= subinstr(Agency, "Portland Police Bureau", "Portland Police Department", .)
replace Agency= subinstr(Agency, "/SWAT", "", .)
replace Agency= subinstr(Agency, " SWAT SWAT Team", "", .)
replace Agency= subinstr(Agency, "Baltimore City Police", "Baltimore City Police Department", .)
replace Agency= subinstr(Agency, "Baltimore County Police", "Baltimore County Police Department", .)
replace Agency= subinstr(Agency, ", US Secret Service", "", .)
replace Agency= subinstr(Agency, "Baltimore Police Department", "Baltimore City Police Department", .) if Locationofdeathcity=="Baltimore"
replace Agency= subinstr(Agency, "Baltimore Police Department", "Baltimore County Police Department", .) if Locationofdeathcity!="Baltimore"
replace Agency= subinstr(Agency, "City of Baltimore Police Department", "Baltimore City Police Department", .)
replace Agency= subinstr(Agency, "City of New York", "New York City", .)
replace Agency= subinstr(Agency, "DEPT", "DEPARTMENT", .)




rename Subjectsn name
rename Locationofinjuryadd address
rename Locationofdeathcity city
rename Locationofdeathstate state
rename Locationofdeathzip zip
rename Locationofdeathcou county
rename Agencyres agency
rename Causeofde COD
rename Abrief description
rename Linkto link
gen year=year(date)

split agency, p(",")

drop if agency9!=""
drop agency10 agency11 agency12 agency13 agency14 agency15 agency16
//	list Agencyresponsiblefordeath if !missing(Agencyresponsiblefordeath) 
//	drop if !missing(Agencyresponsiblefordeath9)	//drops 9762 and 9763
//	drop Agencyresponsiblefordeath12 Agencyresponsiblefordeath11 Agencyresponsiblefordeath10 Agencyresponsiblefordeath9
drop COD description link StateDataStatus

save "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\FE_Cleaned.dta", replace 
export excel using "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\FE_Cleaned.xlsx", sheetreplace firstrow(variables) nolabel

clear
