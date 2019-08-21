#!/bin/bash

OPTARGS=""

[[ ! -z "$LOG_LEVEL" ]] && OPTARGS="$OPTARGS -l $LOG_LEVEL"
[[ ! -z "$BOT_NAME" ]] && OPTARGS="$OPTARGS --bot $BOT_NAME"
[[ ! -z "$CONFIG_FILE" ]] && OPTARGS="$OPTARGS --config-file $CONFIG_FILE"
[[ ! -z "$EMOJI_TO_CONFIRM" ]] && OPTARGS="$OPTARGS --emoji-to-confirm $EMOJI_TO_CONFIRM"
[[ ! -z "$SLEEP_MS" ]] && OPTARGS="$OPTARGS --sleep-ms $SLEEP_MS"
[[ ! -z "$MIRROR_BOTS" ]] && OPTARGS="$OPTARGS --mirror-bots $MIRROR_BOTS"

[[ ! -z "$BOT_TOKEN" ]] && OPTARGS="$OPTARGS $BOT_TOKEN"

python ./slackrelay.py $OPTARGS