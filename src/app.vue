<template lang="pug">
div.zi-main.zi-layout
  js-slogan
  js-editor(@done='search' @package-change='packageChange')
  zi-card.show
    js-versions.versions(:versions='versions' :is-loading='version_loading' @change='changeHandler')
    js-files(:tree='tree' :is-loading='tree_loading' @file-click='fileClickHandler')
</template>

<script lang="coffee">
import * as service from './service'

export default
  data: ->
    name: ''
    package: 'npm'
    versions: []
    tree: {}
    version_loading: off
    tree_loading: off

  methods:
    search: (name) ->
      @checkPackage name
      @name = name
      @version_loading = on
      @tree_loading = on

      try
        result = await service.get_versions @package, name
        @versions = result.versions
        @version_loading = off
      catch err
        @$Toast.warning "not found anything by `#{name}`"
        @versions = []
        @tree = {}
        @version_loading = off
        @tree_loading = off

    get_files: (name, version) ->
      @tree_loading = on
      @tree = await service.get_tree @package, name, version
      @tree_loading = off

    changeHandler: (version) ->
      @get_files(@name, version)

    fileClickHandler: (event) ->
      url = service.get_url @package, @name, event.name
      await @$copyText url
      @$Toast.show "CDN url copied. `#{url}`"

    packageChange: (name) ->
      @package = (name is 'npm' and 'npm') or 'gh'

    checkPackage: (name) ->
      return if @package isnt 'gh'
      if not name.includes('/')
        @$Toast.danger 'github type required: "username/repo"'

</script>

<style scoped lang="stylus">
.zi-layout
  max-width 800px

.show
  display flex
  margin-top 20px

.versions
  min-width 200px
</style>
