#!/bin/sh

#Auxiliary function
copy_file() {
    echo "Función alcanzada"
    file_name=$1
    commit_id=$2

    echo $file_name

    if [ ! -d "Git_Diff" ]
    then
        mkdir "Git_Diff"
    fi

    git show $commit_id $file_name > Git_Diff/$file_name

}

#Get input variables
originalCommit=314930d7d2d1435831eabc921897fcbefffeb3d9
newCommit=53c75a35cd46dce05d046094e81f3736dded8d34

#Create differences file (list of changed files)
git diff $originalCommit $newCommit --name-only > Git_Diff_Changes.txt

#Copy files into new directory
cat Git_Diff_Changes.txt | while read line; do
    echo "Instancia bucle"
    copy_file ${line} $newCommit 
done

#Write full git diff data into Git_Diff_Changes.txt
git diff $originalCommit $newCommit > Git_Diff_Changes.txt
mv Git_Diff_Changes.txt Git_Diff

#Zip files
zip -r git_diff.zip Git_Diff

#Delete original folder
#rm -r Git_Diff

exit
