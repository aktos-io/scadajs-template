# File Structure  

### Required Files

* `index.pug` is compiled to `index.html` by using `scada.js/templates` which is served as main html file to the user on page request. 
* `app.ls` is the actual application, compiled into `js/app.js` and downloaded by `<script src="js/app.js" />` within `index.html`.

Basically file structure is that simple. Rest of the files are optional and included by these two files.

### Optional Files

* `app.pug`: The main template file. Every other template files are included in this file. Pug allows native server side includes by `include` keyword. 
* `dep.ls`: Non critical codes which may be loaded after first page load (for performance and UX reasons). It is compiled to `js/dep.js` and user is responsible for merging it in the runtime, no magic is done automatically. 
* `showcase/`: More complicated examples' files which are split into smaller files and folders.

> You can compile `.pug` files to `.html` on https://pughtml.com/
