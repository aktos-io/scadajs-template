require! 'dcs/browser': {CouchDcsClient}

Ractive.components["admin"] = Ractive.extend do
    template: require('./index.pug')
    isolated: no
    data: ->
        designDb: new CouchDcsClient route: "@db-proxy"
