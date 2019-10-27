#!/bin/bash
i=0
for value in $(mysql -u{$db_user} -p${db_pass} -D${db_name} -rN --execute "
    SELECT type,text,url,date,location,autoRemove,isFirstComment FROM Blog WHERE type='post:' ")
do
    Content[$i]=${value}
    echo "Content[$i]=${Content[$i]}"
    let "i+=1"
done
echo "Found ${#Content[@]} values..."
echo "BlogContent ${Content[1]} and secondItem is ${Content[2]}."