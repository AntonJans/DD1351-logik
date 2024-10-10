%%%%%%%%%%%%%%%%%%%%%%%%
% Uppgift 3
% Rekursion
%%%%%%%%%%%%%%%%%%%%%%%%

% append/3(base_list, append_list, result_list) concatenates two lists IN ORDER to get a result_list
% length/2(list, list_length) checks the length of a list

% partstring/3(list, length, result_list) returns all sublists of length 'length'
partstring(List, L, F) :- append(_, Temp, List), append(F, _, Temp), length(F, L), F \= [].
