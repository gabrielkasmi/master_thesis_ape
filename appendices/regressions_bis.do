**** Regressions, bis

*** suivent l'ordre chronologique du mémoire

** pour mémoire, spécifications de base:

**************************
*Com
xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)


*Hem
xtreg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)


**************************

** par cohérence, mêmes conditions dans les deux cas

**TESTS AVEC L'UNE OU LAUTRE DES MAJORITES (TABLE 1)
xtreg pres_com maj_1 cumul_exec cumul_1 i.com i.session i.legis age age2 i.nb_mdt exp i.groupe circ_dist if poste==1 & constit==1 & legis!=2 & GRP1==2, fe cl(num)
estimates store comparaison_com_psmaj, title( (1) )
xtreg pres_com maj_1 cumul_exec cumul_1 i.com i.session i.legis age age2 i.nb_mdt exp i.groupe circ_dist if poste==1 & constit==1 & legis!=2 & GRP2==2, fe cl(num)
estimates store comparaison_com_umpmaj,title( (2) )

xtreg pres_h maj_1 cumul_1 cumul_exec hauteur i.travee i.group_size i.session i.legis i.president age age2 i.nb_mdt exp i.groupe i.h_type distance_grp dist_ave circ_dist i.legis##i.groupe if bureau!=1 & legis!=2 & poste==1 & president==1 & GRP1==2, fe cluster(num)
estimates store comparaison_hem_psmaj,title( (3) )
xtreg pres_h maj_1 cumul_1 cumul_exec hauteur i.travee i.group_size i.session i.legis i.president age age2 i.nb_mdt exp i.groupe i.h_type distance_grp dist_ave circ_dist i.legis##i.groupe if bureau!=1 & legis!=2 & poste==1 & president==1 & GRP2==2, fe cluster(num)
estimates store comparaison_hem_umpmaj,title( (4) )

esttab comparaison_com_psmaj comparaison_com_umpmaj comparaison_hem_psmaj comparaison_hem_umpmaj using test_majorites.tex, se(a4) b(a4) r2(a4) nomtitles mgroups("Committee" "Hemicycle", pattern(1 0 1 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) booktabs indicate("Controls=age age2") keep(maj_1) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}") replace


**TESTS CONSTITS (TABLE 2)
//** attention, à ne faire que sur la 13e législature !

*** commission 
xtreg pres_com constit1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis==3 & GRP3==2 , fe cl(num)
estimates store constit1, title ("Committee")
xtreg pres_com constit1 constit1Xmaj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis==3 & GRP3==2 , fe cl(num)
estimates store constit2
xtreg pres_com constit1 constit1Xmaj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist group_rest if bureau==. & poste==1 & president==1 & legis==3 & GRP3==2 & margin2==1, fe cl(num)
estimates store constit3
*sur tout l'échantillon
xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store constit4
xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist group_rest2 if bureau==. & poste==1 & president==1 & legis!=2 & GRP3==2 , fe cl(num)
estimates store constit5

*** hémicycle
xtreg pres_h constit2 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis==3 & GRP3==2 , fe cl(num)
estimates store constit6, title ("Hemicycle")
xtreg pres_h constit2 constitXmaj age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis==3 & GRP3==2 , fe cl(num)
estimates store constit7
xtreg pres_h constit2 constitXmaj age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis==3 & GRP3==2 & margin==1 , fe cl(num)
estimates store constit8
xtreg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store constit9
xtreg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest2 if bureau==. & poste==1 & president==1 & legis!=2 & GRP3==2 , fe cl(num)
estimates store constit10

**cutoff = margin, à inclure aussi dedans

esttab constit1 constit2 constit3 constit4 constit5  constit6 constit7 constit8 constit9 constit10 using testconstit_tex.tex, se(a4) b(a4) r2(a4)nomtitles mgroups("Committee" "Hemicycle", pattern(1 0 0 0 0 1 0 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) booktabs indicate( "Cutoff=group_rest" "Restriction=group_rest2" "Controls=age age2") keep(maj_1 constit1 constit1Xmaj_1 constit2 constitXmaj) varlabels(constit1 "Constit1" constit2 "Constit2") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}") replace

