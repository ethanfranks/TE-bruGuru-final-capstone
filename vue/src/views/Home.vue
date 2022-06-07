<template>
  <div class="home">
    <div class="home-components">
      <google-map></google-map>
    </div>
  </div>
</template>

<script>
import googleMap from "../components/GoogleMap.vue";

export default {
  name: "home",
  components: {
    googleMap,
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

.home {
  display: flex;
  flex-grow: 1;
}

.home-components {
  display: flex;
  height: 100%;
  width: 100%;
  justify-content: space-around;
}
</style>
