#!/usr/bin/env bats

SCRIPT_FILE_NAME=$(basename $0)
SCRIPT_NAME=${SCRIPT_FILE_NAME%.*}
SELF=$(cd $(dirname $0); pwd)

APP=$(${SELF}/${SCRIPT_FILE_NAME})
TMP_FILE=''
TMP_DIR=''

setup() {
    TMP_FILE=$(mktemp -t "bats_${SCRIPT_FILE_NAME}")
    TMP_DIR=$(mktemp -d -t "bats_${SCRIPT_FILE_NAME}")
}

teardown() {
  rm -rf ${TMP_FILE}
  rm -rf ${TMP_DIR}
}

@test "Running no argument given." {
    run ${APP}
    [ "${status}" -eq 0 ]
    #[ "${#DIR[@]}" -eq 1 ]
}

@test "Running full options given." {
    run ${APP} ${TMP_DIR} -a -o ${TMP_DIR}/test.bats -e jpg -d ','
  [ "${status}" -eq 0 ]
}

