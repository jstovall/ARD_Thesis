/**************************************************************************
 |                                                                         
 |                    STATA SETUP FILE FOR ICPSR 04411
 |        LAW ENFORCEMENT MANAGEMENT AND ADMINISTRATIVE STATISTICS
 |        (LEMAS): 2003 SAMPLE SURVEY OF LAW ENFORCEMENT AGENCIES
 |
 |                                                                        
 |  Please edit this file as instructed below.                            
 |  To execute, start Stata, change to the directory containing:          
 |       - this do file                                                   
 |       - the ASCII data file                                            
 |       - the dictionary file                                            
 |                                                                        
 |  Then execute the do file (e.g., do 04411-0001-statasetup.do)          
 |                                                                        
 **************************************************************************/

set mem 20m  /* Allocating 20 megabyte(s) of RAM for Stata SE to read the
                 data file into memory. */

set more off  /* This prevents the Stata output viewer from pausing the
                 process*/

/****************************************************

Section 1: File Specifications
   This section assigns local macros to the necessary files.
   Please edit:
        "data-filename" ==> The name of data file downloaded from ICPSR
        "dictionary-filename" ==> The name of the dictionary file downloaded.
        "stata-datafile" ==> The name you wish to call your Stata data file.

   Note:  We assume that the raw data, dictionary, and setup (this do file) all
          reside in the same directory (or folder).  If that is not the case
          you will need to include paths as well as filenames in the macros.

********************************************************/

local raw_data "data-filename"
local dict "dictionary-filename"
local outfile "stata-datafile"

/********************************************************

Section 2: Infile Command

This section reads the raw data into Stata format.  If Section 1 was defined
properly, there should be no reason to modify this section.  These macros
should inflate automatically.

**********************************************************/

infile using `dict', using (`raw_data') clear










/*********************************************************

Section 3: Value Label Definitions
This section defines labels for the individual values of each variable.
We suggest that users do not modify this section.

**********************************************************/


label data "Law Enforcement Management and Administrative Statistics (LEMAS): 2003 Sample Survey of Law Enforcement Agencies, Dataset 0001"

#delimit ;
label define PHONE     9999999999 "Blanked" ;
label define FAX       9999999999 "Blanked" ;
label define AGCYTYPE  1 "Sheriffs office" 2 "County police"
                       3 "Municipal police" 5 "Primary state agency"
                       8 "Tribal police" 9 "Regional police" ;
label define FORMTYPE  1 "Long form" 2 "Short form" ;
label define V1        0 "No" 1 "Yes" ;
label define V2        0 "No" 1 "Yes" ;
label define V3        0 "No" 1 "Yes" ;
label define V4        0 "No" 1 "Yes" ;
label define V5        0 "No" 1 "Yes" ;
label define V6        0 "No" 1 "Yes" ;
label define V7        0 "No" 1 "Yes" ;
label define V8        0 "No" 1 "Yes" ;
label define V9        0 "No" 1 "Yes" ;
label define V10       0 "No" 1 "Yes" ;
label define V11       0 "No" 1 "Yes" 9 "DK" ;
label define V12       0 "No" 1 "Yes" 9 "DK" ;
label define V13       0 "No" 1 "Yes" 9 "DK" ;
label define V14       0 "No" 1 "Yes" 9 "DK" ;
label define V15       0 "No" 1 "Yes" ;
label define V16       0 "No" 1 "Yes" ;
label define V17       0 "No" 1 "Yes" ;
label define V18       0 "No" 1 "Yes" ;
label define V19       0 "No" 1 "Yes" ;
label define V20       0 "No" 1 "Yes" 9 "DK" ;
label define V21       0 "No" 1 "Yes" 9 "DK" ;
label define V22       0 "No" 1 "Yes" 9 "DK" ;
label define V23       0 "No" 1 "Yes" ;
label define V24       0 "No" 1 "Yes" ;
label define V25       0 "No" 1 "Yes" ;
label define V26       0 "No" 1 "Yes" ;
label define V27       0 "No" 1 "Yes" 9 "DK" ;
label define V28       0 "No" 1 "Yes" 9 "DK" ;
label define V29       0 "No" 1 "Yes" 9 "DK" ;
label define V30       0 "No" 1 "Yes" 9 "DK" ;
label define V31       0 "No" 1 "Yes" 9 "DK" ;
label define V32       0 "No" 1 "Yes" 9 "DK" ;
label define V33       0 "No" 1 "Yes" 9 "DK" ;
label define V34       0 "No" 1 "Yes" 9 "DK" ;
label define V35       0 "No" 1 "Yes" 9 "DK" ;
label define V36       0 "No" 1 "Yes" 9 "DK" ;
label define V37       0 "No" 1 "Yes" 9 "DK" ;
label define V67       0 "No" 1 "Yes" ;
label define V68       77777777 "Missing" 99999999 "DK" ;
label define V69       1 "Four-year college degree required"
                       2 "Two-year college degree required"
                       3 "Some college but no degree (specify credit hours)"
                       4 "High school diploma or equivalent degree"
                       5 "No formal education requirement" ;
