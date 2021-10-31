<template>
  <Header/>
  <Navbar/>
  <div class="container">
    
    <div class="about-content">
        <div class="img-about">
          <img src="../assets/images/detail.jpg" alt="">
        </div>
        <div class="content">
          <div class="story">
            <h2>Our Story</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius quidem nisi quas dignissimos provident, natus, iste fuga placeat saepe non aut voluptas, perspiciatis iure repudiandae repellendus eum. Animi, eum vero!
            Asperiores ducimus quasi minus labore provident fugit ratione, sed totam debitis cupiditate officia repellat illo beatae perspiciatis tempora corrupti amet quaerat illum ab saepe porro quisquam voluptatibus nemo autem. Reiciendis!
            Provident unde ipsam delectus maxime libero illo blanditiis commodi, suscipit, sapiente numquam perferendis neque quam accusantium consequatur quos laudantium nisi aliquid asperiores itaque iste praesentium quod aut magni tempora. Magnam!
            Praesentium optio impedit non architecto. Possimus inventore et quod itaque placeat, tenetur excepturi aliquam eaque, atque, tempore voluptates consectetur. Mollitia impedit autem at atque ducimus. Ullam in vitae inventore exercitationem.
            Dolore ullam facilis distinctio eaque error cum maxime voluptas consequatur, nobis beatae. Dicta culpa veritatis voluptates qui itaque, sapiente tempora neque reprehenderit reiciendis asperiores porro, sequi voluptatem debitis, distinctio labore.</p>
          </div>
          <div class="goal">
            <h2>Our Goal</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure nulla aut quia asperiores, neque animi exercitationem quos vero praesentium amet. Aliquam veritatis eligendi expedita quis rem minus corporis, aspernatur eos.
            Quod excepturi magni at sequi modi deserunt et quisquam, itaque sit natus maxime fugit reiciendis nisi provident. Sint dolores unde beatae ut ab adipisci odio at! Vero culpa eius laborum!
            Asperiores, ratione sit? Dignissimos sunt ullam officiis soluta, et amet ipsum dolorum reiciendis aut id perspiciatis tempora esse autem culpa unde iusto labore, tempore saepe explicabo iste magni quis similique!
            Deleniti quasi id nemo quod officia earum tempore deserunt eveniet repudiandae? Vitae recusandae neque dolorum reiciendis perferendis aliquid, culpa, iure ipsam fugiat commodi animi cum praesentium excepturi voluptatum necessitatibus porro.
            Aliquam, veniam! Tenetur ipsa distinctio rerum incidunt beatae debitis, obcaecati itaque magni deserunt ullam eos error atque, nihil non deleniti commodi repellendus exercitationem! Obcaecati dolores placeat porro, sequi quod exercitationem!</p>
          </div>
        </div>
    </div>
    <Footer/>
  </div>
</template>
<script>
import Header from '../components/Header.vue'
import Navbar from '../components/Navbar.vue';
import Footer from '../components/Footer.vue'
export default {
  components:{
    Header,
    Navbar,
    Footer,
  }
}
</script>
<style lang="scss" scoped>
  .about-content{
    .img-about{
      margin: 50px 30px;
      img{
        height: 250px;
        width: 100%;
      }
    }
    .content{
      margin: 40px 100px;
      p{
            color: #301A22;
            font-size: 16px;
            margin-bottom: 15px;
            font-weight: 300;
            line-height: 1.6;
      }
      h2{
        font-weight: 700;
        line-height: 1.4;
        margin-bottom: 22px;
      }
    }
  }
</style>
