##
# User.restartHmIPServer
# Restartet den HMIPServer
#
# Parameter:
#   keine
#
# R�ckgabewert: true

exec /usr/bin/monit restart HMIPServer >/dev/null &
jsonrpc_response true
