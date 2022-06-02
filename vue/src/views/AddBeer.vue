<template>
  <div class="add-beer-view">
      <header-component></header-component>
      <add-beer></add-beer>
      <footer-component></footer-component>
  </div>
</template>

<script>
import addBeer from '../components/AddBeer.vue'
import headerComponent from '../components/Header.vue'
import footerComponent from '../components/Footer.vue'

export default {
components: {
    addBeer,
    headerComponent,
    footerComponent
}
}
</script>

<style>

</style>