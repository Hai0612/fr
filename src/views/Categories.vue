<template>
   <section>
       <section class="categories-preview">
         <div class="categories-preview-content">
         <h2>
            Accessories
         </h2>
         <div class="categories-preview-extend">
            <span><i class="fas fa-square"></i>
            </span>
            <router-link to="/contact">Contact Me
               <i class="fas fa-chevron-circle-right"></i>
            </router-link>
         </div>
         </div>  
      </section> 
       <section class="categories-content">
          <div class="row">
             <div class="col col-sm-3 categories-filter">
                <v-list-group
                  no-action
                  sub-group
               >
                  <template v-slot:activator>
                     <v-list-item-content >
                        <v-list-item-title>Categories</v-list-item-title>
                     </v-list-item-content>
                  </template>

                  <v-list-item 
                     v-bind:style="{ color: 'red' }"
                     v-for="([title, icon], i) in categories"
                     :key="i"
                     link
                  >
                     <v-list-item-title v-text="title"></v-list-item-title>

                     <v-list-item-icon>
                     <v-icon v-text="icon"></v-icon>
                     </v-list-item-icon>
                  </v-list-item>
               </v-list-group>
               <v-list-group
                  no-action
                  sub-group
               >
                  <template v-slot:activator>
                     <v-list-item-content>
                     <v-list-item-title>Sort By</v-list-item-title>
                     </v-list-item-content>
                  </template>

                  <v-list-item
                     v-for="([title, icon], i) in sort"
                     :key="i"
                     link
                  >
                     <v-list-item-title v-text="title"></v-list-item-title>

                     <v-list-item-icon>
                     <v-icon v-text="icon"></v-icon>
                     </v-list-item-icon>
                  </v-list-item>
               </v-list-group>
               <v-list-group
                  no-action
                  sub-group
               >
                  <template v-slot:activator>
                     <v-list-item-content>
                     <v-list-item-title>Color</v-list-item-title>
                     </v-list-item-content>
                  </template>

                  <v-list-item
                     v-for="([title, icon], i) in price_level"
                     :key="i"
                     link
                  >
                     <v-list-item-title v-text="title"></v-list-item-title>

                     <v-list-item-icon>
                     <v-icon v-text="icon"></v-icon>
                     </v-list-item-icon>
                  </v-list-item>
               </v-list-group>
               <v-list-group
                  no-action
                  sub-group
               >
                  <template v-slot:activator>
                     <v-list-item-content>
                     <v-list-item-title>Price</v-list-item-title>
                     </v-list-item-content>
                  </template>

                  <v-list-item
                     v-for="([title, icon], i) in price_level"
                     :key="i"
                     link
                  >
                     <v-list-item-title v-text="title"></v-list-item-title>

                     <v-list-item-icon>
                     <v-icon v-text="icon"></v-icon>
                     </v-list-item-icon>
                  </v-list-item>
               </v-list-group>   
             </div>
             <div class="col col-sm-9 categories-items">
                <div class="row">
                  <div v-for="(book, index) in listBooks" class="col col-sm-4" v-bind:key="index">
                     <Product/>
                  </div>
                </div>
             </div>
          </div>
       </section>
   </section>
</template>
<script>
import axios from 'axios';
import Product from '../components/Product.vue'
export default {
   data(){
      return {
         categories: [
            ['Love', 'mdi-cards-heart-outline' ],
            ['Biography', 'mdi-cards-heart-outline' ],
            ['Cartoon', 'mdi-cards-heart-outline' ],
            ['Novel', 'mdi-cards-heart-outline' ],
            ['Fiction', 'mdi-cards-heart-outline' ],
            ['Hornor', 'mdi-cards-heart-outline' ]      
         ],
         sort: [
         ['Featured', 'mdi-plus-outline'],
         ['Rating', 'mdi-file-outline'],
         ['Price , low to high', 'mdi-update'],
         ['Price, high to low', 'mdi-delete']
        ],
         price_level: [
           ['$0 -> $25'],
           ['$35 -> $45'],
           ['$45 -> above']
        ],
        listBooks: {},
      }
   },
   methods:{
      fetchCategoryDefaul(){
         let self = this;
         const bookline = this.$route.params.category;
         console.log(bookline)
         axios({
            method: 'post',
            data:{
               'bookLine' : bookline ,
            },
            url: 'https://localhost/banhang/index.php?controller=book&action=getbycategory&bookLine='.concat(bookline) ,
         }).then((res) =>{
            self.listBooks = res.data.payload;
         })
      }
   },
   components:{
      Product,
   },
   created(){
      this.fetchCategoryDefaul();
   }
}
</script>
<style lang="scss" scoped>
   .categories-preview{
    background-image: url("../assets/images/Contact-me.png");
    color: Black;
    padding: 150px  ;
    padding-bottom: 150px;
    padding-left: 300px;
    .categories-preview-content{
      h2{
        font-size: 56px;
        font-weight: 800;
        letter-spacing: 3px;
        span{
          color: red;
        }
      }
      .categories-preview-extend{
        font-size: 25px;
        span{
          margin-right: 5px;
          color: red;
        }
        a{
          text-decoration: none;
          color: black;
          i{
            transition: all 0.5s ease;
            color: red;
          }
        }
        a:hover{
          i{
            margin-left: 10px;
          }
        }
      }
    }
    

  }
  .categories-content{
       padding: 100px 0px; 
       .categories-filter{
          padding-left: 100px;
          
       }
       .categories-items{
          padding-right: 100px;
          .row{
             .col{
             }
          }
       }
    }

</style>