
# Dabman i400 Remote Control

This API description was initially forked from https://github.com/tabacha/dabman-api (i450 devices)

It has been modified and improved for i400 devices.

To save your webradio station to favorits [1..5] first search the station and then choose it for playing (Play station with ID). Press 5 seconds the IR-Remote button "FAV+". Now the favorits menu appears and you have to choose place [1..5] with the IR-Remote UP/Down buttons. Finally press the IR-Remote button "ENTER".

Sometimes the software is not working reliable:
Before you are getting crazy unplug the power for a complete reset and call the "Init" command...

You need sed curl and xml2 (on raspberrypi (sudo apt install curl xml2)


# COMMANDS

## GetSystemInfo
```
curl -s -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/GetSystemInfo | xml2 | sed -r 's/\/menu\///' | sed -r 's/wifi_info\///'
```

## Sendkey
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/Sendkey?key=<KEY>
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
| 17 | 0 |
| 18 | 1 |
| 19 | 2 |
| 20 | 3 |
| 21 | 4 |
| 22 | 5 |
| 23 | 6 |
| 24 | 7 |
| 25 | 8 |
| 26 | 9 |
| 123 | 10 |
| 28 | Mode (Webradio DAB FM BT UPNP USB) |
| 29 | Play/Pause (also for BT) |
| 30 | Stop |
| 31 | Next |
| 32 | Prev |
| 36 | USB |
| 37 | FM |
| 40 | Webradio Menu |
| 65 | Arrangement FM/DAB list |
| 115 | Hotkey 1 |
| 116 | Hotkey 2 |
| 117 | Hotkey 3 |
| 118 | Hotkey 4 |
| 119 | Hotkey 5 |
| 120 | Hotkey 6 |
| 121 | Hotkey 7 |
| 122 | Hotkey 8 |
| 123 | Hotkey 9 |
| 124 | Hotkey 10 |
| 168 | Settings |

## Init

```
curl -s -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/init?language=de | xml2 | sed -r 's/\/result\///'
```

## Play-info
working only on wlan interface not working for Wire Interface:
```
curl -s -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/playinfo | xml2 | sed -r 's/\/result\///'
```

## WEBRADIO-FAV-list
```
curl -s -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/hotkeylist | xml2 | sed -r 's/\/menu//' | sed -r 's/\/item_//' | sed -r 's/\/item\///' | sed -r 's/\/item//' | sed -r 's/status=file//' | sed '/^$/d'
```

## Play station with ID
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/play_stn?id=91_6
```

## FM-FAV-list
```
curl -s -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/GetFMFAVlist | xml2 | sed -r 's/\/menu//' | sed -r 's/\/item_//' | sed -r 's/\/item\///' | sed -r 's/\/item//' | sed -r 's/status=file//' | sed '/^$/d'
```

## Play FM-FAV
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/GotoFMfav?fav=<ID>
```

## DAB-FAV-list
```
curl -s -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/DABhotkeylist | xml2 | sed -r 's/\/menu//' | sed -r 's/\/item_//' | sed -r 's/\/item\///' | sed -r 's/\/item//' | sed -r 's/status=file//' | sed '/^$/d'
```

## Play DAB-FAV
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
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman:8080/playlogo.jpg
```


## Play status
```
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' http://dabman/background_play_status
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
