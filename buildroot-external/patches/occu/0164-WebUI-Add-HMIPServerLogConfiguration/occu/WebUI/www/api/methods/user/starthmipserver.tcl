##
# User.startHmIPServer
# Startet den HMIPServer
#
# Parameter:
#   keine
#
# R�ckgabewert: true

exec /usr/bin/monit start HMIPServer >/dev/null &
jsonrpc_response true
