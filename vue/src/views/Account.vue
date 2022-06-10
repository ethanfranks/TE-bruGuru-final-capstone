<template>
  <div class="home">
    <div id="admin-section" v-if="isAdmin()">
      <add-brewery></add-brewery>
    </div>

    <div id="brewer-section" v-if="isBrewer() && !isAdmin()">
      
      <div class="brewery-left-container">
        <brewery-details></brewery-details>
      </div>

      <div class="brewery-right-container">
        
        <div id="brewer-update-brewery">
          <brewery-update></brewery-update>
        </div>

        <div id="brewer-add-beer">
          <add-beer></add-beer>
        </div>

        <div id="brewer-update-beer">
          <update-beer></update-beer>
          <!-- <router-link :to="{name: 'beer-update'}">Update Beer</router-link> -->
        </div>

        <div id="brewery-beer-list">
          <beer-list :id="userBrewery.brewery_id"></beer-list>
        </div>

      </div>
      
    </div>

    <div id="user-section" v-if="isUser() && !isBrewer() && !isAdmin()">
      This feature is currently in development.
      <!-- add the favorite breweries component and favorite beers component here 
            also, if we want an update account component, etc... -->
    </div>
  </div>
</template>

<script>
import AddBrewery from "../components/AddBrewery.vue";
import BreweryUpdate from '../components/BreweryUpdate.vue';
import BreweryService from '@/services/BreweryService'
import BreweryDetails from '../components/BreweryDetails.vue'
import AddBeer from '../components/AddBeer.vue'
import BeerList from "../components/BeerList.vue";
import UpdateBeer from "../components/UpdateBeer.vue"

export default {
  name: "Account",
  components: {
    AddBrewery,
    BreweryUpdate,
    BreweryDetails,
    AddBeer,
    BeerList,
    UpdateBeer
  },
  data() {
    return {
      permissions: this.$store.state.user.authorities,
      showUpdate: false,
      userBrewery: {},
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
        if (this.permissions[i].name == "ROLE_BEER LOVER") {
          return true;
        }
      }
    },
  },
  created() {
    return BreweryService.getBreweryByUsername().then((response) => {
      this.userBrewery = response.data;
    });
  },
};
</script>

<style scoped>
#admin-section {
  display: flex;
  align-items: center;
}

#user-section {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
}

#brewer-section {
  display: grid;
  grid-template-areas: "left right";
  grid-template-columns: 1fr 2fr;
  width: 100%;
  height: 100%;
}

.brewery-left-container {
  grid-area: left;
  overflow-y: auto;
}

.brewery-right-container {
  grid-area: right;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 100%;
  width: 100%;
}

#brewer-update-brewery {
  padding-top: 1%;
  padding-bottom: 1%;
}

#brewer-add-beer {
  padding-top: 1%;
  padding-bottom: 1%;
}

#brewer-update-beer {
  padding-top: 1%;
  padding-bottom: 2%;
}
</style>