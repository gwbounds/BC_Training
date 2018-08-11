/*	PROLOG #####################################################################

	PROJECT: PRE-POST EVALUATION OF BREAST CANCER AWARENESS TRAINING
	PURPOSE: LABEL, MERGE, CLEAN DATA FOR ANALYSIS, ANALYSIS
	DATA:	 TRAINING_2017-18_PRE-TEST, TRAINING_2017-18_POST-TEST
	AUTHOR:	 GREGORY BOUNDS
	CREATED: DECEMBER 28, 2017
	LATEST:	 AUGUST 10, 2018
	NOTES:	 For coding2share project. Pre / post analysis based on ongoing 
			 evaluation of breast cancer training program in Texas for 
			 immigrant women.

	PROLOG ###################################################################*/

use TRAINING_2017-18_PRE-TEST,clear


rename (idnumber gender age marital children_under18 yrs_living_in_US ///
	educationlevel employment annual_income living_situation religion ///
	past_12months_stress past_12months_groupsorg MachSong ///
	newspapers_magazines tv radio internet hc_practitioners churches_temples ///
	BPSOS notBPSOS_HF notBPSOSworkshops other_comnty_org ///
	family_friends_cowkrs others heardBC gettingolder familyhist ///
	latemenopause latechildbirth nevergivebirth_breastfeed chestradiation ///
	overweight hormreplcmt_contraceptive alcohol exercise ///
	VN_USwomen_lessrisk at__riskBC BSE howoften_BSE BSE_last30days ///
	BSE_nextmonth  heardofmamm hadmamm lastmamm ///
	mamm_nxt12months BSE_timeconsuming VNwoman_embarrassing ///
	breastremoved_notwoman BC_cannotbemother BSE_confident ///
	afraid_mamm_radiation SBE_perdoctor mamm_perdoctor healthins ///
	familydoc lastannualcheck) ///
(uid gender age marital children_under18 yrs_living_in_US education_level ///
	employment annual_income living_situation religion past_12months_stress ///
	past_12months_groupsorg MachSong newspapers_magazines tv radio internet ///
	hc_practitioners churches_temples BPSOS notBPSOS_HF notBPSOS_workshops ///
	other_comnty_org family_friends_cowkrs others heard_BC getting_older ///
	family_hist late_menopause late_childbirth never_give_birth_breastfeed ///
	chest_radiation overweight hormreplcmt_contraceptive alcohol exercise ///
	VN_US_women_lessrisk at__risk_BC BSE how_often_BSE BSE_last30days ///
	BSE_next_month heard_of_mamm had_mamm last_mamm ///
	mamm_next_12months BSE_timeconsuming VN_woman_embarrassing ///
	breast_removed_not_woman BC_cannot_be_mother BSE_confident ///
	afraid_mamm_radiation SBE_perdoctor mamm_perdoctor health_ins  ///
	family_doc last_annual_check)


//loop creates a prefix for all comparison pre-questions 
foreach var of varlist  heard_BC getting_older family_hist late_menopause ///
	late_childbirth never_give_birth_breastfeed chest_radiation overweight ///
	hormreplcmt_contraceptive alcohol exercise VN_US_women_lessrisk ///
	at__risk_BC how_often_BSE BSE_next_month mamm_next_12months ///
	BSE_timeconsuming VN_woman_embarrassing breast_removed_not_woman ///
	BC_cannot_be_mother BSE_confident afraid_mamm_radiation SBE_perdoctor ///
	mamm_perdoctor {
		rename `var' pre_`var'
}



