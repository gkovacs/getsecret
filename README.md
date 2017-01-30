# getsecret

A simple way to get credentials stored in yaml files and environment variables

## Install

    npm install getsecret

## Storing secrets

You can store secrets in 3 locations (in decreasing order of priority)

* An environment variable. These are commonly used in Heroku. ex: `process.env.some_keyname`

* A file named `.getsecret.yaml` in your current directory

* A file named `.getsecret.yaml` in your home directory. The format should map key names to secrets, ie:

    some_keyname: some_secret_value
    another_keyname: another_secret_value

## Accessing secrets from code

Simply pass the key name to getsecret and its value will be returned. ex:

```javascript
var getsecret = require('getsecret')
var secret_value = getsecret('some_keyname')
```

## Author

[Geza Kovacs](http://github.com/gkovacs)

## License

MIT
