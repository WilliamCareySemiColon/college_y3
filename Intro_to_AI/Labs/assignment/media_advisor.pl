% some example rules to get you started

% machines jobs
% rule 1
stimulus_situation(verbal) :- environment(papers);
                              environment(manuals);
                              environment(documents);
                              environment(textbooks).

% rule 2
stimulus_situation(visual) :- environment(pictures);
                              environment(illustrations);
                              environment(photographs);
                              environment(diagrams).
							  
% rule 3
stimulus_situation(pysicalObject) :- environment(machines);
                              environment(buildings);
                              environment(tools).
							  
% rule 4
stimulus_situation(symbolic) :- environment(numbers);
                              environment(formulas);
                              environment(computerProgramme).

% personal rules 
stimulus_situation(danger) :- environment(weapon);
							environment(greed);
							environment(crime).
							
stimulus_situation(audio) :- environment(musician);
							environment(podcast);
							environment(broadCaster).
							
stimulus_situation(sixth) :- environment(spirituality);
							environment(mindfullness);
							environment(high).
							
stimulus_situation(taste) :- environment(chef);
							environment(taster);
							environment(mixer).

% repairing jobs
% rule 5
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
                              
                              
% required
% rule 9
medium(workshop) :- stimulus_situation(pysicalObject),
                    stimulus_response(handsOn),
                    feedback(yes).
					
medium(programme) :- stimulus_situation(pysicalObject),
                    stimulus_response(handsOn),
                    feedback(no).
					
medium(programme) :- stimulus_situation(pysicalObject),
                    stimulus_response(automated),
                    feedback(no).
                    
medium(machineLearning) :- stimulus_situation(pysicalObject),
                    stimulus_response(automated),
                    feedback(yes).
% rule 10
medium(lectureTutorial) :- stimulus_situation(symbolic),
                    stimulus_response(analytical),
                    feedback(yes).
					
					
medium(lab) :- stimulus_situation(symbolic),
                    stimulus_response(analytical),
                    feedback(no).       

% rule 11
medium(videocassette) :- stimulus_situation(visual),
                    stimulus_response(documented),
                    feedback(no).
					
medium(art) :- stimulus_situation(visual),
                    stimulus_response(documented),
                    feedback(yes).
                    
% rule 12
medium(lectureTutorial) :- stimulus_situation(visual),
                    stimulus_response(oral),
                    feedback(yes).
                    
medium(culture) :- stimulus_situation(visual),
                    stimulus_response(oral),
                    feedback(no).
					
% rule 13
medium(lectureTutorial) :- stimulus_situation(verbal),
                    stimulus_response(analytical),
                    feedback(yes).
                    
medium(thesis) :- stimulus_situation(verbal),
                    stimulus_response(analytical),
                    feedback(no).
% rule 14
medium(rolePlay) :- stimulus_situation(verbal),
                    stimulus_response(oral),
                    feedback(yes).
					
medium(language) :- stimulus_situation(verbal),
                    stimulus_response(oral),
                    feedback(no).
					
meduim(cult) :- stimulus_situation(sixth),
					stimulus_response(religion),
					feeback(yes).
						
meduim(indiviality) :- stimulus_situation(sixth),
						stimulus_response(religion),
						feeback(no).
						
meduim(politicalNewWorld) :- stimulus_situation(danger),
							stimulus_response(politics),
							feeback(no).
							
meduim(democracy) :- stimulus_situation(danger),
							stimulus_response(politics),
							feeback(yes).
							
meduim(selfTrain) :- stimulus_situation(taste),
					stimulus_response(recreational),
					feeback(no).
                    

% 3 inputs required: 1 environment 2 job, 3 feedback yes / no                 

go :- 
    getEnvironment,
    getJob,
    feedback,
    ( stimulus_situation(SS),
      nl, write('Stimulus situation is '), write(SS), nl,
	  stimulus_response(QQ),
	  write('Stimulus response is '), write(QQ), nl,
      medium(M),
	  write('and your medium is '), write(M)
    ;
      writeln('Could not advise on an appropriate medium')
    ), 
    cleanInputs.
      
getEnvironment :-
    write('Input the environment '), 
    read(E), 
    assert(environment(E)).

getJob :-
	write('Input the job'),
	read(G),
	assert(job(G)).
	
feedback :-       
    write('Is feedback required yes/no '),
    read(F),
    assert(feedback(F)).
      
cleanInputs :- 
    retractall(environment(_)),
    retractall(job(_)),
    retractall(feedback(_)).
           