# Apt stuff
if which apt-get &> /dev/null; then
  alias agi='sudo apt-get install'
  alias agp='sudo apt-get purge'
  alias agr='sudo apt-get remove'
  alias agu='sudo apt-get update'
  alias agug='sudo apt-get upgrade'
  alias aguu='sudo apt-get update && sudo apt upgrade'
  alias agar='sudo apt-get autoremove'
  alias agdu='sudo apt-get dist-upgrade'
fi
