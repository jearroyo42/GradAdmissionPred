***Checking Distribution before standardlization******
histogram chanceofadmit, normal xtitle(Chance of Admit) title(Distribution of Chance of Admit)
histogram grescore, normal xtitle(Gre Score) title(Distribution of GRE)
histogram toeflscore, normal xtitle(TOELF Score) title(Distribution of Toelf Score)
histogram universityrating, normal xtitle(University Rating) title(Distribution of University Rating)
histogram cgpa, normal xtitle(College GPA) title(Distribution of College GPA)
histogram research, normal xtitle(Research) title(Distribution of Research)
histogram lor, normal xtitle(Letter of Recomendation) title(Distribution of Letter of Recommendation)
histogram sop, normal xtitle(Statement of Purpose) title(Distribution of Statement of Purpose)

***Checking Correlation before standardlized***
pwcorr chanceofadmit grescore toeflscore universityrating sop lor cgpa research 

*** summary statistics before standardlized***
summarize chanceofadmit grescore toeflscore universityrating sop lor cgpa research

*** regression before standardlized***
regress chanceofadmit grescore toeflscore universityrating sop lor cgpa research

**Standardlizing The whole data**
egen zgrescore = std(grescore)
egen ztoelfscore = std(toeflscore)
egen zuniversityrating = std(universityrating)
egen zcgpa = std(cgpa)
egen zresearch = std(research)
egen zlor = std(lor)
egen zsop = std(sop)
egen zchanceofadmit = std(chanceofadmit)


**Checking distrubtion after standardlization******
histogram zchanceofadmit, normal xtitle(Chance of Admit) title(Distribution of Standardlized Chance of Admit)
histogram zgrescore, normal xtitle(Gre Score) title(Distribution of Standardlized GRE)
histogram ztoelfscore, normal xtitle(TOELF Score) title(Distribution of Standardlized Toelf Score)
histogram zuniversityrating, normal xtitle(University Rating) title(Distribution of Standardlized University Rating)
histogram zcgpa, normal xtitle(College GPA) title(Distribution of Standardlized College GPA)
histogram zresearch, normal xtitle(Research) title(Distribution of Standardlized Research)
histogram zlor, normal xtitle(Letter of Recomendation) title(Distribution of Standardlized Letter of Recommendation)
histogram zsop, normal xtitle(Statement of Purpose) title(Distribution of Standardlized Statement of Purpose)

**Viewing Correlations to check if there is colinearity between the variables after standardlized***
pwcorr zgrescore ztoelfscore zcgpa zresearch zlor zchanceofadmit zsop zuniversityrating
**Summary Statistics**
summarize zgrescore ztoelfscore zcgpa zresearch zlor zchanceofadmit zsop zuniversityrating

**regession without interaction term***
regress zchanceofadmit zgrescore ztoelfscore zcgpa zresearch zlor zsop zuniversityrating

**regession with interaction***
gen greandresearch = zgrescore*zresearch
regress zchanceofadmit zgrescore ztoelfscore zcgpa zresearch zlor zsop zuniversityrating greandresearch

***Restricted***
regress  zchanceofadmit zgrescore zresearch zcgpa greandresearch zlor








