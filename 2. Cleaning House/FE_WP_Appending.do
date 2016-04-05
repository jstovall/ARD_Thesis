//FE and WP appended and deduplicated
clear 

use "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\FE_Cleaned.dta", clear
append using "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\WP_Cleaned.dta", gen (merge) force

duplicates tag id, gen(dup)
drop if dup==1 & merge==1	//keeping only the duplicates from FE

duplicates list		//just checking

summ if merge==1	//147 unique obs from WP of 1,079

save "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\FE_WP_Appended.dta", replace
export excel using "C:\Users\Joshua\Desktop\Thesis\Hot_Fuzz\3. Cleaned .xls and .dta\FE_WP_Appended.xlsx", sheetreplace firstrow(variables) nolabel


