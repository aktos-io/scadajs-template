# File Structure  

### Required Files

* `index.html` or `index.pug` (compiled to `index.html` automatically) is served on page request. Simplest form is:

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

* `app.ls` is the **main application**, compiled into `js/app.js` and is downloaded by `index.html` as seen above.

### Important Files

* `js/vendor2.js` and `css/vendor2.css`: Files under `scada.js/vendor2/` are compiled to these outputs accordingly.

  > Developer is responsible for loading these files in runtime. They are loaded by `app.ls` in this example.

### Optional Files

* `app[n].ls`: Compiled into `js/app[n].js`. You are responsible for loading these additional `app` scripts, no action is taken automatically.

    > **Rationale** <br />
    > Loading an application requires 3 stage:
    >  * First response (should be < 0.5 second)
    >  * Core application (should be < 3 second)
    >  * Additional dependencies (will be loaded incrementally)
    >
    > <br />
    >
    > In order to achieve these goals, the webapp is split into `app*.ls`:
    > 
    >  * `app.ls` is executed by `index.html` and responsible for loading core application, its dependencies and displaying status messages during this process.
    >  * `app2.ls` is the core application.
    >  * `app3.ls` is the additional dependencies, loaded when idle and/or on demand.

* `*.css`: If any CSS files exist, they will be concatenated into `css/vendor2.css`.

### App Specific Layout

Following files are optional and included directly or indirectly by above required and optional files:

* `app.pug`: The main Ractive template file, included in `app.ls`.
* `showcase/`: More complicated examples, included in `app.pug`.

# See Also

* Compile `.pug` files into `.html` on https://pughtml.com/
* Compile `.ls` files/codes into `.js` on http://livescript.net/
