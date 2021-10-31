<template>
    <div class="container">
        <div class="img">
            <h3>Welcome to Website</h3>
            <p>Signup Form</p>
        </div>
        <div class="content-login">
        <form @submit.prevent="onSignup">
            <div class="mb-3">
                <label for="username" class="form-label">Tên tài khoản</label>
                <input v-model="username" type="username" class="form-control" id="username" aria-describedby="emailHelp" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input v-model="password" type="password" class="form-control" id="password" required>
            </div>
            <div class="mb-3">
                <label for="firstname" class="form-label">Firstname</label>
                <input v-model="firstname" type="text" class="form-control" id="firstname" required>
            </div>
            <div class="mb-3">
                <label for="lastname" class="form-label">Lastname</label>
                <input v-model="lastname" type="text" class="form-control" id="lastname" required>
            </div>
        
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input  v-model="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" required>
            </div>
            <div class="mb-3">
                <label for="date" class="form-label">Date</label>
                <input v-model="date" type="text" class="form-control" id="date" aria-describedby="emailHelp" required>
            </div>
            <div>
                <p id="stateMessage">{{mes}}</p>
            </div>
            <button type="submit" class="btn btn-primary">Đăng kí tài khoản</button>
            <p></p>
        </form>
        </div>
    </div>
</template>
<script>
import axios from 'axios'
export default {
    data(){
        return{
            username: '',
            password : '',
            firstname : '',
            lastname : '',
            email : '',
            date: '',
            mes : '',

        }
    },
    methods:{
        onSignup(){
            let seft = this;
            axios({
                method: 'post',
                data:{
                    username : seft.username,
                    password: seft.password,
                    email : seft.email,
                    date : seft.date, 
                    firstname : seft.firstname,
                    lastname : seft.lastname,
                },
                url: 'https://localhost/BTL_ecommerce/index.php?controller=user&action=signup',
            }).then((response) => {
                if(response.data){
                    console.log(response.data);
                    seft.mes = 'Successfully Add'
                    seft.$router.push('/login')
                }else{
                    seft.mes = 'Existed Username';
                }
                
            });
        }
    },
    
}
</script>
<style  lang="scss" scoped>
    .container{
        background: linear-gradient(to right top, #ffafbd, #ffc3a0);
        padding: 100px 300px;
        .img{
            text-align: center;
            margin-bottom: 30px;
        }
        button{
            margin-left: 40%;
            width: 200px;
            font-size: 20px;
            transition: 1s all ease;
        }
        button:hover{
            background: rgb(82, 116, 139);
        }
        #stateMessage{
            text-align: center;
            color: red;
            font-weight: 500;
        }
    }
</style>