//WP victim data set cleaning and standaridization

clear
set more off
import delimited "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\1. Data\Original Victim Data Sets\Wash Post data-police-shootings-master\data-police-shootings-master\fatal-police-shootings-data.csv"
drop id threat_level

duplicates list

**Sex
encode gender, gen(sex)
recode sex 2=0
label define sex 0 "Male" 1 "Female", replace
drop gender

**Race
encode race, gen(race1)
//1-A	asian
//2-B	black
//3-H	hispanic
//4-N	native Amnerican
//5-O	other
//6-W	white
**Ethnicity
gen ethnicity=0
replace ethn = 1 if race1==3

recode race1 6=0 3=0	//white
recode race1 1=7		//asian: moving it out of the way for now
recode race1 2=1		//black
recode race1 4=3		//na/an
recode race1 7=2		//asian

label define race1 0 "White" 1 "Black" 2 "Asian/PI" 3 "NA/Alaskan" 4 "Middle Eastern" 5 "Other", replace
drop race
rename race1 race

**Substance Abuse
gen substance_abuse=.


**Signs of Mental Illness
gen signs_of_MI=0
replace signs_of_MI = 1 if signs_of_mental=="True" 
label define signs_of_MI 0 "No" 1 "Yes", replace
drop signs_of_mental

**Date
generate date2 = date(date, "YMD")
format %td dateof death
drop date


**Use of Force
encode manner, gen(COD) //Only options are shot, shot and Tasered

//gunshot
gen UOF_gunshot=0
replace UOF_gunshot = 1 if COD==1 | COD==2
 
//taser
gen UOF_taser=0
replace UOF_taser = 1 if COD==2

//pepper spray
gen UOF_pepper_spray=.

//vehicle
gen UOF_vehicle=.

//bean bag
gen UOF_beanbag=.

//physical restraint
gen UOF_physical_restraint=.

//Unclear: use of force was not reported in the description or details surounding the event were noted to be unclear
gen UOF_unclear=.

**Unique ID
gen idstr = substr(name,1,3)
egen id= concat(idstr date age sex state)
drop idstr

duplicates drop id, force	//0 id's dropped, unique list

//Standardizing with FE for merge
drop manner armed
gen address=.
gen zip=.
gen county=.
gen agency=.
gen description=.
gen link=.


save "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\WP_Cleaned.dta", replace
export excel using "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\WP_Cleaned.xlsx", sheetreplace firstrow(variables) nolabel

clear
