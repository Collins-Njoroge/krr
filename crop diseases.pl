% Define symptoms
symptom('wilting leaves').
symptom('yellow spots on leaves').
symptom('purple spots on leaves').
symptom('stunted growth').
symptom('brown spots on stems').
symptom('white mold on leaves').
symptom('leaf curling').
symptom('blackened roots').
symptom('slimy patches on leaves').
symptom('leaf blisters').

% Define diseases
disease('fungus A').
disease('virus B').
disease('bacteria C').
disease('virus D').
disease('bacteria E').

% Define disease symptoms
disease_symptoms('fungus A', ['wilting leaves', 'yellow spots on leaves']).
disease_symptoms('virus B', ['stunted growth', 'brown spots on stems']).
disease_symptoms('bacteria C', ['yellow spots on leaves', 'white mold on leaves']).
disease_symptoms('virus D', ['leaf curling', 'blackened roots']).
disease_symptoms('bacteria E', ['slimy patches on leaves', 'leaf blisters']).

% Prompt for user's symptoms and check for a disease based on those symptoms
get_disease :-
    write('List of all symptoms:'), nl,
    forall(symptom(S), (
        write('- '), write(S), nl
    )),
    nl,
    write('Please list your symptoms (enter two):'), nl,
    write('Enter symptom 1: '), read(Symptom1),
    write('Enter symptom 2: '), read(Symptom2),
    check_disease([Symptom1, Symptom2]).

% Predicate to check for a disease based on user symptoms
check_disease(UserSymptoms) :-
    (   disease_symptoms(Disease, Symptoms),
        subset(UserSymptoms, Symptoms),
        disease(Disease)
    ->  format('You may have disease: ~w', [Disease]), nl
    ;   format('No matching disease found for given symptoms'), nl
    ).
