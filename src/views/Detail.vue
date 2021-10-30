<template>
    <Header :num="numInCart"/>
    <Menu/>
    <div class="container">
        <div class="cart">
            <img :src="book.image" alt="">
            <div class="info">
                <h3>{{book.name}}</h3>
                <p>{{book.author}}</p>
                <span>${{book.price}}</span>
                <p><span><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span> ({{book.views}}) </p>
                <div>
                    <button @click="addCart" id="addCart" type="button" class="btn btn-primary">Add to cart</button>
                    <button type="button" class="btn btn-primary"><i class="fas fa-share-alt"></i></button>
                </div>

            </div>
        </div>
            <div class="chooses">
                <ul>
                    <li>
                        <button @click="showDetail" id="description">
                            Description
                        </button>
                    </li>
                    <li>
                        <button @click="showDetail" id="comments">
                            Comment
                        </button>
                    </li>
                    <li>
                        <button @click="showDetail" id="author">
                            Author
                        </button>
                    </li>
                    <li>
                        <button @click="showDetail" id="review">
                            Review
                        </button>
                    </li>
                </ul>
            </div>
        <div class="content">
            <p>{{content}}</p>
            <div v-if="showComment" class="comment-content">
                <div class="row addComment">
                    <div class="col col-sm-2 user-img">
                        <img src="../assets/logo.png" alt="user-img">
                    </div>
                    <div class="col col-sm-9">
                        <input @keyup.enter="addComment" type="text" name="addComment" id="addComment" class="form-control">
                        <div class="icon-add"><i class="fas fa-tags"></i><i class="fas fa-gifts"></i>   <i class="fas fa-grin-tongue"></i></div>
                    </div>
                </div>
                <div class="list-comments">
                    <div class="row comment-item" v-for="comment in listComments" v-bind:key="comment">
                        <div class="col col-sm-2 user-img">
                            <img src="../assets/logo.png" alt="user-img">
                        </div>
                        <div class="col col-sm-8 cmt">
                            <p>
                                {{comment.content}}
                                <span v-if="comment.vote > 0" id="icon-like" ><i class="fas fa-heart"></i>{{comment.vote}}</span>
                            </p>
                            <div class="feedback"><span @click="clickLike" id="like" :data-idcomment=comment.id_comment>Like</span> <span id="reply">Trả lời</span></div>
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
import JoinNews from '../components/JoinNews.vue'

