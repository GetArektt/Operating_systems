#ls $1 | awk '{printf("%s ->", $1); system("readlink -f " $1)}'

links=0

for file in `find $1 -type l`
do
    i=0
    echo $file
    last_link=$(echo $file | cut -c 3-)
    arr=()

    while [ "$(readlink $last_link)" != "" ]
    do
        flag=false
        arr[i]=$last_link
        i=$((i+1))

        last_link=$(readlink $last_link)

        
        for item in ${arr[@]}
        do
            if [ "$last_link" == "$item" ]
            then
                flag=true
                break
            fi
        done

        if [ "$flag" = true ]
        then
                echo "Petla ($i iteracji): ${arr[@]}"
		    links=$((links+1))
                break
        fi
    done
done

echo "Ilość pętli: $links"

