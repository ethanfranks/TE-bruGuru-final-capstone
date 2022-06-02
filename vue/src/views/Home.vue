<template>
  <div class="home">
    <header-component></header-component>

    <body class="home-components">
      <google-map></google-map>
      <brewery-list></brewery-list>
    </body>

    <footer-component></footer-component>
  </div>
</template>

<script>
import headerComponent from "../components/Header.vue";
import footerComponent from "../components/Footer.vue";
import googleMap from "../components/GoogleMap.vue";
import breweryList from "../components/BreweryList.vue";

export default {
  name: "home",
  components: {
    headerComponent,
    footerComponent,
    googleMap,
    breweryList,
  },
  data() {
    return {};
  },
  methods: {},
};
</script>

<style>
div {
  font-family: "Nunito Sans", sans-serif;
}
.home-components {
  display: flex;
  justify-content: space-around;
}
</style>