label define V70       88 "NA" 99 "DK" ;
label define V71       0 "No" 1 "Yes" 8 "NA" ;
label define V72       0 "No" 1 "Yes" 8 "NA" ;
label define V73       0 "No" 1 "Yes" 8 "NA" ;
label define V74       0 "No" 1 "Yes" 8 "NA" ;
label define V75       0 "No" 1 "Yes" 8 "NA" ;
label define V76       0 "No" 1 "Yes" 8 "NA" ;
label define V77       0 "No" 1 "Yes" 8 "NA" ;
label define V78       0 "No" 1 "Yes" 8 "NA" ;
label define V79       0 "No" 1 "Yes" 8 "NA" ;
label define V80       0 "No" 1 "Yes" 8 "NA" ;
label define V81       0 "No" 1 "Yes" 8 "NA" ;
label define V82       0 "No" 1 "Yes" 8 "NA" ;
label define V83       0 "No" 1 "Yes" 8 "NA" ;
label define V84       0 "No" 1 "Yes" 8 "NA" ;
label define V85       0 "No" 1 "Yes" 8 "NA" ;
label define V86       0 "No" 1 "Yes" 8 "NA" ;
label define V87       0 "No" 1 "Yes" 8 "NA" ;
label define V88       0 "No" 1 "Yes" 8 "NA" ;
label define V127      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V128      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V129      0 "No" 1 "Yes" ;
label define V130      0 "No" 1 "Yes" 9 "DK" ;
label define V131      0 "No" 1 "Yes" 9 "DK" ;
label define V132      0 "No" 1 "Yes" ;
label define V133      0 "No" 1 "Yes" ;
label define V134      0 "No" 1 "Yes" ;
label define V135      0 "No" 1 "Yes" 9 "DK" ;
label define V136      0 "No" 1 "Yes" 9 "DK" ;
label define V144      88 "NA" 99 "DK" ;
label define V145      1111 "Can hold detainees indefinitely"
                       8888 "NA - no adult capacity" ;
label define V146      888 "NA - no juvenile capacity" ;
label define V147      0 "No" 1 "Yes - enhanced 9-1-1 system"
                       2 "Yes - basic 9-1-1 system" 9 "DK" ;
label define V148      0 "No" 1 "Yes" 8 "NA - no operational 9-1-1 system"
                       9 "DK" ;
label define V149      0 "No" 1 "Yes" 7 "Missing"
                       8 "NA - no operational 9-1-1 system" 9 "DK" ;
label define V156      99999999 "DK" ;
label define V157      9999999 "DK" ;
label define V158      0 "No" 1 "Yes" ;
label define V159      0 "No" 1 "Yes" ;
label define V160      0 "No" 1 "Yes" 9 "DK" ;
label define V161      0 "No" 1 "Yes" 7 "Missing data" 9 "DK" ;
label define V162      0 "No" 1 "Yes" 7 "Missing data" 9 "DK" ;
label define V163      0 "No" 1 "Yes" 7 "Missing data" 9 "DK" ;
label define V164      0 "No" 1 "Yes" 9 "DK" ;
label define V165      0 "No" 1 "Yes" 7 "Missing data" 9 "DK" ;
label define V166      0 "No" 1 "Yes" 9 "DK" ;
label define V172
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V173
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V174
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V175
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" 9 "DK" ;
label define V176
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" 9 "DK" ;
label define V177
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V178
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V179
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V180
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" 9 "DK" ;
label define V181
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" 9 "DK" ;
label define V182
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" 9 "DK" ;
label define V183
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V184
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V185
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V186
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V187
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" 9 "DK" ;
label define V188
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V189
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" 9 "DK" ;
label define V190
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" 9 "DK" ;
label define V191
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V192
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" ;
label define V193
                       1 "Agency has specialized unit w f/t persnl to address problem"
                       2 "Agency has dedicated personnel to address this problem"
                       3 "Agency addresses this prob, but doesnt have dedicated persnl"
                       4 "Agency does not address this problem" 9 "DK" ;
label define V194      1 "All" 2 "Half or more" 3 "Less than half" 4 "None"
                       5 "NA" 7 "Missing data" 9 "DK" ;
label define V195      1 "All" 2 "Half or more" 3 "Less than half" 4 "None"
                       5 "NA" 7 "Missing" 9 "DK" ;
label define V196      1 "All" 2 "Half or more" 3 "Less than half" 4 "None"
                       5 "NA" 9 "DK" ;
label define V197      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V198      777 "Missing" 888 "NA" 999 "DK" ;
label define V199      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V200      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V201      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V202      777 "Missing" 888 "NA" 999 "DK" ;
label define V203      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V204      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V205      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V206      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V207      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V208      0 "No" 1 "Yes" 8 "NA" 9 "DK" ;
label define V209      0 "No" 1 "Yes" 9 "DK" ;
label define V210      0 "No" 1 "Yes" 9 "DK" ;
label define V211      0 "No" 1 "Yes" 9 "DK" ;
label define V212      0 "No" 1 "Yes" 9 "DK" ;
label define V213      0 "No" 1 "Yes" 9 "DK" ;
label define V214      0 "No" 1 "Yes" 9 "DK" ;
label define V215      0 "No" 1 "Yes" 9 "DK" ;
label define V216      0 "No" 1 "Yes" 9 "DK" ;
label define V217      0 "No" 1 "Yes" 9 "DK" ;
label define V218      0 "No" 1 "Yes" 9 "DK" ;
label define V219      0 "No" 1 "Yes" 9 "DK" ;
label define V220      0 "No" 1 "Yes" 9 "DK" ;
label define V221      0 "No" 1 "Yes" 9 "DK" ;
label define V222      0 "No" 1 "Yes" 9 "DK" ;
label define V223      0 "No" 1 "Yes" 9 "DK" ;
label define V225      0 "No" 1 "Yes" 9 "DK" ;
label define V226      0 "No" 1 "Yes"
                       8 "NA - did not survey the general public" 9 "DK" ;
