require! 'dcs': {DcsTcpClient, Actor, sleep}
require! '../config'
require! 'fancy-log': log 

new class Hello extends Actor
    action: ->
        @on-topic \@hello-server.*, (msg) ~>
            log "Received", msg.data, "from user."
            delay = 1500ms
            <~ sleep delay # wait just to illustrate a heavy work  
            @send-response msg, {reply: 'hi there!', delay}

new DcsTcpClient port: config.dcs-port 
    .login {user: "hello-server", password: "1234"}
