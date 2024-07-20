Measures microarchitectural details. Customize microarchitecturometer_generator.py by commenting/uncommenting lines, then run

    python3 microarchitecturometer_generator.py mem nop > microarchitecturometer.c
    clang microarchitecturometer.c -O3 -o microarchitecturometer
    ./microarchitecturometer

Plot the results.

To collect results in bulk, you can use `./collect-results.sh`. First set `$WORK_LIST` and `$PADDING_LIST`, then run `./collect-results.sh` with no arguments. Results will be collected in the `RESULTS_DIR` directory for every work and padding combination.

    export WORK_LIST=mem
    export PADDING_LIST="nop mov cmp $(python microarchitecturometer_generator.py --list padding | grep "x86")"
    ./collect-results.sh
