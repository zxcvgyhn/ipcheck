# ipcheck.sh

Bash: Ensure Bash is installed (the script is compatible with Git Bash on Windows).
curl: The script uses curl to retrieve IP addresses from online services.

# Installatio

    git clone [https://github.com/yourusername/ip.sh.git](https://github.com/zxcvgyhn/ip.sh.git)
    cd ipcheck/ip_sh

Make the Script Executable:

bash

    chmod +x ip.sh

Usage

To run the script, use:

    ./ip.sh

The script will display the IP addresses retrieved from multiple sources and highlight the consensus as follows:

    Green: All sources match.
    Yellow: Majority match (50% or more).
    Red: Low consensus (less than 50%).

Move the Script to a Directory in Your PATH:

    mv ip.sh /usr/local/bin/ipcheck



Add an Alias to .bashrc: Open .bashrc in your preferred editor:


    nano ~/.bashrc

Add the following line to create an alias for the script:

    alias ipcheck='/usr/local/bin/ipcheck'

Source .bashrc to Apply Changes:

    source ~/.bashrc

Now, you can simply run:

    ipcheck

#Compatibility

This script is compatible with:

Bash on Linux and macOS.
Git Bash on Windows.
