# dash-rpctest
simple up/down curl test for dashd responsiveness

dash-rpctest.sh will exit with a non-zero status if dashd rpc does not respond.

# usage

in a script or cron, etc., do:

/path/to/dash-rpctest.sh || dashd_is_unresponsive_do_something_clever

