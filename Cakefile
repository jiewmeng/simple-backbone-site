{spawn, exec} = require "child_process"

# Helpers
# -------

# **`procExec(procName)`**
# returns the path to executable in `node_modules`
procExec = (procName) -> 
	"./node_modules/.bin/" + procName

# **`processOutput(proc)`**
# handle the output of a `spawn`-ed process
# see **[link](http://stackoverflow.com/a/7376108/292291)**
processOutput = (proc) ->
	proc.stdout.on "data", (data) -> 
		console.log data.toString().trim()
	proc.stderr.on "data", (data) -> 
		console.log data.toString().trim()

# **`handleOutput(err, output)`**
# handle the output from a `exec`-ed process
handleOutput = (err, output) ->
	if err then throw err
	console.log output

task "watch", "Watch and compile file changes", ->
	# watch and compile CoffeeScript intp `public/js/`
	coffee = spawn procExec("coffee"), ["-o", "public/js/app", "-c", "-w", "src/coffee"]
	processOutput coffee

	# watch and compile Stylus
	stylus = spawn procExec("stylus"), ["src/stylus/styles.styl", "-I", "public/css/","-l", "-w", "-u", "./node_modules/nib", "-o", "public/css/app"]
	processOutput stylus

	# watch and compile jade
	jade = spawn procExec("jade"), ["src/jade", "--watch", "--out", "public"]
	processOutput jade
