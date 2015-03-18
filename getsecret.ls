require! {
  yamlfile
  fs
  path
}

cached_secrets = null

getsecret_init = ->
  cached_secrets := {}
  homepath = process.env.HOME
  if not homepath?
    homepath = process.env.USERPROFILE # for windows
  if homepath?
    home_secrets = path.join homepath, '.getsecret.yaml'
    if fs.existsSync home_secrets
      for k,v of yamlfile.readFileSync home_secrets
        cached_secrets[k] = v
  if fs.existsSync '.getsecret.yaml'
    for k,v of yamlfile.readFileSync '.getsecret.yaml'
      cached_secrets[k] = v
  for k,v of process.env
    cached_secrets[k] = v

getsecret = (name) ->
  if not cached_secrets?
    getsecret_init()
  return cached_secrets[name]

module.exports = getsecret
