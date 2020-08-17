Ractive.components['components'] = Ractive.extend do
    template: require('./index.pug')
    isolated: no 
    data: -> 
        x1: 20.12345
        x2: 40.56789
        hide:
            bubble: yes # consuming too much CPU power

    on:
        sayHello: (ctx) -> 
            return unless btn=ctx?component 
            btn.state \doing 
            # use {route: "@hello-server.hi", +debug} to debug the communication.
            err, res <~ btn.actor.send-request "@hello-server.hi", {hi: "there"}
            if err 
                btn.error err 
            else 
                new PNotify.success do
                    text: "Server says: #{JSON.stringify res.data}"
                btn.state \done...

