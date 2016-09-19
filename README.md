# Tools

Tools module used for infrastrcture organization as well as common modules to be used by other main modules.

# Usage
1) Install git
2) Git clone this repository
3) Execute bootstrap.sh

> NOTE: If you are using zsh, you will need to recreate the equivalent settings in the .bashrc file

# How this works...
This repo will be used by us to ensure we have the same environment everywhere. We do so by listing all of our requirements in this repository such that it will be automatically synced.

### Initial Run
- Upon the first execution of bootstrap.sh, all of the required default modules will be installed and a `.manifest_current` file will be created. This will be used to determine the state of your environment. Bootstrap will be added such that it will be a "startup program" and will run upon every reboot.
- Upon successive manual runs, a manifest will be compared to the current manifest (`.manifest_current`). If they do not match, the process will repeat.
