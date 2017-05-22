-module(minion).
-export([start/0,accept_commands/0]).

start() ->
	register(minion, self()),
	net_kernel:connect_node(master@yondo),
        Bot = spawn(minion, accept_commands, []),
	{master, master@yondo} ! {ready, Bot}.

accept_commands() ->
	receive
		test ->
			io:format('Received test from master',[]);
		test2 ->
			io:format('Received test2 from master',[])
	end,
	accept_commands().

