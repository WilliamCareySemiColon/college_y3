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