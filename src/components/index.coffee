context = require.context './', on, /\.vue$/
getComponentName = (p) =>
  name = p.replace('.vue', '').split('/').slice(-1)[0]
  name.replace(/_/g, '-')

modules = context.keys()
  .map (path) =>
    Object.assign {}, context(path).default, { routerName: getComponentName(path).toLowerCase() }

export default
  install: (vue) ->
    modules.forEach (com) =>
      com.name = "js-#{com.routerName}" if not com.name
      vue.component(com.name, com)

  components: modules
