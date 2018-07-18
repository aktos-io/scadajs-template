require! './db-simulator': {db}
require! 'prelude-ls': {filter}

export settings =
    # REQUIRED
    name: "issues"

    # REQUIRED
    # column names for the table view, array of template strings
    col-names:
        "ID"
        "Subject"
        "Labels <i class='icon cogs' />"

    # REQUIRED
    # when data table first renders, this function is run:
    on-init: (proceed) ->
        db.generate-data!
        err, res <~ db.view
        @set \tableview, res
        @set \availableLabels, [{id: .., name: ..} for <[ hello there ]>]
        proceed!

    # OPTIONAL
    # define how many rows per page (0 or null for infinite table)
    page-size: 10

    # OPTIONAL
    # additional search fields, array of keypaths relative to row
    search-fields:
        \value.labels
        \value.subject

    # OPTIONAL
    on-create-view: (row, proceed) ->
        if row
            # editing to an existing document
            # fetch the document
            err, res <~ db.get row.id
            proceed err, curr=res
        else
            # adding a new row
            proceed err=null, curr=
                _id: 'ISSUE-####'
                type: \issue
                content: """
                    Define your issue here
                    """

    # OPTIONAL (unless readonly)
    save: (ctx, curr, proceed) ->
        is-new = not curr._rev?
        err, res <~ db.put curr
        @update \curr
        if is-new and not err
            t = @get \tableview
            t.unshift do
                id: curr._id
                key: curr._id
                value:
                    subject: curr.subject
                    labels: curr.labels
            @update \tableview
        proceed err

    # OPTIONAL
    # Just like Ractive.data
    # type: function
    data: ->
        double: (* 2)

    # OPTIONAL
    # Return an array of rows (default: 'all')
    filters:
        longOnes: (tableview) ->
            filter (.value?.subject?.length > 10), tableview

    # OPTIONAL
    # define any ractive handler here
    handlers:
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
