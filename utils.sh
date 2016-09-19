# Colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
RESET="$(tput sgr0)"

# Prints colored
# param 1 color value from the top
# param 2 string to be colored
function cecho {
  echo "$1$2$RESET"
}
