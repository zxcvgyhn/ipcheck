# ip.sh

    Bash: Ensure Bash is installed (the script is compatible with Git Bash on Windows).
    curl: The script uses curl to retrieve IP addresses from online services.

Installation

    Clone the Repository (if in a Git repository):

    bash

git clone https://github.com/yourusername/your-repo-name.git
cd your-repo-name

Make the Script Executable:

bash

    chmod +x ip.sh

Usage

To run the script, use:

bash

./ip.sh

The script will display the IP addresses retrieved from multiple sources and highlight the consensus as follows:

    Green: All sources match.
    Yellow: Majority match (50% or more).
    Red: Low consensus (less than 50%).

Adding to .bashrc

To make the script accessible from any directory:

    Move the Script to a Directory in Your PATH:

    bash

mv ip.sh /usr/local/bin/ipcheck

Add an Alias to .bashrc: Open .bashrc in your preferred editor:

bash

nano ~/.bashrc

Add the following line to create an alias for the script:

bash

alias ipcheck='/usr/local/bin/ipcheck'

Source .bashrc to Apply Changes:

bash

    source ~/.bashrc

Now, you can simply run:

bash

ipcheck

Compatibility

This script is compatible with:

    Bash on Linux and macOS.
    Git Bash on Windows.
