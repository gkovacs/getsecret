require! {
  yamlfile
  fs
  path
}

cached_secrets = null

getsecret_init = ->
  cached_secrets := {}
  home_secrets = path.join process.env.HOME, '.getsecret.yaml'
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
