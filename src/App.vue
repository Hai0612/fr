<template>
  <v-app> 
    <!-- <Navbar/> -->
    <Social/>
    <div>
      <router-view/>
    </div>
  </v-app>
</template>

<script>
import Navbar from './components/Navbar.vue'
import Social from './components/Social.vue'
import Iframe from './components/Iframe.vue'

export default {
  name: 'App',

  data: () => ({
    //
  }),
  components:{
    Navbar,
    Social,
    Iframe
  },
  mounted(){
  }
};
</script>
<style lang="scss" scoped>

</style>