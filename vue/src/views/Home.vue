<template>
  <div class="home">
    <body class="home-components">
      <google-map></google-map>
      <brewery-list></brewery-list>
    </body>
  </div>
</template>

<script>
import googleMap from "../components/GoogleMap.vue";
import breweryList from "../components/BreweryList.vue";

export default {
  name: "home",
  components: {
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
