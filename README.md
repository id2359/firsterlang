# firsterlang
Mucking around with Erlang

Notes:

1. To start master node:

erl -noshell -sname master -setcookie mycookie -s master start


2. Slave nodes must use same cookie name, connect via net_kernel:connect_node 





