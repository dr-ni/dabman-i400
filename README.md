
# Dabman i400 Remote Control

This API description was initially forked from https://github.com/tabacha/dabman-api (i450 devices)

It has been modified and improved for i400 devices


# COMMANDS

## GetSystemInfo
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/GetSystemInfo
```

## Sendkey
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/Sendkey/Sendkey?key=\<KEY\>
```

| KEY | Description |
|-----|-------------|
| 1 | Home |
| 2 | Up |
| 3 | Down |
| 4 | Left |
| 5 | Right |
| 6 | Enter |
| 7 | Power |
| 8 | Mute |
| 9 | Vol+ |
| 10 | Vol- |
| 11 | Alarm |
| 12 | Sleep |
| 13 | Language |
| 14 | Light |
| 15 | Fav-List |
| 28 | Mode |
| 29 | Play/Pause |
| 31 | Next |
| 32 | Prev |
| 115 | 1 |
| 116 | 2 |
| 116 | 3 |
| 117 | 4 |
| 118 | 5 |
| 119 | 6 |
| 120 | 7 |
| 121 | 8 |
| 122 | 9 |
| 123 | 10 |
| 168 | Settings |

## Init

```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/init?language=de
```

## Hotkey-list
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/hotkeylist
```

## Play-info
working only on wlan interface not working for Wire Interface:
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/playinfo
```

## DAB hotkey-list
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/DABhotkeylist
```

## Play DAB-hotkey
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/playDABhotkey?key=1
```

## Play local URL
to be checked: seams to work only for special files/domains

```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/LocalPlay?url=http://<URL>/msg.wav&name=intercom
```
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/LocalPlay?url=http://<URL>/msg.wav&save=1
```

## Play station with ID
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/play_stn?id=91_6
```

## irdevice.xml
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/irdevice.xml
```

## Stop
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/stop
```

## Exit
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/exit
```

## Back
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/back
```

## Playlogo
works only if Radiostation has a play logo
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/playlogo.jpg
```


## Play status
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/background_play_status
```

## GetFMFAVlist
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/GetFMFAVlist
```

## GotoFMfav
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/GotoFMfav?fav=<ID>
```

## Set volume and mute
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/setvol?vol=9&mute=0
```

## GetFMStatus
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/GetFMStatus
```

## GetBTStatus
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/GetBTStatus
```

# Search and show results example
## Search for station called "radio"
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/searchstn?str=radio
```
Result:
```
<?xml version="1.0" encoding="UTF-8"?>
<result><id>100</id><rt>OK</rt></result>
```

```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/gochild?id=100
```
Result:
```
<?xml version="1.0" encoding="UTF-8"?>
<result><id>100</id></result>
```

```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' 'http://dabman/list?id=100&start=1&count=100'
```
Result:
```{=xml}
<?xml version="1.0" encoding="UTF-8"?>
<menu>
  <item_total>248</item_total>
  <item_return>20</item_return>
  <item><id>100_1</id>
    <status>file</status>
    <name>#%RD RADIO.DISCOunt</name>
  </item>
  <item>
    <id>100_2</id><status>file</status>
    <name>#POPHITS</name>
  </item>
  <item>
    <id>100_3</id>
    <status>file</status>
    <name>#Pop Radio</name>
  </item>
  <item>
    <id>100_4</id>
    <status>file</status>
    <name>'t Is Vloms Radio</name>
  </item>
  <item>
    <id>100_5</id>
    <status>file</status>
    <name>'MEGA RADIO</name>
  </item>
  <item>
    <id>100_6</id>
    <status>file</status>
    <name>(((EBM Radio)))</name>
  </item>
  <item>
    <id>100_7</id>
    <status>file</status>
    <name>(a)ac Radio FM</name>
    </item>
  <item>
    <id>100_8</id>
    <status>file</status>
    <name>1 Classic</name>
  </item>
  <item>
    <id>100_9</id>
    <status>file</status>
    <name>1 HITS 50s</name>
  </item>
  <item>
    <id>100_10</id>
    <status>file</status>
    <name>1 HITS 60s</name>
  </item>
  <item>
    <id>100_11</id>
    <status>file</status>
    <name>1 HITS 70s</name>
  </item>
  <item>
    <id>100_12</id>
    <status>file</status>
    <name>1 HITS 80s</name>
  </item>
  <item>
    <id>100_13</id>
    <status>file</status>
    <name>1 HITS 90s</name>
  </item>
  <item>
    <id>100_14</id>
    <status>file</status>
    <name>1 MASTER HIP-HOP</name>
  </item>
  <item>
    <id>100_15</id>
    <status>file</status>
    <name>1 Music Radio</name>
  </item>
  <item>
    <id>100_16</id>
    <status>file</status>
    <name>1 Pure EDM Radio</name>
  </item>
  <item>
    <id>100_17</id>
    <status>file</status>
    <name>1 Radio Dance</name>
  </item><item>
    <id>100_18</id>
    <status>file</status>
    <name>1 Radio Jazz</name>
  </item>
  <item>
    <id>100_19</id>
    <status>file</status>
    <name>1 Radio Lounge</name>
  </item>
  <item>
    <id>100_20</id>
    <status>file</status>
    <name>1-Dance</name>
  </item>
</menu>
```


# Other Commands

http://dabman:52525/root_XXYY.xml

http://dabman:52525/root_XXYY_S.xml
