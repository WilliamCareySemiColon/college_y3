stimulus_response(oral) :- job(lecturing);
                           job(advising);
                           job(counselling).
                              
% rule 6
stimulus_response(handsOn) :- job(building);
                           job(repairing);
                           job(troubleShooting).
                              
% rule 7
stimulus_response(documented) :- job(writing);
                           job(typing);
                           job(drawing).
                              
% rule 8
stimulus_response(analytical) :- job(evaluating);
                           job(reasoning);
                           job(investigating).
						   
% personal rules
stimulus_response(recreational) :- job(scout);
                           job(trainer);
                           job(athlete).
                              

stimulus_response(automated) :- job(ai);
                           job(selfDone);
                           job(unconsciously).
                              

stimulus_response(religion) :- job(priset);
                           job(preacher);
                           job(cultist).
                              

stimulus_response(politics) :- job(president);
                           job(senator);
                           job(councilor).
                              