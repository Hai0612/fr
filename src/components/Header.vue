<template>
     <div class="header">
        <div class="row">
            <div class="col col-sm-3">
                <div class="logo">
                    <router-link to="/">
                    <img src="../../src/assets/logo.png" alt="logo"><h3><span>Hai</span>Shop</h3></router-link>
                </div>
            </div>
            <div class="col col-sm-5">
                <div class="search">
                    <div class="search-form">
                        <input type="text" class="form-control" @keyup="searchMachine" v-model="searchText">
                        <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                    </div>
                    <div v-if="searchText != ''" class="search-result">
                        <div v-for="item in listSearchs" v-bind:key="item" class="searchItem">
                            <img :src="item.image" alt="">
                            <div class="searchItem-body">
                                <h3>{{item.name}}</h3>
                                <span>{{item.author}}</span>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
            </div>
            <div class="col col-sm-4 header-nav">
                <ul class="list-group">
                   <router-link to="/"> <li class="list-group-item">FAQ</li></router-link>
                    <router-link to="/"> <li class="list-group-item">Track Order</li></router-link>
                    <router-link to="/cart" @mouseover="hoverCart" @mouseleave="mouseleaveCart"><li id="cart-tag" class="list-group-item"><i class="fas fa-cart-plus"></i><span id="num-cart">{{getNum}}</span></li></router-link>
                    <router-link to="/login"><li class="list-group-item">Sign In</li></router-link>
                    <router-link to="/user">
                        <div class="userAcc">
                            <img :src="user['image']" alt="">
                            <h3>{{user['lastname']}}</h3>
                        </div>
                    </router-link>
                </ul>
            </div>
        </div>
    </div>
</template>
<script>
import axios from 'axios';
export default {
    data(){
        return{
            quantityInCart: this.$store.state.numInCart,
            searchText: '',
            listSearchs : [],
            user: {}
        }
    },
    
    computed:{
        getNum(){
            let num = 0
            this.$store.state['carts'].forEach(element => {
                num += parseInt(element.quantity)
            })
            return num
        }
    },
    methods:{
     
        searchMachine(){
           let self = this;
            axios({
            method: 'post',
            data:{
                searchText : self.searchText,
            },
            url: 'https://localhost/BTL_ecommerce/index.php?controller=book&action=searchMachine',
                }).then((response) => {
                        if(response.data.payload != ''){
                            self.listSearchs = response.data.payload;
                        }
                });     
            },
           
            hoverCart(){
                document.getElementById('num-cart').style.top = '-10px';
                document.getElementById('num-cart').style.fontSize = '15px';

            },
            mouseleaveCart(){
                document.getElementById('num-cart').style.top = '-3px';
                document.getElementById('num-cart').style.fontSize = '12px';

            }
    },
  
    created(){
        this.user = this.$store.state.user;
        console.log(this.$store.state)

        console.log(this.$store.state.carts)
        console.log(this.$store.state.user)

    }   
}
</script>
 <style lang="scss" scoped>
    .header{
        background: rgb(124, 206, 124);
        text-align: center;
        padding: 20px;
        border-bottom: 1px solid rgba(255, 0, 0, .1);
        .row {
            align-items: center;
            .logo{
                a{
                    display: inline-flex;
                    text-decoration: none;
                    img{
                        height: 50px;
                        width: 60px;
                        margin-right: 20px;
                    
                     }
                    h3{
                        span{
                            color: orangered;
                            font-size: 30px;
                            margin:0px 5px;
                            font-weight: 800;
                        }
                    }
                }
                    
            }
            .search{
                position: relative;
                .search-form{
                    display: flex;
                    align-items: center;
                    input{
                    height: 45px;
                    display: inline-block;
                    }
                    button{
                        border: none;
                        border-radius: 30%;
                        margin-left: -40px;
                    }
                }
                .search-result{
                    position:absolute;
                    width: 400px;
                    z-index: 9999;
                    color: white;
                    background: rgba(rgb(224, 152, 152),1);
                    border-bottom-left-radius: 7px;
                    border-bottom-right-radius: 7px;
                    .searchItem{
                        margin: 5px 10px;
                        padding: 5px;
                        display: flex;
                        align-items: center;
                        height: 50px;
                        border-top: 1px solid rgba(black, 0.2);
                        transition: 2s ease;
                        img{
                            height: 100%;
                            width: 50px;
                        }
                        .searchItem-body{
                            padding: 0px 20px;
                            h3{
                                text-overflow: ellipsis;
                                overflow: hidden;
                                white-space: nowrap;
                                font-size: 16px;
                                margin: 0px;
                                font-weight: 500;
                                padding: 0px;
                            
                            }
                            span{
                                font-size: 14px;
                                font-weight: 300;
                            }
                        }
                    }
                    .searchItem:hover{
                        cursor: pointer;
                        background: linear-gradient(to bottom , rgb(63, 61, 61), rgb(61, 57, 57));
                    }
                }
            }
            .header-nav{
                ul{
                    display: flex;
                    flex-direction: row;
                    align-items: center;
                    justify-content: center;
                    a{
                        text-decoration: none;
                    }
                    a:hover{
                        li{
                            background: wheat;
                        }
                    }
                    li{
                        margin-right: 10px;
                        border-radius: 5px;
                        border: none;
                        display: inline-block;
                        text-decoration: none;
                        i{
                            color: red;

                        }

                    }
                    li:last-child {
                        font-weight: 500;
                        }
                .userAcc{
                    text-decoration: none;
                    padding: 5px;
                    background: rgba(255, 0, 0, .1);
                    border-radius: 99px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    img{
                        width: 40px;
                        height: 40px;
                        border-radius: 50%;
                    }
                    h3{
                        color: black;
                        font-size: 20px;
                        margin-left: 5px;
                    }
                }
                }
                #cart-tag{
                    position: relative;
                }
                #num-cart{  
                    background: red;
                    color: white;
                    font-size: 12px;
                    padding: 0px 2px;
                    position: absolute;
                    top: -3px;
                    right: 5px;
                    transition: all 1s ease;
                }
            }
            
        }
    }
 </style>

