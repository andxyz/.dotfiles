##### the e editor shortcut for sublimetext (github.com/bkeepers tip)
function e
  # rm -rf project.sublime-workspace > /dev/null 2>&1
  if test -f project.sublime-project
    subl ./project.sublime-project
  else
    subl -n ./
  end
end
