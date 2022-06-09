<template>
  <div id="main">
    <img :src="image" alt="brewery" class="brewery-image" />
    
    <div class="add-brewery-form-container">
      <h2>Add Brewery</h2>
      <form v-on:submit.prevent="addNewBrewery">
        
        <div class="form-element">
          <select name="brewer" id="brewer" v-model="newBrewery.user_id" required>
            <option :value="null">Select Brewer User Account</option>
            <option v-for="brewer in brewers" v-bind:key="brewer.id" :value="brewer.id">User ID# {{brewer.id}} -- Username: {{brewer.username}}</option>
          </select>
        </div>
              
        <div class="form-element" id="brewery-name-fe">
          <label for="brewery-name">Brewery Name: </label>
          <input
            id="brewery-name"
            type="text"
            v-model="newBrewery.brewery_name" required placeholder="Brewery Name"
          />
        </div>
        <div class="actions">
          <button class="bold">Submit</button>
          <button v-on:click.prevent="resetForm" type="cancel" class="bold">
            Cancel
          </button>
        </div>
      </form>
    </div>
  </div>

</template>

<script>
import BreweryService from "../services/BreweryService";
import image from "../assets/brewery.png";
import AuthService from "../services/AuthService";

export default {
  name: "add-brewery",
  data() {
    return {
      newBrewery: {
        user_id: null,
        brewery_name: "",
      },
      image: image,
      brewers: [],
    };
  },
  created() {
    return AuthService.getUsersByRole("BREWER").then((response) => {
      this.brewers = response.data;
    });
  },
  methods: {
    addNewBrewery() {
      BreweryService.addBrewery(this.newBrewery).then((response) => {
        if (response.status == 201) {
          this.resetForm();
        }
      });
    },
    resetForm() {
      this.newBrewery = {};
    },
  },
  computed: {
    getBrewersFromUsers() {
      return this.users.filter(
        (user) => user.authorities.name.indexOf(2) === "ROLE_BREWER"
      );
    },
  },
};
</script>

<style>
.bold {
  font-weight: bold;
}

.add-brewery-form-container {
  display: inline-block;
  width: 100vw;
  border-top: 15px solid black;
  border-bottom: 15px solid black;
  padding: whitesmoke;
  margin: 0;
  background: whitesmoke;
  box-shadow: inset 0 0 0 15px whitesmoke;
  opacity: 0.85;
  font-weight: bold;
  text-align: center;
}

.add-brewery-form-container > form {
  padding-bottom: 1%;
}

.add-brewery-form-container > h2 {
  padding-top: 1%;
  margin: 0;
}

.brewery-image {
  height: 100%;
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  z-index: -2;
}

.actions {
  padding-top: 1%;
}

#brewery-name-fe {
  padding-top: 1%;
}
</style>