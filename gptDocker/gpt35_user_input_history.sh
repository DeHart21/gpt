#!/bin/bash

# Define the file path for saving the conversation history
history_file="gptContainerFiles/conversation_history.json"

# Initialize the conversation history array by reading from the file
if [ -f $history_file ]; then
  conversation_history=($(cat $history_file))
  echo $(cat $history_file)
else
  conversation_history=()
fi

# Add a system message to instruct the AI to act as a coding expert
conversation_history+=('{"role": "system", "content": "You are a coding expert."}')

# Add the user's message to the conversation history
conversation_history+=('{"role": "user", "content": "'"${user_input}"'"}')

# Prepare the conversation history string for the API call
messages=$(echo "${conversation_history[*]}" | jq -c -s '. | map({role: .role, content: .content})')

echo ${messages}

response=$(curl -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
       "model": "gpt-3.5-turbo",
       "messages": '"${messages}"',
       "temperature": 0.7
     }')


ai_response_instant=$(echo $response | jq '.choices[0].message.content')

# Add the AI's response to the conversation history
conversation_history+=('{"role": "assistant", "content": "'"${ai_response_instant//\"}"'"}')

# Save the conversation history to the file
echo "${conversation_history[@]}" > $history_file

echo "AI Response: $ai_response_instant"

