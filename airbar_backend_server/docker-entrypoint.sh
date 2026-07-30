#!/bin/sh
set -e

exec ./server \
  --mode="${runmode}" \
  --server-id="${serverid}" \
  --logging="${logging}" \
  --role="${role}" \
  "$@"
