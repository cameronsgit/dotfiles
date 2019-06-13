#!/usr/local/bin/awk -f

function green(string) {
    printf "\033[1;32m" string "\033[0m ";
}

function blue(string) {
    printf "\033[1;34m" string "\033[0m ";
}

BEGIN { FS = "[: ]+"; } {
    packages[$1]++;
    for (i = 2; i <= NF; i++) {
        dependencies[$i]++;
    }
} END {
    print "Below is a list of formulae which are not dependencies of other formulae.";
    print blue("Blue: Pinned version");
    print green("Green: Third-Party");
    print "-------------------------------------------------------------------------\n";
    for (package in packages) {
        if (!(package in dependencies)) {
            # Check if the package was installed from a third-party tap.
            thirdParty = index(package, "/");
            # Check if the package is using an older / pinnned version.
            pinnedVersion = index(package, "@");
            if (thirdParty > 0) {
                print green(package);
            } else if (pinnedVersion > 0) {
                print blue(package);
            } else {
                print package;
            }
        }
    }
} { }
