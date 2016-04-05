//Replacing missing pop data in lemas 06

import excel "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\Replacing Missing pop data in LEMAS07\q_Agencies_Complete.xlsx", sheet("q_Agencies_Complete") firstrow

gen pop06fill=(((pop12-pop02)/10)*4)+pop02
destring pop06, generate(pop06new)
replace pop06new=pop06fill if pop06new==.
drop pop06 pop06fill
rename pop06new pop06

export excel using "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\Replacing Missing pop data in LEMAS07\q_agency_complete.xlsx", firstrow(variables)

