slackrelay
-------------

slackrelay is a Slack bot which relays every message from a Slack channel to one or more predetermined backends, according to a set of preconfigured rules persisted in a config file. A key goal is to enable channel mirroring across different Slack teams.

Currently, two backends are supported (but others, e.g., **irc**, can be easily integrated):
* **echo**: simply echoes the original message in the same Slack channel (for testing purposes).
* **slack-iwh**: uses incoming web hooks to relay every message to another Slack channel, possibly from another team.

Usage
-----

```
slackrelay.py [-h] [-l {debug,info,warning,error}] [-b BOT]
                        [-f CONFIG_FILE] [-s SLEEP_MS] [-v]
                        bot_user_token

Slack Relay Bot

positional arguments:
  bot_user_token

optional arguments:
  -h, --help            show this help message and exit
  -l {debug,info,warning,error}, --log {debug,info,warning,error}
                        Log level
  -b BOT, --bot BOT     Bot name
  -f CONFIG_FILE, --config-file CONFIG_FILE
                        Configuration file
  -s SLEEP_MS, --sleep-ms SLEEP_MS
                        Polling interval (ms)
  -v, --version         show program's version number and exit
```

Workflow
-------

1. `git clone git@github.com:cgiuffr/slackrelay.git`
2. Add a bot user to your Slack team and note down its `$bot_user_token`
3. Add an incoming web hook to the Slack channel you want to relay messages to (slack-iwh backend)
4. Add the bot user to the channel you want to relay messages from
5. `python slackrelay.py $bot_user_token`
6. Type `@slackrelay help` to interact with the bot and add rules to relay messages
7. When mirroring a channel across teams (slack-iwh backend), repeat the (symmetric) procedure for the other team

Usage example
-------------

```
@slackrelay help
@slackrelay rule-list
@slackrelay rule-add { "backend": "echo", "name": "echo-test" }
@slackrelay rule-list
Test message1
@slackrelay rule-add { "backend": "slack-iwh", "backend-channel": "#dest", "backend-url": "https://hooks.slack.com/services/dest/incoming-web-hook/url", "name": "dest-relay" }
@slackrelay rule-list
Test message2
@slackrelay rule-del echo-test
@slackrelay rule-list
Test message3
```

