-module(analyser).
-export([analyse_alert/1]).

analyse_alert({dota, Minutes}) when Minutes > 120 ->
    {kill, "Dota2.exe"};

