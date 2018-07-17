require! './db-simulator': {db}

export settings =
    name: "issues"

    autoincrement: yes # only valid if you are using default on-save function

    # define how many rows per page (0 or null for infinite table)
    page-size: 10

    # additional search fields, array of keypaths relative to row
    search-fields:
        \value.labels
        \value.subject

    # this is the default document for newly created rows
    default: ->
        _id: 'ISSUE-####'
        type: \issue
        subject: "your subject here..."

    # column names for the table view, array of template strings
    col-names:
        "ID"
        "Subject"
        "Labels <i class='icon cogs' />"

    # when data table first renders, this function is run:
    on-init: (proceed) ->
        db.generate-data!
        err, res <~ db.view
        @set \tableview, res
        @set \availableLabels, [{id: .., name: ..} for <[ hello there ]>]
        proceed!

    on-create-view: (row, proceed) ->
        if row
            # editing an existing document
            @logger.clog "opening #{row.id}"
            # fetch your document at this point
            err, res <~ db.get row.id
            unless err
                @set \curr, res
            proceed err
        else
            # adding new
            proceed!

    on-save: (ctx, curr, proceed) ->
        is-new = not curr._rev?
        err, res <~ db.put curr
        @update \curr
        if is-new
            t = @get \tableview
            t.unshift do
                id: res._id
                key: res._id
                value:
                    subject: res.subject
                    labels: res.labels
            @update \tableview
        proceed err

    handlers:
        # define ractive handlers here
        kickChanges: (ctx, callback) ->
            btn = ctx.component
            btn?.state \doing
            err, res <~ db.view
            # set your tableview when you are done
            @set \tableview, res
            btn?.state \done...
            callback?!

        pushData: (ctx) ->
            btn = ctx.component
            btn.state \doing
            db.generate-data!
            <~ @fire \kickChanges
            btn.state \done...

        addLabel: (ctx, search, proceed) ->
            @push \availableLabels, {id: search, name: search}
            proceed!
