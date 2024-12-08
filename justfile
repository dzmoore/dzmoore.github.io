umletUrl := "https://www.umlet.com/download/umlet_15_1/umlet-standalone-15.1.zip"
umletPath := "/tmp/umlet"
umletJar := umletPath / "Umlet/umlet.jar"
sitePath := "site"
renderedSitePath := "_site"
serveSitePath := "_serve"

default:
  just --list

clean:
  rm -rf _site

bundle-install:
  bundle install

build: bundle-install renderUmlet invertUmlet
  bundle exec jekyll build --source {{sitePath}} --destination {{renderedSitePath}}

serve: build
  #!/usr/bin/env bash
  set -euxo pipefail
  (
    trap 'kill 0' SIGINT; (
      watchexec -w site/assets/umlet just renderUmlet invertUmlet &
      bundle exec jekyll serve --source {{renderedSitePath}} --destination {{serveSitePath}} --watch &
      wait
    )
  )

renderUmlet:
  #!/usr/bin/env bash
  set -euxo pipefail
  if [ ! -f "{{umletJar}}" ]; then
    rm -rf "{{umletPath}}"
    mkdir -p "{{umletPath}}"
    curl -L -o "{{umletPath}}/umlet.zip" "{{umletUrl}}"
    unzip -d "{{umletPath}}" "{{umletPath}}/umlet.zip"
  fi

  mkdir -p _site/assets/images/umlet

  find "{{sitePath}}/assets/umlet" -name '*.uxf' | 
    sed 's/{{sitePath}}\/assets\/umlet\///' |
    sed 's/\.uxf//' |
    xargs -I {} \
     java -jar "{{umletJar}}" \
       -action=convert \
       -format=png \
       -filename='{{sitePath}}/assets/umlet/{}.uxf' \
       -output='{{renderedSitePath}}/assets/images/umlet/{}.png'

invertUmlet: renderUmlet
  #!/usr/bin/env bash
  set -euxo pipefail
  mkdir -p {{renderedSitePath}}/assets/images/umlet/inverted

  find {{renderedSitePath}}/assets/images/umlet -maxdepth 1 -name '*.png' | 
    sed 's/{{renderedSitePath}}\/assets\/images\/umlet\///' | 
    xargs -I {} \
      magick \
        {{renderedSitePath}}/assets/images/umlet/{} \
        -channel RGB \
        -negate \
        {{renderedSitePath}}/assets/images/umlet/inverted/{}