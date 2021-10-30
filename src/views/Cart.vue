<template>
    <Header/>
    <Menu/>
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="book in carts" v-bind:key="book">
                    <td>
                        <div class="prod">
                            <img :src="book.image" alt="img">
                            <router-link :to="{name : 'Detail', params: {id_book: book.id_book}}">
                                 <h4>{{book.name}}
                                </h4>
                            </router-link>
                        </div>
                    </td>
                    <td>{{book.price}}</td>
                    <td>
                        <div class="quantt">
                            <span>{{book.quantity}}</span>
                            <div class="revise">
                                <button :data-id_book="book.id_book" class="btn"  @click="incre"><i  class="fas fa-angle-up"></i></button>
                                <button :data-id_book="book.id_book" class="btn"  @click="decre"><i  class="fas fa-angle-down"></i></button>
                            </div>
                        </div>
                        
                    </td>
                    <td>{{parseInt(book.quantity * book.price)}}</td>

                </tr>
                <tr>
                    <td><b>Total</b></td>
                    <td></td>
                    <td><b>{{totalQuantity}}</b></td>
                    <td><b>{{parseInt(totalPrice)}}</b></td>
                </tr>
                
            </tbody>
            
        </table>
        <div class="payment">
            <button class="btn btn-success">Phieu Giam Gia</button>
            <button class="btn btn-danger">Thanh Toan</button>
        </div>
    </div>
    <Footer/>
</template>
<script>
import axios from 'axios'
import Header from '../components/Header.vue'
import Menu from '../components/Menu.vue'
import Footer from '../components/Footer.vue'
export default {
    data(){
        return {
           carts: [],
        }
    },
    methods:{
        checkUser(){
         
        },
        incre(event){
            this.$store.dispatch('increQuantityOfItem',event.target.closest('button').dataset.id_book);
            console.log(event.target.closest('button').dataset.id_book)
            this.carts = this.$store.state.carts;
        },
        decre(event){
            this.$store.dispatch('decreQuantityOfItem',event.target.closest('button').dataset.id_book);
            this.carts = this.$store.state.carts;
        }
    },
    components:{
        Header, Menu,Footer
    },
    computed:{
        totalPrice(){
            let total = 0;
            this.carts.forEach(element => {
                total += element.price* element.quantity;
            });
            return total;
        },
        totalQuantity(){
            let totalQuan = 0;
            this.carts.forEach(element => {
                totalQuan += parseInt(element.quantity);
            });
            return totalQuan;
        }
    },
    created(){
        this.carts = this.$store.state.carts;
        this.checkUser();
    }
}
</script>
<style lang="scss" scoped>
.container{
    table{
        width: 100%;
        thead{
            height: 70px;
        }
        tr,td,th{
            padding: 5px;
            margin: 0;
            font-size: 20px;
            text-align: center;

        }
        tr,td:first-child{
            width: 60%;
        }
        tbody{
            tr{
                border: 1px solid wheat;
            }
            .quantt{
                width: 60%;
                padding: 5px;
                border:1px solid rgba($color: black, $alpha: 0.2);
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;
                span{
                    margin:0px 20px;
                    height: 20px;
                }
                .revise{
                    display: flex;
                    flex-direction: column;
                    font-size: 24px;
                    font-weight: 600;
                    button{
                        border: 1px solid rgba($color: black, $alpha: 0.5);
                        width: 50px;
                           i{
                            font-size: 26px;
                        }
                    }
                }
                
            }

            .prod{
                display: flex;
                flex-direction: row;
                align-items: center;
                img{
                    padding: 5px;
                    width: 30%;
                    height: 200px;
                }
                a{
                    text-decoration: none;
                }
                h4{
                    font-size: 16px;
                    padding-left: 20px;
                }
                
            }
        }
        
    }
    .payment{
        margin-top: 30px;
        text-align: end;
            button{
                margin: 5px;
            }
        }
}
</style>