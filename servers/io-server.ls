# Create the test io handlers
require! 'dcs': {DcsTcpClient}
require! 'dcs/proxy-actors': {create-io-proxies}
require! 'dcs/drivers/simulator': {IoSimulatorDriver}
require! '../config'

create-io-proxies do
    drivers: {IoSimulatorDriver}
    devices:
        hello:
            driver: 'IoSimulatorDriver'
            handles:
                there: {}
                name: {}

new DcsTcpClient port: config.dcs-port .login {user: "public", password: "public"}
