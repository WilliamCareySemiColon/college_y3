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