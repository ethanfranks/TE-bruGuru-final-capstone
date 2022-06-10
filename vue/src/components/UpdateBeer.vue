<template>
  <div class="update-beer">
    <button @click="toggleUpdateForm()">Update a Beer</button>
    <h2 class="form-title" v-show="showUpdateForm">Update Beer Information</h2>
    <form
      v-show="showUpdateForm"
      class="update-beer-form"
      v-on:submit.prevent="updateBeer"
    >
      <div class="form-element">
        <select name="beer" id="beer" v-model="beerToUpdate.beer_id">
          <option :value="null">Select Beer to be Updated</option>
          <option
            v-for="beer in beers"
            v-bind:key="beer.beer_id"
            :value="beer.beer_id"
          >
            Beer ID# {{ beer.id }} -- Name: {{ beer.name }}
          </option>
        </select>
      </div>

      <div class="form-element">
        <label for="beer-name">Beer Name: </label>
        <input
          id="beer-name"
          type="text"
          placeholder="Name"
          v-model="beerToUpdate.name"
          required
        />
      </div>

      <div class="form-element">
        <label for="beer-type">Beer Type: </label>
        <input
          id="beer-type"
          type="text"
          placeholder="Type"
          v-model="beerToUpdate.beer_style"
          required
        />
      </div>

      <div class="form-element">
        <label for="beer-abv">Beer ABV: </label>
        <input
          id="beer-abv"
          type="text"
          placeholder="ABV"
          v-model="beerToUpdate.beer_abv"
          required
        />
      </div>

      <div class="form-element">
        <label for="beer-flavor-profile">Beer Flavor Profile: </label>
        <input
          id="beer-flavor-profile"
          type="text"
          placeholder="Flavor Profile"
          v-model="beerToUpdate.flavor_profile"
          required
        />
      </div>

      <div class="form-element">
        <label for="beer-image-url">Beer Image URL: </label>
        <input
          id="beer-image-url"
          type="text"
          placeholder="Image URL"
          v-model="beerToUpdate.image_url"
          required
        />
      </div>

      <div class="form-element">
        <label for="beer-description">Beer Description: </label>
        <input
          id="beer-description"
          type="text"
          placeholder="Description"
          v-model="beerToUpdate.beer_description"
          required
        />
      </div>

      <div class="form-element">
        <label for="beer-available">Beer Available?</label>
        <input type="checkbox" v-model="beerToUpdate.beer_available" />
      </div>

      <div class="actions">
        <button>Submit</button>
        <button v-on:click.prevent="resetForm" type="cancel">Cancel</button>
      </div>
    </form>

    <br />

    <div v-show="showUpdateForm" class="delete-beer">
      <h2>Delete Beer</h2>
      <form class="delete-beer-form" v-on:submit.prevent="deleteBeer">
        <label for="delete-beer-options">
          Select the name of the beer you wish to delete:
        </label>
        <select name="delete-beer-options" v-model="deletedBeerId">
          <option
            v-for="beer in beers"
            v-bind:key="beer.beer_id"
            :value="beer.id"
          >
            Beer ID# {{ beer.id }} -- Beer Name: {{ beer.name }}
          </option>
        </select>
        <button class="delete-beer-button" v-on:click="deleteBeer()">
          Delete Beer
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import beerService from "@/services/BeerService";
import BreweryService from "@/services/BreweryService";

export default {
  name: "update-beer",
  // props: ["brewery_id"],
  data() {
    return {
      showUpdateForm: false,
      deletedBeerId: "",
      beers: [],
      beerToUpdate: {
        name: "",
        beer_description: "",
        beer_abv: null,
        beer_style: "",
        image_url: "",
        flavor_profile: "",
        beer_available: false,
        beer_id: null,
        brewery_id: null,
      },
    };
  },
  created() {
    BreweryService.getBreweryByUsername().then((response) => {
      const brewery_id = response.data.brewery_id;
      beerService.getBeersByBreweryId(brewery_id).then((response) => {
        this.beers = response.data;
        this.beerToUpdate.brewery_id = brewery_id;
      });
    });
  },
  methods: {
    toggleUpdateForm() {
      this.showUpdateForm = !this.showUpdateForm;
    },
    updateBeer() {
      beerService.updateBeer(this.beerToUpdate).then((response) => {
        if (response.status == 200) {
          window.alert("Updated Beer Successfully!")
          this.resetForm();
          this.$router.push({name: 'account'});
        }
      });
    },
    deleteBeer() {
      if (
        confirm(
          "Are you sure you want to delete this beer? This action cannot be undone."
        )
      )
        beerService
          .deleteBeer(this.deletedBeerId)
          .then((response) => {
            if (response.status == 200) {
              window.alert("Beer Deleted Successfully!");
            }
          })
          .catch((error) => {
            if (error.response) {
              this.errorMsg =
                "Error deleting beer. Response received was '" +
                error.response.statusText +
                "'.";
            } else if (error.request) {
              this.errorMsg =
                "Error deleting beer. Server could not be reached.";
            } else {
              this.errorMsg =
                "Error deleting beer. Request could not be created.";
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
.update-beer {
  font-family: "Nunito Sans", sans-serif;
  text-align: center;
}
</style>