To summarize: you have to download my GIT repo from https://github.com/pelya/commandergenius,
then install Android SDK 2.2, NDK r4b, and "ant" tool, then you should launch commands
    rm project/jni/application/src
    ln -s scummvm project/jni/application/src
    cd project && android update project -p .
then download ResidualVM 0.1.0 GIT into the dir project/jni/application/residualvm/residualvm
(or create a symlink to it if you already have downloaded it), then apply patch project/jni/application/residualvm/residualvm-0.1.0.diff
onto ResidualVM, and launch build.sh. That should be it.

Note:
The original theme modern.zip size is 1.4 MB which resulted in a data1.zip > 1 MB. Assets bigger than 1 MB are not handled correctly so modern.zip was repacked with the standard compression settings which resulted in a 700 KB file (seems the contents of modern.zip was not compressed before). 
