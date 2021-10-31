<template>
    <Header @passUser="receivedUser"/>
    <div class="container">
        <div class="row user-content">
            <div class="user-left col col-sm-3">
                <div class="avatar">
                    <img src="../assets/item.png" alt="">
                    <div class="avatar-body">
                        <h3>Name</h3>
                        <router-link  to ="/"><p><span><i class="fas fa-edit"></i></span>Edit profile</p></router-link>
                    </div>
                </div>
                <div class="menu-bar">
                    <ul>
                        <li :class="{ li_active : isShow['profile_content']}" @click="showRightContent" id="profile_content"><i class="fas fa-user-circle"></i>Tài khoản của tôi
                            <ul v-if="isShow['profile_content']">
                                <li :class="{li_active : isShow['profile_content']}">Hồ sơ</li>
                                <li>Đổi mật khẩu</li>
                            </ul>
                        </li>
                        <li :class="{ li_active : isShow['discount_content']}" @click="showRightContent" id="discount_content"><span><i class="fas fa-ticket"></i></span> Vé giảm giá</li>
                        <li :class="{ li_active : isShow['notification_content']}" @click="showRightContent" id="notification_content"><span><i class="fas fa-bell"></i></span> Thông báo</li>
                    </ul>
                </div>
            </div>
            <div class="user-right col col-sm-8">
                <div v-if="isShow['profile_content']" class="profile_content" id="profile_content">
                    <div class="title-content">
                        <h3>My Profile</h3>
                        <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
                    </div>
                    <hr>
                    <div class="profile-item">
                        <div class="row">
                            <div class="col col-sm-8">
                                <div class="mb-3">
                                    <label for="account_user" class="form-label">Account Name</label>
                                    <input type="email" class="form-control" id="account_user" aria-describedby="emailHelp">
                                </div>
                                 <div class="mb-3">
                                    <label for="name_user" class="form-label">Name </label>
                                    <input type="email" class="form-control" id="name_user" aria-describedby="emailHelp">
                                </div>
                                 <div class="mb-3">
                                    <label for="email_user" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="email_user" aria-describedby="emailHelp">
                                </div>
                                <button class="btn btn-danger btn" type="submit">Save</button>
                            </div>
                            <div class="col col-sm-4">
                                <img src="../assets/logo.png" alt="image-user">
                                <input type="button" value="Chose image">
                                <small class="form-text">Dụng lượng file tối đa 1 MB
                                                        Định dạng:.JPEG, .PNG
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
                <div v-if="isShow['discount_content']" class="discount_content" id="discount_content">
                    <div class="title-content">
                        <h3>My Discount</h3>
                        <p>Quản lý thông tin phiếu mua hàng</p>
                    </div>
                    <hr>
                    <div class="discount-item">
                        <div class="discount-item-title">
                            <i class="fas fa-user-tag"></i><span>COUPON</span>
                        </div>
                        <a href="#">
                            <div class="discount-card">
                                <h3><span>25%</span> OFF</h3>
                                <p>Chrismas Special - Click here</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div v-if="isShow['notification_content']" class="notification_content" id="notification_content">
                    <div class="title-content">
                        <h3>Notifications </h3>
                        <p>Quản lý thông báo</p>
                    </div>
                    <hr>
                        <div class="notification-item">
                            <h4>Name</h4>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ad tempore reiciendis atque repudiandae necessitatibus mollitia assumenda culpa quo quod excepturi! Architecto placeat eligendi ea quas, temporibus voluptas incidunt laboriosam voluptates.</p>
                            <div>
                                <button class="btn"><span>Trả lời</span></button>
                                <small>5 phút trước</small>
                            </div>
                        </div>
                        <div class="notification-item">
                            <h4>Name</h4>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ad tempore reiciendis atque repudiandae necessitatibus mollitia assumenda culpa quo quod excepturi! Architecto placeat eligendi ea quas, temporibus voluptas incidunt laboriosam voluptates.</p>
                            <div>
                                <button class="btn"><span>Trả lời</span></button>
                                <small>5 phút trước</small>
                            </div>
                        </div>
                        <div class="notification-item">
                            <h4>Name</h4>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ad tempore reiciendis atque repudiandae necessitatibus mollitia assumenda culpa quo quod excepturi! Architecto placeat eligendi ea quas, temporibus voluptas incidunt laboriosam voluptates.</p>
                            <div>
                                <button class="btn"><span>Trả lời</span></button>
                                <small>5 phút trước</small>
                            </div>
                        </div>
                    
                </div>
            </div>
        </div>
    </div>
    <Footer/>
