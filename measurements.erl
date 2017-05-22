-module(measurements).
-export([store/4]).

store(Location, Timestamp, Key, Value) ->
    io:format("~p ~p ~p ~p~n", [Location, Timestamp, Key, Value]).





