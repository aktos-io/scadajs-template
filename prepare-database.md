# Create and Configure a CouchDB database for your application

1. Create a database user (https://github.com/aktos-io/aktos-dcs-node/blob/master/services/couch-dcs/doc/security.md#create-db-users)
2. Download the database user json file as "./db-user.json"
3. Create a database.
4. Configure the "_security" document inside the database.
5. Configure the database via "#/showcase/database" page.

Optional:
1. Configure a different port for webserver and dcs in config.ls.


1. Create the following view in your database as `_design/mydocument`: 

```ls 
views:
    mydocument:
        map: (doc) ->
            prefix = doc._id.split "-" .0
            if prefix is \mydocument
                emit doc._id, {subject: doc.subject}
```