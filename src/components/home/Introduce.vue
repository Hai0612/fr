<template>
    <div>
        <div class="introduce">
        <div class="row">
          <div class="col col-sm-3">
            <div class="intro-item">
              <img @mouseover="reloadImage()" src="https://media.tdp-arch.com/Calendar_Icon.gif?timestamp=Mon Sep 06 2021 21:41:03 GMT+0700 (Giờ Đông Dương)" alt="">
              <h5>OVER <span>{{numYear}}</span> YEARS </h5>
            </div>
          </div>
          <div class="col col-sm-3">
            <div class="intro-item">
              <img @mouseover="reloadImage()" src="https://media.tdp-arch.com/Building_Icon2.gif?timestamp=Mon%20Sep%2006%202021%2021:44:52%20GMT+0700%20(Gi%E1%BB%9D%20%C4%90%C3%B4ng%20D%C6%B0%C6%A1ng)" alt="">
              <h5><span>{{numProducts}}</span> PRODUCTS COMPLETED</h5>
            </div>
          </div><div class="col col-sm-3">
            <div class="intro-item">
              <img @mouseover="reloadImage()" src="https://media.tdp-arch.com/Map_Icon2.gif?timestamp=Mon Sep 06 2021 21:44:52 GMT+0700 (Giờ Đông Dương)" alt="">
              <h5><span>{{numBranch}}</span> BRANCH</h5>
            </div>
          </div>
        </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            numProducts: 0,
            numBranch : 0,
            numYear : 0
        }
    },
    methods:{
        loadIntroduce(){
            this.numProducts = 0;
            this.numBranch = 0 ;
            this.numYear = 0;
            const my_loop = setInterval(() =>{
                this.numYear++;
                if(this.numYear > 10){
                clearInterval(my_loop);
                }  
            },100);  
            const my_loop_company = setInterval(() =>{
                this.numBranch++;
                if(this.numBranch > 5){
                clearInterval(my_loop_company);
                }  
            },200);  
            const my_loop_project = setInterval(() =>{
                this.numProducts = this.numProducts + 30;
                if(this.numProducts > 1000){
                clearInterval(my_loop_project);
                }  
            },40);  
      },
      reloadImage(){
        this.loadIntroduce();

        let self = event;
        setTimeout(() => {
          const src = self.target.src;
          self.target.src =  src; 
        }, 1000);
      },
    },
    created(){
        this.loadIntroduce();
    }
}
</script>
<style lang="scss" scoped>
    .introduce{
      background-image: url('https://www.tdp-arch.com/img/illustration-inverse.png');
    margin-top: 100px;
    .row{
      text-align: center;
      justify-content: center;
      .col-sm-3{
        display: flex;
        justify-content: center;
        align-content: center;
        img{

        }
        h5{
          margin: auto 15%;
          font-size: 26px;
          font-weight: normal;
          text-align: center;
          span{
            color: red;
          }
        }
      }
    }
  }
</style>