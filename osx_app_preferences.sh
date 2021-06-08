#!/usr/bin/env bash

set -x
set -e

# LSTOOL_HOME='/Users/andrew/Library/PreferencePanes/RCDefaultApp.prefPane/Contents/Resources/'
EDITOR_PATH='/Applications/Sublime Text.app' #Sublimetext3
# LSREG_HOME="/Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Products/Release"
LSREG_HOME=${HOME}/bin
LSREG_TOOL="${LSREG_HOME}/swda"

# First download a compiled swda from https://github.com/Lord-Kamina/SwiftDefaultApps/releases

## first you must compile swda from https://github.com/Lord-Kamina/SwiftDefaultApps
# git clone git@github.com:Lord-Kamina/SwiftDefaultApps.git
# cd SwiftDefaultApps
# git submodule update --init --recursive
# open SwiftDefaultApps.xcworkspace
## Product -> schemes -> build CLI
# open /Users/andrewstevens/Library/Developer/Xcode/DerivedData/
## find swda and use it
#

# cd /Users/andrew/code/git/SwiftDefaultApps

# export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer

# export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk

# /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -incremental \
# -module-name SwiftCLI -Onone -enable-batch-mode \
# -enforce-exclusivity=checked @/Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Intermediates.noindex/SwiftDefaultApps\ CLI.build/Debug/SwiftCLI.build/Objects-normal/x86_64/SwiftCLI.SwiftFileList \
# -DSWIFT_PACKAGE -DXcode -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk \
# -target x86_64-apple-macos10.15 \
# -g \
# -module-cache-path /Users/andrew/Library/Developer/Xcode/DerivedData/ModuleCache.noindex \
# -Xfrontend -serialize-debugging-options -enable-testing \
# -index-store-path /Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Index/DataStore \
# -swift-version 5 -I /Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Products/Debug \
# -F /Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Products/Debug \
# -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks \
# -c -j12 -output-file-map /Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Intermediates.noindex/SwiftDefaultApps\ CLI.build/Debug/SwiftCLI.build/Objects-normal/x86_64/SwiftCLI-OutputFileMap.json \
# -parseable-output -serialize-diagnostics \
# -emit-dependencies -emit-module -emit-module-path /Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Intermediates.noindex/SwiftDefaultApps\ CLI.build/Debug/SwiftCLI.build/Objects-normal/x86_64/SwiftCLI.swiftmodule \
# -Xcc -I/Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Intermediates.noindex/SwiftDefaultApps\ CLI.build/Debug/SwiftCLI.build/swift-overrides.hmap \
# -Xcc -I/Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Products/Debug/include \
# -Xcc -I/Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Intermediates.noindex/SwiftDefaultApps\ CLI.build/Debug/SwiftCLI.build/DerivedSources-normal/x86_64 \
# -Xcc -I/Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Intermediates.noindex/SwiftDefaultApps\ CLI.build/Debug/SwiftCLI.build/DerivedSources/x86_64 \
# -Xcc -I/Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Intermediates.noindex/SwiftDefaultApps\ CLI.build/Debug/SwiftCLI.build/DerivedSources \
# -emit-objc-header -emit-objc-header-path /Users/andrew/Library/Developer/Xcode/DerivedData/SwiftDefaultApps-akayzniwfxeojlczrbiwbzphucas/Build/Intermediates.noindex/SwiftDefaultApps\ CLI.build/Debug/SwiftCLI.build/Objects-normal/x86_64/SwiftCLI-Swift.h \
# -working-directory /Users/andrew/code/git/SwiftDefaultApps

# /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc \
# -module-name SwiftCLI \
# -Onone \
# -enable-batch-mode \
# -enforce-exclusivity=checked \
# -DSWIFT_PACKAGE \
# -DXcode -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/ -target x86_64-apple-macos11.1 \
# -g \
# -Xfrontend -serialize-debugging-options -enable-testing \
# -swift-version 5 \
# -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks \
# -c -j12 \
# -parseable-output -serialize-diagnostics \
# -working-directory /Users/andrew/code/git/SwiftDefaultApps
# -I ???


${LSREG_HOME}/swda getSchemes
${LSREG_HOME}/swda getHandler --web
${LSREG_HOME}/swda getHandler --mail
# ${LSREG_HOME}/swda getHandler --rss # errors for some reason
${LSREG_HOME}/swda getHandler --news

${LSREG_HOME}/swda getUTIs | grep -i Xcode
${LSREG_HOME}/swda getUTIs | grep -i MacVim
${LSREG_HOME}/swda getUTIs | grep -i Terminal
${LSREG_HOME}/swda getUTIs | grep -i TextEdit
${LSREG_HOME}/swda getUTIs | grep -i Sublime

## note: you can use the `mdls` command to find the UTI for a file:
# mdls ~/Desktop/tmp.js
# mdls ~/code/andxyz-dotfiles/ctags
#
## prints a bunch of stuff:
#
# kMDItemContentType                 = "com.netscape.javascript-source"
# kMDItemContentTypeTree             = (
#     "public.script",
#     "public.source-code",
#     "public.data",
#     "public.plain-text",
#     "public.item",
#     "com.netscape.javascript-source",
#     "public.content",
#     "public.executable",
#     "public.text"
# )

# uhh sure
${LSREG_TOOL} setHandler --UTI 'com.apple.applescript.text' --application "${EDITOR_PATH}"

# uhh sure okay
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.bash-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.csh-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.ksh-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.make-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.tcsh-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.zsh-script' --application "${EDITOR_PATH}"

# uhh sure
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.ada-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.fortran-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.lex-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.pascal-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.mig-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.strings-dictionary' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.strings-text' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.usersettings' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.xcode.yacc-source' --application "${EDITOR_PATH}"

# uhh
${LSREG_TOOL} setHandler --UTI 'com.apple.xml-property-list' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.pixar.usd.ascii' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.pixar.usd.crate' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.sun.java-source' --application "${EDITOR_PATH}"

# sourcecode
${LSREG_TOOL} setHandler --UTI 'com.netscape.javascript-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'org.vim.tex-file' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'org.vim.vim-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.ada-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.assembly-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.c-header' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.c-plus-plus-header' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.c-plus-plus-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.c-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.fortran-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.module-map' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.nasm-assembly-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.objective-c-plus-plus-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.objective-c-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.opencl-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.patch-file' --application "${EDITOR_PATH}"
# more sourcecode
${LSREG_TOOL} setHandler --UTI 'com.apple.alias-file' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.alias-record' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.terminal.shell-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.directory' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.file-url' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.json' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.source-code.preprocessed' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.symlink' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.xml' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.yaml' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.filename-extension' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.data' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.item' --application "${EDITOR_PATH}"


# scripts
${LSREG_TOOL} setHandler --UTI 'public.bash-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.csh-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.ksh-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.perl-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.php-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.python-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.ruby-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.shell-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.source-code' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.swift-source' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.tcsh-script' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.zsh-script' --application "${EDITOR_PATH}"


# basic text
${LSREG_TOOL} setHandler --UTI 'net.daringfireball.markdown' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.case-insensitive-text' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.comma-separated-values-text' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.css' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.data' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.delimited-values-text' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.log' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'com.apple.log' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.plain-text' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.rss' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.tab-separated-values-text' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.text' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.utf16-external-plain-text' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.utf16-plain-text' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.utf8-plain-text' --application "${EDITOR_PATH}"
${LSREG_TOOL} setHandler --UTI 'public.utf8-tab-separated-values-text' --application "${EDITOR_PATH}"

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
