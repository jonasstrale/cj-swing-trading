#!/usr/bin/env bash

# Assuming git and code are installed and in PATH.
main() {
    if [[ "$OSTYPE" == darwin* ]]; then
        sed -E -i '' -e 's|(HOST_PATH=).*|\1'"${PWD}"'|' .env
    else
        sed -ri 's|(HOST_PATH=).*|\1'"${PWD}"'|' .env
    fi

    git update-index --assume-unchanged .env

    code jbeam-swing-trading.code-workspace

    return $?
}

main "$@"
exit $?
