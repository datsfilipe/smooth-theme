#!/bin/sh

yarn sass --watch src/scss:src/output --style=compressed &

compile_and_rename() {
  yarn sass src/scss:/tmp --style=compressed

  mv /tmp/custom.css $HOME/.config/Vencord/settings/quickCss.css
}

compile_and_rename
while true; do
  inotifywait -r -e modify,create,delete src/scss
  compile_and_rename
done
