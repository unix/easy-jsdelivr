<template lang="pug">
zi-card.card
  h4.title Enter npm package name:
  .inputs
    zi-select(size='small' v-model='package' style="margin-right: 10px;")
      zi-option(value="npm")
      zi-option(value="github")
    zi-input(size='small' :placeholder='placeholder' :prefix-label='prefix' v-model='name')
    zi-button.button(size='small' auto type="success" @click='done' :disabled='disabled') done
</template>

<script lang="coffee">
export default
  data: ->
    name: undefined
    package: 'npm'

  computed:
    disabled: -> not @name

    placeholder: ->
      (@package is 'npm' and 'package name') or 'username/repo'

    prefix: ->
      (@package is 'npm' and 'npm/') or 'github/'

  methods:
    done: -> @$emit 'done', @name

  watch:
    package: (next) ->
      @$emit 'package-change', next
</script>

<style scoped lang="stylus">
.card
  padding-top 30px
  padding-bottom 30px

.title
  margin 0 0 15px

.inputs
  display flex
  align-items flex-end

  .button
    margin-left 10px
</style>
