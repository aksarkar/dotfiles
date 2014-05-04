#!/usr/bin/awk -f

# Parse cdrdao TOC file and output oggenc invocations suitable for piping into
# GNU parallel.

# Parameters:

#   format - printf-style format string for split input files (default
#   "split-track%02d.wav" as produced by shntool)

# Author: Abhishek Sarkar <aksarkar@mit.edu>

BEGIN {
    if (format == "") {
        format = "split-track%02d.wav"
    }
}

function parse(line) {
    sub(/^[^"]*"/, "", line)
    sub(/".*$/, "", line)
    return line
}

track == 0 && /TITLE/ {
    meta["album"] = parse($0)
}

track == 0 && /PERFORMER/ {
    meta["albumartist"] = parse($0)
}

track == 0 && /COMPOSER/ {
    meta["composer"] = parse($0)
}

track > 0 && /TITLE/ {
    meta["title"] = parse($0)
}

track > 0 && /PERFORMER/ {
    meta["artist"] = parse($0)
}

track > 0 && /COMPOSER/ {
    meta["composer"] = parse($0)
}

$0 == "TRACK AUDIO" {
    track += 1
    meta["tracknumber"] = track
}

$1 == "FILE" {
    infile = sprintf(format, track)
    printf("oggenc -Q -q6 ")
    for (t in meta) {
        if (meta[t] != "") {
            printf("-c %s='%s' ", t, meta[t])
        }
    }
    printf("-o '%02d. %s.ogg' %s\n", meta["tracknumber"], meta["title"], infile)
}
