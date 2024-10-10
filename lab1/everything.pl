edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,d).
edge(c,f).
edge(d,e).
edge(e,g).
edge(f,g).

edge(b,a).
edge(c,a).
edge(d,b).
edge(e,b).
edge(d,c).
edge(f,c).
edge(e,d).
edge(g,e).
edge(g,f).

% select/3(element, list, result_list) removes element from list ONCE to get result_list
% append/3(base_list, append_list, result_list) concatenates two lists IN ORDER to get a result_list
% length/2(list, list_length) checks the length of a list
% member/2(element, list) checks if element is a member of list

% remove_duplicates/2(list, result_list) removes duplicates from the list in order
remove_duplicates([], []).
remove_duplicates([H|T], E) :- select(H, T, R), !, remove_duplicates([H|R], E).
remove_duplicates([H|T], [H|R]) :- remove_duplicates(T, R).

% partstring/3(list, length, result_list) checks/gets all sublists of length 'length'
partstring(List, L, F) :- append(_, Temp, List), append(F, _, Temp), length(F, L), F \= [].

% dfs/3(From, To, Path) checks/gets all paths from node 'From' to node 'To' in a graph
dfs(From, To, Path) :- dfs(From, To, [From], Path).
dfs(Current, Current, _, [Current]).
dfs(Current, To, Visited, [Current|Rest]) :-
    edge(Current, Next),
    \+member(Next, Visited),
    dfs(Next, To, [Next|Visited], Rest).
