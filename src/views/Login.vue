<template>
    <div class="background-login">
        <div class="container">
        <div class="img">
            <img src="../assets/images/loginImg.jpg" alt="">
            <h3>Login</h3>
            <p>Enter Login details to get access</p>
        </div>
        <div class="content-login">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input  v-model="username" type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter username...." >
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input v-model="password" type="password" class="form-control" id="password" placeholder="Enter your password...">
                </div>
                <div class="mb-3 form-check">
                    <input v-model="remember" type="checkbox" class="form-check-input" id="remember">
                    <label class="form-check-label" for="remember">Lưu tài khoản</label>
                    <router-link to="{name : Login}">Forgot Password?</router-link>
                </div>
                <div class="mb-3">
                    <router-link to="/signup">Đăng kí tài khoản</router-link>
                </div>
                <button type="submit" class="btn btn-primary" @click="onSubmit">Submit</button>
        </div>
    </div>
    <div>
        <input type="text" name="" id="" v-model="id_search">
        <button @click="search">Tim kiem</button>
        {{bookItem}}
    </div>
    </div>
</template>
<script>
import axios from 'axios'
export default {
    
    data(){
        return {
            id_search: '',
            username: 'admin',
            password :'pass',
            remember:null,
            bookItem : null,
        }
    },
    methods:{
        search(){
            let self = this;
            axios({
                method: 'post',
                data:{
                    id : self.id_search,
                },
                url: 'https://localhost/banhang/index.php?controller=book&action=getbyIndex'.concat('&id_book=').concat(self.id_search),
            }).then((response) => {
                if(response.data){
                    self.bookItem = response.data
                    console.log(response.data);
                }
            });
        }
        ,
        async onSubmit(){
            let self = this;
            await axios({
                method: 'post',
                data:{
                    username : self.username,
                    password: self.password,
                    remember : self.remember
                },
                url: 'https://localhost/banhang/index.php?controller=user&action=login',
            }).then((response) => {
                if(response.data){
                    localStorage.setItem("token", response.data['token']);
                    self.$store.dispatch('getCartByUser',{
                            'id_user' : '',
                            'username' : self.username,
                    });
                    self.$store.dispatch('setUser',{
                        'username' : self.username,
                    });
                    self.$router.push('/');
                }
            });
        }
    },
    
}
</script>
<style  lang="scss" scoped>
    .background-login{
        background-image: url('../assets/images/background.jpg');
        background-size: cover;
    }
    .container{
        background: linear-gradient(to bottom, white, rgb(214, 203, 203));
        padding: 100px 300px;
        .img{
            text-align: center;
            margin-bottom: 30px;
            img{
                border-radius: 50%;
                width: 100px;
            }
        }
        button{
            margin-left: 40%;
            width: 200px;
            font-size: 20px;
            transition: 1s all ease;
        }
        button:hover{
            background: rgb(82, 116, 139);
            font-size: 22px;
        }
        .form-check a{
            float: right;
        }
    }
</style>