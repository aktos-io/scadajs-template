Ractive.components['components'] = Ractive.extend do
    template: require('./index.pug')
    isolated: no 
    data: -> 
        x1: 20.12345
        x2: 40.56789
        hide:
            bubble: yes # consuming too much CPU power