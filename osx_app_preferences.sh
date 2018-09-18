#!/usr/bin/env bash

set -x
set -e

LSTOOL_HOME='/Users/andxyz/Library/PreferencePanes/RCDefaultApp.prefPane/Contents/Resources/'
EDITOR_PATH='/Applications/Sublime Text 3.app'
LSREG_HOME="/Users/andrewstevens/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-efkgcqjeguekrhfjgqyylhkbfjxl/Build/Products/Release/"

## first you must compile lsreg from https://github.com/Lord-Kamina/SwiftDefaultApps
# git clone git@github.com:Lord-Kamina/SwiftDefaultApps.git
# cd SwiftDefaultApps
# git submodule update --init --recursive
# open SwiftDefaultApps.xcworkspace
## Product -> schemes -> build CLI
# open /Users/andrewstevens/Library/Developer/Xcode/DerivedData/
## find lsreg and use it


${LSREG_HOME}/lsreg getSchemes
${LSREG_HOME}/lsreg getHandler --web
${LSREG_HOME}/lsreg getHandler --mail
# ${LSREG_HOME}/lsreg getHandler --rss # errors for some reason
${LSREG_HOME}/lsreg getHandler --news

# ${LSREG_HOME}/lsreg getUTIs | grep Xcode
#

# uhh sure
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.applescript.text' --application "${EDITOR_PATH}"

# uhh sure okay
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.bash-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.csh-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.ksh-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.make-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.tcsh-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.zsh-script' --application "${EDITOR_PATH}"

# uhh sure
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.ada-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.fortran-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.lex-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.pascal-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.mig-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.strings-dictionary' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.strings-text' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.usersettings' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xcode.yacc-source' --application "${EDITOR_PATH}"

# uhh
${LSREG_HOME}/lsreg  setHandler --UTI 'com.apple.xml-property-list' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.pixar.usd.ascii' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.pixar.usd.crate' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'com.sun.java-source' --application "${EDITOR_PATH}"

# sourcecode
${LSREG_HOME}/lsreg  setHandler --UTI 'public.assembly-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.c-header' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.c-plus-plus-header' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.c-plus-plus-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.c-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.module-map' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.nasm-assembly-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.objective-c-plus-plus-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.objective-c-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.opencl-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.xml' --application "${EDITOR_PATH}"

# scripts
${LSREG_HOME}/lsreg  setHandler --UTI 'public.bash-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.csh-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.ksh-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.perl-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.php-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.python-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.ruby-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.shell-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.source-code' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.swift-source' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.tcsh-script' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.zsh-script' --application "${EDITOR_PATH}"

# basic text
${LSREG_HOME}/lsreg  setHandler --UTI 'net.daringfireball.markdown' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.case-insensitive-text' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.comma-separated-values-text' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.css' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.data' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.delimited-values-text' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.log' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.plain-text' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.rss' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.tab-separated-values-text' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.text' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.utf16-external-plain-text' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.utf16-plain-text' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.utf8-plain-text' --application "${EDITOR_PATH}"
${LSREG_HOME}/lsreg  setHandler --UTI 'public.utf8-tab-separated-values-text' --application "${EDITOR_PATH}"

##
##
# OLD LSTOOL STUFF IS BELOW
##
##
#
#

# ${LSTOOL_HOME}/lstool --help
# ${LSTOOL_HOME}/lstool apps | grep -i sublime
# ${LSTOOL_HOME}/lstool apps | grep -i vim

# ${LSTOOL_HOME}/lsreg write "extension" ".textmate_init" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "adp" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "asa" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "bash" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "bash_login" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "bash_logout" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "bash_profile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "bashrc" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "bat" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "bib" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "bsh" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "build" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "capfile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "cgi" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "cpt" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "cpy" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "cs" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "css" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "css.erb" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "ctp" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "d" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "ddl" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "di" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "dml" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "dtml" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "el" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "emakefile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "Emakefile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "erb" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "erbsql" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "erl" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "fcgi" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "gemspec" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "geojson" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "GNUmakefile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "groovy" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "gvy" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "hrl" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "hs" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "htc" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "inc" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "inl" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "irbrc" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "js" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "json" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "jsp" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "jsx" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "lhs" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "lisp" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "lua" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "Makefile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "makefile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "markdn" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "markdown" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "matlab" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "md" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "mdown" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "ml" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "mli" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "mll" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "mly" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "mud" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "OCamlMakefile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "opml" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "pod" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "profile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "properties" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "pt" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "py" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "pyw" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "rake" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "Rakefile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "rb" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "rbw" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "rbx" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "re" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "rhtml" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "rjs" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "Rprofile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "rpy" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "rss" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "rxml" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "scala" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "scm" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "SConscript" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "SConstruct" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "sconstruct" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "Sconstruct" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "sh" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "sql" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "ss" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "sublime-build" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "sublime-keymap" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "sublime-menu" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "sublime-project" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "sublime-settings" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "sublime-snippet" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "sublime-theme" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "svg" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "t" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "tcl" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "tcsh" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "textile" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "tld" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "tmLanguage" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "tmpl" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "tmPreferences" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "tmSnippet" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "tmTheme" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "tpl" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "vcproj" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "xhtml" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "XHTML" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "xsd" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "xsl" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "xslt" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "yaml" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "yaws" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "extension" "yml" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "uti" "com.apple.xcode.zsh-script" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "uti" "net.daringfireball.markdown" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "uti" "public.perl-script" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "uti" "public.python-script" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "uti" "public.ruby-script" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "uti" "public.script" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "uti" "public.shell-script" "${EDITOR_PATH}"
# ${LSTOOL_HOME}/lstool write "uti" "public.source-code" "${EDITOR_PATH}"
