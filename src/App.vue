<template>
  <v-app>
    <Navbar1 v-if="this.$route.name != 'Login'"/>
    <v-main style="margin-top: 76px;">
      <router-view/>
    </v-main>
    <Footer/>
  </v-app>
</template>

<script>
import Navbar1 from './components/Navbar1.vue';
import Footer from './components/Footer.vue';

export default {
  name: 'App',
  data: () => ({
    //
  }),
  components:{
    Navbar1,
    Footer
  },
  created(){
  }
};
</script> 