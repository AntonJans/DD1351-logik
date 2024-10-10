%%%%%%%%%%%%%%%%%%%%%%%%
% Uppgift 2 
% Representation
%%%%%%%%%%%%%%%%%%%%%%%%

% select/3(element, list, result_list) removes element from list ONCE to get result_list

% remove_duplicates/2(list, result_list) removes duplicates from the list in order
remove_duplicates([], []).
remove_duplicates([H|T], E) :- select(H, T, R), !, remove_duplicates([H|R], E).
remove_duplicates([H|T], [H|R]) :- remove_duplicates(T, R).
