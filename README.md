# Tools

Tools module used for infrastrcture organization as well as common modules to be used by other main modules.

# Usage
1. Install git
2. Git clone this repository and change directory (`cd` command) to it.
3. Execute bootstrap.sh `/bin/bash bootstrap.sh`

#### NOTE
- You should note that I am using `/bin/bash` instead of a simple `sh` command. `sh` is basically a symlink to your default shell, you maybe using zsh like myself. I have written all of the code and rtested it with bash becuase that is the default shell that most of you likely will use. So when running any script, always use `/bin/bash`. I have already specified that bash is used in the first line but its a good practice in case someone forgets that.
- If you are using zsh, you will need to recreate the equivalent settings in the .bashrc file
- An alias will be added to your `.bashrc` which will expose a command, `bootstrap` simply run that command from here onwards and it will do exactly the same thing as Step 3.

# How this works...
This repo will be used by us to ensure we have the same environment everywhere. We do so by listing all of our requirements in this repository such that it will be automatically synced.

- The very first time `bootstrap.sh` is run, all of the required modules will be installed. A `.manifest_current` file will be created with a stamped manifest of the latest manifest. This will also involve a run of the latest manifest *delta* shell file located in the manifests directory
- On successive runs, bootstrap will git clone the remote directory and do the following...
1) Check if latest remote manifest has changed to the current manifest
2) If it has changed, run the corresponding manifest shell script
- A crontab is also installed which will automatically run this procedure for you in the background.once everyday. See crontab file as reference, this should be set to a smaller period in production. 

# How to contribute
If you have things that are need to be added and be deployed on all of the nodes, simple create a new manifest that matches the current unix time. The steps are listed below:

1. Run the following command to genereate the timestamp, `date +%s`
2. Copy paste this string into the .manifest such that it is the first line
3. Create an executable shell file with the same name, and add all of your requirements
4. Make a commit identifying the changes added and then create a pull request which should be vetted by at least two students.

#### A digression...
- You should always ensure you source the utils shell file, see the default one as reference.
- You should always overkill on the comments, to make code reviews easy
- If you are adding more pip modules, ensure the default virtualenv is sourced, prior to doing so. Also, make sure to append the module in the requirements.txt file as well. This way we have a global list of requirements, but have history of what modules were added for what reason.