**** DISTRIBUTION DES ROLES EN COMMISSION (table 3) 
latab poste maj_1 if constit==1 & legis!=2 & GRP3==2, tf(essai_flek2.tex)

*** Résultats 

** Table de résultats avec tous les mécanismes de la partie 1 

** partie commission 

**/ Baseline equation 
xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store baseline_com

**/ Mécanisme explicatif 

** 2 mécanismes : affinitaire et influence
** mécanisme affinitaire 

*** 1 tester avec la commission des finances

*1. établir le fait que les présidents de commission de la com des finances sont de l'opposition 

xtreg pres_com maj_1 maj_1Xfin fin age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store fin_pres_com

*problème : commission des finances particulière et assez importante, donc rien à en attendre - effectivement, rien de significatif
* sorte d'instrument, voir le niveau de majorité chez les vice présidents / dans le bureau

latab maj_1 com if poste==6 & legis==3, tf(vp_com_13) col ncom dec(2)
latab maj_1 com if poste==6 & legis==1, tf(vp_com_14) col ncom dec(2)

** définition du score, dans l'absolu et en relatif 
*** interprétation à clarifier et à expliciter

gen vp_maj_ratio=0
replace vp_maj_ratio=1 if com==1 & legis==3
replace vp_maj_ratio=1 if com==2 & legis==3
replace vp_maj_ratio=0 if com==3 & legis==3
replace vp_maj_ratio=0.66947368 if com==4 & legis==3
replace vp_maj_ratio=0.55591168 if com==5 & legis==3
replace vp_maj_ratio=0 if com==6 & legis==3
replace vp_maj_ratio=1 if com==7 & legis==3
replace vp_maj_ratio=0.63624637 if com==8 & legis==3
replace vp_maj_ratio=0.60306501 if com==9 & legis==3
replace vp_maj_ratio=0.90600994 if com==10 & legis==3

replace vp_maj_ratio=. if com==1 & legis==1
replace vp_maj_ratio=. if com==2 & legis==1
replace vp_maj_ratio=0.49702587 if com==3 & legis==1
replace vp_maj_ratio=0.48275862 if com==4 & legis==1
replace vp_maj_ratio=0.33237658 if com==5 & legis==1
replace vp_maj_ratio=0.53796837 if com==6 & legis==1
replace vp_maj_ratio=0.61307599 if com==7 & legis==1
replace vp_maj_ratio=1 if com==8 & legis==1
replace vp_maj_ratio=0.68725033 if com==9 & legis==1
replace vp_maj_ratio=0.67275494 if com==10 & legis==1


gen vp_maj_moy=0
replace vp_maj_moy=0.61634978 if legis==3
replace vp_maj_moy=0.59326073 if legis==1

replace vp_maj_ratio=vp_maj_ratio*100
replace vp_maj_moy=vp_maj_moy*100
gen maj_1Xvp_maj_dev=maj_1*vp_maj_dev

xtreg pres_com maj_1 maj_1Xvp_maj_dev vp_maj_dev age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store affinite_com

**support pour un mécanisme affinitaire, effet de groupe, voir l'effet sur les autres outcomes ensuite

** effet du cycle électoral: rien de probant
xtreg pres_com maj_1 time_elapsed time2div100 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store cycle_elec_com
**tout combiner
xtreg pres_com maj_1 maj_1Xvp_maj_dev vp_maj_dev age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store total_com

*sortie des résultats

