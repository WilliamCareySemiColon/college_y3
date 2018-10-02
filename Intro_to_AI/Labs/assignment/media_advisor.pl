% some example rules to get you started


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
                              
% rule 9
medium(workshop) :- stimulus_situation(physical_object),
                    stimulus_response(hands_on),
                    feedback(yes).
                    

% rule 10
medium(lectureTutorial) :- stimulus_situation(symbolic),
                    stimulus_response(analytical),
                    feedback(yes).
                    

% rule 11
medium(videocassette) :- stimulus_situation(visual),
                    stimulus_response(documented),
                    feedback(no).
                    

% rule 12
medium(lectureTutorial) :- stimulus_situation(visual),
                    stimulus_response(oral),
                    feedback(yes).
                    

% rule 13
medium(lectureTutorial) :- stimulus_situation(verbal),
                    stimulus_response(analytical),
                    feedback(yes).
                    

% rule 14
medium(rolePlay) :- stimulus_situation(verbal),
                    stimulus_response(oral),
                    feedback(yes).
                    

% 3 inputs required: 1 environment 2 job, 3 feedback yes / no                 

go :- 
    getEnvironment,
    % getJob,
    feedback,
    ( stimulus_situation(SS),
      nl, write('Stimulus situation is '), write(SS), nl,
      medium(M)
    ;
      writeln('Could not advise on an appropriate medium')
    ), 
    cleanInputs.
      
getEnvironment :-
    write('Input the environment '), 
    read(E), 
    assert(environment(E)).

feedback :-       
    write('Is feedback required yes/no '),
    read(F),
    assert(feedback(F)).
      
cleanInputs :- 
    retractall(environment(_)),
    retractall(job(_)),
    retractall(feedback(_)).
           