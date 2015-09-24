::call makeCoverletter.bat
call makeCV.bat
::call makeTeaching.bat
::call makeResearch.bat
call makePublications.bat
::call makeRepresentativePublications.bat
del *.aux
del *.out
del *.log
del *.bbl
del *.blg
del *.Rout
::pdftk SolymosCoverletter.pdf SolymosCV.pdf SolymosResearch.pdf SolymosTeaching.pdf SolymosRepresentativePublications.pdf cat output Solymos_UCBerkeley_2014.pdf
::pdftk Solymos_UdeM_2013.pdf Solymos_et_al_2013_MEE_QPAD_final.pdf Solymos_etal_2012_ENV_single-visit-N-mixture.pdf Solymos_Lele_2012_GEB_hsarx.pdf cat output Solymos_UCBerkeley_2014_final.pdf


::pdftk CCF12062014*.pdf cat output MathPracticeGrade3-4.pdf

cp SolymosCV.pdf c:\Users\Peter\Dropbox\Public\SolymosCV.pdf
cp SolymosPublications.pdf c:\Users\Peter\Dropbox\Public\SolymosPublications.pdf
