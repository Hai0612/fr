<template>
  <Header/>
  <Menu/>
  <router-view/>
  <Footer/>
</template>
<script>
import Header from '../src/components/Header.vue'
import Menu from '../src/components/Menu.vue'
import Footer from '../src/components/Footer.vue'
  export default {
    data: () => ({ drawer: null }),
    component:{
      Header, Menu ,Footer
    }
  }
</script>