label define V227      0 "No" 1 "Yes"
                       8 "NA - did not survey the general public" 9 "DK" ;
label define V228      0 "No" 1 "Yes"
                       8 "NA - did not survey the general public" 9 "DK" ;
label define V229      0 "No" 1 "Yes"
                       8 "NA - did not survey the general public" 9 "DK" ;
label define V230      0 "No" 1 "Yes"
                       8 "NA - did not survey the general public" 9 "DK" ;
label define V231      0 "No" 1 "Yes"
                       8 "NA - did not survey the general public" 9 "DK" ;
label define V232      0 "No" 1 "Yes"
                       8 "NA - did not survey the general public" 9 "DK" ;
label define V233      0 "No" 1 "Yes"
                       8 "NA - did not survey the general public" 9 "DK" ;
label define V234      0 "No" 1 "Yes"
                       8 "NA - did not survey the general public" 9 "DK" ;
label define V236      0 "No" 1 "Yes"
                       8 "NA - did not survey the general public" 9 "DK" ;
label define V237      0 "No -skip to question 34" 1 "Yes" 9 "DK" ;
label define V238      0 "No" 1 "Yes"
                       8 "NA - no written action plan for terrorist attacks"
                       9 "DK" ;
label define V239      0 "No" 1 "Yes" ;
label define V240      0 "No" 1 "Yes" ;
label define V241      0 "No" 1 "Yes" ;
label define V242      0 "No" 1 "Yes" ;
label define V243      0 "No" 1 "Yes" ;
label define V244      0 "No" 1 "Yes" ;
label define V245      0 "No" 1 "Yes" ;
label define V246      0 "No" 1 "Yes" ;
label define V247      0 "No" 1 "Yes" 9 "DK" ;
label define V248      0 "No" 1 "Yes" 9 "DK" ;
label define V249      0 "No" 1 "Yes" 9 "DK" ;
label define V250      0 "No" 1 "Yes" 9 "DK" ;
label define V251      0 "No" 1 "Yes" 9 "DK" ;
label define V252      0 "No" 1 "Yes" 9 "DK" ;
label define V259      0 "No" 1 "Yes" ;
label define V260      0 "No" 1 "Yes" ;
label define V261      0 "No" 1 "Yes" ;
label define V262      0 "No" 1 "Yes" ;
label define V263      0 "No" 1 "Yes" ;
label define V264      0 "No" 1 "Yes" ;
label define V265      0 "No" 1 "Yes" ;
label define V266      0 "No" 1 "Yes" ;
label define V267      0 "No" 1 "Yes" ;
label define V268      0 "No" 1 "Yes" ;
label define V269      0 "No" 1 "Yes" ;
label define V270      0 "No" 1 "Yes" ;
label define V271      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V272      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V273      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V274      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V275      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V276      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V277      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V278      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V279      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V280      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V281      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V282      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V283      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V284      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V285      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V286      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V287      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V288      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V289      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V290      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V291      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V293      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V294      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V295      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V296      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V297      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V298      0 "No" 1 "Yes" 7 "Missing" 8 "NA" 9 "DK" ;
label define V299      0 "No" 1 "Yes, all the time"
                       2 "Yes, in some circumstances (e.g., serving warrants)" ;
label define V302      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V303      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V304      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V305      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V306      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V307      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V308      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V309      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V310      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V311      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V312      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V313      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V314      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V315      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V316      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V317      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V318      0 "No" 1 "Yes" ;
label define V319      0 "No" 1 "Yes" ;
label define V320      0 "No" 1 "Yes" ;
label define V321      0 "No" 1 "Yes" ;
label define V322      0 "No" 1 "Yes" ;
label define V323      0 "No" 1 "Yes" ;
label define V325      0 "No" 1 "Yes" ;
label define V326      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V327      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V328      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V329      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V331      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V332      0 "No" 1 "Yes" ;
label define V333      0 "No" 1 "Yes" ;
label define V334      0 "No" 1 "Yes" ;
label define V335      0 "No" 1 "Yes" ;
label define V337      0 "No" 1 "Yes" ;
label define V347      0 "No - skip to question 47" 1 "Yes" ;
label define V348      0 "No" 1 "Yes"
                       8 "NA - officers are not allowed to take marked vehicles home"
                       9 "DK" ;
label define V349      0 "No" 1 "Yes" ;
label define V350
                       888 "NA - no red light cameras operated on a regular basis" ;
label define V351      0 "No" 1 "Yes" ;
label define V352
                       888 "NA - no speed enforcement cameras operated on regular basis"
                       999 "DK" ;
label define V353      0 "No" 1 "Yes" ;
label define V354
                       8888 "NA - video cameras are not operated on a regular basis" ;
label define V355
                       8888 "NA - video cameras are not operated on a regular basis"
                       9999 "DK" ;
label define V356
                       888 "NA - video cameras are not operated on a regular basis" ;
label define V357
                       888 "NA - video cameras are not operated on a regular basis" ;
