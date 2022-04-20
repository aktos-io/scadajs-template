try
    require! 'aea/defaults'
    require! 'components'
    require! './showcase/components'
    require! './showcase/database'
    new Ractive do
        el: \body
        template: require('./app2.pug') # or require('./app.html')
        data:
            dataTableExample: require './showcase/data-table/settings' .settings
            appVersion: require('app-version.json')
        on:
            dcsLive: ->
                # Let Ractive complete rendering before fetching any other dependencies
                simulation = 3_000ms 
                new PNotify.success do
                    title: "Simulating Delay"
                    text: "Simulating #{simulation/1000} seconds of delay..."
                    addClass: 'nonblock'
                    
                info = new PNotify.notice do
                    text: "Fetching dependencies..."
                    hide: no
                    addClass: 'nonblock'

                start = Date.now!
                <~ sleep simulation
                <~ getDep "js/app3.js"
                info.close!
                elapsed = (Date.now! - start) / 1000
                new PNotify.info do
                    text: "Dependencies are loaded in #{oneDecimal elapsed} s"
                    addClass: 'nonblock'                

                # send signal to Async Synchronizers
                @set "@shared.deps", {_all: yes}, {+deep}

catch
    loadingError (e.stack or e)