esttab baseline_com fin_pres_com affinite_com cycle_elec_com total_com using commissions_presence.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles mgroups("Dependent variable: attendance", pattern(1 0 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Compulsory only = obligatoire" "Controls=age age2") keep(maj_1 maj_1Xfin fin maj_1Xvp_maj_dev vp_maj_dev time_elapsed time2div100) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace

**partie intensité 

*** dep var: participation
xtreg participation maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store participation_com_1
xtreg participation maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist i.com_group_size blind_control if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store participation_com_2
xtreg participation maj_1 vp_maj_dev maj_1Xvp_maj_dev age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist i.com_group_size blind_control if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store participation_com_3
xtreg participation maj_1 vp_maj_dev maj_1Xvp_maj_dev age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist i.com_group_size obligatoire blind_control if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store participation_com_4

**dep var: log_c_inter
xtreg log_c_inter maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store log_c_inter_com_1
xtreg log_c_inter maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist i.com_group_size blind_control if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store log_c_inter_com_2
xtreg log_c_inter maj_1 vp_maj_dev maj_1Xvp_maj_dev age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist i.com_group_size blind_control if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store log_c_inter_com_3
xtreg log_c_inter maj_1 vp_maj_dev maj_1Xvp_maj_dev age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist i.com_group_size obligatoire blind_control if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store log_c_inter_com_4

** résultats
esttab participation_com_1 participation_com_2 participation_com_3 participation_com_4 log_c_inter_com_1 log_c_inter_com_2 log_c_inter_com_3 log_c_inter_com_4 using commissions_implication.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles  mgroups("Dep. var.: participation" "Dep. var.: log of interventions", pattern(1 0 0 0 1 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Group size = blind_control" "Compulsory only = obligatoire" "Controls = age age2") keep(maj_1 maj_1Xvp_maj_dev vp_maj_dev) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace

**** fin commissions 

********************************************************************************
********************************************************************************
********************************************************************************

** Preliminary hemicycle, impact président et bureau

**partie hémicycle 

*Baseline equation 
xtreg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store base_hemicycle
xtreg pres_h maj_1 maj_1Xlois lois age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store lois_hem_1
xtreg pres_h maj_1 maj_1Xqag qag age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store qag_hem_1
**questions : effet des questions seules
xtreg pres_h maj_1 maj_1Xquestion question age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store qag_hem_2
**lois :
xtreg pres_h maj_1 maj_1Xamendement maj_1Xrapporteur amendement rapporteur age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store lois_hem_2
** dernière régression: évolution au cours du temps

xtreg pres_h maj_1 time_elapsed time2div100 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store time_hem

esttab base_hemicycle lois_hem_1 lois_hem_2 qag_hem_1 qag_hem_2 time_hem using hemicycle_prisesparole.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles  mgroups("" "Laws" "Quesions" "", pattern(1 1 0 1 0 1) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Group restriction = group_rest") keep(maj_1 maj_1Xlois lois maj_1Xqag qag maj_1Xamendement maj_1Xrapporteur amendement rapporteur maj_1Xquestion question time_elapsed time2div100) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace

** hémicycle et tribune
xtreg log_long maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store log_inter1

*lors des débats législatifs
xtreg log_long maj_1 age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 &h_type==1 , fe cl(num)
estimates store log_inter2
*débats législatifs avec interactions 
xtreg log_long maj_1 maj_1Xamendement maj_1Xrapporteur amendement rapporteur age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 &h_type==1 , fe cl(num)
estimates store log_inter3

*lors des qag
xtreg log_long maj_1 age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 &h_type==2 , fe cl(num)
estimates store log_inter4

*avec les interactions
xtreg log_long maj_1 maj_1Xquestion question age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 &h_type==2 , fe cl(num)
estimates store log_inter5

** avec un changement de variable = tribune
xtreg tribune maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store tribune1

*lors des débats législatifs
xtreg tribune maj_1 age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 &h_type==1 , fe cl(num)
estimates store tribune2
*débats législatifs avec interactions -- majorité qui défend des amendements: utilisent moins les amendements pour avoir du temps de parole
xtreg tribune maj_1 maj_1Xamendement maj_1Xrapporteur amendement rapporteur age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur group_rest i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 &h_type==1 , fe cl(num)
estimates store tribune3

*lors des qag
xtreg tribune maj_1 age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 &h_type==2 , fe cl(num)
estimates store tribune4

*avec les interactions
xtreg tribune maj_1 maj_1Xquestion question age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size group_rest i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 &h_type==2 , fe cl(num)
estimates store tribune5

esttab log_inter1 log_inter2 log_inter3 log_inter4 log_inter5 tribune1 tribune2 tribune3 tribune4 tribune5 using hemicycle_intensites.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles  mgroups("Dep. var.: log interventions" "Dep. var.: more than 1,000 words" "", pattern(1 0 0 0 0 1 0 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Meeting restriction = group_rest") keep(maj_1 maj_1Xamendement maj_1Xrapporteur amendement rapporteur maj_1Xquestion question) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace

** pattern of specialization
xtreg amendement maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1 , fe cl(num)
estimates store amend_hem
xtreg rapporteur maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & h_type==1 &constit_h==1 & GRP3==2 , fe cl(num)
estimates store rapport_hem
xtreg question maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 &h_type==2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store question_hem

esttab amend_hem rapport_hem question_hem using hemicycle_pattern.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles  mgroups("Amendements" "Rapporteur" "Questions", pattern(1 1 1) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Controls = age age2") keep(maj_1 ) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace


*fin hémicyle

*** passer aux divers

*** CHECKS 
** False majority 
gen value=.
forvalues i=1/917{
gen alea=runiform()*100
replace value=alea if id0==`i'
drop alea
}

gen false_maj=0

replace false_maj=1 if value<=48.722628
drop value

**** Falsification tables 4 & 8

*table 4

gen falseXfin=false_maj*fin
gen falseXvp_maj=false_maj*vp_maj_dev

xtreg pres_com false_maj age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store false_com1
xtreg pres_com false_maj falseXfin fin age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store false_com2
xtreg pres_com false_maj falseXvp_maj vp_maj_dev age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store false_com3
xtreg pres_com false_maj time_elapsed time2div100 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store false_com4
xtreg pres_com false_maj falseXvp_maj vp_maj_dev age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store false_com5

esttab false_com1 false_com2 false_com3 false_com4 false_com5 using commissions_falsification.tex,se(a4) b(a4) r2(a4) booktabs nodep nomtitles mgroups("Dependent variable: attendance", pattern(1 0 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Compulsory only = obligatoire" "Controls=age age2") keep(false_maj falseXfin fin falseXvp_maj vp_maj_dev time_elapsed time2div100) varlabels(false_maj "False Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace

*table 8 

gen falseXlois=false_maj*lois
gen falseXqag=false_maj*qag
gen falseXamendement=false_maj*amendement
gen falseXrapporteur=false_maj*rapporteur
gen falseXquestion=false_maj*question


xtreg pres_h false_maj age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store false_h1
xtreg pres_h false_maj falseXlois lois age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store false_h2
xtreg pres_h false_maj falseXqag qag age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store false_h3
xtreg pres_h false_maj falseXquestion question age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store false_h4
xtreg pres_h false_maj falseXamendement falseXrapporteur amendement rapporteur age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store false_h5
xtreg pres_h false_maj time_elapsed time2div100 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store false_h6

esttab false_h1 false_h2 false_h5 false_h3 false_h4 false_h6 using hemicycle_falsification.tex,  se(a4) b(a4) r2(a4) booktabs nodep nomtitles  mgroups("" "Laws" "Questions" "", pattern(1 1 0 1 0 1) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Meeting type restriction = group_rest") keep(false_maj falseXlois lois falseXamendement falseXrapporteur amendement rapporteur falseXqag qag falseXquestion question time_elapsed time2div100) varlabels(false_maj "False Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace


**time effects : concern if interaction between time and parties - fixed faire la table
xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store base_timecom
xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist i.legis##i.groupe group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store control_timecom
xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp group_rest i.groupe i.groupe##i.legis  c.circ_dist threshold if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & threshold==1, fe cl(num)
estimates store control_threscom

xtreg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store base_timehem
xtreg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.legis##i.groupe group_rest i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store control_timehem
xtreg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.groupe##i.legis i.cumul_1 i.cumul_exec c.hauteur group_rest i.travee dist_ave threshold if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & threshold==1 , fe cl(num)
estimates store control_threshem

esttab base_timecom control_timecom control_threscom base_timehem control_timehem control_threshem using time_trends.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles mgroups("Committees" "Hemicycle", pattern(1 0 0 1 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("TimeXGroup control = group_rest" "Session restriction=" "Controls=age age2") keep(maj_1) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace


** TIME 3 focusing around the threshold
xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)

xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe i.groupe##i.legis  c.circ_dist group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & threshold==1, fe cl(num)

xtreg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)

xtreg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.groupe##i.legis i.cumul_1 i.cumul_exec c.hauteur group_rest i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & threshold==1 , fe cl(num)


** Checking for overrejection - faire tourner les deux spéficiations de base 100 fois chacune et voir ce que ça donne en termes de rejection rate

gen REJECT_C=0
gen REJECT_H=0

forvalues j=1/100{

gen value=.
forvalues i=1/917{
gen alea=runiform()*100
replace value=alea if id0==`i'
drop alea
}

gen false_maj_`j'=0

replace false_maj_`j'=1 if value<=48.722628
drop value

quietly xtreg pres_com false_maj_`j' age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
replace REJECT_C=REJECT_C+1 if (_b[false_maj_`j']/_se[false_maj_`j']>1.96)|(_b[false_maj_`j']/_se[false_maj_`j']<(-1.96))
quietly xtreg pres_h false_maj_`j' age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
replace REJECT_H=REJECT_H+1 if (_b[false_maj_`j']/_se[false_maj_`j']>1.96)|(_b[false_maj_`j']/_se[false_maj_`j']<(-1.96))

drop false_maj_`j'

}

gen reject_c=REJECT_C/100
gen reject_h=REJECT_H/100

display reject_c
display reject_h

/** 
Valeurs à reporter ici :
Taux de rejet avec un faux traitement pour la commission : .06
Taux de rejet avec un faux traitement pour l'hémicycle : .04
**/


** alternative models : faire tourner les équations 1 & 2 avec d'autres modèles

*base spec FE 
xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store fe_com, title("FE")
xtreg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store fe_hem, title("FE")
* spec POLS
reg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , cl(num)
estimates store pols_com, title("OLS")
reg pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , cl(num)
estimates store pols_hem, title("OLS")

*spec PROBIT
xtprobit pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2
estimates store probit_com
xtprobit pres_h maj_1 age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2
estimates store probit_hem



esttab fe_com pols_com probit_com fe_hem pols_hem probit_hem using alternative_models.tex, se(a4) b(a4) r2(a4) booktabs nomtitles nodep mgroups("Committees" "Hemicycle", pattern(1 0 0 1 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Specification=group_rest" "Controls=age age2" ) keep(maj_1) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace



** summary statistics

quietly estpost sum age sex exp total_exp nb_mdt cumul_exec cumul_1 po_delib_m parachute circ_pop, detail
esttab . using sumstat.tex, cells(" count mean sd min p50 max") noobs

quietly estpost sum maj_1 amendement rapporteur question pres_com participation log_c_inter pres_h log_long tribune, detail
esttab . using sumstat2.tex, cells(" count mean sd min p50 max") noobs



**** differential effects

** committee

xtreg pres_com maj_1 age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)

*differential effects of sex, political color, cumul, age and exp on attendance

xtreg pres_com maj_1 maj_1Xsexe sexe age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
xtreg pres_com maj_1 maj_1Xleft left age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
xtreg pres_com maj_1 maj_1Xcumul_exec cumul_exec age age2 cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
xtreg pres_com maj_1 maj_1Xage age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
xtreg pres_com maj_1 maj_1Xexp exp age age2 cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)

**all effects
xtreg pres_com maj_1 maj_1Xsexe maj_1Xleft maj_1Xcumul_exec maj_1Xage maj_1Xexp sexe left cumul_exec age exp i.com i.session i.legis i.nb_mdt i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)


*differential effects on participation

*committees 

** attendance

*all
xtreg pres_com maj_1 maj_1Xsexe sexe age age2 i.cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff1
xtreg pres_com maj_1 maj_1Xcumul_exec cumul_exec age age2 cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff3
xtreg pres_com maj_1 maj_1Xcumul_exec maj_1Xsexe maj_1XcumulXsexe sexeXexec cumul_exec sexe age age2 cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff5


*obligatoire
xtreg pres_com maj_1 maj_1Xsexe sexe age age2 i.cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff2
xtreg pres_com maj_1 maj_1Xcumul_exec cumul_exec age age2 cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff4
xtreg pres_com maj_1 maj_1Xcumul_exec maj_1Xsexe maj_1XcumulXsexe  sexeXexec cumul_exec sexe age age2 cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff6


esttab com_diff1 com_diff2 com_diff3 com_diff4 com_diff5 com_diff6 using differentiel_com.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles mgroups("Dependent variable: attendance", pattern(1 0 0 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Compulsory only = obligatoire" "Controls=age age2") keep(maj_1 maj_1Xsexe  sexeXexec maj_1Xcumul_exec maj_1XcumulXsexe cumul_exec) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace

**participation
*all
xtreg participation maj_1 maj_1Xsexe sexe age age2 i.cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe group_rest i.com_group_size c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff12
xtreg  participation maj_1 maj_1Xcumul_exec cumul_exec age age2 cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe group_rest i.com_group_size c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff32
xtreg  participation maj_1 maj_1Xcumul_exec maj_1Xsexe maj_1XcumulXsexe  sexeXexec cumul_exec sexe age age2 cumul_1 i.com i.session group_rest i.legis i.com_group_size i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff52


*obligatoire
xtreg  participation maj_1 maj_1Xsexe sexe age age2 i.cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt  group_rest i.exp i.groupe i.com_group_size c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff22
xtreg  participation maj_1 maj_1Xcumul_exec cumul_exec age age2 cumul_1 i.com i.session i.legis i.nb_mdt group_rest i.exp i.groupe i.com_group_size c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff42
xtreg  participation maj_1 maj_1Xcumul_exec maj_1Xsexe maj_1XcumulXsexe  sexeXexec cumul_exec sexe age age2 cumul_1 i.com group_rest i.com_group_size i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff62

esttab com_diff12 com_diff22 com_diff32 com_diff42 com_diff52 com_diff62 using differentiel_com3.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles mgroups("Dependent variable: participation", pattern(1 0 0 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Compulsory only = obligatoire" "Controls=age age2" "Group size=group_rest") keep(maj_1 maj_1Xsexe  sexeXexec maj_1Xcumul_exec maj_1XcumulXsexe cumul_exec) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace


**participation
*all
xtreg log_c_inter maj_1 maj_1Xsexe sexe age age2 i.cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe group_rest i.com_group_size c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff121
xtreg   log_c_inter maj_1 maj_1Xcumul_exec cumul_exec age age2 cumul_1 i.com i.session i.legis i.nb_mdt i.exp i.groupe group_rest i.com_group_size c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff321
xtreg   log_c_inter maj_1 maj_1Xcumul_exec maj_1Xsexe maj_1XcumulXsexe  sexeXexec cumul_exec sexe age age2 cumul_1 i.com i.session group_rest i.legis i.com_group_size i.nb_mdt i.exp i.groupe c.circ_dist if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff521


*obligatoire
xtreg   log_c_inter maj_1 maj_1Xsexe sexe age age2 i.cumul_exec cumul_1 i.com i.session i.legis i.nb_mdt  group_rest i.exp i.groupe i.com_group_size c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff221
xtreg   log_c_inter maj_1 maj_1Xcumul_exec cumul_exec age age2 cumul_1 i.com i.session i.legis i.nb_mdt group_rest i.exp i.groupe i.com_group_size c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff421
xtreg   log_c_inter maj_1 maj_1Xcumul_exec maj_1Xsexe maj_1XcumulXsexe  sexeXexec cumul_exec sexe age age2 cumul_1 i.com group_rest i.com_group_size i.session i.legis i.nb_mdt i.exp i.groupe c.circ_dist obligatoire if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store com_diff621

esttab com_diff121 com_diff221 com_diff321 com_diff421 com_diff521 com_diff621 using differentiel_com4.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles mgroups("Dependent variable: log inter", pattern(1 0 0 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Compulsory only = obligatoire" "Controls=age age2" "Group size=group_rest") keep(maj_1 maj_1Xsexe  sexeXexec maj_1Xcumul_exec maj_1XcumulXsexe cumul_exec) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  replace

** hémicycle


**** differential hemicycle

*** présence
**1 tout  
*tout avec sexe
xtreg pres_h maj_1 maj_1Xsexe sexe age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store hemicycle1
*tout avec cumul
xtreg pres_h maj_1 maj_1Xcumul_exec cumul_exec age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store hemicycle2

** 2 lois
xtreg pres_h maj_1 maj_1Xamendement maj_1Xrapporteur amendement rapporteur age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store hemicycle3
**lois sxe
xtreg pres_h maj_1 sexeXamendementXmaj maj_1Xsexe sexeXrapporteurXmaj maj_1Xamendement maj_1Xrapporteur sexeXamendement sexeXrapporteur  amendement rapporteur age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store hemicycle4
** lois cumul
xtreg pres_h maj_1 cumul_execXamendementXmaj maj_1Xcumul_exec cumul_execXrapporteurXmaj maj_1Xamendement maj_1Xrapporteur cumul_execXamendement cumul_execXrapporteur amendement rapporteur cumul_exec age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store hemicycle5

**3 questions
xtreg pres_h maj_1 maj_1Xquestion question age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store hemicycle6
** questions sexe
xtreg pres_h maj_1 maj_1Xquestion sexeXquestion maj_1Xsexe sexeXquestionXmaj  question age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store hemicycle7
** question cumul
xtreg pres_h maj_1 maj_1Xquestion cumul_execXquestion maj_1Xcumul_exec cumul_execXquestionXmaj  question cumul_exec age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store hemicycle8


esttab hemicycle1 hemicycle2 hemicycle3 hemicycle4 hemicycle5 hemicycle6 hemicycle7 hemicycle8 using hemicycle_differential.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles  mgroups("Overall" "Legis" "Questions", pattern(1 0 1 0 0 1 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Meeting type restriction = group_rest") keep(maj_1 sexeXquestion maj_1Xcumul_exec maj_1Xsexe sexeXamendement sexeXrapporteur sexeXquestionXmaj sexeXamendementXmaj sexeXrapporteurXmaj cumul_execXquestion cumul_execXamendement cumul_execXrapporteur cumul_execXquestionXmaj cumul_execXamendementXmaj cumul_execXrapporteurXmaj amendement question rapporteur cumul_exec maj_1Xamendement maj_1Xrapporteur maj_1Xquestion) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  compress replace

** log long


**** differential hemicycle

*** présence
**1 tout  
*tout avec sexe
xtreg log_long maj_1 maj_1Xsexe sexe age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store hemicycle9
*tout avec cumul
xtreg  log_long maj_1 maj_1Xcumul_exec cumul_exec age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store hemicycle10

** 2 lois
xtreg  log_long maj_1 maj_1Xamendement maj_1Xrapporteur amendement rapporteur age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store hemicycle11
**lois sxe
xtreg  log_long maj_1 sexeXamendementXmaj maj_1Xsexe sexeXrapporteurXmaj maj_1Xamendement maj_1Xrapporteur sexeXamendement sexeXrapporteur  amendement rapporteur age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store hemicycle12
** lois cumul
xtreg  log_long maj_1 cumul_execXamendementXmaj maj_1Xcumul_exec cumul_execXrapporteurXmaj maj_1Xamendement maj_1Xrapporteur cumul_execXamendement cumul_execXrapporteur amendement rapporteur cumul_exec age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store hemicycle13

**3 questions
xtreg  log_long maj_1 maj_1Xquestion question age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store hemicycle14
** questions sexe
xtreg  log_long maj_1 maj_1Xquestion sexeXquestion maj_1Xsexe sexeXquestionXmaj  question age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store hemicycle15
** question cumul
xtreg  log_long maj_1 maj_1Xquestion cumul_execXquestion maj_1Xcumul_exec cumul_execXquestionXmaj  question cumul_exec age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store hemicycle16


esttab hemicycle9 hemicycle10 hemicycle11 hemicycle12 hemicycle13 hemicycle14 hemicycle15 hemicycle16 using hemicycle_differential2.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles  mgroups("Overall" "Legis" "Questions", pattern(1 0 1 0 0 1 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Meeting type restriction = group_rest") keep(maj_1 sexeXquestion maj_1Xcumul_exec maj_1Xsexe sexeXamendement sexeXrapporteur sexeXquestionXmaj sexeXamendementXmaj sexeXrapporteurXmaj cumul_execXquestion cumul_execXamendement cumul_execXrapporteur cumul_execXquestionXmaj cumul_execXamendementXmaj cumul_execXrapporteurXmaj amendement question rapporteur cumul_exec maj_1Xamendement maj_1Xrapporteur maj_1Xquestion) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  compress replace

**tribune


**** differential hemicycle

*** présence
**1 tout  
*tout avec sexe
xtreg tribune maj_1 maj_1Xsexe sexe age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store hemicycle17
*tout avec cumul
xtreg  tribune maj_1 maj_1Xcumul_exec cumul_exec age age2 c.circ_dist i.h_type i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 , fe cl(num)
estimates store hemicycle18

** 2 lois
xtreg  tribune maj_1 maj_1Xamendement maj_1Xrapporteur amendement rapporteur age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store hemicycle19
**lois sxe
xtreg  tribune maj_1 sexeXamendementXmaj maj_1Xsexe sexeXrapporteurXmaj maj_1Xamendement maj_1Xrapporteur sexeXamendement sexeXrapporteur  amendement rapporteur age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store hemicycle20
** lois cumul
xtreg  tribune maj_1 cumul_execXamendementXmaj maj_1Xcumul_exec cumul_execXrapporteurXmaj maj_1Xamendement maj_1Xrapporteur cumul_execXamendement cumul_execXrapporteur amendement rapporteur cumul_exec age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==1, fe cl(num)
estimates store hemicycle21

**3 questions
xtreg  tribune maj_1 maj_1Xquestion question age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store hemicycle22
** questions sexe
xtreg  tribune maj_1 maj_1Xquestion sexeXquestion maj_1Xsexe sexeXquestionXmaj  question age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store hemicycle23
** question cumul
xtreg  tribune maj_1 maj_1Xquestion cumul_execXquestion maj_1Xcumul_exec cumul_execXquestionXmaj  question cumul_exec age age2 c.circ_dist i.session i.nb_mdt i.exp i.groupe i.group_size i.cumul_1 i.cumul_exec c.hauteur i.travee dist_ave group_rest if bureau==. & poste==1 & president==1 & legis!=2 & constit_h==1 & GRP3==2 & h_type==2, fe cl(num)
estimates store hemicycle24


esttab hemicycle17 hemicycle18 hemicycle19 hemicycle20 hemicycle21 hemicycle22 hemicycle23 hemicycle24 using hemicycle_differential3.tex, se(a4) b(a4) r2(a4) booktabs nodep nomtitles  mgroups("Overall" "Legis" "Questions", pattern(1 0 1 0 0 1 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) indicate("Meeting type restriction = group_rest") keep(maj_1 sexeXquestion maj_1Xcumul_exec maj_1Xsexe sexeXamendement sexeXrapporteur sexeXquestionXmaj sexeXamendementXmaj sexeXrapporteurXmaj cumul_execXquestion cumul_execXamendement cumul_execXrapporteur cumul_execXquestionXmaj cumul_execXamendementXmaj cumul_execXrapporteurXmaj amendement question rapporteur cumul_exec maj_1Xamendement maj_1Xrapporteur maj_1Xquestion) varlabels(maj_1 "Majority") star(* 0.1 ** 0.05 *** 0.01) nonotes addnotes("\specialcell{Robust standard errors in parentheses\\  \textit{*p < 0.10, ** p < 0.05, *** p < 0.01}}")  compress replace
