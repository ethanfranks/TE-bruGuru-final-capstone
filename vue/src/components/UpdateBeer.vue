<template>
  <div class="update-beer">
      <h2 class="form-title">Update Beer Information</h2>
      <form class="update-beer-form" v-on:submit.prevent="updateBeer">

        <div class="form-element">
          <select name="beer" id="beer" v-model="beerToUpdate.beer_id">
            <option :value="null">Select Beer to be Updated</option>
            <option v-for="beer in beers" v-bind:key="beer.beer_id" :value="beer.beer_id">Beer ID# {{beer.beer_id}} -- Name: {{beer_name}}</option>
          </select>
        </div>
        
        
        <div class="form-element">
          <label for="beer-name">Beer Name: </label>
          <input id="beer-name" type="text" placeholder="Name" v-model="beerToUpdate.beer_name" required />
        </div>
        
        <div class="form-element">
          <label for="beer-type">Beer Type: </label>
          <input id="beer-type" type="text" placeholder="Type" v-model="beerToUpdate.beer_style" required />
        </div>
        
        <div class="form-element">
          <label for="beer-abv">Beer ABV: </label>
          <input id="beer-abv" type="text" placeholder="ABV" v-model="beerToUpdate.beer_abv" required />
        </div>
        
        <div class="form-element">
          <label for="beer-flavor-profile">Beer Flavor Profile: </label>
          <input id="beer-flavor-profile" type="text" placeholder="Flavor Profile" v-model="beerToUpdate.flavor_profile" required />
        </div>
        
        <div class="form-element">
          <label for="beer-image-url">Beer Image URL: </label>
          <input id="beer-image-url" type="text" placeholder="Image URL" v-model="beerToUpdate.image_url" required />
        </div>
        
        <div class="form-element">
          <label for="beer-description">Beer Description: </label>
          <input id="beer-description" type="text" placeholder="Description" v-model="beerToUpdate.beer_description" required />
        </div>
        
        <div class="form-element">
          <label for="beer-available">Beer Available?</label>
          <input type="checkbox" v-model="beerToUpdate.beer_available">
        </div>
       
        <div class="actions">
          <button>Submit</button>
          <button v-on:click.prevent="resetForm" type="cancel">Cancel</button>
        </div>

      </form>

      <h2 class="form-title">Delete Beer</h2>
      <form class="delete-beer-form" v-on:submit.prevent="deleteBeer"></form>
      
  </div>
</template>

<script>
import beerService from '@/services/BeerService'
import BreweryService from '@/services/BreweryService'

console.log(BreweryService.getBreweryIdByCurrentUser())

export default {
name: 'update-beer',
data() {
    return {
        beers: [],
        beerToUpdate: {
          beer_name: "",
          beer_description: "",
          beer_abv: null,
          beer_style: "",
          image_url: "",
          flavor_profile: "",
          beer_available: false,
          beer_id: null,
          brewery_id: null
        }
    }
},
  created() {
    const thisId = BreweryService.getBreweryIdByCurrentUser();
    return beerService.getBeersByBreweryId(thisId).then((response) => {
      this.beers = response.data;
    });
  },
  methods: {
    updateBeer() {
      beerService.updateBeer(this.beerToUpdate).then((response) => {
        if (response.status == 200) {
          this.resetForm();
        }
      });
    },
    resetForm() {
      this.newBeer = {};
    },
  }
}
</script>

<style>

</style>