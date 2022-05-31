<template>
  <div class="home">
    <header-component></header-component>

    <div id="admin-section" v-if="isAdmin()">
      <add-brewery></add-brewery>
    </div>

    <div id="brewer-section" v-if="isBrewer()">
      <!-- add the update brewery component here -->
    </div>

    <div id="user-section" v-if="isUser()">
      <!-- add the favorite breweries component and favorite beers component here 
            also, if we want an update account component, etc... -->
    </div>

    <footer-component></footer-component>
  </div>
</template>

<script>
import headerComponent from "../components/Header.vue";
import footerComponent from "../components/Footer.vue";
import addBrewery from "../components/AddBrewery.vue";

export default {
  name: "Account",
  components: {
    headerComponent,
    footerComponent,
    addBrewery,
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