label define V358      0 "No" 1 "Yes" ;
label define V359      8888 "NA" ;
label define V360      0 "No" 1 "Yes" ;
label define V361      0 "No" 1 "Yes" 9 "DK" ;
label define V362      8888 "NA" ;
label define V363      0 "No" 1 "Yes" 9 "DK" ;
label define V364      0 "No" 1 "Yes" 9 "DK" ;
label define V365      8888 "NA" ;
label define V366      0 "No" 1 "Yes" 9 "DK" ;
label define V367      0 "No" 1 "Yes" ;
label define V369      8888 "NA" 9999 "DK" ;
label define V370      0 "No" 1 "Yes" ;
label define V371      0 "No" 1 "Yes" ;
label define V372      8888 "NA" ;
label define V373      0 "No" 1 "Yes" ;
label define V374      0 "No" 1 "Yes" 9 "DK" ;
label define V375      8888 "NA" 9999 "DK" ;
label define V376      0 "No" 1 "Yes" 9 "DK" ;
label define V377      0 "No" 1 "Yes" 9 "DK" ;
label define V378      888 "NA" 999 "DK" ;
label define V379      0 "No" 1 "Yes" 9 "DK" ;
label define V380      0 "No" 1 "Yes" 9 "DK" ;
label define V381      8888 "NA" 9999 "DK" ;
label define V382      0 "No" 1 "Yes" 9 "DK" ;
label define V383      0 "No" 1 "Yes" ;
label define V385      888 "NA" ;
label define V386      0 "No" 1 "Yes" 9 "DK" ;
label define V387      0 "No" 1 "Yes" ;
label define V388      0 "No" 1 "Yes" 9 "DK" ;
label define V389      0 "No" 1 "Yes" ;
label define V390      0 "No" 1 "Yes" ;
label define V391      0 "No" 1 "Yes" ;
label define V392      0 "No" 1 "Yes" ;
label define V393      0 "No" 1 "Yes" ;
label define V394      1 "Paper report" 2 "Wireless transmission"
                       3 "Telephone line" 4 "Computer medium" 5 "Data device"
                       6 "Not applicable - agency does not handle such reports" ;
label define V395      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V396      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V397      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V398      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V399      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V400      0 "No" 1 "Yes" 9 "DK" ;
label define V401      0 "No" 1 "Yes" 9 "DK" ;
label define V402      0 "No" 1 "Yes" 9 "DK" ;
label define V403      0 "No" 1 "Yes" 9 "DK" ;
label define V404      0 "No" 1 "Yes" 9 "DK" ;
label define V405      0 "No" 1 "Yes" 9 "DK" ;
label define V406      0 "No" 1 "Yes" 9 "DK" ;
label define V407      0 "No" 1 "Yes" 9 "DK" ;
label define V408      0 "No" 1 "Yes" 9 "DK" ;
label define V409      0 "No" 1 "Yes" 9 "DK" ;
label define V410      0 "No" 1 "Yes" 9 "DK" ;
label define V411      0 "No" 1 "Yes" 9 "DK" ;
label define V412      0 "No" 1 "Yes" 9 "DK" ;
label define V413      0 "No" 1 "Yes" 9 "DK" ;
label define V414      0 "No" 1 "Yes" 9 "DK" ;
label define V415      0 "No" 1 "Yes" 9 "DK" ;
label define V416      0 "No" 1 "Yes" 9 "DK" ;
label define V417      0 "No" 1 "Yes" 9 "DK" ;
label define V418      0 "No" 1 "Yes" 9 "DK" ;
label define V419      0 "No" 1 "Yes" 9 "DK" ;
label define V420      0 "No" 1 "Yes" 9 "DK" ;
label define V421      0 "No" 1 "Yes" 9 "DK" ;
label define V422      0 "No" 1 "Yes" 9 "DK" ;
label define V423      0 "No" 1 "Yes" 9 "DK" ;
label define V424      0 "No" 1 "Yes" 9 "DK" ;
label define V425      0 "No" 1 "Yes" 9 "DK" ;
label define V426      0 "No" 1 "Yes" 9 "DK" ;
label define V427      0 "No" 1 "Yes" 9 "DK" ;
label define V428      0 "No" 1 "Yes" 9 "DK" ;
label define V429      0 "No" 1 "Yes" 9 "DK" ;
label define V430      0 "No" 1 "Yes" 9 "DK" ;
label define V431      0 "No" 1 "Yes" 9 "DK" ;
label define V432      0 "No" 1 "Yes" 9 "DK" ;
label define V433      0 "No" 1 "Yes" 9 "DK" ;
label define V434      0 "No" 1 "Yes" 9 "DK" ;
label define V435      0 "No" 1 "Yes" 9 "DK" ;
label define V436      0 "No" 1 "Yes" 9 "DK" ;
label define V437      0 "No" 1 "Yes" 9 "DK" ;
label define V438      0 "No" 1 "Yes" 9 "DK" ;
label define V439      0 "No" 1 "Yes" 9 "DK" ;
label define V440      0 "No" 1 "Yes" 9 "DK" ;
label define V441      0 "No" 1 "Yes" 9 "DK" ;
label define V442      0 "No" 1 "Yes" 9 "DK" ;
label define V443      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V444      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V445      0 "No" 1 "Yes" 9 "DK" ;
label define V446      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V447      0 "No" 1 "Yes" 9 "DK" ;
label define V448      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V449      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V450      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V451      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V452      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V453      1 "Discouragement" 2 "Judgmental" 3 "Restrictive"
                       4 "Other (please describe)"
                       5 "Agency does not have a written policy pertaining to pursuit"
                       7 "Missing" 9 "DK" ;
