#!/usr/bin/env bats

TMP_DIR=''

setup() {
    TMP_DIR=$(mktemp -d -t "bats_${SCRIPT_FILE_NAME}")

    # create 9 regular files.
    touch ${TMP_DIR}/{01..03}.{txt,jpg,md}

    # create 9 dotfiles.
    touch ${TMP_DIR}/.{01..03}.{txt,jpg,md}
}

teardown() {
  rm -rf ${TMP_DIR}
}

@test "When run with no options, the status code is 0" {
    run filelist
    [ "${status}" -eq 0 ]
}

@test "When run with as many options as possible, the status code is 0" {
    run filelist ${TMP_DIR} -a -o ${TMP_DIR}/test.bats -e jpg -d ',' --dotfile
    [ "${status}" -eq 0 ]
}

@test "Working well -o option: The output file will contain 9 lines" {
    run filelist ${TMP_DIR} -o ${TMP_DIR}/test.bats
    [ $(cat ${TMP_DIR}/test.bats | wc -l) -eq 9 ]
}

@test "Working well -d option: The output file will contain 1 line" {
    run filelist ${TMP_DIR} -o ${TMP_DIR}/test.bats -d ','
    [ $(cat ${TMP_DIR}/test.bats | wc -l) -eq 1 ]
}

@test "Working well -e option: The output file will contain 3 lines" {
    run filelist ${TMP_DIR} -o ${TMP_DIR}/test.bats -e jpg
    [ $(cat ${TMP_DIR}/test.bats | wc -l) -eq 3 ]
}

@test 'Working well -a option: The output file will contain ${TMPDIR} path' {
    run filelist ${TMP_DIR} -o ${TMP_DIR}/test.bats -a
    [[ $(cat ${TMP_DIR}/test.bats) =~ ${TMPDIR} ]]
}

@test "Working well --dotfile option: The output file will contain 18 lines" {
    run filelist ${TMP_DIR} -o ${TMP_DIR}/test.bats --dotfile
    [ $(cat ${TMP_DIR}/test.bats | wc -l) -eq 18 ]
}

