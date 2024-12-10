% ====== SETUP ================
verify(InputFileName) :- see(InputFileName), read(Prems), read(Goal), read(Proof), seen, valid_proof(Prems, Goal, Proof).

valid_proof(Prems, Goal, Proof) :- check_goal(Goal, Proof), check_proof(Prems, Proof, []).

check_goal(Goal, Proof) :- last_row(Res, Proof), memberchk(Goal, Res). % Check if goal is in last line of proof

% ====== check_proof/3(Prems, Proof, CheckedRows) ================================================================================================
check_proof(_, [], _) :- !.
check_proof(Prems, [H|T], Checked) :- check_line(Prems, H, Checked), check_proof(Prems, T, [H|Checked]), !.

% ====== check_line/3(Prems, Row, CheckedRows), row: [LineNum, Statement, Rule] ==================================================================
check_line(Prems, [_, Prem, premise], _) :- member(Prem, Prems). % Check if premise is in list of premises
check_line(Prems, [[X, A, assumption]|T], Checked) :- check_proof(Prems, T, [[X, A, assumption]|Checked]), !. % Check if assumption is valid

check_line(_, [_, A, copy(X)], Checked) :- member([X, A, _], Checked). % copy(x)

check_line(_, [_, and(A, B), andint(X, Y)], Checked) :- member([X, A, _], Checked), member([Y, B, _], Checked). % andint(x, y)
check_line(_, [_, A, andel1(X)], Checked) :- member([X, and(A, _), _], Checked). % andel1(x)
check_line(_, [_, A, andel2(X)], Checked) :- member([X, and(_, A), _], Checked). % andel2(x)

check_line(_, [_, or(A, _), orint1(X)], Checked) :- member([X, A, _], Checked). % orint1(x)
check_line(_, [_, or(_, A), orint2(X)], Checked) :- member([X, A, _], Checked). % orint2(x)

check_line(_, [_, WierdX, orel(X, Y, U, V, W)], Checked) :- member([X, or(A, B), _], Checked), validate_box(A, WierdX, Y, U, Checked), validate_box(B, WierdX, V, W, Checked). % orel(x, y, u, v, w) BOXES

check_line(_, [_, imp(A, B), impint(X, Y)], Checked) :- validate_box(A, B, X, Y, Checked). % impint(x, y) BOXES
check_line(_, [_, B, impel(X, Y)], Checked) :- member([X, A, _], Checked), member([Y, imp(A, B), _], Checked). % impel(x, y)

check_line(_, [_, neg(A), negint(X, Y)], Checked) :- validate_box(A, cont, X, Y, Checked). % negint(x, y) BOXES
check_line(_, [_, cont, negel(X, Y)], Checked) :- member([X, A, _], Checked), member([Y, neg(A), _], Checked). % negel(x, y)

% no introduction rule for cont
check_line(_, [_, _, contel(X)], Checked) :- member([X, cont, _], Checked). % contel(x)

check_line(_, [_, neg(neg(A)), negnegint(X)], Checked) :- member([X, A, _], Checked). % negnegint(x) DERIVED
check_line(_, [_, A, negnegel(X)], Checked) :- member([X, neg(neg(A)), _], Checked). % negnegel(x)

check_line(_, [_, neg(A), mt(X, Y)], Checked) :- member([X, imp(A, B), _], Checked), member([Y, neg(B), _], Checked). % mt(x, y) DERIVED

check_line(_, [_, A, pbc(X, Y)], Checked) :- validate_box(neg(A), cont, X, Y, Checked). % pbc(x, y) BOXES DERIVED

check_line(_, [_, or(A, neg(A)), lem], _). % lem DERIVED

% =========== Help Predicates ================
last_row(Result, [Result]) :- !.
last_row(Result, [_|T]) :- last_row(Result, T).

validate_box(Start, Goal, X, Y, Checked) :-
    member(Box, Checked),
    member([X, Start, assumption], Box),
    last_row(R, Box),
    R = [Y, Goal, _].
