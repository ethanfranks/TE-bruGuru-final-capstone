<template>
  <div class="add-beer-component">
    <button @click="toggleUpdateForm()">Add a Beer</button>

    <h2 v-show="showUpdateForm">Add Beer</h2>

    <form v-on:submit.prevent="addNewBeer" v-show="showUpdateForm">
      <div class="form-element">
        <label for="beer-name">Beer Name: </label>
        <input
          id="beer-name"
          type="text"
          placeholder="Name"
          v-model="newBeer.beer_name"
          required
        />
      </div>
      <div class="form-element">
        <label for="beer-type">Beer Type: </label>
        <input
          id="beer-type"
          type="text"
          placeholder="Type"
          v-model="newBeer.beer_style"
          required
        />
      </div>
      <div class="form-element">
        <label for="beer-abv">Beer ABV: </label>
        <input
          id="beer-abv"
          type="text"
          placeholder="ABV"
          v-model="newBeer.beer_abv"
          required
        />
      </div>
      <div class="form-element">
        <label for="beer-flavor-profile">Beer Flavor Profile: </label>
        <input
          id="beer-flavor-profile"
          type="text"
          placeholder="Flavor Profile"
          v-model="newBeer.flavor_profile"
          required
        />
      </div>
      <div class="form-element">
        <label for="beer-image-url">Beer Image URL: </label>
        <input
          id="beer-image-url"
          type="text"
          placeholder="Image URL"
          v-model="newBeer.image_url"
          required
        />
      </div>
      <div class="form-element">
        <label for="beer-description">Beer Description: </label>
        <input
          id="beer-description"
          type="text"
          placeholder="Description"
          v-model="newBeer.beer_description"
          required
        />
      </div>
      <div class="form-element">
        <label for="beer-available">Beer Available?</label>
        <input type="checkbox" v-model="newBeer.beer_available" />
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
import BreweryService from "../services/BreweryService";

export default {
  name: "add-beer",
  props: ["brewery"],
  data() {
    return {
      newBeer: {
        breweryId: null,
        beer_name: "",
        beer_description: "",
        beer_abv: null,
        beer_style: "",
        image_url: "",
        flavor_profile: "",
        beer_available: false,
      },
      showUpdateForm: false,
    };
  },
  created() {
    BreweryService.getBreweryByUsername().then((response) => {
      let brewery = response.data;
      this.newBeer.breweryId = brewery.brewery_id;
    });
  },
  methods: {
    addNewBeer() {
      beerService.addNewBeer(this.newBeer).then((response) => {
        if (response.status == 201) {
          window.alert("Beer Added Successfully!");
          this.resetForm();
          this.$router.push("/account");
        }
      });
    },
    resetForm() {
      this.newBeer = {};
    },
    toggleUpdateForm() {
      this.showUpdateForm = !this.showUpdateForm;
    },
  },
};
</script>

<style>
</style>