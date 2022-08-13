<template>
  <button :type="type" :disabled="disabled">
    <slot />
  </button>
</template>

<script>
export default {
  name: 'LoadingButton',
  props: {
    disabled: {
      type: Boolean,
      default: false
    },
    type: {
      type: String,
      default: 'submit'
    },
  }
}
</script>
