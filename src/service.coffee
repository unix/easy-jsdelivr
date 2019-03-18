host = 'https://data.jsdelivr.com/v1/package'
cdn = 'https://cdn.jsdelivr.net'

export get_versions = (package_name, name) ->
  res = await fetch("#{host}/#{package_name}/#{name}")
  if res.status > 204
    throw 'error'
  res.json()

export get_tree = (package_name, name, version) ->
  (await fetch("#{host}/#{package_name}/#{name}@#{version}")).json()

export get_url = (package_name, name, file) ->
  path = "/#{package_name}/#{name}/#{file}".replace /\/\//g, '/'
  "#{cdn}#{path}"
