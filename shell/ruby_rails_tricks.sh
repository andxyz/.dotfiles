# https://github.com/mislav/dotfiles/blob/755ebe6fa8a9ec066f50f3f55bb6eb96aad13462/shrc/ruby.sh
# ruby tricks

# rails console
function mmconsole() {
  if [ -f config/environment.rb ] && which pry >/dev/null; then
    pry -r./config/environment.rb
  elif [ -x script/rails ]; then
    script/rails console
  elif [ -x script/console ]; then
    script/console
  elif [ -f app.rb ]; then
    local repl=$(which pry >/dev/null && echo pry || echo irb)
    local args=$([ -n "$BUNDLE_GEMFILE" -o -f Gemfile ] && echo "-rbundler/setup")
    $repl $args -I. -r./app.rb
  else
    echo "no script/rails or script/console found" >&2
    return 1
  fi
}

# rails server
function mmserver() {
  if [ -x script/rails ]; then
    script/rails server "$@"
  elif [ -x script/server ]; then
    script/server "$@"
  else
    echo "no script/rails or script/server found" >&2
    return 1
  fi
}

# rails restart
function mmrestart() {
  mkdir -p tmp
  touch tmp/restart.txt
}
