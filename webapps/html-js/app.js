require('components');

new Ractive({
  el: 'body',
  template: RACTIVE_PREPARSE('app.html'),
  data: {
    name: "world",
    x: 35
  }
});
