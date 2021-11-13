<template>
  <v-app>
    <Navbar1 v-if="this.$route.name != 'Login'"/>
    <v-main style="margin-top: 90px;">
      <router-view/>
    </v-main>
    <Footer/>
    <Social/>
  </v-app>
</template>

<script>
import Navbar1 from './components/Navbar1.vue';
import Footer from './components/Footer.vue';
import Social from './components/Social.vue';


export default {
  name: 'App',
  data: () => ({
    //
  }),
  components:{
    Navbar1,
    Footer,
    Social,
  },
  created(){
  }
};
</script> 