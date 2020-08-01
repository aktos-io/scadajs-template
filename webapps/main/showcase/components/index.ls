Ractive.components['components'] = Ractive.extend do
    template: require('./index.pug')
    isolated: no 
    data: -> 
        x1: 20
        x2: 40
        hide:
            bubble: yes # consuming too much CPU power