run:
	minizinc --solver Chuffed sudoku.mzn sudoku.dzn 2>&1 | tee output.log
