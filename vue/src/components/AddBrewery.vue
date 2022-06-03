<template>
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
import AuthService from "../services/AuthService"

export default {
  name: "add-brewery",
  data() {
    return {
      newBrewery: {
        user_id: null,
        brewery_name: "",
      },
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
      return this.users.filter(user => user.authorities.name.indexOf(2) === "ROLE_BREWER");
    } 
  }
};
</script>

<style>
</style>