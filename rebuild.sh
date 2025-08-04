#!/usr/bin/env bash

# Menu for selecting the host and rebuilding the system using Nix

# Set prompt for select menu
PS3='Please enter your choice: '

# Define available options
options=("desktop" "laptop" "raspberry" "Quit")

# Display the menu and handle selection
select opt in "${options[@]}"; do
    case $opt in
        "desktop"|"laptop"|"raspberry")
            HOST="$opt"
            echo "Selected host: $HOST"
            break
            ;;
        "Quit")
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option: $REPLY"
            ;;
    esac
done

# Run NixOS rebuild with selected host
echo "Running: sudo nixos-rebuild switch --flake ./#$HOST --impure"
sudo nixos-rebuild switch --flake "./#$HOST" --impure

# Run home-manager switch
echo "Running: home-manager switch"
home-manager switch
