## 1. Creating `your-webapp`

1. Create the `webapps` folder which will hold all of your webapps:

       cd your-project
       mkdir webapps

2. Create `your-webapp`'s folder:

       cd webapps
       mkdir your-webapp
       cd your-webapp

3. Create an `app.js` (or `app.ls`) [like this](./webapps/main/app.ls).

4. Create your `app.html` (or `app.pug`) with [the following contents](./webapps/main/app.pug).
This is the container of your single page application.

5. Create an `index.html` (or `index.pug`) here with [the following contents](./webapps/main/index.html). This is your index.html file where the user fetches in the first place.

## 2. Build your webapp

You can simply build `your-webapp` with the following command:

    cd your-project/scada.js
    make development # or `make production`

Now `your-webapp` is ready to be served in `your-project/scada.js/[build or release]/your-webapp` folder. 

## 3. Serve your webapp

Create a webserver that supports *Socket.io* and *aktos-dcs*, [like this one](./servers/webserver.ls).

## 4. See the result

You can see `your-webapp` by opening [http://localhost:XXXX](./config.ls#L1) with any modern browser.

By default, the slider's output *will be lost in the DCS space* because there is
nothing that handles these messages. See the next step:

## 5. Start adding your microservices

You can add any number of microservices in any programming language that has an implementation of [aktos-dcs](https://github.com/aktos-io/aktos-dcs) and make them communicate with each other over the DCS network. For example: [io-server.ls](./servers/io-server.ls).
