run-easy-1-1-1:
	minizinc --solver Chuffed sudoku.mzn easy-volume-1-book-1-puzzle-1.dzn 2>&1 | tee output.log

run-insane-1-1-1:
	minizinc --solver Chuffed sudoku.mzn insane-volume-1-book-1-puzzle-1.dzn 2>&1 | tee output.log
