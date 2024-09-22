# GIT BAA-ASH

We like sheep jokes. It gets BAAAD for us. 

## Description

For the lazy, the forgetful, the anal retentives, etc.  I present to you, GIT-BASH.  No more remembering the git commands in the specified order you need to use them in.  Git-bash will eventually turn into a rather complicated script very quickly. However, it will simplify how you deal with github immediately.  

# Git Bash Automation Script

## Overview

This bash script simplifies the process of managing git repositories by automating common tasks such as adding, committing, and pushing changes. It is particularly useful for both first-time users and returning users by providing an onboarding wizard and personalized configurations.

## Features

- **Onboarding Wizard**: For first-time users, the script guides you through setting up your environment:
  - Creates a hidden directory (`.git-bash`) for configuration.
  - Updates the `.gitignore` file to exclude the `.git-bash` directory.
  - Prompts for your name, email, GitHub username, and optionally your GitHub password, storing this information securely.

- **User-Friendly Interface**: Upon running the script, users are greeted with a message of the day (MOTD) style welcome message.

- **Streamlined Git Operations**: After onboarding, users can:
  - Add, commit, and push changes to their git repository with a single command.
  - Choose to re-run the onboarding wizard if needed.

## Usage

1.   **Getting Started**:
   ```bash
        git clone https://github.com/omnisophia/git-bash.git
        cd git-bash
        chmod +x git.sh
        cp git.sh ~/$YOURGITHUBREPO/
        cd ~/$YOURGITHUBREPO/
        ./git.sh
    ```

## Authors

# [OMNISOPHIA](https://www.omnisophia.com)

## Version History

* 0.1
    * Initial Release

## License

We don't know how we should license this thing.  Have fun. It's free. 

## Acknowledgments

To all my frustrations on the CLI.


## Breadcrumbs

We used this exact script to update itself. Talk about inception! 




