<template lang="pug">
div
  h2.zi-subheading VERSIONS:
  div(v-if='!isLoading')
    zi-radio-group(v-model="value").list
      zi-radio.radio(v-for="v in safe_versions" :label="v" :key="v") {{ v }}
  zi-spinner(v-else)
</template>

<script lang="coffee">
export default
  props: ['versions', 'is-loading']

  computed:
    safe_versions: ->
      return [] if not @versions
      @versions.slice(0, 20)

  data: ->
    value: ''

  watch:
    versions: (next) ->
      return if not next or next.length is 0
      @value = next[0]

    value: (next) ->
      @$emit 'change', next
</script>

<style scoped lang="stylus">
.list
  display flex
  width 80%
  flex-direction column
  align-items flex-start
  flex-wrap wrap

  .radio
    width auto
    height 16px
    margin-bottom 10px


</style>
