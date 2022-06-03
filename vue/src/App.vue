<template>
  <div id="app">
    <div id="nav">
      <header-component />
    </div>
    <router-view />
    <footer-component />
  </div>
</template>
<script>
import FooterComponent from "./components/FooterComponent.vue";
import HeaderComponent from "./components/HeaderComponent.vue";
export default {
  components: { HeaderComponent, FooterComponent },
};
</script>
<style>
@import url("https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;600&display=swap");
</style>