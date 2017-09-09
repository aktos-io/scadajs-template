require! components

new Ractive do
    el: \body
    template: RACTIVE_PREPARSE('app.pug')
    data:
        name: "world"
        x: 35
