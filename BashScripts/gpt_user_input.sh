#!/bin/bash

#!/bin/bash

echo "Enter your message:"
read user_input

response=$(curl -s https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
     "model": "gpt-3.5-turbo",
     "messages": [{"role": "user", "content": "'"${user_input}"'"}],
     "temperature": 0.7
   }')

echo $response | jq '.choices[0].message.content'

