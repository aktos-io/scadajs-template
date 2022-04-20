require! 'dcs/src/auth-helpers': {hash-passwd}
require! '../config': {backend-passwd}

# A user named "myuser" will have an access to `@myuser` route by default.
# Use "groups" field to inherit routes and permissions from those users
# "permissions" field is used from within the GUI, by using `able("the_permission")` function.

export users =
    'public':
        passwd-hash: hash-passwd "public"
        routes:
            \@mydevice.hello.**
            \@hello-server.hi
        permissions:
            'something'
            'something-else'


    'mydevice':
        passwd-hash: hash-passwd "1234"

    'myuser':
        passwd-hash: hash-passwd "5678"
        groups:
            \public  # inherit all routes and permissions from public user
        routes:
            \@mydevice.foo.**
        permissions:
            \slider2.write

    'hellouser':
        passwd-hash: hash-passwd "1234"
        permissions:
            \scene.hello.**

    'hello-server':
        passwd-hash: hash-passwd "1234"

    'admin':
        passwd-hash: hash-passwd "admin"
        routes:
            \@mydevice.**
            \@hello-server.**
            \@db-proxy.**
        permissions:
            \scene.**
            \admin

    'db-proxy':
        passwd-hash: hash-passwd backend-passwd
