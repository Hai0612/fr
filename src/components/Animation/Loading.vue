<template>
  <div>
    <v-progress-circular
      :rotate="-90"
      :size="70"
      :width="10"
      :value="value"
      color="success"
    >
    </v-progress-circular>
  </div>
</template>
<script>
  export default {
    data () {
      return {
        interval: {},
        value: 0,
      }
    },
    beforeDestroy () {
      clearInterval(this.interval)
    },
    mounted () {
      this.interval = setInterval(() => { 
        if (this.value === 100) {
          return (this.value = 100)
        }
        this.value += 20
      }, 100)
    },
  }
</script>