source "${HOME}"/.ktx

# Parrallelized tar bzip2
pbzipper() {
  tar -cv $1 | pbzip2 -m500 > $1.tar.bz2
}

### Backup function for Work Laptop ###
backupSkillsoft() {
  pbzipper $1
  split -b 9000m $1.tar.bz2 "$1.tar.bz2.part."
}

export AWS_PROFILE=develop
