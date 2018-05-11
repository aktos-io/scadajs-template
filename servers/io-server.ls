# Create the test io handlers
require! 'dcs': {DcsTcpClient}
require! 'dcs/proxy-actors': {create-io-proxies}
require! 'dcs/drivers/simulator': {IoSimulatorDriver}
require! '../config'

user = "mydevice"
password = "1234"

create-io-proxies do
    node: user
    drivers: {IoSimulatorDriver}
    devices:
        hello:
            driver: 'IoSimulatorDriver'
            handles:
                there: {}
                name: {}

new DcsTcpClient port: config.dcs-port .login {user, password}
