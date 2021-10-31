<template>

<div class="slider">
  <input type="radio" name="slider" title="slide1" checked="checked" class="slider__nav"/>
  <input type="radio" name="slider" title="slide2" class="slider__nav"/>
  <input type="radio" name="slider" title="slide3" class="slider__nav"/>
  <input type="radio" name="slider" title="slide4" class="slider__nav"/>
  <div class="slider__inner" >
    <div class="slider__contents" style="background-image : url('https://i.shgcdn.com/f85b7608-c7fd-48d6-9482-1ac178ebbd0d/-/format/auto/-/preview/3000x3000/-/quality/lighter/')">
      <h2 class="slider__caption">codepen</h2>
      <p class="slider__txt">Lorem ipsum dolor sit amet, consectetur adipisicing elit. At cupiditate omnis possimus illo quos, corporis minima!</p>
    </div>
    <div class="slider__contents" style="background-image : url('https://i.shgcdn.com/f85b7608-c7fd-48d6-9482-1ac178ebbd0d/-/format/auto/-/preview/3000x3000/-/quality/lighter/')">
      <h2 class="slider__caption">codepen</h2>
      <p class="slider__txt">Lorem ipsum dolor sit amet, consectetur adipisicing elit. At cupiditate omnis possimus illo quos, corporis minima!</p>
    </div>
    <div class="slider__contents" style="background-image : url('https://i.shgcdn.com/555c98fd-66c0-458e-a747-ce52a0f0e41b/-/format/auto/-/preview/3000x3000/-/quality/lighter/')">
      <h2 class="slider__caption">codepen</h2>
      <p class="slider__txt">Lorem ipsum dolor sit amet, consectetur adipisicing elit. At cupiditate omnis possimus illo quos, corporis minima!</p>
    </div>
    <div class="slider__contents" style="background-image : url('https://i.shgcdn.com/fc230f0e-c4d0-4a85-978d-96160662e29b/-/format/auto/-/preview/3000x3000/-/quality/lighter/')">
      <h2 class="slider__caption">codepen</h2>
      <p class="slider__txt">Lorem ipsum dolor sit amet, consectetur adipisicing elit. At cupiditate omnis possimus illo quos, corporis minima!</p>
    </div>
  </div>
</div>

</template>
<script>  
export default {
   
   created(){}
}
</script>
<style lang="scss" scoped>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,500);
@import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css);
*, *:before, *:after {
  box-sizing: border-box;
}


.slider {
  width: 60%;
  margin: auto;
  height: 60vh !important;
  position: relative;
  overflow: hidden;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-flow: row nowrap;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
  -webkit-box-align: end;
  -webkit-align-items: flex-end;
      -ms-flex-align: end;
          align-items: flex-end;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}
.slider__nav {
  width: 12px;
  height: 12px;
  margin: 2rem 12px;
  border-radius: 50%;
  z-index: 10;
  outline: 6px solid #ccc;
  outline-offset: -6px;
  box-shadow: 0 0 0 0 #333, 0 0 0 0 rgba(51, 51, 51, 0);
  cursor: pointer;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  -webkit-backface-visibility: hidden;
          backface-visibility: hidden;
}
.slider__nav:checked {
  -webkit-animation: check 0.4s linear forwards;
          animation: check 0.4s linear forwards;
}
.slider__nav:checked:nth-of-type(1) ~ .slider__inner {
  left: 0%;
}
.slider__nav:checked:nth-of-type(2) ~ .slider__inner {
  left: -100%;
}
.slider__nav:checked:nth-of-type(3) ~ .slider__inner {
  left: -200%;
}
.slider__nav:checked:nth-of-type(4) ~ .slider__inner {
  left: -300%;
}
.slider__inner {
  position: absolute;
  top: 0;
  left: 0;
  width: 400%;
  height: 100%;
  -webkit-transition: left 0.4s;
  transition: left 0.4s;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-flow: row nowrap;
      -ms-flex-flow: row nowrap;
          flex-flow: row nowrap;
}
.slider__contents {
  height: 100%;
  padding: 2rem;
  text-align: center;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  background-size: cover;
  background-repeat: no-repeat;
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
  -webkit-flex-flow: column nowrap;
      -ms-flex-flow: column nowrap;
          flex-flow: column nowrap;
  -webkit-box-align: center;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
  h2{
    color: white;
    font-weight: 700;
    font-size: 3vw;
  }
  p{
    color: white;
    font-style: 2vw;
  }
}
.slider__image {
  font-size: 2.7rem;
      color: #2196F3;
}
.slider__caption {
  font-weight: 500;
  margin: 2rem 0 1rem;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  text-transform: uppercase;
}
.slider__txt {
  color: #999;
  margin-bottom: 3rem;
  max-width: 300px;
}

@-webkit-keyframes check {
  50% {
    outline-color: #333;
    box-shadow: 0 0 0 12px #333, 0 0 0 36px rgba(51, 51, 51, 0.2);
  }
  100% {
    outline-color: #333;
    box-shadow: 0 0 0 0 #333, 0 0 0 0 rgba(51, 51, 51, 0);
  }
}

@keyframes check {
  50% {
    outline-color: #333;
    box-shadow: 0 0 0 12px #333, 0 0 0 36px rgba(51, 51, 51, 0.2);
  }
  100% {
    outline-color: #333;
    box-shadow: 0 0 0 0 #333, 0 0 0 0 rgba(51, 51, 51, 0);
  }
}

</style>