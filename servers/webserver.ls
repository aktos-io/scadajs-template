require! <[ path express dcs dcs/browser ]>

# configuration
require! '../config': {webserver-port, dcs-port}
require! './users': {users}

# Create auth db
db = new dcs.AuthDB users

# Create a webserver
app = express!
http = require \http .Server app
app.use "/", express.static path.resolve "../scada.js/build/main"
http.listen webserver-port, "0.0.0.0", ->
    console.log "webserver is listening on *:#{webserver-port}"

# Create a SocketIO bridge
new browser.DcsSocketIOServer http, {db}

# Create a TCP DCS Service
new dcs.DcsTcpServer {port: dcs-port, db}
