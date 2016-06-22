Config { font = "xft:Inconsolata:size=9"
       , bgColor = "#000000"
       , fgColor = "#657b83"
       , position = TopW L 100
       , lowerOnStart = False
       , allDesktops = True
       , hideOnStart = False
       , persistent = False
       , overrideRedirect = False
       , commands = [ Run Weather "URRR" ["-t"," <tempC>C","-L","64","-H","77","--normal","green","--high","red","--low","lightblue"] 36000
                    , Run Com "bash" ["-c","~/.xmonad/bin/wireless.sh"] "wifi" 30
		    , Run MultiCpu       [ "--template" , "Cpu: <total0>% <total1>% <total2>% <total3>%"
                             , "--Low"      , "50"         -- units: %
                             , "--High"     , "85"         -- units: %
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 10
                    ,  Run CoreTemp       [ "--template" , "Temp: <core0>°C"
                             , "--Low"      , "70"        -- units: °C
                             , "--High"     , "80"        -- units: °C
                             , "--low"      , "darkgreen"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkred"
                             ] 50
                    , Run Network "eth0" ["-m", "4", "-L","0","-H","100","--normal","#002b36","--high","#657b83"] 10
                    , Run Com "bash" ["-c", "~/.xmonad/bin/get-volume.sh"] "myvolume" 10
                    , Run DiskIO [("/", "/ <total>"), ("/home", "~ <total>")] [] 10
		    , Run Memory ["-t","Mem: <usedratio>%"] 10
		    , Run Swap [] 10
		    , Run Date "%a %b %_d %H:%M" "date" 10
		    , Run Kbd [("us", "US"), ("ru", "RU"), ("us(dvp)", "DVP")]
                    , Run Battery        [ "--template" , "Batt: <acstatus>"
                             , "--Low"      , "10"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"      , "darkred"
                             , "--normal"   , "darkorange"
                             , "--high"     , "darkgreen"

                             , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "<left>% (<timeleft>)"
                                       -- AC "on" status
                                       , "-O"	, "<fc=#dAA520>Charging</fc>"
                                       -- charged status
                                       , "-i"	, "<fc=#006000>Charged</fc>"
                             ] 50
		    , Run StdinReader
		    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %diskio% | %multicpu% | %coretemp% | %memory% | %wifi% - Vol: %myvolume% - %battery% - <fc=#ee9a00>%date%</fc> "
       }
