-module(master).
-export([start/0, accept_requests/0, control/1]).

info(S) ->
    io:format(string:concat(S, "~n"), []).

start() ->
    info("Starting Master ..."),
    Master = spawn(master, accept_requests,[]),
    info("Master spawned"),
    register(master, Master),
    info("Master name registered").

accept_requests() ->
    receive
        {ready, Bot} ->
               info("Controlling a new bot!"),
               spawn(master, control, [Bot])
    end,
    accept_requests().

control(Bot) ->
    info("Sending message test"),
    Bot ! test,
    info("Sending message test2"),
    Bot ! test2,
    info("Bot controller going to sleep"),
    timer:sleep(timer:seconds(5)),
    info("Bot controller woke up!"),
    control(Bot).




