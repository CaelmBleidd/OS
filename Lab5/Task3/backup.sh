#!/bin/bash

ROOT="$OS_LABS/Lab5"
REPORT_FILE="$ROOT/backup-report"
SOURCE_DIR="$ROOT/source"

LAUNCH_DATE=$(date "+%F")


format_date () {
    echo $(date -d "$1" "$2")
}



date_to_timestamp () {
    echo $(format_date "$1" "+%s")
}


get_newest_backup_path () {
    current_date_ts=$(date_to_timestamp "${LAUNCH_DATE}")
    newest_backup_date=$(get_newest_backup_date)
    if [[ -z $newest_backup_date ]]; then
        echo ""
        return 0
    fi

    newest_backup_date_ts=$(date_to_timestamp "$newest_backup_date")
    diff_in_days=$(( (newest_backup_date_ts - current_date_ts) / (60 * 60 * 24) ))

    if (( diff_in_days >= 0 && diff_in_days < 7 )); then
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


make_new_backup () {
    backup_dir_name="Backup-${LAUNCH_DATE}"
    backup_dir_path="${ROOT}/${backup_dir_name}"
    (mkdir ${backup_dir_path}  && echo "${LAUNCH_DATE} : Backup directory ${backup_dir_path} has been created" || {
        echo "Couldn't create directory ${backup_dir_path}"
        return 1
    }) >> ${REPORT_FILE}

    cp -rv "${SOURCE_DIR}/"* ${backup_dir_path} >> ${REPORT_FILE}
}



backup_to_existing_dir () {
    backup_dir=$1

    echo "${LAUNCH_DATE} : Changing existing backup directory ${backup_dir}" >> ${REPORT_FILE}

    comm -23 <(ls -A ${SOURCE_DIR}) <(ls -A ${backup_dir}) |
        awk -v source_dir="${SOURCE_DIR}" '{ print source_dir "/" $1 }' |
        xargs cp -rv --target=${backup_dir} >> ${REPORT_FILE} || echo "No new files!"

    comm -12 <(ls -A ${SOURCE_DIR}) <(ls -A ${backup_dir}) |
        awk -v source_dir="${SOURCE_DIR}" -v backup_dir="${backup_dir}" '{
            source_cmd="wc -c " source_dir "/" $1 " | cut -d \" \" -f 1"
            backup_cmd="wc -c " backup_dir "/" $1 " | cut -d \" \" -f 1"
            source_cmd | getline source_size
            backup_cmd | getline backup_size
            if (source_size != backup_size)
                print source_dir "/" $1
            close(source_cmd)
            close(backup_cmd)
        }' |
        xargs cp -rv -b --suffix=".${LAUNCH_DATE}" --target=${backup_dir} >> ${REPORT_FILE} ||
            echo "No files with different size!"


}


main () {
    newest_backup_path=$(get_newest_backup_path)
    if [[ -z "${newest_backup_path}" ]] ; then
        make_new_backup
    else
        backup_to_existing_dir "${newest_backup_path}"
    fi

}	


main
