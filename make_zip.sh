#!/bin/bash

##############################################################################################
#
# Basic files for VoLTE support for Quark
#
##############################################################################################
#timer counter
START=$(date +%s.%N);
START2="$(date)";
echo -e "\nMaking a flash zip\n";

#kernel folder yours folder
FOLDER=$HOME/android/Quark_VoLTE/;
cd $FOLDER;

#zip name
ZIPNAME="VoLTE-Test-V01.zip";

#arch and out folder

cd ./anykernel2/
rm -rf *.zip
zip -r9 volte * -x README .gitignore modules/.gitignore ZipScriptSign/* ZipScriptSign/bin/* how_to_build_this.sh
mv volte.zip ./ZipScriptSign
./ZipScriptSign/sign.sh test volte.zip
rm -rf ./ZipScriptSign/volte.zip
mv ./ZipScriptSign/volte-signed.zip ./$ZIPNAME
cd -
echo -e "\nZip made OK zip file at... $FOLDER anykernel2/$ZIPNAME \n";

# final time display *cosmetic...
END2="$(date)";
END=$(date +%s.%N);
echo -e "\nBuild start $START2";
echo -e "Build end   $END2 \n";
echo -e "\n${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($END - $START) / 60"|bc ):$(echo "(($END - $START) - (($END - $START) / 60) * 60)"|bc ) (minutes:seconds). ${txtrst}\n";

