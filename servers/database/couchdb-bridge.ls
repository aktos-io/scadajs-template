require! 'dcs/services/couch-dcs/server': {CouchDcsServer}
require! 'dcs': {DcsTcpClient}
require! '../../config': {dcs-port, db-url, backend-passwd}
require! './db-user'


# Create a bridge between this service and DCS server
new DcsTcpClient port: dcs-port .login do
    user: "db-proxy"
    password: backend-passwd

# Create a bridge between this service and CouchDB
new CouchDcsServer do
    url: db-url
    database: \scadajs-template
    user:
        name: db-user.name
        password: db-user.password
    subscribe: '@db-proxy' 
