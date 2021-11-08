<template>
  <v-app>
    <Navbar v-if="this.$route.name != 'Login'"/>
    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>
import Navbar from './components/Navbar.vue';
export default {
  name: 'App',
  data: () => ({
    //
  }),
  components:{
    Navbar
  },
  created(){
  }
};
</script> 