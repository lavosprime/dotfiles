## Setup

Clone the repo:

```bash
git clone git@github.com:lavosprime/dotfiles.git
```

Add the following to `.bashrc`:

```bash
# Try to load version-controlled environment
export LAVOSPRIME_CONTEXT=#TODO
export LAVOSPRIME_MACHINE=#TODO
if [ -f ~/dotfiles/bashrc/init.sh ]; then
  . ~/dotfiles/bashrc/init.sh
fi
```
