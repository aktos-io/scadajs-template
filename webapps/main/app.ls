require! 'components'
require! 'aea/defaults'

new Ractive do
    el: \body
    template: RACTIVE_PREPARSE('app.pug')
    #template: RACTIVE_PREPARSE('app.html') # if you have HTML template instead of Pug