labvars ///
	uid "ID" ///
	gender "Gender" ///
	age "Age" ///
	marital "Marital Status" ///
	children_under18 "Children under 18" ///
	yrs_living_in_US "Years living in the US" ///
	education_level	 "Education Level" ///
	employment "Employment Status" ///
	annual_income "Income" ///
	living_situation "Living situtation" ///
	religion "Religion" ///
	past_12months_stress ///
	"Past 12 months how worried about money to pay rent" ///
	past_12months_groupsorg "Past 12 months participated in any organizations" ///
	MachSong "Match Song newspaper" ///
	newspapers_magazines "Newspapers" ///
	tv "TV"  ///
	radio "Radio" ///
	internet "The internet"  ///
	hc_practitioners "Health care practicitioners" ///
	churches_temples "Churches or temples" ///
	BPSOS "BPSOS" ///
	notBPSOS_HF "Health fairs not by BPSOS" ///
	notBPSOS_workshops	 "Health workshops not by BPSOS" ///
	other_comnty_org "Other community orgnizations or groups" ///
	family_friends_cowkrs "Family, friends, or coworkers" ///
	others "Others" ///
	pre_heard_BC "Have you heard of breast cancer?" ///
	pre_getting_older "Getting older" ///
	pre_family_hist  "Family history"     ///    
	pre_late_menopause "Starts menopause later than most women" ///
	pre_late_childbirth "Being older than most women at the birth of first child" ///
	pre_never_give_birth_breastfeed "Never gives birth or never breastfeeds" ///
	pre_chest_radiation "Having radiation therapy to the chest or breasts" ///
	pre_overweight "Over-weight" ///
	pre_hormreplcmt_contraceptive "Long-term use of hormone replacement therapy or oral contraceptive pills" ///
	pre_alcohol "Drinking alcohol" ///
	pre_exercise "Do not exercise regularly" ///
	pre_VN_US_women_lessrisk "VN women in US at risk of BC"  ///
	pre_at__risk_BC "You at risk of BC" ///
	BSE "Heard of BSE?" ///
	pre_how_often_BSE "How often BSE?" ///
	BSE_last30days "BSE in last 30 days?" ///
	pre_BSE_next_month "Intend to do BSE in next month" ///
	heard_of_mamm "Heard of mammogram?" ///
	had_mamm "Ever had mammogram?" ///
	last_mamm "How long ago last mammogram?" ///
	pre_mamm_next_12months "Intend to have mammogram in next 12 months" ///
	pre_BSE_timeconsuming "BSE time consuming" ///
	pre_VN_woman_embarrassing "Embarassing for VN woman to get breast exam" ///
	pre_breast_removed_not_woman "If woman has masectomy, no longer a woman" ///
	pre_BC_cannot_be_mother "Cannot really be mother if she has BC" ///
	pre_BSE_confident "Confident to perform BSE" ///
	pre_afraid_mamm_radiation "Afraid of radiation from mammogram" ///
	pre_SBE_perdoctor "If doctor recommends, will do BSE" ///
	pre_mamm_perdoctor "If doctor recommends, will get mammogram" ///
	health_ins "Health insurance" ///
	family_doc "Have a family doctor" ///
	last_annual_check "Last annual checkup?" ///
	,alternate



tempfile pre //saving pre as tempfile
save `pre'


use TRAINING_2017-18_POST-TEST,clear


//renaming default names
rename (idnumber heardBC gettingolder familyhist latemenopause ///
	latechildbirth nevergivebirth_breastfeed chestradiation overweight ///
	hormreplcmt_contraceptive alcohol exercise VN_USwomen_lessrisk ///
	at__riskBC howoften_BSE BSE_nextmonth mamm_nxt12months BSE_timeconsuming ///
	VNwoman_embarrassing breastremoved_notwoman BC_cannotbemother ///
	BSE_confident afraid_mamm_radiation SBE_perdoctor mamm_perdoctor  ///
	) ///
(uid heard_BC getting_older family_hist late_menopause late_childbirth ///
	never_give_birth_breastfeed chest_radiation overweight ///
	hormreplcmt_contraceptive alcohol exercise VN_US_women_lessrisk ///
	at__risk_BC how_often_BSE  BSE_next_month mamm_next_12months ///
	BSE_timeconsuming VN_woman_embarrassing breast_removed_not_woman ///
	BC_cannot_be_mother BSE_confident afraid_mamm_radiation SBE_perdoctor ///
	mamm_perdoctor ///
	)

*this loop creates a prefix for all the post- questions
foreach var of varlist  heard_BC getting_older family_hist late_menopause ///
	late_childbirth never_give_birth_breastfeed chest_radiation overweight ///
	hormreplcmt_contraceptive alcohol exercise VN_US_women_lessrisk ///
	at__risk_BC how_often_BSE BSE_next_month mamm_next_12months ///
	BSE_timeconsuming VN_woman_embarrassing breast_removed_not_woman ///
	BC_cannot_be_mother BSE_confident afraid_mamm_radiation SBE_perdoctor ///
	mamm_perdoctor {
		rename `var' post_`var'
}


