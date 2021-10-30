<template>
    <div class="main">
        <span><i class="fas fa-hand-pointer"></i></span>

        <div class="progress">
            <div id="test" class="progress-bar progress-bar-striped" role="progressbar" style="width: 0%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
    <p v-for="(line) in text" v-bind:key="line">
        {{line}}
    </p>
    </div>
</template>
<script>
import axios from 'axios'
export default {
    data(){
        return {
            text : [],
            string: '',
            index : 0,
        }
    },
    methods:{
        fetch(){
            const my_loop = setInterval(() =>{
                this.index++;
                document.getElementById('test').style.width = this.index + '%';
                if(this.index > 100){
                clearInterval(my_loop);
                this.fetchNext();
                }  
            },50);

            
        },
        fetchNext(){
                this.index = 0;
                let self = this;
                axios({
                    method: 'get',
                    url: 'https://localhost/banhang/index.php?controller=info&action=index',
                }).then((response) => {
                        if(response.data != ''){
                            const int = setInterval(() =>{
                                self.text.push(response.data[self.index]);
                                self.index ++ ;
                            },100);
                            
                        }
                    })
        }
        
    },
    
    mounted() {
            this.fetch(); // invoke function when ready
    },
    created() {
    },
}
</script>
<style lang="scss" scoped>
*{
    font-family: 'Roboto Mono', monospace;
    font-size: 11px;
}
.main{
    height: 90vh;
}
.progress{
    width: 1770px;
}
p{
    padding: 0;
    margin: 0;
    color: rgb(16, 16, 17);
}
</style>