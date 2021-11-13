<template>
    <section class="checkout">
        
        <section class="checkout-main">
            <div class="payment-methods">
                <div class="title-checkout">
                    <h2>Checkout</h2>
                    <h5>Cart >  Information > Shipping > Payment</h5>
                </div>
                <h3>Langly Go</h3>
                <div class="express-methods row">
                        <div class="col col-md-4 col-sm-12">
                            <img src="../assets/images/paypal.png" alt="">
                        </div>
                        <div class="col col-md-4 col-sm-12">
                            <img src="../assets/images/shop.png" alt="">
                        </div>
                        <div class="col col-md-4 col-sm-12"> 
                            <img src="../assets/images/g-pay.png" alt="">
                        </div>
                </div>
                <div class="checkout-form">
                    <FormCheckout/>
                </div>
            </div>
            <div class="checkout-card">
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="card-img">
                                    <img src="../assets/images/proview.jpg" alt="">
                                    <span>2</span>
                                </div>
                            </td>
                            <td>Layer Photography Field Jacket</td>
                            <td>$50.00</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="card-img">
                                    <img src="../assets/images/proview.jpg" alt="">
                                    <span>2</span>
                                </div>
                            </td>
                            <td>Layer Photography Field Jacket</td>
                            <td>$50.00</td>
                        </tr>
                    </tbody>
                </table>
                <div class="card-gift">
                    <v-row>
                        <v-col cols="9">
                            <v-text-field
                            v-model="select"
                            :rules="[v => !!v || 'Item is required']"
                            label="Item"
                            required
                            ></v-text-field>
                        </v-col>
                        <v-col cols="3" class="mt-4">
                            <v-btn >
                                Normal
                                </v-btn>
                        </v-col>
                    </v-row>
                </div>
                <div class="total-payment">
                    <v-row>
                        <span>Total</span>
                        <v-spacer></v-spacer>
                        <span>$330.25</span>
                    </v-row>
                </div>
            </div>
        </section>
    </section>
</template>
<script>
import FormCheckout from '../components/FormCheckout.vue'
export default {
    components:{
        FormCheckout,
    },
    
}
</script>
<style lang="scss">
@import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700&display=swap');
*{
  font-family: 'Roboto', sans-serif;
}
    .checkout{
        .checkout-title{
            padding-left: 200px;
            height: 200px;
        }
        .checkout-main{
            display: flex;
            .payment-methods{
                padding-bottom: 100px;
                padding-left: 15%;
                width: 50%;
                margin-right: 100px;
                .title-checkout{
                    h2{
                        padding-top: 10px;
                        font-size: 32px;
                        padding-bottom: 10px;
                    }
                    h5{
                        padding-left: 20px;
                        margin-bottom: 30px;
                    }
                }
                .express-methods{
                        padding: 10px;
                        border: 1px solid red;
                        div{
                            img{
                                width: 100%;
                            }
                        }
                }
            }
            .checkout-card{
                width: 50%;
                padding: 50px 20% 0px 50px;
                background: #8cd0e3;
                table{
                    width: 100%;
                   
                    tbody{
                        tr{
                            margin-bottom: 20px;
                        }
                        .card-img{
                            position: relative;
                            border: 1px solid red;
                            margin-right: 20px;
                            img{
                            width: 100%;
                            border-radius: 5px;
                            height: 100px;
                            }
                            span{
                                position: absolute;
                                right: -4px;
                                color: white;
                                top: -10px;
                                background: rgb(65, 62, 62);
                                padding: 1px 3px;
                                border-radius: 50%;
                            }
                        }
                    }
                }
            }
        }
    }
</style>