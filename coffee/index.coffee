express = require('express')
exphbs = require('express-handlebars')
bodyParser = require('body-parser')

Q = require('q')


app = express()

app.engine 'handlebars', exphbs(
    defaultLayout: 'main'
    layoutsDir: "#{__dirname}/views/layouts"
)
app.set 'view engine', 'handlebars'
app.set 'views', __dirname + '/views'
app.use express.static(__dirname + '/public')
app.use bodyParser.urlencoded(extended: true)

getCoffee = (name, args)->
    coffee =
        is_admin: false
        result: "Coffee not found"

        macchiato: (arg, cb) ->
            if arg
                cb("One macchiato with #{arg.join(' and ')} coming right up!")
            else
                cb("One macchiato coming right up!")

        espresso: (arg, cb) ->
            # no milk 4 u :3
            cb("A single shot of espresso!")

        galao: (arg, cb) ->
            # The hell even is this
            cb("...what?")

        black: (arg, cb) ->
            if arg
                cb("One black coffee with #{arg.join(' and ')}")
            else
                cb("One black coffee")

        americano: (arg, cb) ->
            if arg
                cb("One americano with #{arg.join(' and ')}")
            else
                cb("One americano")

        latte: (arg, cb) ->
            if arg
                cb("One latte with #{arg.join(' and ')}")
            else
                cb("One latte")

        melange: (arg, cb) ->
            cb("Sorry, none of this fancy shit")

        cappucinno: (arg, cb) ->
            if arg
                cb("One cappucinno with #{arg.join(' and ')}")
            else
                cb("One cappucinno")

        viennois: (arg, cb) ->
            cb("no.")

        tripplo: (arg, cb) ->
            cb("One tripplo! 0_0 good luck!")

        iced_coffee: (arg, cb) ->
            if arg
                cb("One iced coffee with #{arg.join(' and ')}")
            else
                cb("One iced coffee")

        brew: (arg, cb) ->
            if arg
                cb("One tea with #{arg.join(' and ')}")
            else
                cb("One tea")

        flat_white: (arg, cb) ->
            cb("One glass of milk for the weakling")


        # Assistance functions (NOT COFFEE)
        rebrew: ->
            "Rebrewed some coffee!"
        cleanup: ->
            "Cleaned up!"
    # Promises are awesome
    deferred = Q.defer()

    # Check that the coffee exists
    if (coffee[name]? and 
            name not in ["rebrew", "cleanup"] and
            typeof coffee[name] is "function")

        # Simulate the coffee
        coffee[name](args, (result) ->
            # This is a simulator, act like we're doing some work.
            setTimeout ->
                coffee.result = result
                deferred.resolve(coffee)
            , 200

            # Clean up after yourself
            deferred.promise.then ->
                coffee.cleanup()
        )
        # If the admin wants coffee, he gets it fresh.
        if coffee.is_admin
            coffee.rebrew()
    else
        # If it wasn't found, let's just print an error for the coffee name
        deferred.resolve(coffee)
    return deferred.promise


app.get '/', (req, res) ->
    res.render("index")

app.get '/:coffee', (req, res) ->
    args = if req.query.args? then req.query.args else []
    if typeof args is "string"
        args = [args]
    unless Array.isArray(args)
        return res.send("No.")
    getCoffee(req.params.coffee, args).then (coffee) ->
        # The admin always gets his favorite cup of joe :3
        if coffee.is_admin
            res.render("coffee", {result: coffee.result + " + secret admin spice :3"})
        else
            res.render("coffee", {result: coffee.result})
    
server = app.listen(3000, ->
    console.log 'Server listening on port 3000'
    return
)
