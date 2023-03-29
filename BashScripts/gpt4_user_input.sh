#!/bin/bash

# Initialize an empty array to store conversation history
conversation_history=()

while true; do
  echo "Enter your message:"
  read user_input

  # Add the user's message to the conversation history
  conversation_history+=('{"role": "user", "content": "'"${user_input}"'"}')

  # Prepare the conversation history string for the API call
  messages=$(IFS=,; echo "[${conversation_history[*]}]")

  response=$(curl -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
       "model": "gpt-4",
       "messages": '"${messages}"',
       "temperature": 0.7
     }')

  ai_response=$(echo $response | jq '.choices[0].message.content')

  # Add the AI's response to the conversation history
  conversation_history+=('{"role": "assistant", "content": "'"${ai_response//\"}"'"}')

  echo "AI Response: $ai_response"
done

