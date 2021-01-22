function s() {
  git status
}

function g+() {
  git add .
}

function g-() {
  git reset HEAD .
}

function ls() {
  command ls -al --color "$@"
}

function x() {
  exit
}
