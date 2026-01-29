int: N = 9;
set of int: DIGITS = 1..9;
include "globals.mzn";

% Input puzzle: 0 means empty cell
array[1..N, 1..N] of int: puzzle;

% Decision variables
array[1..N, 1..N] of var DIGITS: grid;

% --- Fix given clues
constraint
  forall(r in 1..N, c in 1..N) (
    puzzle[r, c] != 0 -> grid[r, c] = puzzle[r, c]
  );

% --- Row constraints
constraint
  forall(r in 1..N) (
    all_different([ grid[r, c] | c in 1..N ])
  );

% --- Column constraints
constraint
  forall(c in 1..N) (
    all_different([ grid[r, c] | r in 1..N ])
  );

% --- 3x3 box constraints
constraint
  forall(br in 0..2, bc in 0..2) (
    all_different([
      grid[3*br + r, 3*bc + c]
      | r in 1..3, c in 1..3
    ])
  );

solve satisfy;

output [
  if c = N then
    show(grid[r,c]) ++ "\n"
  else
    show(grid[r,c]) ++ " "
  endif
  | r in 1..N, c in 1..N
];

