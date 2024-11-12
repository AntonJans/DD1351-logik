%%%%%%%%%%%%%%%%%%%%%%%%
% Uppgift 4
% Representation (graf)
%%%%%%%%%%%%%%%%%%%%%%%%

/*
  b----e
 /  \   \
a   d   g
 \ /   /
  c---f
*/

% These edges represent the base for a directed graph
edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,d).
edge(c,f).
edge(d,e).
edge(e,g).
edge(f,g).

edge(d,a).

% These edges makes the graph represented above undirected
% edge(b,a).
% edge(c,a).
% edge(d,b).
% edge(e,b).
% edge(d,c).
% edge(f,c).
% edge(e,d).
% edge(g,e).
% edge(g,f).

% has_edge(X,Y) :- edge(X,Y); edge(Y,X).

/*
DFS algorithm (recursive):
1. Mark the current node as visited(initially current node is the root node)
2. Check if current node is the goal, If so, then return it.
3. Iterate over children nodes of current node, and do the following:
    1. Check if a child node is not visited.
    2. If so, then, mark it as visited.
    3. Go to it's sub tree recursively until you find the goal node(In other words, do the same steps here passing the child node as the current node in the next recursive call).
    4. If the child node has the goal node in this sub tree, then, return it.
4. If goal node is not found, then goal node is not in the tree!
*/

dfs(From, To, Path) :- dfs(From, To, [From], Path).
dfs(Current, Current, _, [Current]).
dfs(Current, To, Visited, [Current|Rest]) :-
    edge(Current, Next),
    \+member(Next, Visited),
    dfs(Next, To, [Next|Visited], Rest).
