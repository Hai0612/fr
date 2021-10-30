<template>
    <div class="footer">
        <div class="row">
            <div class="col col-sm-5">
                <div class="logo-footer">
                    <span><i class="fas fa-book-open"></i></span><span>ABC</span>Book
                    </div>
                <p>Get the breathing space now, and we’ll extend your term at the other end year for go.</p>
                <div class="list-link">
                    <ul>
                    <a href="https://www.facebook.com/">
                        <li>
                            <i class="fab fa-facebook"></i>
                        </li>
                    </a>
                    <a href="https://www.google.com/">
                        <li>
                            <i class="fab fa-instagram"></i>
                        </li>
                    </a>
                    <a href="https://www.youtube.com/">
                        <li>
                            <i class="fab fa-youtube"></i>
                        </li>
                    </a>
                    <a href="https://www.mail.google.com/">
                        <li>
                            <i class="fas fa-mail-bulk"></i>
                        </li>
                    </a>
                </ul>
                </div>
            </div>
            <div class="col col-sm-2" >
                <div class="cate">
                    <h5>Book Category</h5>
                    <ul>
                        <router-link to="/">
                            <li>History</li>
                        </router-link>
                        <router-link to="/">
                            <li>Hornor</li>
                        </router-link>
                        <router-link to="/">
                            <li>Love stories</li>
                        </router-link>
                        <router-link to="/">
                            <li>Science</li>
                        </router-link>
                        <router-link to="/">
                            <li>Business</li>
                        </router-link>
                    </ul>
                </div>
            </div>
            <div class="col col-sm 3">
                <div class="cate cate-extend">
                    <ul>
                        <router-link to="/">
                            <li>History</li>
                        </router-link>
                        <router-link to="/">
                            <li>Hornor</li>
                        </router-link>
                        <router-link to="/">
                            <li>Love stories</li>
                        </router-link>
                        <router-link to="/">
                            <li>Science</li>
                        </router-link>
                        <router-link to="/">
                            <li>Business</li>
                        </router-link>

                    </ul>
                </div>
            </div>
            <div class="col col-sm-3">
                <h4>Site Map</h4>
                <div class="cate">
                    <ul>
                        <router-link to="/">
                            <li>Home</li>
                        </router-link>
                        <router-link to="/">
                            <li>About Me</li>
                        </router-link>
                        <router-link to="/">
                            <li>FAQS</li>
                        </router-link>
                        <router-link to="/">
                            <li>Blog</li>
                        </router-link>
                        <router-link to="/">
                            <li>Contact</li>
                        </router-link>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="note">
        <p>Copyright ©2021 All rights reserved | This template is made with  by NDH</p>
    </div>
</template>
<script>
export default {
    methods:{
        fetch
    }
}
</script>
<style lang="scss" scoped>
.footer{
    background: rgba($color: pink, $alpha: 0.2);
    margin: 50px 30px;
    .row{
        padding: 20px 30px;
        .col{
            margin-left:20px;
            .logo-footer{
                margin-bottom: 30px;
                font-size: 25px;
                span:first-child{
                    color: crimson;
                    font-size: 34px;
                    margin: 0px 10px;
                }
                span:nth-child(2){
                    color: rgb(30, 185, 206);
                    font-size: 30px;
                    margin: 10px;
                    font-weight: 600;
                }
            }
            p{
                max-width: 90%;
            }
            .list-link{
                    ul{
                     li{
                        text-align: center;
                        display: inline-block;
                        color: red;
                        margin: 5px;
                        font-size: 20px;
                        width: 50px;
                        border-radius: 50%;
                        background: wheat;
                    }

                }
            }
            .cate{
                ul{
                    li{
                        list-style-type: none;
                        margin: 10px 0px;
                    }
                }
            }
            .cate-extend{
                margin-top: 34px;
            }
        }
    }
    a{
        text-decoration: none;
        color: rgb(170, 56, 56);
    }
    a:hover{
        text-decoration: none;
        color: red;
    }
}
.note{
    text-align: center;
    font-size: 16px;
}
</style>