<template>
  <div class="home">
    <div id="admin-section" v-if="isAdmin()">
      <add-brewery></add-brewery>
    </div>

    <div id="brewer-section" v-if="isBrewer()">
      <beer-list></beer-list>
    </div>

    <div id="user-section" v-if="isUser()">
      <!-- add the favorite breweries component and favorite beers component here 
            also, if we want an update account component, etc... -->
    </div>
  </div>
</template>

<script>
import addBrewery from "../components/AddBrewery.vue";
import beerList from "../components/BeerList.vue";

export default {
  name: "Account",
  components: {
    addBrewery,
    beerList,
  },
  data() {
    return {
      permissions: this.$store.state.user.authorities,
    };
  },
  methods: {
    isAdmin() {
      for (let i = 0; i < this.permissions.length; i++) {
        if (this.permissions[i].name == "ROLE_ADMIN") {
          return true;
        }
      }
    },
    isBrewer() {
      for (let i = 0; i < this.permissions.length; i++) {
        if (this.permissions[i].name == "ROLE_BREWER") {
          return true;
        }
      }
    },
    // make sure ROLE_USER exists
    isUser() {
      for (let i = 0; i < this.permissions.length; i++) {
        if (this.permissions[i].name == "ROLE_USER") {
          return true;
        }
      }
    },
  },
};
</script>

<style scoped>
</style>