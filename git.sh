#!/bin/bash

# Define the configuration file
CONFIG_DIR=".git-bash"
CONFIG_FILE="$CONFIG_DIR/git-bash.rc"

# Function to display the welcome message
function display_welcome() {
    echo ""
    echo ""
    echo ""
    echo " ░▒▓██████▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░ ░▒▓███████▓▒░▒▓█▓▒░░▒▓█▓▒░ "
    echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ "
    echo "░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ "
    echo "░▒▓█▓▒▒▓███▓▒░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓███████▓▒░░▒▓████████▓▒░░▒▓██████▓▒░░▒▓████████▓▒░ "
    echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ "
    echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ "
    echo " ░▒▓██████▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░ "
    echo "#####################################################################################"
    echo "##                       WELCOME TO GITBASH - OMNISOPHIA                           ##"
    echo "#####################################################################################"
    echo ""
    echo ""
}

# Function to handle onboarding
function onboarding() {
    echo "Hello! Let's set up your environment."

    # Create the hidden folder if it doesn't exist
    mkdir -p "$CONFIG_DIR"

    # Add the .git-bash/ to .gitignore
    if ! grep -q "$CONFIG_DIR/" .gitignore; then
        echo "$CONFIG_DIR/" >> .gitignore
    fi

    # Create the configuration file
    touch "$CONFIG_FILE"

    # Prompt for user information
    read -p "What is your name? " name
    read -p "What is your email? " email
    read -p "What is your GitHub username? " github_username
    read -p "Would you like to store your GitHub password? (yes/no) " store_password

    if [[ "$store_password" == "yes" ]]; then
        read -sp "What is your GitHub password? " github_password
        echo -e "\n"
    else
        github_password=""
    fi

    # Store the information in git-bash.rc
    {
        echo "name=$name"
        echo "email=$email"
        echo "github_username=$github_username"
        echo "github_password=$github_password"
    } > "$CONFIG_FILE"

    echo "Onboarding complete! Your information has been saved."
}

# Function to perform git operations
function git_operations() {
    source "$CONFIG_FILE"
    display_welcome

    # Prompt user for action
    echo "What would you like to do?"
    echo "1.) Add, Commit, Push repo"
    echo "2.) Onboard wizard"
    echo "3.) Exit"

    read -p "Please select an option (1-3): " option

    case $option in
        1)
            read -p "Please enter your commit message: " desc
            read -p "What branch would you like to use? " branch
            git add . && \
            git add -u && \
            git commit -m "$desc" && \
            git push origin "$branch" || echo "Git Update is complete. Please continue to push using 'git push' once you are ready."
            ;;
        2)
            onboarding
            ;;
        3)
            echo "Exiting. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
}

# Main script execution
if [ ! -f "$CONFIG_FILE" ]; then
    onboarding
fi

git_operations
