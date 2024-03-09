#!/bin/bash
echo "$(date --iso=seconds) | Running apply-limit.sh"
echo "$(date --iso=seconds) | Running apply-limit.sh" > /cronlog.txt

cd /output

LIMIT=$(echo "5G" | numfmt --from=iec)

SIZE=$(du | tr -dc '0-9')
while [ "$SIZE" -gt "$LIMIT" ];
do
  echo "$(date --iso=seconds) | Space occupied by the recordings: $SIZE bytes is greater than configured limit $LIMIT bytes"

  OLDEST=$(ls -tp | grep -v '/$' | tail -n 1)
  echo "$(date --iso=seconds) | Removing file $OLDEST"
  rm "$OLDEST"
  sleep 1

  SIZE=$(du | tr -dc '0-9')
done