<template>
    <section>
        <div class="cart-title">
            <h2>Shopping Bag</h2>
            (<span>5</span> Items)
        </div>
        <div class="cart-main">
            <div class="row">
                <div class="cart-table col col-md-8 col-sm-12">
                    <table>
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img src="../assets/images/icon.jpg" alt=""></td>
                                <td>
                                    <h2>Free Makeup Melt Cleanser Sample</h2>
                                    <p>Dry/wet Gentle Jelly Cleanser With Rose Flower</p>
                                </td>
                                <td>
                                    <div class="change-quantity">
                                        <button><i class="fas fa-minus"></i></button>
                                        <span>5</span>
                                        <button><i class="fas fa-plus"></i></button>
                                    </div>
                                </td>
                                <td>$32.00</td>
                                <td><button>Remove</button></td>
                            </tr>
                             <tr>
                                <td><img src="../assets/images/icon.jpg" alt=""></td>
                                <td>
                                    <h2>Free Makeup Melt Cleanser Sample</h2>
                                    <p>Dry/wet Gentle Jelly Cleanser With Rose Flower</p>
                                </td>
                                <td>
                                    <div class="change-quantity">
                                        <button><i class="fas fa-minus"></i></button>
                                        <span>5</span>
                                        <button><i class="fas fa-plus"></i></button>
                                    </div>
                                </td>
                                <td>$32.00</td>
                                <td><button>Remove</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="cart-checkout col col-md-3 col-sm-12">
                    <ul>
                        <li>
                            <div class="row">
                                <div class="col col-md-6 type">Subtotal</div>
                                <div class="col col-md-6 result">$40.00</div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col col-md-6 type">Shipping:</div>
                                <div class="col col-md-6 result">Add info</div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col col-md-6 type">Coupon Code</div>
                                <div class="col col-md-6 result">Add coupon</div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col col-md-6 type">Grand total:</div>
                                <div class="col col-md-6 result">$40.00</div>
                            </div>
                        </li>
                    </ul>
                    <div class="button-checkout">
                            <router-link to="/checkout">
                                <v-btn depressed color="primary" block ><i class="fas fa-user-lock"></i>Checkout</v-btn>
                            </router-link>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>
<script>
export default {
    
}
</script>
<style lang="scss" scoped>
    section{
        margin: 50px 10%;
        .cart-title{
            text-align: center;
            h2{
                font-size: 40px;
                color: rgb(116, 40, 40);
            }
            span{
                font-size: 25px;
            }
        }
        .cart-main{
            margin-top: 100px;
            .row{
                .cart-table{   
                    margin-right: 50px;
                    table {
                        margin: 0;
                        width: 100%;
                        color: #444;
                        td:nth-child(3){
                            text-align: center;
                            div.change-quantity{
                                display: inline-flex;
                                border: 1px solid black;
                                button{
                                padding: 10px;
                                font-size: 20px;
                                }
                                span{
                                    padding: 10px;
                                    font-size: 20px;
                                    width: 30px;
                                }
                            }
                        }
                        thead{
                            
                            th:nth-child(1){
                                width: 10%;
                            }
                            th:nth-child(2){
                                width: 40%;
                            }
                            th:nth-child(3){
                                width: 20%;
                            }
                            th:nth-child(4){
                                width: 20%;
                            }
                            th:nth-child(5){
                                width: 10%;
                            }
                        }
                        tbody{
                            tr{ 
                                height: 11vh;
                                position: relative;
                            }
                           
                            tr td:nth-child(2){
                                h2{
                                    font-size: 18px;
                                    line-height: 22px;
                                }
                                p{
                                    margin: 0px;
                                }
                            }
                             td img{
                                height: 50px;
                            }
                        }
                    }
                }
                .cart-checkout{
                    padding: 20px;
                    border: 1px solid red;
                    ul{
                        padding-left: 0px;
                        li{
                            padding: 10px;
                            list-style-type: none;
                            .type{

                            }
                            .result{
                                text-align: end;
                            }
                        }
                        li:nth-child(3){
                            padding-bottom: 20px;
                            border-bottom: 1px solid black;
                        }
                        
                    }
                    i{
                        color:white;
                        margin-right: 10px;
                    }
                    a{
                        text-decoration: none;
                        color: white;
                    }
                }   
            }
        }
        
    }

</style>