require! 'dcs/browser': {CouchDcsClient}

Ractive.components["database"] = Ractive.extend do
    template: require('./index.pug')
    isolated: no
    data: ->
        designDb: new CouchDcsClient route: "@db-proxy"
