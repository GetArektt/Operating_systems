katalog="$1"

for file in $katalog/*
do
    dowiazania=$(stat $file | grep "Links" | tail -c 2)
    if [ $dowiazania != 1 ]
    then
        echo $dowiazania $(find $katalog -links $dowiazania)
    fi
done | sort | uniq
