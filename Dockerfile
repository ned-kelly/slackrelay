FROM python:3

WORKDIR /opt/slack-relay

COPY entrypoint.sh requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "bash", "/opt/slack-relay/entrypoint.sh" ]
