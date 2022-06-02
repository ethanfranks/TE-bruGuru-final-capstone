<template>
  <div class="add-beer-component">
    <h2>Add Beer</h2>

    <form v-on:submit.prevent="addNewBeer">
      <div class="form-element">
        <label for="beer-name">Beer Name: </label>
        <input id="beer-name" type="text" v-model="newBeer.beer_name" required />
      </div>
      <div class="form-element">
        <label for="beer-type">Beer Type: </label>
        <input id="beer-type" type="text" v-model="newBeer.beer_style" required />
      </div>
      <div class="form-element">
        <label for="beer-abv">Beer ABV: </label>
        <input id="beer-abv" type="text" v-model="newBeer.beer_abv" required />
      </div>
      <div class="form-element">
        <label for="beer-flavor-profile">Beer Flavor Profile: </label>
        <input id="beer-flavor-profile" type="text" v-model="newBeer.flavor_profile" required />
      </div>
      <div class="form-element">
        <label for="beer-image-url">Beer Image URL: </label>
        <input id="beer-image-url" type="text" v-model="newBeer.image_url" required />
      </div>
      <div class="form-element">
        <label for="beer-description">Beer Description: </label>
        <input id="beer-description" type="text" v-model="newBeer.beer_description" required />
      </div>
      <div class="actions">
        <button>Submit</button>
        <button v-on:click.prevent="resetForm" type="cancel">Cancel</button>
      </div>
    </form>
  </div>
</template>

<script>
import beerService from "../services/BeerService";

export default {
  name: "add-beer",
  data() {
    return {
      newBeer: {
        beer_name: "",
        beer_description: "",
        beer_abv: null,
        beer_style: "",
        image_url: "",
        flavor_profile: ""
      },
    };
  },
  methods: {
    addNewBeer() {
      beerService.addNewBeer(this.newBeer).then((response) => {
        if (response.status == 201) {
          this.$router.push("/account");
          this.resetForm();
        }
      });
    },
    resetForm() {
      this.newBeer = {};
    },
  },
};
</script>

<style>
</style>