</template>
<script>
import axios from 'axios'

import Header from '../components/Header.vue'
import Navbar from '../components/Navbar.vue'
import Footer from '../components/Footer.vue'

export default {
    data(){
        return {
            isShowProfileTagDetail : false,
            isShow : {
                profile_content : true,
                discount_content : false,
                notification_content : false,
            }
        }
    },
    methods:{
        // receivedUser(value){
        //     console.log(value);
        // },
        showRightContent(){
            if(event.target.id =='profile-tag'){
                this.isShowProfileTagDetail = true;
            }
            else{
                this.isShowProfileTagDetail = false;
            }
            for(let ele in this.isShow){
                if(ele === event.target.id){
                    this.isShow[ele] = true;
                }else{
                    this.isShow[ele] = false;
                }
            }
        }
    },
    components:{
        Header, Navbar, Footer
    }
}
</script>
<style lang="scss" scoped>
*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
.container{
    max-width: 1140px;
    margin: auto;
    .user-content{
        .user-left{
            .avatar{
                display: flex;
                margin: 5px;
                img{
                        width: 50px;
                }
                .avatar-body{
                    padding: 10px;
                }
            }
            .menu-bar{
                margin-top: 30px;
                ul{
                    i{
                        margin: 0px 2px;
                    }
                    li{
                        list-style-type: none;
                        font-weight: 400;
                        padding: 10px 5px;
                    }
                    li:hover{
                        cursor: pointer;
                        background: rgba($color: wheat, $alpha: 0.5);
                    }
                    li:nth-child(1){
                        ul{
                            margin-left: 15px;
                        }
                    }
                    li:last-child{
                        i{
                            color: rgb(212, 90, 90);
                        }
                    }
                }
            }
        }
        .user-right{
            background: rgba($color: wheat, $alpha: 0.3);
            padding: 20px;
            .title-content{
                h3{
                    font-size: 20px;
                    font-weight: 500;
                    margin-bottom: 10px;
                }
                p{
                    font-size: 14px;
                }
            }
            .profile_content{
                .profile-item{
                    margin-top: 25px;
                    .row{
                        .col-sm-8{
                            input{
                                height: 40px;
                                padding: 5px;
                            }
                            button{
                                padding: 10px 30px;
                                font-size: 18px;
                            }
                        }
                        .col-sm-4{
                            padding: 50px;
                            display: flex;
                            flex-direction: column;
                            justify-content: center;
                            align-items: center;
                            img{
                                height: 100px;
                            }
                        }
                    }
                }
            }
            .notification_content{
                .notification-item{
                    background: rgba($color: wheat, $alpha: 0.5);
                    border-radius: 7px;
                    margin-top: 10px;
                    padding: 5px 10px;
                    h4{
                        font-size: 17px;
                    }
                    p{
                        white-space: nowrap;
                        overflow: hidden;
                        text-overflow: ellipsis;
                    }
                    span{
                        margin: 0px 20px;
                    }
                    button:hover{
                        color: rgb(47, 139, 35);
                    }
                }
                .notification-item:hover{
                    cursor: pointer;
                     box-shadow: rgba(100, 100, 111, 0.4) 0px 7px 29px 0px;
                }
            }
            .discount_content{
                .discount-item{
                    padding:  50px;
                    .discount-item-title{
                        span{
                            margin: 0 10px;
                            font-weight: 600;
                        }
                    }
                    a{
                        text-decoration: none;
                    }
                    .discount-card{
                        border: 1px solid rgba($color: rgb(41, 40, 38), $alpha: 0.5);
                        margin: 20px;
                        padding: 10px;
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                        align-items: center;
                        h3{
                            span{
                                color: red;
                                font-size: 34px;
                            }
                        }
                    }
                }
            }
        }
    }
    .li_active{
        background: rgba($color: wheat, $alpha: 0.5);
    }
}
</style>

