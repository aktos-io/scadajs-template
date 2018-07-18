last-index = 0
count = 8
docs = []
next-doc-id = 0

export db =
    generate-data: (callback) ->
        docs ++= for i in [last-index to (last-index + count)]
            _id: "hello#{i}"
            _rev: 0
            subject: "subject#{i} #{if i % 3 is 0 then "çalış öğün" else ''}"
            content: """
                Sed ut perspiciatis unde omnis iste natus error
                sit voluptatem accusantium doloremque laudantium,
                totam rem aperiam, eaque ipsa quae ab illo inventore
                veritatis et quasi architecto beatae vitae dicta sunt
                """
            labels: for j in [til 3]
                "label#{i}#{j}"
        last-index := last-index + count

    view: (callback) ->
        <~ sleep 1000ms
        callback err=null, for docs
            id: .._id
            key: .._id
            value:
                subject: ..subject
                labels: ..labels

    put: (doc, callback) ->
        if doc._id.match /\#{4}/
            doc._id = doc._id.replace /\#{4}/, next-doc-id
            next-doc-id++
        doc._rev = (doc._rev or 0) + 1
        if find (._id is doc._id), docs
            err = "Conflict"
        else
            err = null
            docs.push doc
        <~ sleep 1000ms
        callback err, null

    get: (id, callback) ->
        doc = find (._id is id), docs
        <~ sleep 500ms
        err = unless doc?
            "Document #{id} is not found"
        else
            null
        callback err, doc
