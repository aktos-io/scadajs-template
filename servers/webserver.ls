require! <[ path express dcs dcs/browser ]>

# configuration
require! '../config': {webserver-port, dcs-port}

# Create an in-memory authentication database
require! 'dcs/src/auth-helpers': {hash-passwd}

users =
    'public':
        passwd-hash: hash-passwd "public"
        routes:
            \@mydevice.**
        permissions:
            'something'

    'mydevice':
        passwd-hash: hash-passwd "1234"


db = new dcs.AuthDB users

# Create a webserver and a SocketIO bridge
app = express!
http = require \http .Server app
app.use "/", express.static path.resolve "../scada.js/build/main"
http.listen webserver-port, ->
    console.log "webserver is listening on *:#{webserver-port}"

new browser.DcsSocketIOServer http, {db}

# create a TCP DCS Service
new dcs.DcsTcpServer {port: dcs-port, db}
