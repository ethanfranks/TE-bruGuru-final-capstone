<template>
  <div id="main">
    <img :src="image" alt="brewery" class="brewery-image" />
    <div class="add-brewery-form">
      <h2>Add Brewery</h2>
      <form v-on:submit.prevent="addNewBrewery">
        <div class="form-element">
          <label for="brewer-id">Brewer ID: </label>
          <input id="brewer-id" type="text" v-model="newBrewery.user_id" />
        </div>
        <br />
        <div class="form-element">
          <label for="brewery-name">Brewery Name: </label>
          <input
            id="brewery-name"
            type="text"
            v-model="newBrewery.brewery_name"
          />
        </div>
        <br />
        <div class="actions">
          <button><b>Submit</b></button>
          <button v-on:click.prevent="resetForm" type="cancel">
            <b>Cancel</b>
          </button>
        </div>
      </form>
    </div>
  <div>
    
    <h2>Add Brewery</h2>
    
    <form v-on:submit.prevent="addNewBrewery">
      <div class="form-element">
        <select name="brewer" id="brewer" v-model="newBrewery.user_id" required>
          <option :value="null">Select Brewer User Account</option>
          <option v-for="brewer in brewers" v-bind:key="brewer.id" :value="brewer.id">User ID# {{brewer.id}} -- Username: {{brewer.username}}</option>
        </select>
      </div>
      <div class="form-element">
        <input id="brewery-name" type="text" placeholder="Brewery Name" v-model="newBrewery.brewery_name" required />
      </div>
      <div class="actions">
        <button>Submit</button>
        <button v-on:click.prevent="resetForm" type="cancel">Cancel</button>
      </div>
    </form>
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
          this.$router.push("/admin");
          this.resetForm;
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
.add-brewery-form {
  display: inline-block;
  top: 200px;
  width: 100vw;
  border-top: 15px solid black;
  border-bottom: 15px solid black;
  padding: whitesmoke;
  margin-top: 10%;
  padding-top: 2.5%;
  padding-bottom: 2.5%;
  background: whitesmoke;
  box-shadow: inset 0 0 0 15px whitesmoke;
  opacity: 0.85;
  font-weight: bold;
  text-align: center;
}
.brewery-image {
  min-height: 100%;
  min-width: 1024px;
  width: 100%;
  height: auto;
  position: fixed;
  top: 0;
  left: 0;
  z-index: -2;
}
#main {
  text-align: center;
}
</style>