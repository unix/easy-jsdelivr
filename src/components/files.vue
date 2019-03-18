<template lang="pug">
div
  h2.zi-subheading FILES:
  div(v-if='!isLoading')
    zi-tag(:type="main !== 'none' ? 'success' : 'warning'") Main: {{ main }}
    zi-files(v-if='tree && tree.files' :files='tree.files' @file-click="$emit('file-click', $event)")
  zi-spinner(v-else)
</template>

<script lang="coffee">
export default
  props: ['tree', 'is-loading']

  computed:
    main: ->
      return 'none' if not @tree or not @tree.default
      @tree.default
</script>

