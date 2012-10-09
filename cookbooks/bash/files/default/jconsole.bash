#
# Bash helper function for connecting to a remote JVM via jconsole using an SSH
# tunnel.
#
# Supports multiple concurrent jconsole sessions to different hosts.
#
# Tested on mac osx, but should work on linux too.
#
# Install
# -------
#
# 1. Load the 'jcon' function in current shell:
#  $ . jconsole_ssh.sh
# 2. Concatenate  into your ~/.bashrc or ~/.profile
# 3. Put it into systemd-wide /etc/profile.d/ if your system supports that. (many linux distros)
# 4. Concatenate it into system-wide /etc/bashrc (mac osx, others)
#
# Usage Examples:
# ---------------
#
# Start jconsole on the local machine and connect to JVM on 'target_host', port
# defaults to 7199 (Cassandra's jmx port):
#
#   $ jcon target_host
#
# Connect to remote JVM on alternate port:
#
#   $ jcon target_host 8181
#
# Based on http://simplygenius.com/2010/08/jconsole-via-socks-ssh-tunnel.html
# with modifications.
#
# joe miller, https://github.com/joemiller
#
function jcon {
    host=$1
    jmx_port=${2:-7199}
    local_proxy_port=$(find_available_port)
    echo "DEBUG: local_proxy_port=$local_proxy_port"
    # start the ssh tunnel and -[f]ork to background, then find its pid
    ssh -f -D${local_proxy_port} ${host} "echo jconsole-proxy-${local_proxy_port} >/dev/null; while true; do sleep 5; done"
    ssh_pid=$(ps ax | grep "jconsole-proxy-${local_proxy_port}" | grep -v grep | awk '{print $1}')
    echo "ssh pid: $ssh_pid"
    jconsole -J-DsocksProxyHost=localhost -J-DsocksProxyPort=${local_proxy_port} \
        ${host}:7199
    # kill the ssh tunnel after jconsole exits
    kill $ssh_pid
}
function find_available_port {
    # find and return a TCP port available for listening
    start=${1:-8000}
    end=${2:-8200}
    for i in $(seq $start $end); do
        # echo "DEBUG: trying port $i"
        if ! `lsof -iTCP:${i} >/dev/null 2>&1`; then
            # port $i is available"
            echo $i
            return
        fi
    done
    return
} 
