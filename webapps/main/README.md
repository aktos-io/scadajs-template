# File Structure  

### Required Files

* `index.pug` is compiled to `index.html` by using `scada.js/templates` which is served as main html file to the user upon page request. Simplest form of `index.html` is:

    ```html
    <html>
      <head>
        <script id="vendor" src="js/vendor.js"></script> <!-- js files under scada.js/vendor -->
        <link rel="stylesheet" href="css/vendor.css"> <!-- css files under scada.js/vendor -->
      </head>
      <body>
        <p>Loading Application...</p>
        <script src="js/app.js"></script>
      </body>
    </html>
    ```

* `app.ls` is the actual application, compiled into `js/app.js` and is downloaded by `index.html` as shown.

> Files under `scada.js/vendor2` are compiled into `js/vendor2.js` and `css/vendor2.css` and contain non-critical libraries that may or may not be loaded into the application. User is responsible for loading these files if they are necessary. 

> If `dep.ls` (or `dep.js`) exists, it is compiled into `js/dep.js`. This is intended to be used for non critical codes (like [async components](https://github.com/ceremcem/ractive-synchronizer)) to be loaded after first page load. User is responsible for handling this script, no action is taken automatically. 

### Optional Files

These files are optional and included directly or indirectly by above required files:

* `app.pug`: The main template file. Every other template files are included in this file. Pug allows native server side includes by `include` keyword. 
* `showcase/`: More complicated examples' files which are split into smaller files and folders.

> You can compile `.pug` files to `.html` on https://pughtml.com/