//labeling
labvars ///
	post_heard_BC "Have you heard of breast cancer?" ///
	post_getting_older "Getting older" ///
	post_family_hist  "Family history"     ///    
	post_late_menopause "Starts menopause later than most women" ///
	post_late_childbirth "Being older than most women at the birth of first child" ///
	post_never_give_birth_breastfeed "Never gives birth or never breastfeeds" ///
	post_chest_radiation "Having radiation therapy to the chest or breasts" ///
	post_overweight "Over-weight" ///
	post_hormreplcmt_contraceptive "Long-term use of hormone replacement therapy or oral contraceptive pills" ///
	post_alcohol "Drinking alcohol" ///
	post_exercise "Do not exercise regularly" ///
	post_VN_US_women_lessrisk "VN women in US at risk of BC"  ///
	post_at__risk_BC "You at risk of BC" ///
	post_how_often_BSE "How often BSE?" ///
	post_BSE_next_month "Intend to do BSE in next month" ///
	post_mamm_next_12months "Intend to have mammogram in next 12 months" ///
	post_BSE_timeconsuming "BSE time consuming" ///
	post_VN_woman_embarrassing "Embarassing for VN woman to get breast exam" ///
	post_breast_removed_not_woman "If woman has masectomy, no longer a woman" ///
	post_BC_cannot_be_mother "Cannot really be mother if she has BC" ///
	post_BSE_confident "Confident to perform BSE" ///
	post_afraid_mamm_radiation "Afraid of radiation from mammogram" ///
	post_SBE_perdoctor "If doctor recommends, will do BSE" ///
	post_mamm_perdoctor "If doctor recommends, will get mammogram" ///
,alternate

tempfile post //saving post as tempfile
save `post'

*merging
use `pre', clear
merge 1:1 uid using `post'
drop if _merge<3
drop  _merge


//value labeling
//labels
label define q1 1 "Male" 2 "Female"
label define q3 1 "Married" 2 "Divorced, separated, or widowed" ///
3 "Never married"
label define q7 1 "Full-time employed for wages" ///
2 "Part-time employed for wages" 3 "Self-employed" 4 "Unemployed" ///
5 "A homemaker" 6 "A student" 7 "Retired" 8 "Unable to work/Disabled"
label define q8 1 "Less than $25,000" 2 "Between $25,000 and $50,000" ///
3 "Between $50,000 and $75,000" 4 "More than $75,000"
label define q9 1 "Own" 2 "Rent" 3 "Other"
label define q10 1 "Catholic" 2 "Buddhist" 3 "Protestant" 4 "Other" ///
5 "No religion"
label define q11 1 "Always" 2 "Usually" 3 "Sometimes" 4 "Rarely" ///
5 "Never / Don't have to pay rent / mortgage"
label define yn 1 "Yes" 2 "No"
label define risk 1 "No risk at all" 2 "Little risk" 3 "Some risk" ///
4 "Moderate risk" 5 "High risk" 
label define often 1 "Every month" 2 " Every few months" 3 "Every year" ///
4 "Other"
label define longago 1 "Within the last 12 months" ///
2 "More than a year but <2 years ago" 3 "More than 2 years ago"
label define agree 1 "Agree" 2 "Neither agree nor disagree" 3 "Disagree" 

//assigning labels
//lazy assigning of variables by using generic label names to cylcle through
local l = 1
foreach var of varlist gender age marital children_under18 yrs_living_in_US ///
	education_level employment annual_income living_situation religion ///
	past_12months_stress {
		capture label values `var' q`l'
		local l = `l' + 1
}


foreach var of varlist past_12months_groupsorg MachSong newspapers_magazines ///
	tv radio internet hc_practitioners churches_temples BPSOS notBPSOS_HF ///
	notBPSOS_workshops other_comnty_org family_friends_cowkrs others ///
	pre_heard_BC pre_getting_older pre_family_hist pre_late_menopause ///
	pre_late_childbirth pre_never_give_birth_breastfeed pre_chest_radiation ///
	pre_overweight pre_hormreplcmt_contraceptive pre_alcohol pre_exercise BSE ///
	BSE_last30days pre_BSE_next_month heard_of_mamm had_mamm ///
	pre_mamm_next_12months family_doc post_heard_BC post_getting_older ///
	post_family_hist post_late_menopause post_late_childbirth ///
	post_never_give_birth_breastfeed post_chest_radiation post_overweight ///
	post_hormreplcmt_contraceptive post_alcohol post_exercise  ///
	post_BSE_next_month {
		label values `var' yn
}

