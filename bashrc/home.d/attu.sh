
# connect to attu
attu () {
  ssh cooperdj@attu.cs.washington.edu
}

# mount attu home directory
mntcse () {
  if [ ! -d ~/CSE ]
  then
    mkdir ~/CSE
  fi
  sshfs cooperdj@attu.cs.washington.edu: ~/CSE
  if [ "$1" ]
  then
    cd ~/CSE/"$1"
  else
    cd ~/CSE
  fi
}
# unmount attu home directory
unmntcse () {
  if [ "${PWD##/home/cooper/CSE}" != "${PWD}" ]
  then
    cd
  fi
  fusermount -u ~/CSE
  rmdir ~/CSE
}
