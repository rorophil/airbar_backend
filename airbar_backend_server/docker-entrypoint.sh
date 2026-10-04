#!/bin/sh
set -e

exec ./bin/server \
  --mode="${runmode}" \
  --server-id="${serverid}" \
  --logging="${logging}" \
  --role="${role}" \
  "$@"
