
if [ $# -eq 0 ]
  then
    echo "Keine Datei wurde uebergeben" 2>&1
    exit 
fi


# Syntax-check
for file in "$@"
do 
	if ! ghdl -s "$file"; then 
		echo "Syntax-check FAILED: $file" 2>&1
		exit 1
	fi
done 
echo "Syntax-check OK"

# Analysis
for file in "$@"
do 
	if ! ghdl -a "$file"; then
		echo "Analysis FAILED: $file" 2>&1
		exit 1
	fi
done 
echo "Analysis OK"

# Build
for file in "$@"
do 
	x=${file%.*}
	if ! ghdl -e "$x";  then
		echo "Build FAILED: $file" 2>&1
		exit 1
	fi
done 
echo "Build OK"


# VCD-Dump
for file in "$@"
do 
	x=${file%.*}
	if ! ghdl -r "$x" --vcd=testbench.vcd;  then
		echo "VCD-Dump FAILED: $file" 2>&1
		exit 1
	fi
done 
echo "VCD-Dump OK"


# Starting GTKWave
if ! gtkwave testbench.vcd; then
	echo "Starting GTKWave FAILED" 2>&1
	exit 1
fi
echo "Starting GTKWave"

