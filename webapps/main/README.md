# File Structure  

### Required Files

* `index.pug` is compiled to `index.html` by using `scada.js/templates` and served as main html file to the user upon page request. Simplest form is:

    ```html
    <html>
      <head>
        <!-- files under scada.js/vendor/ -->
        <script id="vendor" src="js/vendor.js"></script>
        <link rel="stylesheet" href="css/vendor.css"> 
      </head>
      <body>
        <p>Loading Application...</p>
        <script src="js/app.js"></script>
      </body>
    </html>
    ```

* `app.ls` is the **main application**, compiled into `js/app.js` and is downloaded by `index.html`.

### Optional Files

* `dep.ls`: If exists, it is compiled into `js/dep.js`. This is intended to be used for non critical codes (like [async components](https://github.com/ceremcem/ractive-synchronizer)) to be loaded after first page load. Developer is responsible for handling this script, no action is taken automatically. It is included by `app.ls` in this example.

* `*.css`: If any CSS files exist, they will be concatenated into `css/vendor2.css`.

### App Specific Layout

Following files are optional and included directly or indirectly by above required and optional files:

* `app.pug`: The main Ractive template file, included in `app.ls`.
* `showcase/`: More complicated examples, included in `app.pug`.

### Other Files 

* `js/vendor2.js` and `css/vendor2.css`: Files under `scada.js/vendor2/` are compiled to these outputs accordingly. These files contain non-critical 3rd party libraries that may or may not be needed in *this* webapp, such as: 
    * SemanticUI (required for most components) 
    * JsBarcode 
    * LoadingBar 
    * ...etc

  > Developer is responsible for loading these files if they are necessary. They are included by `app.ls` in this example.

# See Also 

* You can compile `.pug` files into `.html` on https://pughtml.com/
* You can compile `.ls` files/codes into `.js` on http://livescript.net/
