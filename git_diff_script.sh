#!/bin/bash


function copy_file {
    local file_name = $1
    local commit_id = $2

    git show "$commit_id" "$file_name" > "$file_name"
}


originalCommit = $1
newCommit = $2

if [ ! -d "Git_Diff" ]
then
mkdir "Git_Diff"
fi

cd Git_Diff

git diff "$originalCommit" "$newCommit" --name-only > Git_Diff_Changes.txt

files = $(git diff "$originalCommit" "$newCommit" --name-only)

echo "$files" | while read line; do
    copy_file "$newCommit" "${line}"
done

exit
