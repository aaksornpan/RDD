* Reload experimental group data
use https://github.com/scunning1975/mixtape/raw/master/nsw_mixtape.dta, clear
drop if treat==0

* Now merge in the CPS controls from footnote 2 of Table 2 (Dehejia and Wahba 2002)
append using https://github.com/scunning1975/mixtape/raw/master/cps_mixtape.dta
gen agesq=age*age
gen agecube=age*age*age
gen educsq=educ*educ
gen educcube=educ*educ*educ
gen u74 = 0 if re74!=.
replace u74 = 1 if re74==0
gen u75 = 0 if re75!=.
replace u75 = 1 if re75==0
gen educ_re74 = educ*re74
gen re74sq=re74^2
gen re75sq=re75^2
gen hisp_u74 = u74*hisp
