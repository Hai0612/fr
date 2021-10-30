<template>
    <Header/>
    <Menu/>
    <div class="container">
        <div class="card-edit">
            <div class="card-edit-header">
                <div>
                    <img :src="image" alt="">
                    <input type="file" id="chosefile">
                </div>
                <div class="card-edit-title">
                    <div class="form-group" id="test">
                        <label for="input-name"> Name</label>
                        <input type="text" class="form-control" id="input-name" v-model="name">
                    </div><div class="form-group">
                        <label for="input-author"> Author</label>
                        <input type="text" class="form-control" id="input-author" v-model="author">
                    </div>
                </div>
            </div>
            <div class="card-edit-body">
                    <div class="form-group">
                        <label for="input-bookline"> Line</label>
                        <input type="text" class="form-control" id="input-bookline" v-model="bookLine">
                    </div>
                    <div class="form-group">
                        <div>
                            <label for="input-quantity">Quantity</label>
                            <input type="text" class="form-control" id="input-quantity" v-model="quantity">      
                        </div>
                        <div>
                            <label for="input-ordered">Ordered</label>
                            <input type="text" class="form-control" id="input-ordered" v-model="ordered">
                        </div>
                        <div>
                            <label for="input-price">Price</label>
                            <input type="text" class="form-control" id="input-price" v-model="price">
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <label for="input-publisher">Publisher</label>
                        <input type="text" class="form-control" id="input-publisher" v-model="publisher">
                        
                    </div>
                    <div class="form-group">
                        <label for="input-view">View</label>
                        <input type="text" class="form-control" id="input-view" v-model="views">
                    </div>
                    <div class="form-floating">
                        <textarea rows="10" class="form-control" v-model="description" id="desciptionTextarea"></textarea>
                        <label for="desciptionTextarea">Description</label>
                    </div>
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>

                    <button @click="saveEdit" type="submit" class="btn btn-primary">Submit</button>
                    <p id="mesEdit" class="form-text">{{mes}}</p>
            </div>
        </div>
    </div>
    <Footer/>
</template>
<script>
import Header from '../components/Header.vue'
import Menu  from '../components/Menu.vue'
import Footer from '../components/Footer.vue'
import axios from 'axios'
export default {
    data(){
        return {
            name : '',
            author : '',
            id_book : '',
            quantity: 0,
            ordered : 0,
            price : 0,
            publisher : '',
            views : 0,
            description : '',
            image: '',
            mes: '     ',
        }
    },
    methods:{
        fetchItem(){
          let self = this;
            axios({
               method : 'post',
               url : 'https://localhost/banhang/index.php?controller=book&action=getbyIndex&id_book=' + self.$route.params.id_book,
               data :{
               } 
            }).then((response) =>{
                if(response.data) {
                    self.name = response.data[0].name;
                    self.id_book = response.data[0].id_book;
                    self.quantity = response.data[0].quantity;
                    self.ordered = response.data[0].ordered
                    self.price = response.data[0].price
                    self.bookLine = response.data[0].bookLine
                    self.author = response.data[0].author
                    self.publisher = response.data[0].publisher
                    self.description = response.data[0].description
                    self.views = response.data[0].views
                    self.image = response.data[0].image
                }
            });
        },
        saveEdit(){
            let self = this;
            axios({
              method: 'post',
              data:{
                  id_book : self.id_book,
                  name : self.name,
                  author : self.author,
                  bookLine : self.bookLine,
                  quantity : self.bookLine,
                  ordered: self.ordered,
                  price : self.price,
                  publisher : self.publisher,
                  views : self.views,
                  description : self.description,
                  image : self.image,
              },

              url: 'https://localhost/banhang/index.php?controller=book&action=editBook',
            }).then((response) => {
                  if(response.data.payload){
                    document.getElementById('mesEdit').style.color = 'green'
                    let x = document.getElementsByTagName("input");
                    x.forEach(element => {
                        element.style.backgroundColor = 'aliceblue';
                    });
                      self.mes = 'Successful Change';
                      
                  }else{
                        self.mes = 'Failure Change';
                        document.getElementById('mesEdit').style.color = 'red';
                        let x = document.getElementsByTagName("input");
                        x.forEach(element => {
                        element.style.backgroundColor = 'antiquewhite';
                    });
                  }
            });
        }
    },
    components:{
        Header,
        Menu,
        Footer
    },
    created(){
        this.fetchItem();
        // this.getValue();
    }
}
</script>
<style lang="scss" scoped>
    .container{
        font-weight: 500;
        padding-left: 200px;
        .card-edit{
            .card-edit-header{
                display: flex;
                align-items: center;
                img{
                    display:block;
                    height: 200px;
                    padding: 5px;
                }
                #chosefile{
                    font-size: 12px;
                }
                .card-edit-title{
                    padding: 20px;
                }
            }
            .card-edit-body{
                input,textarea  {
                        width: 50%;
                }
                .form-group:nth-child(2){
                    display: flex;
                    div{
                        input{
                            width: 77%;
                        }
                    }
                }
                textarea{
                    min-height: 120px;
                }
            }
            p#mesEdit{
                height: 50px;
                font-weight: 700;
            }
        }
    }
</style>