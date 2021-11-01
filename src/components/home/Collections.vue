<template>
    <div>
        
        <div class="restaurants-items">
        <div data-aos="fade-up" class="res-item">
            <router-link to="/">
            <img src="../../assets/images/background.jpg" alt="">
            <div class="res-item-content">
                <p>HEALTHY RESTAURANT</p>
                <h3>THE BIG RESTAURANT IN USA</h3>
            </div>
            </router-link>
        </div>
        <div data-aos="fade-up" class="res-item">
            <router-link to="/">
            <img src="../../assets/images/background.jpg" alt="">
            <div class="res-item-content">
                <p>HEALTHY RESTAURANT</p>
                <h3>THE BIG RESTAURANT IN USA</h3>
            </div>
            </router-link>
        </div>
        <div data-aos="fade-up" class="res-item">
            <router-link to="/">
            <img src="../../assets/images/background.jpg" alt="">
            <div class="res-item-content">
                <p>HEALTHY RESTAURANT</p>
                <h3>THE BIG RESTAURANT IN USA</h3>
            </div>
            </router-link>
        </div>
        <div data-aos="fade-up" class="res-item">
            <router-link to="/">
            <img src="../../assets/images/background.jpg" alt="">
            <div class="res-item-content">
                <p>HEALTHY RESTAURANT</p>
                <h3>THE BIG RESTAURANT IN USA</h3>
            </div>
            </router-link>
        </div>
        <div data-aos="fade-up" class="res-item">
            <router-link to="/">
           <img src="../../assets/images/background.jpg" alt="">
            <div class="res-item-content">
                <p>HEALTHY RESTAURANT</p>
                <h3>THE BIG RESTAURANT IN USA</h3>
            </div>
            </router-link>
        </div>
        <div data-aos="fade-up" class="res-item">
            <router-link to="/">
            <img src="../../assets/images/background.jpg" alt="">
            <img src="" alt="">
            <div class="res-item-content">
                <p>HEALTHY RESTAURANT</p>
                <h3>THE BIG RESTAURANT IN USA</h3>
            </div>
            </router-link>
        </div>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style lang="scss" scoped>
    
    .restaurants-items{
    background-repeat: repeat;
    padding-left: 15%;
    padding-right: 15%;
    margin: auto;
    .res-item{
      position: relative;
      display: inline-block;
      padding: 15px;
      transition: all 0.3s ease;
      margin: 10px;
      border: 5px solid white;
      width: 30%;
      a{
        display: block;
        text-decoration: none;
        img{
          width: 100%;
          height: 350px;
        }
        .res-item-content{
          display: flex;
          align-content: center;
          flex-wrap: wrap;
          margin: 5px;
          justify-content: center;
          width: 95%;
          left: 5px;
          opacity: 0;
          height: 95%;
          bottom: 7px;
          position: absolute;
          color: white;
          font-weight: normal;
          transition: all 0.3s ease;
          // animation-name: fadeInUp;
          animation-duration: 1s;
        }
      }
    }
    .res-item:hover{
          img{
            filter: brightness(20%);
          }
          border: 5px solid black;
          .res-item-content{
            opacity: 1;
            
          }
    }
  }
</style>