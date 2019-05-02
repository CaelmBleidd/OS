( ./proc1.sh & )
sleep 0.1
( cpulimit --pid=$(cat .proc1_pid) --limit=20 & disown)
( ./proc2.sh & )
