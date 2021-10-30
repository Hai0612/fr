<template>
  <div class="container">
    <Header/>
    <Menu/>
    <div class="contact-content">
        <div class="img-contact">
          <img src="../assets/images/detail.jpg" alt="">
        </div>
        <div class="content">
            <div class="row">
                <form @submit.prevent="" class="col col-sm-9" >
                    <div class="message">
                        <h4>Get in Touch</h4>
                        <textarea class="form-control" name="message-contact" id="message-contact" cols="" rows="10"></textarea>
                    </div>
                    <div class="address row">
                        <div class="col col-sm-6">
                            <input type="text" class="form-control" name="name" id="name" placeholder="Enter your fullname here....">
                        </div>
                        <div class="col col-sm-6">
                            <input type="email" class="form-control" name="name" id="name" placeholder="Enter your email here....">
                        </div>
                    </div>
                    <div class="subject">
                            <input class="form-control" type="text" name="subject" id="subject" placeholder="Enter your subject...">
                    </div>
                    <button class="btn" type="submit">Send</button>
                </form>
                <div class="col col-sm-3 info">
                    <div class="contact-info">
                        <span><i class="fas fa-home"></i></span>
                        <div class="box">
                            <h5>Hà Tĩnh, Việt Nam</h5>
                            <p>Ngã ba Đồng Lộc</p>
                        </div>
                    </div>
                    <div class="contact-info">
                        <span><i class="fas fa-phone-alt"></i></span>
                        <div class="box">
                            <h5>0123456789</h5>
                            <p>Mon to Fri 9am to 6pm</p>
                        </div>
                    </div>
                    <div class="contact-info">
                        <span><i class="fas fa-envelope"></i></span>
                        <div class="box">
                            <h5>nnn@gmail.com</h5>
                            <p>Send us your query anytime</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <Footer/>
  </div>
</template>
<script>
import Header from '../components/Header.vue'
import Menu from '../components/Menu.vue';
import Footer from '../components/Footer.vue'
export default {
  components:{
    Header,
    Menu,
    Footer,
  }
}
</script>
<style lang="scss" scoped>
.container{
    .contact-content{
        .img-contact{
            margin: 50px 30px;
                img{
                    height: 250px;
                    width: 100%;
                }
        }
    }
    .content{
        form{
            padding: 0px 75px;
            .message{
                textarea{
                    width: 100%;
                    resize: none;
                }
            }
            .address{
                .col{
                    margin: 20px 0px;
                }
            }
            .subject{
                    margin: 20px 0px;

            }
            .btn{
                    background: rgb(255, 255, 255);
                    display: inline-block;
                    padding: 18px 44px;
                    font-family: "Playfair Display", serif;
                    font-size: 20px;
                    font-weight: 600;
                    border: 1px solid rgb(255, 22, 22);
                    text-align: center;
                    cursor: pointer;
            }
            .btn:hover{
                background: rgb(255, 22, 22) !important;
                color: white;
            }
        }
        .info{
            margin-top: 50px;
            .contact-info{
                display: flex;
                span{
                    height: 100%;
                    font-size: 24px;
                    padding: 10px 15px 15px 15px;
                }
                .box{
                    display: inline-block;
                    h5{
                        color: rgb(42, 42, 42);
                        font-size: 16px;

                    }
                    p{
                        color: rgb(138, 138, 138);
                    }
                }
            }
        }
    }
}
</style>
