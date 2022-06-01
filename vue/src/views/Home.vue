<template>
  <div class="home">
    <header-component></header-component>

    <google-map></google-map>

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

<style scoped>

</style>
