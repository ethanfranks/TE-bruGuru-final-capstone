<template>
  <div class="home">
    <header-component></header-component>
    
    <body>
      <google-map></google-map>
    </body>

    <footer-component></footer-component>
  </div>
</template>

<script>
import headerComponent from '../components/Header.vue'
import footerComponent from '../components/Footer.vue'
import googleMap from '../components/GoogleMap.vue'

export default {
  name: "home",
  components:{
    headerComponent,
    footerComponent,
    googleMap
  },
  data () {
    return {

    }
  },
  methods : {

  }
};
</script>

<style>
div {
  font-family: "Nunito Sans", sans-serif;
}

body {
  display: flexbox;
  
}
</style>
