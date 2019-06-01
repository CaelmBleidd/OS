ROOT="$OS_LABS/Lab5"
RESTORE_DIR="$ROOT/restore"

get_newest_backup_path () {
    current_date_ts=$(date_to_timestamp "${LAUNCH_DATE}")
    newest_backup_date=$(get_newest_backup_date)
    if [[ ! -z $newest_backup_date ]]; then
        echo "${ROOT}/Backup-${newest_backup_date}"
    else
        echo ""
    fi
}

get_newest_backup_date () {
    newest_date=$(ls ${ROOT} |
        grep -P "^Backup-\d{4}-\d{2}-\d{2}$" |
        cut -d "-" -f 2,3,4 |
        sort --numeric-sort --reverse |
        head -n 1)
    echo "$newest_date"
}

restore () {
    backup_dir=$1
    mkdir ${RESTORE_DIR}
    ls -A ${backup_dir} |
        grep --invert -P ".*\d{4}-\d{2}-\d{2}$" |
        awk -v backup_dir="${backup_dir}" '{ print backup_dir "/" $1 }' |
        xargs cp -rvf --target=${RESTORE_DIR}
}

main () {
    newest_backup_path=$(get_newest_backup_path)
    echo $newest_backup_path
    restore "${newest_backup_path}"
}


main
