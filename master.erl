-module(master).
-export([start/0, await_commands/0]).

start() ->
    P = spawn_link(?MODULE, await_commands,[]),
    register(master, P).

await_commands() ->
    receive
        {Robot, measurement, Location, Timestamp, Key, Value} ->
            measurements:store(Location, Timestamp, Key, Value);
        {Robot, alert, Location, Timestamp, Message} ->
            measurements:store(Location, Timestamp, alert, Message),
            Action = analyser:analyse_alert(Message),
            case Action of
                reboot ->
                    Robot ! reboot;
                shutdown ->
                    Robot ! shutdown;
                _ ->
                    ok
            end
    end,
    await_commands().

