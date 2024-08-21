FROM python:3.11-alpine

WORKDIR /app

COPY . .

RUN apk add --no-cache mysql-client
RUN pip3 install -r requirements.txt
RUN chmod 755 start.sh

ENTRYPOINT ["sh", "start.sh"]