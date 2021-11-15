<template>
    <div class="social-fast">
        <ul>
            <li><a href="https://www.facebook.com/"><i class="fab fa-facebook"></i></a></li>
            <li><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></li>
            <li><a href="https://mail.google.com/mail"><i class="fas fa-envelope"></i></a></li>
        </ul>
    </div>
</template>
<script>
export default {
    
}
</script>
<style lang="scss" scoped>
.social-fast{
    z-index: 9;
    position: fixed;
    left: 5%;
    top: 40%;
    ul{
        transition: all 1s ease;
        padding: 0px;
        border-radius: 4px;
        li{ 
            border-radius: 5px;
          
            text-align: center;
            margin: 0px;
            padding: 0px 5px;
            list-style-type: none;
            font-size: 27px;
            transition: all 0.5s ease;
            i{
                width: 30px;
                height: 30px;   
            }
        }
        li:hover{
            background-color: greenyellow;
        }
    }
    ul:hover{
        background-color: rgb(231, 79, 79);
    }
}
</style>
