# GPT-3.5 Turbo Bash Script

This repository contains a bash script to interact with OpenAI's GPT-3.5 Turbo model using the OpenAI API. The script accepts user input, sends it to the API, and outputs the AI's response in a readable format.

## Prerequisites

    You need to have an OpenAI API key. Set it as an environment variable:

`export OPENAI_API_KEY="your_api_key_here"`

Install jq to format the JSON output:

For Ubuntu or Debian-based systems:


`sudo apt-get install jq`


For macOS using Homebrew:

`brew install jq`

Usage

    Save the bash script provided in this README as gpt_user_input.sh.

    Make the script executable:


`chmod +x gpt_user_input.sh`

Run the script:
`./gpt_user_input.sh`

The script will prompt you to enter your message, and it will display the AI's response in a readable format.
