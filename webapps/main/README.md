# File Structure  

### Required Files

* `index.pug` (which is compiled to `index.html`) or `index.html` that is served as main html file to the user upon page request. Simplest form is:

    ```html
    <html>
      <head>
        <script id="vendor" src="js/vendor.js"></script>
        <link rel="stylesheet" href="css/vendor.css">
      </head>
      <body>
        <script src="js/app.js"></script>
      </body>
    </html>
    ```

* `app.ls` is the **main application**, compiled into `js/app.js` and is downloaded by `index.html`.

### Important Files

* `js/vendor2.js` and `css/vendor2.css`: Files under `scada.js/vendor2/` are compiled to these outputs accordingly.

  > Developer is responsible for loading these files. They are included by `app.ls` in this example.

### Optional Files

* `app[2,3,...].ls`: If exists, it is compiled into `js/app[2,3,...].js`. Mainly used for UX reasons. You are responsible for getting these scripts, no action is taken automatically.

    > **Rationale** <br />
    > Loading an application requires 3 stage:
    >  * First response (should be < 0.5 second)
    >  * Core application (should be < 3 second)
    >  * Additional dependencies (will be loaded incrementally)
    > In order to achieve these goals, the webapp is split into app.ls, app2.ls and app3.ls
    > app.ls is the first application and is only responsible for displaying loading status.
    > app2.ls is the core application which initialized `new Ractive`
    > app3.ls is the additional dependencies, loaded lazily.

* `*.css`: If any CSS files exist, they will be concatenated into `css/vendor2.css`.

### App Specific Layout

Following files are optional and included directly or indirectly by above required and optional files:

* `app.pug`: The main Ractive template file, included in `app.ls`.
* `showcase/`: More complicated examples, included in `app.pug`.

# See Also

* Compile `.pug` files into `.html` on https://pughtml.com/
* Compile `.ls` files/codes into `.js` on http://livescript.net/
