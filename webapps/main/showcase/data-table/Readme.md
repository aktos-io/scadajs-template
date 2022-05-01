1. Create the following view in your database as `_design/mydocument`: 

```ls 
views:
    mydocument:
        map: (doc) ->
            prefix = doc._id.split "-" .0
            if prefix is \mydocument
                emit doc._id, {subject: doc.subject}
```

2. See Scada.js/components/data-table/README.md for `data-table` documentation.