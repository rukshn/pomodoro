# Pomodoro
A simple pomodoro shell script

![Screenshot](http://i.imgur.com/P53pj9z.png)

*How you see notifications*

![Screenshot](http://i.imgur.com/CQUuaBI.png)

## How to use

You can either copy the code to your ~/.bashrc file or simply run

    source pomodoro.sh && pomo

There after 
    
    pomo

## Options
    pomo [option][message]
  
  Options
  
    -v version
    -h help screen
    -l long break
    -s short break
    -d duration in minutes
    [message] custom message to be displayed after timeout, make sure the message is under quotes

### Long breaks
  Long breaks are 15 minute breaks started by giving -l command, you will be notified after 15 minutes
  
    pomo -l
  
### Short breaks
  Short breaks are 5 minute breaks started by giving -s command, you will be notified after 5 minutes

    pomo -s

### Custom duration
  Sets custom duration of timer in minutes by giving -d command

    # 45 minute timer
    pomo -d 45

## Messages
Custom messages to be shown after breaks

    pomo -l 'time is up'
    pomo 'time is up'

Made it during my spare time. Forkit, improve it, star it, have fun.
Inspired by [this](https://twitter.com/rob_dodson/status/695864071837470720)
