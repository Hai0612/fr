<template>
    <Header/>
    <Menu/>
    <div class="container">
        <div class="title-categories">
                <img src="../assets/categories.png" alt="">
        </div>
        <div class="row show">
            <div class="col col-sm-3 filter">
                <div class="wrap-filter">
                    <div class="filter-genres">
                        <h4>Filter by Genres</h4>
                        <div class="form-check">
                            <input @click="fetchData" class="form-check-input" type="radio" name="radio_genres" id="cartoon" checked>
                            <label class="form-check-label" for="cartoon">
                                Cartoon
                            </label>
                        </div>
                        <div class="form-check">
                            <input @click="fetchData" class="form-check-input" type="radio" name="radio_genres" id="hornor" >
                            <label class="form-check-label" for="hornor">
                                Hornor
                            </label>
                        </div>
                        <div class="form-check">
                            <input @click="fetchData" class="form-check-input" type="radio" name="radio_genres" id="Love stories" >
                            <label class="form-check-label" for="Love stories">
                                Love-stories
                            </label>
                        </div>
                        <div class="form-check">
                            <input @click="fetchData" class="form-check-input" type="radio" name="radio_genres" id="novel" >
                            <label class="form-check-label" for="novel">
                                Novel
                            </label>
                        </div>
                        <div class="form-check">
                            <input @click="fetchData" class="form-check-input" type="radio" name="radio_genres" id="fiction">
                            <label class="form-check-label" for="fiction">
                                Science Fiction
                            </label>
                        </div>
                        <div class="form-check">
                            <input @click="fetchData" class="form-check-input" type="radio" name="radio_genres" id="biography">
                            <label class="form-check-label" for="biography">
                                Biography
                            </label>
                        </div>    
                    </div>
                    <div class="filter-price">
                        <h4>Filter by Price</h4>
                        <div class="progress" @click="changePrice($event)">
                            <div id="price-bar" class="progress-bar progress-bar-striped" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="score">{{price_bar}} to 100</div>
                        
                    </div>
                    <div class="filter-rating">
                        <select @change="fetchData" class="form-select" name="ratingNum" id="rating">
                            <option value="0">Filter by Rating</option>
                            <option value="500">5 star rating</option>
                            <option value="700">4 star rating</option>
                            <option value="500">3 star rating</option>
                            <option value="300">2 star rating</option>
                            <option value="100">1 star rating</option>

                        </select>
                    </div>
                    <div class="filter-publisher">
                        <h4>Filter by Publisher</h4>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="radio_pub" id="all_pub" checked>
                            <label class="form-check-label" for="all_pub">
                                All 
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="radio_pub" id="HarperCollins">
                            <label class="form-check-label" for="HarperCollins">
                                HarperCollins 
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="radio_pub" id="Penguin Random House">
                            <label class="form-check-label" for="Penguin Random House">
                                Penguin Random House 
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="radio_pub" id="Hachette Livre">
                            <label class="form-check-label" for="Hachette Livre">
                                Hachette Livre
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="radio_pub" id="Hachette Livre">
                            <label class="form-check-label" for="Hachette Livre">
                                Hachette Livre
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="radio_pub" id="McGraw-Hill Education">
                            <label class="form-check-label" for="McGraw-Hill Education">
                                McGraw-Hill Education
                            </label>
                        </div>
                    </div>
                    <div class="filter-author">
                        <select @change="fetchData" class="form-select" name="nameAuthor" id="filter-name">
                            <option value="all_author">Filter by Author</option>
                            <option value="Nevil Shute">Nevil Shute</option>
                            <option value="Mark Twain">Mark Twain</option>
                            <option value="Han Kang">Han Kang</option>
                            <option value="George Orwell">George Orwell</option>
                            <option value="Chimamanda Ngozi Adichie">Chimamanda Ngozi Adichie</option>
                            <option value="Lucy Maud Montgomery">Lucy Maud Montgomery</option>

                        </select>
                    </div>
                </div>
            </div>
            <div class="col col-sm-9 content">
                <div class="select">
                    <select @change="fetchData"  name="cate" id="cate">
                        <option value="">Browser by popularity</option>
                        <option value="">1</option>
                        <option value="!">2</option>
                        <option value="!">3</option>
                        <option value="!">4</option>
                        <option value="!">5</option>
                    </select>
                </div>
                <div class="row">
                    <div class="col col-sm-3" v-for="book in listBookBycategory" v-bind:key="book">
                        <div>
                            <BookItem
                                :id_book="book.id_book"
                                :name="book.name" 
                                :author="book.author" 
                                :description="book.description" 
                                :views="book.views" 
                                :price="book.price"
                                :image="book.image"/>

                        </div>
                    </div>
                     
                </div>
            </div>
        </div>
    <JoinNews/>
    <Footer/>

    </div>
