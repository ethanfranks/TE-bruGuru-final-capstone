<template>
  <div>
    <h1>Add Brewery</h1>
    <add-brewery />
    <footer-component></footer-component>
  </div>
</template>

<script>
import AddBrewery from "../components/AddBrewery.vue";
import footerComponent from "../components/Footer.vue";

export default {
  components: {
    AddBrewery,
    footerComponent,
  },
};
</script>
