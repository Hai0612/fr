<template>
    <div class="product-item">
        <router-link to="/">
            <div class="product-content">
                <div class="product-image">
                <img src="../assets/images/back-pro.jpg" alt="">
                <div class="add-product-to-cart">
                    <button>Show detail</button>
                </div>
                </div>
                <div class="product-body">
                    <h4>Mia Women's Lexa Slides - Black</h4>
                    <p>$<span>20.5</span></p>
                </div>
            </div>
        </router-link>
    </div>
</template>
<script>
export default {
    data(){
        return{
            show: false,
        }
    },
    methods:{
        hoverCart(){
            console.log(event.target)
        }
    }
}
</script>
<style lang="scss" scoped>
    .product-item{
        width: 100%;
        a{
            width: 100%;
            height: 100%;
            display: block;
            color: black;
            text-decoration: none;
            .product-content{
                display: flex;
                flex-direction: column;
                .product-image{
                    position: relative;
                    height: 80%;
                    img{
                        height: 100%;
                        width: 100%;
                    }
                    .add-product-to-cart{
                        display: block;
                        position: absolute;
                        top: 70%;
                        left: calc(50% - 3vw - 40px);
                    }
                    button{ 
                        position: relative;
                        padding: 15px 40px;
                        margin-right: 25px;
                        margin-left: 25px ;
                        background-color: black;
                        color: white;
                        z-index: 1;
                        }
                        button::before {
                            color: black;
                            content: '';
                            position: absolute;
                            bottom: 0;
                            left: 0;
                            width: 100%;
                            height: 0%;
                            background-color: white;
                            transition: all .3s;
                            z-index: -1;
                        }
                        button:hover {
                            color: black;
                            box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
                            &:before {
                                height: 100%;
                                }
                        
                        }
                }
                .product-body{
                    margin-top: 50px;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
                    h4{
                        font-size: 15px;
                    }
                    p{
                        font-weight: 600;
                        span{

                        }
                    }
                }
            }

        }
    }
    .product-item:hover{
        .add-product-to-cart{
            display: block;
        }
    }
</style>