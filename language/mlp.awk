#!/usr/bin/env -S awk -v opt=$OPT -f

# Multi Language Parser
split($0,var," : ") {
    if (opt == var[1]) {
        print(var[2])
        exit(0)
    }
}