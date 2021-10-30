<template>
    <div class="menu">
        <div class="menu-content">
            <ul class="list-group">
                <li class="list-group-item" >
                    <router-link to="/">
                        Home
                    </router-link>
                </li>
                <li class="list-group-item" >
                    <router-link :to="{ name: 'Categories'}">
                        Categories
                    </router-link>
                </li>
                <li class="list-group-item" >
                    <router-link :to="{ name: 'About'}">
                        About
                    </router-link>
                </li>
                <li id="pages-li" class="list-group-item" >
                    <router-link to="/">
                        Pages
                    </router-link>
                    <div class="pages-extend">
                    <ul>
                        <router-link to="/">
                        <li>Login</li>
                        </router-link>
                        <router-link to="/">
                        <li>Detail</li>
                        </router-link>
                        <router-link to="/">
                        <li>About</li>
                        </router-link>
                        <router-link to="/">
                        <li>Content</li>
                        </router-link>

                    </ul>
                </div>
                </li>
                
                <li class="list-group-item" >
                    <router-link to="/">
                        BLog
                    </router-link>
                </li>
                <li class="list-group-item" >
                    <router-link to="/contact">
                        Contact
                    </router-link>
                </li>
            </ul>
        </div>
    </div>
</template>
<script>
import{ ref , reactive} from 'vue';
export default {
    setup(){
        const listMenu = reactive(['Home', 'Categories', 'About', 'Pages', 'BLog', 'Content']);
        return{
            listMenu,
        }
    }
}
</script>
<style lang="scss" scoped>

   .menu{
        margin: 20px auto;
        .menu-content{
            background: linear-gradient(to bottom , rgb(240, 240, 206), rgb(247, 247, 239));
            display: flex;
            align-items: center;
            justify-content: center;
           ul{
               display: flex;
               flex-direction: row;
               li{
                   margin: 5px;
                   border-radius: 5px;
                   display: inline-block;
                   border: none;
                   a{
                       color: black;
                       font-weight: 500;
                       font-size: 19px;
                       text-decoration: none;
                   }
                   a:hover{
                    color: red;
                }
                }

                #pages-li{
                    position: relative;
                }
                .pages-extend{
                    position: absolute;
                    left: 0;
                    display: none;
                    top: 50px;
                    ul{
                        border-bottom-right-radius: 5px;
                        border-bottom-left-radius: 5px;
                        padding: 0;
                        flex-direction: column;
                        width: 200px;
                        background: white;
                        li{
                            color: black;
                            width: auto;
                            padding: 2px 0px;
                            font-size: 20px;
                            margin: 0;
                            font-weight: 400;
                            padding-left: 30px;
                            text-align: left;
                            border-bottom: 1px solid oldlace;
                            display: block;
                            transition: all 0.5s ease;
                        }
                        
                        li:hover{
                            font-size: 21px;
                            color: orangered;
                        }
                    }
                }
           }
       }
   }
</style>