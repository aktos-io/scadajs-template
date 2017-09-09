require! <[ fs path express ]>
require! '../config': {webserver-port, dcs-port}
require! 'dcs': {TCPProxyServer, SocketIOServer}
require! './auth-db': {db}

# -----------------------------------------------------------------------------
# Webserver
# -----------------------------------------------------------------------------
pub-dir = "#{__dirname}/../scada.js/build/"
app = express!
http = require \http .Server app

# use pug-ls webapp as main project
app.use "/", express.static path.resolve "#{pub-dir}/pug-ls"

http.listen webserver-port, ->
    console.log "listening on *:#{webserver-port}"

# -----------------------------------------------------------------------------
# DCS
# -----------------------------------------------------------------------------
# create socket.io server
new SocketIOServer http, do
    db: db

# start a TCP Proxy to share messages over dcs network
new TCPProxyServer do
    db: db
    port: dcs-port

process.on 'SIGINT', ->
    console.log 'Received SIGINT, cleaning up...'
    # do any cleanup here
    process.exit 0
