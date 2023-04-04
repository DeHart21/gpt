bash
    docker build -t test
    docker run -e OPENAI_API_KEY=$OPENAI_API_KEY -v $PWD/gptContainerFiles:/app/gptContainerFiles test "Hello my name is Bob."
