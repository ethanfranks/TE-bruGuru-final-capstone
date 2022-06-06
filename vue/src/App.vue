<template>
  <div id="app">
    <div id="header-component">
      <header-component />
    </div>

    <div id="body-components">
      <router-view />
    </div>

    <div id="footer-component">
      <footer-component />
    </div>
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

body {
  margin: 0;
}

#app {
  display: grid;
  grid-template-areas:
    "header-components"
    "body-components"
    "footer-component";
  grid-template-rows: auto 3fr auto;
  width: 100vw;
  height: 100vh;
}

#header-component {
  grid-area: "header-component";
}

#body-components {
  grid-area: "body-components";
  margin: 3%;
}

#footer-components {
  grid-area: "footer-component";
}
</style>