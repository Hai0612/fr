<template>
    <div>
        <v-avatar
  color="primary"
  size="56"
></v-avatar>
        <h2>Hello</h2>
        <!-- <Product/> -->
    </div>
</template>
<script>
import axios from 'axios'
import Product from '../components/Product.vue'

export default {
    data(){
        return {
            id_search : '',
            book : ''
        }
    },
   
    components : {
        Product,
    }
}
</script>
<style lang="scss">
    h3{
        color: red;
    }
</style>