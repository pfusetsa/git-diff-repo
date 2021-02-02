#!/bin/sh

#Auxiliary function
copy_file() {
    echo "Función alcanzada"
    file_name=$1

    echo $file_name

    if [ ! -d "Git_Diff" ]
    then
        mkdir "Git_Diff"
    fi

    git show $file_name > Git_Diff/$file_name

}

#Create differences file (list of changed files)
git diff --name-only > Git_Diff_Changes.txt

#Copy files into new directory
cat Git_Diff_Changes.txt | while read line; do
    echo "Instancia bucle"
    copy_file ${line} 
done

#Write full git diff data into Git_Diff_Changes.txt
git diff > Git_Diff_Changes.txt
mv Git_Diff_Changes.txt Git_Diff

#Zip files
#zip -r git_diff.zip Git_Diff

#Delete original folder
#rm -r Git_Diff

exit