label define V462      0 "No - skip to question 60" 1 "Yes" 9 "DK" ;
label define V463      0 "No" 1 "Yes"
                       8 "NA - no civilian complaint review board/agency"
                       9 "DK" ;
label define V464      0 "No" 1 "Yes" 9 "DK" ;
label define V465      0 "No" 1 "Yes" ;
label define V466      0 "No" 1 "Yes" ;
label define V467      0 "No" 1 "Yes" ;
label define V468      0 "No" 1 "Yes" ;
label define V470      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V471      0 "No" 1 "Yes" 7 "Missing" 9 "DK" ;
label define V1F       1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V16F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V17F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V18F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V24F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V31F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V38F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V39F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V40F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V41F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V42F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V43F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V44F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V45F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V46F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V47F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V48F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V49F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V50F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V51F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V52F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V53F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V54F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V55F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V56F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V57F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V58F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V59F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V60F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V61F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V62F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V63F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V64F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V65F      1 "Imputed value" 2 "Analyst adjustment" 3 "2003 UCR"
                       4 "2000 LEMAS" 5 "2004 CSLLEA" ;
label define V66F      1 "Imputed value" 2 "Analyst adjustment"
                       5 "2004 CSLLEA" ;
label define V68F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V89F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V90F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V91F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V92F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V93F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V94F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V95F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V96F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V97F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V98F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V99F      1 "Imputed value" 2 "Analyst adjustment" ;
label define V100F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V102F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V103F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V104F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V105F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V106F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V107F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V108F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V109F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V110F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V111F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V112F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V113F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V114F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V115F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V116F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V117F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V118F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V119F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V120F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V121F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V122F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V123F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V124F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V125F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V126F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V137F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V138F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V139F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V140F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V141F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V142F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V143F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" 4 "1999 LEMAS" ;
label define V144F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" 4 "1999 LEMAS" ;
label define V145F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" 4 "1999 LEMAS" ;
label define V146F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" 4 "1999 LEMAS" ;
label define V150F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V151F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V152F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V153F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V154F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V155F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V156F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V157F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V168F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V169F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V170F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V171F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V253F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V254F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V255F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V256F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V257F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V258F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V300F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V301F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V338F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V339F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V340F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V341F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V342F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V343F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V344F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V345F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V346F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V354F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V355F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V356F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V357F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V359F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V362F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V365F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V369F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V372F     1 "Imputed value" 2 "Analyst adjustment"
                       3 "2000 LEMAS" ;
label define V375F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V378F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V381F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V385F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V455F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V456F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V457F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V458F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V459F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V460F     1 "Imputed value" 2 "Analyst adjustment" ;
label define V461F     1 "Imputed value" 2 "Analyst adjustment" ;


#delimit cr


/***************************************************************************

 Section 4: Missing Values

 This section will replace numeric missing values (i.e., -9) with generic
 system missing ".".  By default the code in this section is commented out.
 Users wishing to apply the generic missing values should remove the comment
 at the beginning and end of this section.  Note that Stata allows you to
 specify up to 27 unique missing value codes.

****************************************************************/

