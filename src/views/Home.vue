<template>
  <Header/>
  <Menu/>
  <div class="container-fluid">
      <Carousel/>
      <div class="slider">
        <img src="../assets/images/home.jpg" alt="">
      </div>
      <div class="best-selling">
        <div class="row title-best-sell"><h3>Best Selling Books Ever</h3></div>
        <div class="row">
            <div class="col col-sm-2" v-for="(book,index) in listbooks" v-bind:key="index">
               <div v-if="index < maxInRowCategory">
                 <BookItem 
                 @delete-item="deleteItem"
                    :values="book"/>  
               </div>
            </div>
        </div>
      </div>
      <div class="categories">
          <div class="label-categories">
            <h3>Category Items </h3>
            <div >
              <ul class="list">
              <li id="All" @click="showCategory" class="list-item">
                All
              </li> 
              <li id="Hornor" @click="showCategory" class="list-item">
                Hornor
              </li>
              <li id="Cartoon" @click="showCategory" class="list-item">
                Cartoon
              </li>
              <li id="Novel" @click="showCategory" class="list-item">
                Novel
              </li>
             
            </ul>
            </div>
          </div>
          <div class="row">
            <div class="col col-sm-2" v-for="(book,index) in listCategory" v-bind:key="index">
               <div v-if="index < maxInRowCategory">
                 <BookItem 
                  @delete-item="deleteItem"
                    :values="book"/>  
               </div>
            </div>
            <div v-if="isShowMore" class="show-more">
                <router-link :to="{ name: 'ShowCategory', params: { category: listCategory[0]['bookLine'] }}"><button class="btn  btn-success"><i class="fas fa-angle-double-right"></i>Show more</button></router-link>
            </div>
          </div>
    </div>
    <Footer/>
  </div>
</template>

<script>
import Carousel from '../components/UI components/Carousel.vue'
import axios from 'axios'
import BookItem from '../components/BookItem.vue'
import Header from '../components/Header.vue'
import Menu  from "../components/Menu.vue";
import Footer from '../components/Footer.vue'
export default {
  data(){
      return {
        listbooks : [],
        listCategory : [],
        maxInRowCategory : 6,
        isShowMore : false,
      }
  },

  methods:{
    deleteItem(value){
      let index = this.listbooks.indexOf(value)
      this.listbooks.splice(index, 1)
    },
      showCategory(e){
        let seft = this;
            axios({
              method: 'get',
              url: 'https://localhost/banhang/index.php?controller=book&action=getbycategory&category='.concat(e.target.id),
            }).then((response) => {
                  if(response.data != ''){
                    seft.listCategory = response.data;
                    seft.isShowMore = true;
                  }
            });
        
      },
      fetchAllBook(){
         let seft = this;
            axios({
            method: 'get',
            url: 'https://localhost/banhang/index.php?controller=book&action=getall',
          }).then((response) => {
                if(response.data != ''){
                  seft.listbooks = response.data;
                }
          });
        },
      // checkUser(){
      //       let self = this;
      //       axios({
      //         method: 'get',
      //         url: 'https://localhost/banhang/index.php?controller=user&action=authenticate',
      //         headers:{
      //             "Accept" : "application/json",
      //             "Content-Type": "application/json",
      //             "Authorization" : localStorage.getItem("token"),
      //         }
      //       }).then((response) => {
      //             if(response.data.status){
      //                 self.user = response.data.account[0];
      //             }
      //       });
      //   },
      
 
  },
  created(){
      this.fetchAllBook();
      this.user = this.$store.state.user

      // this.checkUser();
  },
  components: {
    Header,
    Menu,
    BookItem,
    Footer,
    Carousel
  }
}
</script>
<style lang="scss" scoped>
*{
  box-sizing: border-box;
}
.container-fluid{
  padding: 30px 250px;
  min-height: 100vh ;
  background: linear-gradient(to right top, #ffd89b, #e5e7e9);
  .slider{
    margin: 50px auto;
    display: flex;
    justify-content: center;
    height: 350px;
    img{
        width: 700px;
        margin: auto;
        height: 100%;
      }
  }
 
  .best-selling{
    .title-best-sell{
      text-align: center;
      margin: 30px 0px;
    
    }
  
  }
  .categories{
    margin-top: 100px;
    .label-categories{
        margin-bottom: 50px;
          h3{
          margin-bottom: 30px;
          }
          text-align: center;
          ul {
            li{
              display: inline-block;
              padding: 10px;
              margin-right: 20px;
              font-size: 18px;
              color: black;
              font-weight: 500;
              border-radius: 10px;
              width: 150px;
              background: rgba($color: rgb(167, 121, 37), $alpha: 0.5);
            }
            li:hover{
              background: crimson;
              cursor: pointer;
            }
          }
        }
        .show-more{
          text-align: center;
          button{
            color:white;
            i{
              margin: 0px 5px;
            }
            font-size: 26px;
            padding: 1px 5px;
          }
        }
  }
}
</style>