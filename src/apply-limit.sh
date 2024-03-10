#!/bin/bash
echo "$(date --iso=seconds) | Running apply-limit.sh"

cd /output

SPACE_LIMIT="${SPACE_WAIT:10G}"
LIMIT=$(echo "$SPACE_LIMIT" | numfmt --from=iec)

SIZE=$(du -sb | tr -dc '0-9')
while [ "$SIZE" -gt "$LIMIT" ];
do
  echo "$(date --iso=seconds) | Space occupied by the recordings: $SIZE bytes is greater than configured limit $LIMIT bytes"

  OLDEST=$(ls -tp | grep -v '/$' | tail -n 1)
  echo "$(date --iso=seconds) | Removing file $OLDEST"
  rm "$OLDEST"
  sleep 1

  SIZE=$(du -sb | tr -dc '0-9')
done

echo "$(date --iso=seconds) | Space occupied by the recordings: $SIZE bytes is less or equal than configured limit $LIMIT bytes; No further actions needed"
