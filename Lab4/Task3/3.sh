crontab -l > tmp_file
echo "*/5 * * * 4 $HOME/Programming/OS/Lab4/Task1/1.sh" >> tmp_file
crontab tmp_file
rm tmp_file

