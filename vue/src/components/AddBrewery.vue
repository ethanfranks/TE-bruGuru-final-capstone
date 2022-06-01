<template>
  <div>
    
    <h2>Add Brewery</h2>
    
    <form v-on:submit.prevent="addNewBrewery">
      <div class="form-element">
        <label for="brewer-id">Brewer ID:</label>
        <input id="brewer-id" type="text" v-model="newBrewery.user_id" />
      </div>
         <div class="form-element">
        <label for="brewery-name">Brewery Name:</label>
        <input
          id="brewery-name"
          type="text"
          v-model="newBrewery.brewery_name"
        />
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

export default {
  name: "add-brewery",
  data() {
    return {
      newBrewery: {
        user_id: null,
        brewery_name: "",
      },
    };
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
};
</script>

<style>
</style>