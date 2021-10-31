<template>
    <footer>
        <div class="footer-content">
            <div class="footer-option">
                <div class="footer-logo">
                    <a href="">
                        <img src="../assets/images/logo.png" alt="">
                    </a>
                </div>
                <div class="footer-nav">
                    <div class="footer-nav-left">
                        <ul>
                            <li>
                                <a href="">PORTFOLIO</a>
                            </li>
                            <li>
                                <a href="">SERVICES</a>
                            </li>
                            <li>
                                <a href="">CONTACT</a>
                            </li>
                            <li>
                                <a href="">ABOUT</a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-nav-right">
                        <ul>
                            <li>
                                <a href="">INSDUSTRY</a>
                            </li>
                            <li>
                                <a href="">JOIN OUR TEAM</a>
                            </li>
                            <li>
                                <a href="">OUR PARTNESS</a>
                            </li>
                            <li class="list-social">
                                <ul>
                                    <li>
                                        <a href=""><i class="fab fa-facebook"></i></a>
                                    </li>
                                    <li>
                                        <a href=""><i class="fab fa-instagram"></i></a>
                                    </li>
                                    <li>
                                        <a href=""><i class="fas fa-at"></i></a>
                                    </li>
                                    <li>
                                        <a href=""><i class="fab fa-twitter"></i></a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
               
            </div>
             <div class="footer-feedback">
                    <h3>GET NEWS <span>+</span> UPDATES</h3>
                    <p>Stay connected with us! Get updates</p>
                    <p>follow projects from sketchpad to completion, and more.</p>
                    <div class="footer-form-feedback">
                        <v-text-field
                            background-color="#A9B9C6"
                            color="red"
                            height="50"
                            label="Enter your email"
                            placeholder=""
                        ></v-text-field>
                        
                    </div>
                </div>
        </div>
        <v-footer
                dark
                padless
            >
                <v-card
                class="flex"
                flat
                tile
                >
                <v-card-title class="black pl-10">
                    <strong class="subheading">Get connected with us on social networks!</strong>
                    <v-spacer></v-spacer>
                    <v-btn >
                        Private Policy
                    </v-btn>
                    <v-btn >
                        Terms of Use
                    </v-btn>
                    <v-btn>
                        Site by <span style="color:red">Hai</span>
                    </v-btn>
                </v-card-title>

                <v-card-text class="py-2 white--text text-center">
                    {{ new Date().getFullYear() }} — <strong>Hai</strong>
                </v-card-text>
                </v-card>
            </v-footer>
    </footer>
</template>
<script>
export default {
    data(){
        return {
            socials: [
                'mdi-facebook',
                'mdi-twitter',
                'mdi-linkedin',
                'mdi-instagram',
            ]
        }
    }
}
</script>
<style lang="scss" scoped>
    footer{
        background-image: url('../assets/images/footer.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        .footer-content{
            padding-bottom: 100px;
            padding-left: 10%;
            width: 80%;
            margin: auto;
            padding-top: 100px;
            color: rgb(202, 176, 128);
            .footer-option{
                display: inline-block;
                width: 50%;
                .footer-logo{
                    padding-left: 20px;
                    a{
                    display: inline-block;
                    img{
                        height: 100px;
                        }
                    }
                }
                .footer-nav{
                    a{
                        text-decoration: none;
                        color: white;
                    }
                    ul{
                        padding-left: 0px;
                        li{
                            font-size: 21px;
                            font-weight: normal;
                            padding: 5px;
                            list-style-type: none;
                        }
                        li:hover{
                            a{
                                color: red;
                            }
                        }
                    }
                    .footer-nav-left{
                        width: 50%;
                        display: inline-block;
                    }
                    .footer-nav-right{
                        width: 50%;
                        display: inline-block;
                        .list-social{
                            padding-left: 0px;
                            li{
                                display: inline-block;
                                margin-right: 10px;
                            }
                            i{
                                color: rgb(207, 192, 192);
                                padding: 2px;
                                border: 1px solid red;
                                border-radius: 50%;
                                background-color: red;
                            }
                        }
                    }
                }
            }
            .footer-feedback{
                widows: 40%;
                display: inline-block;
                color: white;
                h3{
                    font-size: 26px;
                    font-weight: 600;
                    margin-bottom: 30px;
                }
                p{
                    .footer-form-feedback{

                    }
                }
            }
        }

    }
</style>