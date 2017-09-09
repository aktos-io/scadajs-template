require! 'dcs/src/auth-helpers': {hash-passwd}
require! 'aea':{sleep}
require! 'prelude-ls': {find}

users-db =
    * _id: 'user1'
      passwd-hash: hash-passwd "hello1"
      roles: \authorization-test-reader
      opening-scene: 'authorization-test'

    * _id: 'user2'
      passwd-hash: hash-passwd "hello2"
      roles: \authorization-test-writer
      opening-scene: 'authorization-test'

    * _id: 'monitor'
      passwd-hash: hash-passwd "test"
      roles: \monitor-all

permissions-db =
    * _id: \authorization-test-reader
      ro: \authorization.test1

    * _id: \authorization-test-writer
      rw: \authorization.test1

    * _id: \monitor-all
      rw: \**

class Database
    ->

    get: (filter-name, callback) ->
        response = switch filter-name
        | \users => users-db
        | \permissions => permissions-db
        <~ sleep 200ms
        callback err=null, response

    get-user: (username, callback) ->
        <~ sleep 200ms
        doc = find (._id is username), users-db
        err = unless doc
            reason: 'user not found'
        else
            null

        callback err, doc

    get-permissions: (callback) ->
        <~ sleep 200ms
        callback err=null, permissions-db



export db = new Database!

/*
err, res <- test-db.get \users
console.log "response is: ", res
*/
