#!/usr/bin/env bash

UMLET_URL="${1:-https://www.umlet.com/download/umlet_15_1/umlet-standalone-15.1.zip}"
UMLET_PATH='/tmp/umlet'
UMLET_JAR="$UMLET_PATH/Umlet/umlet.jar"

if [ ! -f "$UMLET_JAR" ]; then
  rm -rf "$UMLET_PATH"
  mkdir -p "$UMLET_PATH"
  curl -L -o "$UMLET_PATH/umlet.zip" "$UMLET_URL"
  unzip -d "$UMLET_PATH" "$UMLET_PATH/umlet.zip"
fi

mkdir -p _site/assets/images/umlet

find assets/umlet -name '*.uxf' | 
  sed 's/assets\/umlet\///' |
  sed 's/\.uxf//' |
  xargs -I {} \
    java -jar "$UMLET_JAR" \
      -action=convert \
      -format=png \
      -filename='assets/umlet/{}.uxf' \
      -output='_site/assets/images/umlet/{}.png'

mkdir -p _site/assets/images/umlet/inverted

find _site/assets/images/umlet -name '*.png' | 
  sed 's/_site\/assets\/images\/umlet\///' | 
  xargs -I {} \
    magick convert \
      _site/assets/images/umlet/{} \
      -channel RGB \
      -negate \
      _site/assets/images/umlet/inverted/{}
