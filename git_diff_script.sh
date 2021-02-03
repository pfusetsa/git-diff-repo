#!/bin/sh

#Create directory
if [ ! -d "Git_Diff" ]
then
    mkdir "Git_Diff"
fi

#Create differences file (list of changed files)
git diff HEAD^ HEAD --name-only > Git_Diff_Changes.txt

#Copy files into new directory
cat Git_Diff_Changes.txt | while read line; do
    file_name=${line}
    cp $file_name Git_Diff
done

rm Git_Diff_Changes.txt

exit