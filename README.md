This is a setup for compiling binaries for the https://github.com/thetrime/heroku-prolog-buildpack repository.

If you have docker installed, then hopefully all you need to do is run something like

./build.sh 7.7.13

and after a while you'll get a file

env-7.7.13.tar.bz2

in the current directory. I didn't quite test the automation that far though. I didn't use build.sh, specifically - I ran the commands inside by hand, and created build.sh as a brief documentation for how I did it. Hopefully it works?