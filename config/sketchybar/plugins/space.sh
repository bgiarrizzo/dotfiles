#!/bin/bash

# Get Color Codes
source "$CONFIG_DIR/colors.sh"

update() {
  COLOR=$BACKGROUND_2

  if [ "$SELECTED" = "true" ]; then
    BORDER_COLOR=$GREY
    BACKGROUND_COLOR=$DARK_GREEN
  fi

  sketchybar \
    --set $NAME \
    icon.highlight=$SELECTED \
    label.highlight=$SELECTED \
    background.border_color=$BORDER_COLOR \
    background.color=$BACKGROUND_COLOR
}

mouse_clicked() {
  yabai -m space --focus $SID 2>/dev/null

  # if [ "$BUTTON" = "right" ]; then
  #   yabai -m space --destroy $SID
  #   sketchybar --trigger windows_on_spaces --trigger space_change
  # else
  #   yabai -m space --focus $SID 2>/dev/null
  # fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
