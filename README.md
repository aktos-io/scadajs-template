# Description

This is the bare minimum template project to easily get up and running with [ScadaJS](https://github.com/aktos-io/scada.js).

# Live Demo 

See this project live on https://aktos.io/st.

# Development

### 1. Install dependencies

1. Create virtual environment: [using-virtual-environment.md](https://github.com/aktos-io/scada.js/blob/master/doc/using-virtual-environment.md)
2. `make install-deps`

### 2. Create a Webapp

A) Either create a webapp from scratch: [./creating-webapp.md](./creating-webapp.md).

- or

B) Copy and edit `this` template according to your needs.

### 3. Build 

1. `make development` will start necessary services. 
2. Use your favourite text editor for editing files. 
3. Go to http://localhost:4011

### 4. Release 

1. `make release`. 
2. Stop your development server (if it's running).
3. Run: `./production.service` (look into the script, it's self documentary)
4. Go to http://localhost:4011

