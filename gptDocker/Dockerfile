FROM ubuntu:focal-20230301

WORKDIR /app

COPY gpt35_user_input_history.sh /app/

RUN apt-get update

RUN apt-get install -y curl jq

CMD ["/bin/bash", "/app/gpt35_user_input_history.sh"]