</template>
<script>
import axios from 'axios'
import Header from '../components/Header.vue'
import Menu from '../components/Menu.vue'
import Footer from '../components/Footer.vue'
import BookItem from '../components/BookItem.vue'
import JoinNews from '../components/JoinNews.vue'
export default {
    data(){
        return{
            listBookBycategory: [],
            price_bar : 10,
            rating : '',
            author :'',
            publisher: '',
            genres : '',
            views : 0,
        }
    },
    methods:{
        changePrice(event){
            let el = $(event.target).closest('.progress')[0];
            const max_price = 100;
            const current = event.clientX;
            const left_position = el.getBoundingClientRect().x;    
            const width =  el.getBoundingClientRect().width;
            const price = (current - left_position)/(width) * max_price;
            el.style.width = price;
            el.firstChild.style.width = price/max_price*100 + '%';
            this.price_bar = Math.floor(price);
            this.fetchData();
            return price;
        },
       
        fetchData(){
            this.publisher = document.querySelector("input[name=radio_pub]:checked").id ;
            this.genres = document.querySelector("input[name=radio_genres]:checked").id;
            this.author = document.getElementsByName('nameAuthor')[0].value;
            this.views = document.getElementsByName('ratingNum')[0].value;
            let self = this;
            axios({
              method: 'post',
              data:{
                  genres : self.genres,
                  author : self.author,
                  views : self.views,
                  publisher : self.publisher,
                  price : self.price_bar,
              },
              url: 'https://localhost/banhang/index.php?controller=book&action=fetchConditionsCategories',
            }).then((response) => {
                  if(response.data.status){
                      self.listBookBycategory = response.data.payload;
                  }
            });
        }
    },
    mounted() {
        this.fetchData();
        let self = this;
        if(this.$route.params.category){
            console.log(document.getElementById(this.$route.params.category.toLowerCase()))
            axios({
              method: 'post',
              data:{
                  genres : self.$route.params.category,
              },
              url: 'https://localhost/banhang/index.php?controller=book&action=fetchConditionsCategories',
            }).then((response) => {
                  if(response.data.status){
                      self.listBookBycategory = response.data.payload
                      console.log(self.listBookBycategory);
                  }
            });
        }
    },
    created(){
        // let self = this;
        // if(this.$route.params.category){
            document.getElementById(this.$route.params.category)
        //     axios({
        //       method: 'post',
        //       data:{
        //           genres : self.$route.params.category,
        //       },
        //       url: 'https://localhost/banhang/index.php?controller=book&action=fetchConditionsCategories',
        //     }).then((response) => {
        //           if(response.data.status){
        //               self.listBookBycategory = response.data.payload
        //               console.log(self.listBookBycategory);
        //           }
        //     });
        // }
    },

    components:{
        Header,
        Menu,
        BookItem,
        Footer,
        JoinNews,
    }
}
</script>
<style lang="scss" scoped>
.container{
    margin-top: 50px;
    .title-categories{
        height: 30vh;
        text-align: center;
        img{
            width: 80%;
            height: 100%;
        }
    }
    .show{
        padding-top: 50px ;
        .filter{
            .wrap-filter{
                padding : 25px;
                border:1px solid rgba($color: rgb(145, 133, 133), $alpha: 0.3);
            }
            
            .filter-genres{
                h4{
                margin-bottom: 20px;
            }
            .form-check{
                    margin: 5px;
                    font-size: 18px;
                    input{
                        width: 24px;
                        height: 24px;
                    }
                    label{
                        margin: 5px;
                    }
                }
            }
            .filter-price{
                .progress{
                    cursor: pointer;
                }
                margin-top: 50px;
                .score{
                    margin-top: 10px;
                    text-align: center;
                }
            }
            .filter-rating{
                margin-top: 50px;
                select{
                width: 80%; 
                    option{
                        text-align: center;
                    }
                }
            }
            .filter-publisher{
                margin-top : 60px;
                .form-check{
                    margin: 5px;
                    font-size: 18px;
                    input{
                        color: red;
                        width: 24px;
                        height: 24px;
                    }
                    label{
                        margin: 5px;
                    }
                }
            }
            .filter-name{
                margin: 50px 0px;
                
            }
            .filter-author{
                margin: 50px 0px;
                select{
                width: 80%; 
                    option{
                        text-align: center;
                    }
                }
            }
            
        }
        .content{
            background: rgba($color: wheat, $alpha: 0.3);
            .select{
                margin: 10px 10px 20px 10px ;
                text-align: end;
                select{
                    border-radius: 20px;
                    font-size: 16px;
                    padding: 10px;
                }
            }
            
        }
    }
}
</style>