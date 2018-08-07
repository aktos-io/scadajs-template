> You can compile `.pug` files to `.html` on https://pughtml.com/

# Layout  

### Required 

* `index.pug`: Is compiled to `index.html` by using `scada.js/templates` which is served to the user on page request. 
* `app.ls`: The application, compiled into `js/app.js` which is inserted to end of `index.html`'s `<body>` tag. 

Basically file structure is that simple. Rest of the files are included by these two files and is decided by the developer.

### Optional 

* `app.pug`: The main template file. Every other template files are included in this file. Pug allows native server side includes by `include` keyword. 
* `dep.ls`: Non critical codes that can be loaded after first page load (for performance reasons). It is compiled to `js/dep.js` by Gulp and user is responsible for merging it in the runtime. 
* `showcase/**`: More complicated examples' files which are split into smaller files and folders.