import {eventBus} from '../main'
export default {
    data(){
        return{
            book: [],
            listComments : [],
            content: '',
            numInCart : 0,
        }
    },

    methods:{
        addCart(){
            if(localStorage.getItem("token")){
            this.$store.dispatch('addToCart',this.book)
            }
            this.numInCart = this.$store.getters.total;
        },
        showDetail(event){
            if(event.target.id == 'comments'){
                this.showComment = true;
            }else{
                this.showComment = false;
            }
            this.content = this[event.target.id];
        },
        showContent(){
            let self = this;
            let id_book = this.$route.params.id_book;
            axios({
              method: 'get',
              url: 'https://localhost/banhang/index.php?controller=book&action=getbyIndex&id_book='.concat(id_book),
            }).then((response) => {
                  if(response.data != ''){
                      self.book  = response.data[0];
                  }
            });
        },
        fetchListComments(){    
                let self = this;
                let id_book = this.$route.params.id_book;
                axios({
                method: 'get',
                url: 'https://localhost/banhang/index.php?controller=comment&action=getByIdbook&id_book='.concat(id_book),
                }).then((response) => {
                    if(response.data != ''){
                        self.listComments = response.data;
                    }
                });
        },
        addComment(event){
                let seft = this;
                axios({
                method: 'post',
                data:{
                    content : event.target.value,
                    id_book : seft.id_book,
                },
                url: 'https://localhost/banhang/index.php?controller=comment&action=addComment',
                }).then((response) => {
                    if(response.data != ''){
                    event.target.value = '';
                    seft.fetchListComments();
                    }
                });
        },
        clickLike(event){
            this.listComments.forEach(element => {
                if(element['id_comment'] == event.target.dataset.idcomment){
                    element['vote'] ++;
                    this.updateComment(element['id_comment']);
                }
            });
        },
        updateComment(id){
                let seft = this;
                let id_comment = id;
                axios({
                method: 'get',
                url: 'https://localhost/banhang/index.php?controller=comment&action=increVote&id_comment='.concat(id_comment),
                }).then((response) => {
                    if(response.data){
                        console.log(response.data)
                        }
                });
        }

    },
    created(){
        this.num = this.$store.getters.total;
         this.showContent();
         this.fetchListComments();
        
    },
    components:{
        Header,
        Menu,
        Footer,
        JoinNews
    }
}
</script>
<style lang="scss" scoped>
.container{
    .cart{
        color: white;
        margin-top: 30px;
        display: flex;
        background: #FF1616;
        padding: 35px 70px;
        img{
        width: 300px;
        height: 400px;
        }
        .info{
            display: flex;
            flex-direction: column ;
            justify-content: center;
            margin-left: 80px;
            h3{
                font-size: 34px;
                margin-bottom: 30px;
            }
            span{
                font-size: 32px;
                font-weight: 600;
            }
            button{
              
                display: inline-block;
                padding: .75rem 1.25rem;
                border-radius: 10rem;
                color: black;
                text-transform: uppercase;
                font-size: 1rem;
                letter-spacing: .15rem;
                transition: all .3s;
                position: relative;
                overflow: hidden;   
                z-index: 100;
        
            }
            button:before {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 0%;
                    height: 100%;
                    background-color: yellow;
                    transition: all .3s;
                    border-radius: 10rem;
                    z-index: -1;
                }
             button:hover {
                color: black;
                box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
                &:before {
                    width: 100%;
                }
            }
          
            
            button:nth-child(2){
                width: 55px;
            }

        }
    }
        .chooses{
            margin: 70px;
            padding: 0px 100px;
            text-align: left;
            ul{
                li{
                    display: inline;
                    font-size: 24px;
                    margin: 5px;
                    list-style-type: none   ;
                    border-radius: 9999px;
                    background: wheat;
                    button{
                        background: none;
                        padding: 0px 10px;
                        border: none;
                        color: crimson;
                    }
                }
        }
    }
    .content{
        margin:  0px 100px 50px 100px;
        .comment-content{
            margin: 50px 200px;
            .user-img{
                    text-align: end;
                    img{
                        border-radius: 50%;
                        height: 40px;
                        width: 40px;
                        overflow: hidden;
                    }
                    
                }
            .addComment{
                
                .col-sm-9{
                    position: relative;
                    input{
                        border-radius: 9999px;
                    }
                    .icon-add{
                        position:absolute;
                        right: 27px;
                        top: 7px;
                        i{
                            margin: 0px 5px;
                        }
                    }
                }
            }
            .list-comments{
                margin: 5px 20px;
                .comment-item{
                    p{
                        margin:0px;
                        padding: 7px; 
                        background: rgba($color: rgb(128, 125, 122), $alpha: 0.5);
                        display: inline-block;
                        border-radius: 10px;
                    }
                    .cmt {
                        #icon-like{
                            color: red;
                            margin: 0px 5px;
                        }
                        #icon-like:hover{
                            cursor: pointer;
                        }
                        p{
                            position: relative;
                            span{
                                font-size: 13px;
                                padding: 0px 4px;
                                background: rgba($color: #7a7474, $alpha: 0.5);
                                border-radius: 99px;
                                position: absolute;
                                right: -24px;
                                bottom: -8px;
                                i{
                                    font-size: 13px;
                                }
                            }
                        }
                        .feedback{
                            margin-left: 5px;
                                span{
                                    margin: 2px 4px;
                                }
                                span:hover{
                                    cursor: pointer;
                                    color: rgb(107, 93, 93);
                                    font-weight: 500;
                                }
                        }
                    }
                }
            }
        }
    }
    
    
}
</style>