require! 'prelude-ls': {filter}

export settings =
    # REQUIRED
    name: "issues"

    # OPTIONAL
    # define how many rows per page (0 or null for infinite table)
    page-size: 10

    # OPTIONAL
    # additional search fields, array of keypaths relative to row
    search-fields:
        \value.labels
        \value.subject

    # REQUIRED
    # column names for the table view, array of template strings
    # type: function (useful for @able) or array
    col-names: ->
        return
            "ID"
            "<div class='ui red basic label'>Private Column: Subject</div>" if (@get \canSeePrivate)!


    # REQUIRED
    # when data table first renders, this function is run:
    on-init: ->>
        # Register the handler to update all table view when a change is 
        # occurred in `mydocument/mydocument` view:
        @get('db').on-topic "@db-proxy.change.view.mydocument/mydocument", ~>
            @fire \kickChanges

        # Fetch tableview data upon init:
        @fire \kickChanges

    # OPTIONAL
    /* Executed when a row is about to open. */
    on-create-view: (row) ->>
        if row
            /* Editing to an existing document */
            # fetch the document
            curr = await @get \db .get row.id
        else
            /* Adding a new row */
            curr =
                _id: 'mydocument-####'
                content: ""
        return curr 

    # Required unless readonly
    save: (ctx, curr) ->> 
        await @get('db').put curr
        @update \curr

    # OPTIONAL
    # Just like Ractive.data
    # type: function
    data: ->
        canSeePrivate: ->
            @able \scene.hello.**

        availableLabels: [{id: .., name: ..} for <[ hello there ]>]

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
            err, res <~ @get('db').view "mydocument/mydocument"
            # set your tableview when you are done
            @set \tableview, res
            if err
                btn?.error err.message
            else 
                btn?.state \done...
            callback?!

        addLabel: (ctx, search, proceed) ->
            @push \availableLabels, {id: search, name: search}
            proceed!
