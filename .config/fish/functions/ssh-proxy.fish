# to tunnel traffic from a QA term box's envoy admin UI (which runs on :9901):
# e.g. ssh-proxy qa-term--06e885c6e188bd49e.far-aws-pdx-1.apiori.com 9901
function ssh-proxy --description 'tunnels to a remote port using the space commander ssh wrapper'
  set --local HOST $argv[1]
  set --local PORT $argv[2]
  sc-ssh-wrapper -L $PORT\:localhost:$PORT $HOST
end
