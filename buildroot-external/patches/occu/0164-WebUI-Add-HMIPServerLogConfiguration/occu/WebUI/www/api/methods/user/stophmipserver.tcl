##
# User.stopHmIPServer
# Stoppt den HMIPServer
#
# Parameter:
#   keine
#
# R�ckgabewert: true

exec /usr/bin/monit stop HMIPServer >/dev/null &
jsonrpc_response true
