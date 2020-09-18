# Overview

`abdennour/dotenv-to-js-object` is a software which convert environment variable in a Javascript Object format saved into a destination file

The source of the environment variable can be :
- from a single dotenv file (.env) using `-s=<VALUE>` or `--src=<VALUE>` option
- or/and from the container process env vars using `--env-vars` flag. If you don't provide `-s` or `--src` option, `--env-vars` flag will be forced.

# Examples

## common script

```sh
# create .env file with one entry
echo "REACT_APP_API=http://localhost:8080" > .env.example
# make alias of the software
alias dotenv-to-js='docker run -v $(pwd):/data -w /data -e MSG="Hello" abdennour/dotenv-to-js-object'

```

## Example 1 - basic


```sh
# run common script,  then :
dotenv-to-js

# Validate
### A new file "env.js" must be created 
### it must include env vars of the container process
```
Without no argument, the source of env vars is the process env vars.


## Example 2 - Specify source of dotenv file with `--src`

```sh
# run common script,  then :
dotenv-to-js --src=.env.example

# Validate
### A new file "env.js" must be created 
### it must include  '.... = {  REACT_APP_API: "http://localhost:8080" '}
```

## Example 3 - Process also container env vars with `--env-vars`

```sh
# run common script,  then :
dotenv-to-js --src=.env.example --env-vars

# Validate
### A new file "env.js" must be created 
### it must include  '.... = {  REACT_APP_API: "http://localhost:8080" ', .... , MSG: 'Hello'}

```

Even though MSG is not in the .env file, it has been rendered because it's a container/process env var and `--env-vars` flag has been used

## Example 4 - Specify Directory destination for the JS file

```sh
# run common script,  then :
dotenv-to-js --src=.env.example --dest=assets/js

# Validate
### A new directory must be created under ./assets/js/
### A new file "env.js" must be created inside this directory (./assets/js/)
### env.js must include the expected content  
```

## Example 5 - Run it as Daemon not Job with `--run-as`

By default this software convert env vars, then it terminates.
This is because the default value of `--run-as` option is `job`.

If you want to run it as daemon, you need to specify `--run-as=daemon`

```sh
# run common script,  then :
dotenv-to-js --src=.env.example --run-as=daemon

# Validate
### The process must not finish unless you type Ctrl+C  
### Also open another terminal, edit .env.example file.
### Then check env.js file ==> it must be refreshed
```

## Example 6 - Customize Refresh Period when it's Daemon using `--refresh-period`

`--refresh-period` is a number and its unit is second
```sh
# run common script,  then :
dotenv-to-js --src=.env.example \
  --run-as=daemon \
  --refresh-period=100

# Validate
### The process must not finish unless you type Ctrl+C 
### Refershing the env.js file is done every 100 seconds 
```