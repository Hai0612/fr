<template>
  <v-app>
    <Navbar v-if="this.$route.name !== 'Login' && this.$route.name !=='Signup'"/>
    <v-main style="margin-top: 90px;">
      <router-view/>
    </v-main>
    <Footer v-if="this.$route.name != 'Admin'"/>
    <Social/>
  </v-app>
</template>

<script>
import Navbar from './components/Navbar.vue';
import Footer from './components/Footer.vue';
import Social from './components/Social.vue';


export default {
  name: 'App',
  data: () => ({
    //
  }),
  components:{
    Navbar,
    Footer,
    Social,
  },
  created(){
    console.log(this.$route)
  }
};
</script> 