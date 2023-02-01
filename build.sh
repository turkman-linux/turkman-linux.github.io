#!/bin/bash
build_page(){
	mkdir -p $3 2>/dev/null
	cat $1/template/begin.html > $3/$2.html
	cat $1/$2.html >> $3/$2.html
	cat $1/template/end.html >> $3/$2.html
}
gcfg(){
	cat ./$1/config | grep $2 | sed "s/^.*=//g" | tail -n 1
}
#clear all html files
for j in $(ls .)
do
    if [ -f $j/config ] ; then
        echo "Compile $j"
        output=$(gcfg $j output)
        for i in $(ls $j | grep .html | sed "s/.html//g")
        do
            build_page $j $i build/$output
        done
        [ -d $j/assets ] && cp -prf $j/assets build/$output/
    fi
done
