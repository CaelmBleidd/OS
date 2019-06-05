loop () {
     a=1
     b=2
     while true ; do
         ((a=$a * $b))
         #echo $a
         #sleep 0.001
     done
}

loop