foreach var of varlist pre_VN_US_women_lessrisk pre_at__risk_BC ///
	post_VN_US_women_lessrisk post_at__risk_BC{
		label values `var' risk
}

foreach var of varlist pre_how_often_BSE post_how_often_BSE {
	label values `var' often
}

foreach var of varlist last_mamm last_annual_check {
	label values `var' longago
}


foreach var of varlist pre_BSE_timeconsuming pre_VN_woman_embarrassing ///
	pre_breast_removed_not_woman pre_BC_cannot_be_mother pre_BSE_confident ///
	pre_afraid_mamm_radiation pre_SBE_perdoctor pre_mamm_perdoctor ///
	post_VN_woman_embarrassing post_breast_removed_not_woman ///
	post_BC_cannot_be_mother post_BSE_confident post_afraid_mamm_radiation ///
	post_SBE_perdoctor post_mamm_perdoctor {
		label values `var' agree
}

//assign missing / don't know labels to all labels
label dir
foreach lab in `r(names)' {
	label define `lab' 99 "Missing", modify
	label define `lab' 88 "Don't know / Not sure", modify
}



//demographic descriptives
foreach var of varlist gender marital    employment annual_income ///
	living_situation religion past_12months_stress past_12months_groupsorg ///
	MachSong newspapers_magazines tv radio internet hc_practitioners ///
	churches_temples BPSOS notBPSOS_HF notBPSOS_workshops other_comnty_org ///
	family_friends_cowkrs others {
		tab `var' if `var'<88 //ignore don't know /missing
}
foreach var of varlist age children_under18 yrs_living_in_US education_level {
	sum `var' if `var'<88 //ignore don't know /missing
}

//pre-post analysis
local tests heard_BC getting_older family_hist late_menopause ///
late_childbirth never_give_birth_breastfeed chest_radiation overweight ///
hormreplcmt_contraceptive alcohol exercise VN_US_women_lessrisk at__risk_BC ///
how_often_BSE  BSE_next_month  mamm_next_12months BSE_timeconsuming ///
VN_woman_embarrassing breast_removed_not_woman BC_cannot_be_mother ///
BSE_confident afraid_mamm_radiation SBE_perdoctor mamm_perdoctor

foreach p in `tests' {
	ttest pre_`p' = post_`p' if pre_`p'<88 & post_`p'<88 //ignore don't know /missing
}

//how often BSE for participants aware of BSE
tab pre_how_often_BSE if BSE ==1
tab post_how_often_BSE if BSE ==1

//BSE in last 30 days if aware of BSE
tab BSE_last30days if BSE==1

//confidence in BSE among those who had heard
tab pre_BSE_confident if BSE==1
tab post_BSE_confident if BSE==1


