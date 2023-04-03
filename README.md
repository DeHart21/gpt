# GPT-3.5 Turbo Bash Script

This repository contains a bash script to interact with OpenAI's GPT-3.5 Turbo model using the OpenAI API. The script accepts user input, sends it to the API, and outputs the AI's response in a readable format.

## Prerequisites


You need to have an OpenAI API key. 
Set it as an environment variable:

`export OPENAI_API_KEY="your_api_key_here"`

Install `jq` to format the JSON output:

For Ubuntu or Debian-based systems:


`sudo apt-get install jq`


For macOS using Homebrew:

`brew install jq`

Usage

 Make the script executable:
    chmod +x gpt_user_input.sh

Run the script:

    ./gpt_user_input.sh

The script will prompt you to enter your message, and it will display the AI's response in a readable format.

## How to use Docker implementation of interacting with gpt api.


This repository contains a Dockerfile to build and run a GPT-3.5 AI chat application. To use the Dockerfile, follow the steps below:
    Ensure that you have Docker installed on your system. If not, download and install it from the official Docker website.
    Open a terminal and navigate to the /gpt/gptDocker/ directory where the Dockerfile is located.
    Build the Docker image using the following command. Replace `<name_of_image>` with the desired name for the image:

`docker build -t <name_of_image>`

After the build is complete, run the Docker container with the following command. Replace <API_KEY> with your OpenAI API key, <prompt> with the user input prompt, and <name_of_image> with the name of the image you used in the previous step:
```
bash
    export OPENAI_API_KEY="<API_KEY>" 
    docker run -e OPENAI_API_KEY=$OPENAI_API_KEY -v $PWD/gptContainerFiles:/app/gptContainerFiles <name_of_image> "<prompt>"
```
The container will start, and the GPT-3.5 AI chat application will process your input. The AI's response will be displayed in the terminal.


