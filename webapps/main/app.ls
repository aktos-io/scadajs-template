require! 'aea/defaults'
require! 'components'

try
    new Ractive do
        el: \body
        template: RACTIVE_PREPARSE('app.pug')
        #template: RACTIVE_PREPARSE('app.html') # if you have HTML template instead of Pug
        data:
            dataTableExample: require './showcase/data-table/settings' .settings

        oncomplete: ->
            # Let Ractive complete rendering before fetching any other dependencies
            info = PNotify.notice do
                text: "Fetching dependencies..."
                hide: no

            start = Date.now!
            <~ getScriptCached "js/dep.js"
            info.close!
            elapsed = (Date.now! - start) / 1000
            PNotify.info do
                text: "Dependencies are loaded in #{Math.round(elapsed * 10) / 10} s"

            # send signal to Async Synchronizers
            @set "@shared.deps", {_all: yes}, {+deep}

catch
    loadingError e.stack
    throw e