/*
replace PHONE = . if (PHONE == 9999999999)
replace FAX = . if (FAX == 9999999999)
replace V1 = . if (V1 == 9)
replace V2 = . if (V2 == 9)
replace V3 = . if (V3 == 9)
replace V4 = . if (V4 == 9)
replace V5 = . if (V5 == 9)
replace V6 = . if (V6 == 9)
replace V7 = . if (V7 == 9)
replace V8 = . if (V8 == 9)
replace V9 = . if (V9 == 9)
replace V10 = . if (V10 == 9)
replace V11 = . if (V11 == 9)
replace V12 = . if (V12 == 9)
replace V13 = . if (V13 == 9)
replace V14 = . if (V14 == 9)
replace V15 = . if (V15 == 9)
replace V16 = . if (V16 == 9)
replace V17 = . if (V17 == 9)
replace V18 = . if (V18 == 9)
replace V19 = . if (V19 == 9)
replace V20 = . if (V20 == 9)
replace V21 = . if (V21 == 9)
replace V22 = . if (V22 == 9)
replace V23 = . if (V23 == 9)
replace V24 = . if (V24 == 9)
replace V25 = . if (V25 == 9)
replace V26 = . if (V26 == 9)
replace V27 = . if (V27 == 9)
replace V28 = . if (V28 == 9)
replace V29 = . if (V29 == 9)
replace V30 = . if (V30 == 9)
replace V31 = . if (V31 == 9)
replace V32 = . if (V32 == 9)
replace V33 = . if (V33 == 9)
replace V34 = . if (V34 == 9)
replace V35 = . if (V35 == 9)
replace V36 = . if (V36 == 9)
replace V37 = . if (V37 == 9)
replace V38 = . if (V38 == 999)
replace V41 = . if (V41 == 88888 | V41 == 99999)
replace V42 = . if (V42 == 88888 | V42 == 99999)
replace V47 = . if (V47 == 88888 | V47 == 99999)
replace V48 = . if (V48 == 88888 | V48 == 99999)
replace V50 = . if (V50 == 88888 | V50 == 99999)
replace V51 = . if (V51 == 88888 | V51 == 99999)
replace V58 = . if (V58 == 99999)
replace V61 = . if (V61 == 99999)
replace V68 = . if (V68 == 99999999 | V68 == 77777777)
replace V70 = . if (V70 == 88 | V70 == 99)
replace V71 = . if (V71 == 8)
replace V72 = . if (V72 == 8)
replace V73 = . if (V73 == 8)
replace V74 = . if (V74 == 8)
replace V75 = . if (V75 == 8)
replace V76 = . if (V76 == 8)
replace V77 = . if (V77 == 8)
replace V78 = . if (V78 == 8)
replace V79 = . if (V79 == 8)
replace V80 = . if (V80 == 8)
replace V81 = . if (V81 == 8)
replace V82 = . if (V82 == 8)
replace V83 = . if (V83 == 8)
replace V84 = . if (V84 == 8)
replace V85 = . if (V85 == 8)
replace V86 = . if (V86 == 8)
replace V87 = . if (V87 == 8)
replace V88 = . if (V88 == 8)
replace V89 = . if (V89 == 9999)
replace V90 = . if (V90 == 9999)
replace V91 = . if (V91 == 9999)
replace V92 = . if (V92 == 9999)
replace V93 = . if (V93 == 9999)
replace V94 = . if (V94 == 9999)
replace V97 = . if (V97 == 9999)
replace V98 = . if (V98 == 999)
replace V99 = . if (V99 == 999)
replace V102 = . if (V102 == 999)
replace V103 = . if (V103 == 999)
replace V105 = . if (V105 == 999)
replace V106 = . if (V106 == 999)
replace V108 = . if (V108 == 999)
replace V109 = . if (V109 == 999)
replace V111 = . if (V111 == 99999)
replace V125 = . if (V125 == 99999)
replace V127 = . if (V127 == 9 | V127 == 7)
replace V128 = . if (V128 == 9 | V128 == 7 | V128 == 8)
replace V129 = . if (V129 == 9)
replace V130 = . if (V130 == 9)
replace V131 = . if (V131 == 9)
replace V132 = . if (V132 == 9)
replace V133 = . if (V133 == 9)
replace V134 = . if (V134 == 9)
replace V135 = . if (V135 == 9)
replace V136 = . if (V136 == 9)
replace V143 = . if (V143 == 1111 | V143 == 8888 | V143 == 9999)
replace V144 = . if (V144 == 88 | V144 == 99)
replace V145 = . if (V145 == 1111 | V145 == 8888)
replace V146 = . if (V146 == 888)
replace V147 = . if (V147 == 9)
replace V148 = . if (V148 == 8 | V148 == 9)
replace V149 = . if (V149 == 7 | V149 == 8 | V149 == 9)
replace V156 = . if (V156 == 99999999)
replace V157 = . if (V157 == 9999999)
replace V159 = . if (V159 == 7 | V159 == 9)
replace V160 = . if (V160 == 9)
replace V161 = . if (V161 == 7 | V161 == 9)
replace V162 = . if (V162 == 7 | V162 == 9)
replace V163 = . if (V163 == 7 | V163 == 9)
replace V164 = . if (V164 == 9)
replace V165 = . if (V165 == 7 | V165 == 9)
replace V166 = . if (V166 == 9)
replace V168 = . if (V168 == 9999)
replace V172 = . if (V172 == 9)
replace V173 = . if (V173 == 9)
replace V174 = . if (V174 == 9)
replace V175 = . if (V175 == 9)
replace V176 = . if (V176 == 9)
replace V177 = . if (V177 == 9)
replace V178 = . if (V178 == 9)
replace V179 = . if (V179 == 9)
replace V180 = . if (V180 == 9)
replace V181 = . if (V181 == 9)
replace V182 = . if (V182 == 9)
replace V183 = . if (V183 == 9)
replace V184 = . if (V184 == 9)
replace V185 = . if (V185 == 9)
replace V186 = . if (V186 == 9)
replace V187 = . if (V187 == 9)
replace V188 = . if (V188 == 9)
replace V189 = . if (V189 == 9)
replace V190 = . if (V190 == 9)
replace V191 = . if (V191 == 9)
replace V192 = . if (V192 == 9)
replace V193 = . if (V193 == 9)
replace V194 = . if (V194 == 7 | V194 == 9)
replace V195 = . if (V195 == 7 | V195 == 9)
replace V196 = . if (V196 == 9)
replace V197 = . if (V197 == 9 | V197 == 7)
replace V198 = . if (V198 == 888 | V198 == 999 | V198 == 777)
replace V199 = . if (V199 == 7 | V199 == 9)
replace V200 = . if (V200 == 7 | V200 == 9)
replace V201 = . if (V201 == 7 | V201 == 9)
replace V202 = . if (V202 == 777 | V202 == 888 | V202 == 999)
replace V203 = . if (V203 == 8 | V203 == 9 | V203 == 7)
replace V204 = . if (V204 == 8 | V204 == 9 | V204 == 7)
replace V205 = . if (V205 == 8 | V205 == 9 | V205 == 7)
replace V206 = . if (V206 == 8 | V206 == 9 | V206 == 7)
replace V207 = . if (V207 == 8 | V207 == 9 | V207 == 7)
replace V208 = . if (V208 == 8 | V208 == 9)
replace V209 = . if (V209 == 9)
replace V210 = . if (V210 == 9)
replace V211 = . if (V211 == 9)
replace V212 = . if (V212 == 9)
replace V213 = . if (V213 == 9)
replace V214 = . if (V214 == 9)
replace V215 = . if (V215 == 9)
replace V216 = . if (V216 == 9)
replace V217 = . if (V217 == 9)
replace V218 = . if (V218 == 9)
replace V219 = . if (V219 == 9)
replace V220 = . if (V220 == 9)
replace V221 = . if (V221 == 9)
replace V222 = . if (V222 == 9)
replace V223 = . if (V223 == 9)
replace V225 = . if (V225 == 9)
replace V226 = . if (V226 == 9 | V226 == 8)
replace V227 = . if (V227 == 9 | V227 == 8)
replace V228 = . if (V228 == 9 | V228 == 8)
replace V229 = . if (V229 == 9 | V229 == 8)
replace V230 = . if (V230 == 9 | V230 == 8)
replace V231 = . if (V231 == 9 | V231 == 8)
replace V232 = . if (V232 == 9 | V232 == 8)
replace V233 = . if (V233 == 9 | V233 == 8)
replace V234 = . if (V234 == 9 | V234 == 8)
replace V236 = . if (V236 == 9 | V236 == 8)
replace V237 = . if (V237 == 9)
replace V238 = . if (V238 == 9 | V238 == 8)
replace V239 = . if (V239 == 9)
replace V240 = . if (V240 == 9)
replace V241 = . if (V241 == 9)
replace V242 = . if (V242 == 9)
replace V243 = . if (V243 == 9)
replace V244 = . if (V244 == 9)
replace V245 = . if (V245 == 9)
replace V246 = . if (V246 == 9)
replace V247 = . if (V247 == 9)
replace V248 = . if (V248 == 9)
replace V249 = . if (V249 == 9)
replace V250 = . if (V250 == 9)
replace V251 = . if (V251 == 9)
replace V252 = . if (V252 == 9)
replace V253 = . if (V253 == 999)
replace V255 = . if (V255 == 999)
replace V257 = . if (V257 == 999)
replace V271 = . if (V271 == 7 | V271 == 8 | V271 == 9)
replace V272 = . if (V272 >= 7 & V272 <= 9)
replace V273 = . if (V273 == 7 | V273 == 8 | V273 == 9)
replace V274 = . if (V274 == 7 | V274 == 8 | V274 == 9)
replace V275 = . if (V275 >= 7 & V275 <= 9)
replace V276 = . if (V276 == 7 | V276 == 8 | V276 == 9)
replace V277 = . if (V277 == 7 | V277 == 8 | V277 == 9)
replace V278 = . if (V278 >= 7 & V278 <= 9)
replace V279 = . if (V279 == 7 | V279 == 8 | V279 == 9)
replace V280 = . if (V280 == 7 | V280 == 8 | V280 == 9)
replace V281 = . if (V281 >= 7 & V281 <= 9)
replace V282 = . if (V282 == 7 | V282 == 8 | V282 == 9)
replace V283 = . if (V283 == 7 | V283 == 8 | V283 == 9)
replace V284 = . if (V284 >= 7 & V284 <= 9)
replace V285 = . if (V285 == 7 | V285 == 8 | V285 == 9)
replace V286 = . if (V286 == 7 | V286 == 8 | V286 == 9)
replace V287 = . if (V287 >= 7 & V287 <= 9)
replace V288 = . if (V288 == 7 | V288 == 8 | V288 == 9)
replace V289 = . if (V289 == 7 | V289 == 8 | V289 == 9)
replace V290 = . if (V290 >= 7 & V290 <= 9)
replace V291 = . if (V291 == 7 | V291 == 8 | V291 == 9)
replace V293 = . if (V293 >= 7 & V293 <= 9)
replace V294 = . if (V294 >= 7 & V294 <= 9)
replace V295 = . if (V295 >= 7 & V295 <= 9)
replace V296 = . if (V296 >= 7 & V296 <= 9)
replace V297 = . if (V297 >= 7 & V297 <= 9)
replace V298 = . if (V298 >= 7 & V298 <= 9)
replace V299 = . if (V299 == 9)
replace V301 = . if (V301 == 999)
replace V302 = . if (V302 == 7 | V302 == 9)
replace V303 = . if (V303 == 7 | V303 == 9)
replace V304 = . if (V304 == 7 | V304 == 9)
replace V305 = . if (V305 == 7 | V305 == 9)
replace V306 = . if (V306 == 7 | V306 == 9)
replace V307 = . if (V307 == 7 | V307 == 9)
replace V308 = . if (V308 == 7 | V308 == 9)
replace V309 = . if (V309 == 7 | V309 == 9)
replace V310 = . if (V310 == 7 | V310 == 9)
replace V311 = . if (V311 == 7 | V311 == 9)
replace V312 = . if (V312 == 7 | V312 == 9)
replace V313 = . if (V313 == 7 | V313 == 9)
replace V314 = . if (V314 == 7 | V314 == 9)
replace V315 = . if (V315 == 7 | V315 == 9)
replace V316 = . if (V316 == 7 | V316 == 9)
replace V317 = . if (V317 == 7 | V317 == 9)
replace V318 = . if (V318 == 9)
replace V319 = . if (V319 == 9)
replace V320 = . if (V320 == 9)
replace V321 = . if (V321 == 9)
replace V322 = . if (V322 == 9)
replace V323 = . if (V323 == 9)
replace V325 = . if (V325 == 9)
replace V326 = . if (V326 == 9 | V326 == 7)
replace V327 = . if (V327 == 9 | V327 == 7)
replace V328 = . if (V328 == 9 | V328 == 7)
replace V329 = . if (V329 == 7 | V329 == 9)
replace V331 = . if (V331 == 7 | V331 == 9)
replace V332 = . if (V332 == 9)
replace V333 = . if (V333 == 9)
replace V334 = . if (V334 == 9)
replace V335 = . if (V335 == 9)
replace V337 = . if (V337 == 9)
replace V347 = . if (V347 == 9)
replace V348 = . if (V348 == 8 | V348 == 9)
replace V350 = . if (V350 == 888)
replace V352 = . if (V352 == 888 | V352 == 999)
replace V354 = . if (V354 == 8888)
replace V355 = . if (V355 == 8888 | V355 == 9999)
replace V356 = . if (V356 == 888)
replace V357 = . if (V357 == 888)
replace V358 = . if (V358 == 9)
replace V359 = . if (V359 == 8888)
replace V360 = . if (V360 == 9)
replace V361 = . if (V361 == 9)
replace V362 = . if (V362 == 8888)
replace V363 = . if (V363 == 9)
replace V364 = . if (V364 == 9)
replace V365 = . if (V365 == 8888)
replace V366 = . if (V366 == 9)
replace V367 = . if (V367 == 9)
replace V369 = . if (V369 == 8888 | V369 == 9999)
replace V370 = . if (V370 == 9)
replace V371 = . if (V371 == 9)
replace V372 = . if (V372 == 8888)
replace V373 = . if (V373 == 9)
replace V374 = . if (V374 == 9)
replace V375 = . if (V375 == 8888 | V375 == 9999)
replace V376 = . if (V376 == 9)
replace V377 = . if (V377 == 9)
replace V378 = . if (V378 == 888 | V378 == 999)
replace V379 = . if (V379 == 9)
replace V380 = . if (V380 == 9)
replace V381 = . if (V381 == 8888 | V381 == 9999)
replace V382 = . if (V382 == 9)
replace V383 = . if (V383 == 9)
replace V385 = . if (V385 == 888)
replace V386 = . if (V386 == 9)
replace V388 = . if (V388 == 9)
replace V395 = . if (V395 == 7 | V395 == 9)
replace V396 = . if (V396 == 7 | V396 == 9)
replace V397 = . if (V397 == 7 | V397 == 9)
replace V398 = . if (V398 == 7 | V398 == 9)
replace V399 = . if (V399 == 7 | V399 == 9)
replace V400 = . if (V400 == 9)
replace V401 = . if (V401 == 9)
replace V402 = . if (V402 == 9)
replace V403 = . if (V403 == 9)
replace V404 = . if (V404 == 9)
replace V405 = . if (V405 == 9)
replace V406 = . if (V406 == 9)
replace V407 = . if (V407 == 9)
replace V408 = . if (V408 == 9)
replace V409 = . if (V409 == 9)
replace V410 = . if (V410 == 9)
replace V411 = . if (V411 == 9)
replace V412 = . if (V412 == 9)
replace V413 = . if (V413 == 9)
replace V414 = . if (V414 == 9)
replace V415 = . if (V415 == 9)
replace V416 = . if (V416 == 9)
replace V417 = . if (V417 == 9)
replace V418 = . if (V418 == 9)
replace V419 = . if (V419 == 9)
replace V420 = . if (V420 == 9)
replace V421 = . if (V421 == 9)
replace V422 = . if (V422 == 9)
replace V423 = . if (V423 == 9)
replace V424 = . if (V424 == 9)
replace V425 = . if (V425 == 9)
replace V426 = . if (V426 == 9)
replace V427 = . if (V427 == 9)
replace V428 = . if (V428 == 9)
replace V429 = . if (V429 == 9)
replace V430 = . if (V430 == 9)
replace V431 = . if (V431 == 9)
replace V432 = . if (V432 == 9)
replace V433 = . if (V433 == 9)
replace V434 = . if (V434 == 9)
replace V435 = . if (V435 == 9)
replace V436 = . if (V436 == 9)
replace V437 = . if (V437 == 9)
replace V438 = . if (V438 == 9)
replace V439 = . if (V439 == 9)
replace V440 = . if (V440 == 9)
replace V441 = . if (V441 == 9)
replace V442 = . if (V442 == 9)
replace V443 = . if (V443 == 7 | V443 == 9)
replace V444 = . if (V444 == 7 | V444 == 9)
replace V445 = . if (V445 == 9)
replace V446 = . if (V446 == 7 | V446 == 9)
replace V447 = . if (V447 == 7 | V447 == 9)
replace V448 = . if (V448 == 7 | V448 == 9)
replace V449 = . if (V449 == 7 | V449 == 9)
replace V450 = . if (V450 == 7 | V450 == 9)
replace V451 = . if (V451 == 7 | V451 == 9)
replace V452 = . if (V452 == 7 | V452 == 9)
replace V453 = . if (V453 == 7 | V453 == 9)
replace V462 = . if (V462 == 9)
replace V463 = . if (V463 == 9 | V463 == 8)
replace V464 = . if (V464 == 9)
replace V470 = . if (V470 == 7 | V470 == 9)
replace V471 = . if (V471 == 7 | V471 == 9)
replace V1F = . if (V1F == 9)


*/
/********************************************************************

 Section 5: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save `outfile', replace

