<template>
  <div>
      <div v-for="brewery in breweries" v-bind:key="brewery.brewery_id">
          <router-link v-bind:to="{name: 'brewery-details', params:{id: brewery.brewery_id}}" v-bind:brewery="brewery">{{brewery.name}}</router-link>
      </div>
      <div>
          <form action.prevent id="beer-search-form">
              <label for="style-selector">I'm looking for a: </label>
              <select name="style-selector" id="form-style-selector" v-model="searchParams.style">
              <option value="Pale Ale">Pale Ale</option>
              <option value="Brown Ale">Brown Ale</option>
              <option value="Lager">Lager</option>
              <option value="IPA">IPA</option>
              <option value="Wheat Beer">Wheat Beer</option>
              <option value="Porter">Porter</option>
              <option value="Stout">Stout</option>
              <option value="Sour">Sour</option>
              <option value="Pilsner">Pilsner</option>
              </select><br>
              <label for="profile-selector"> That is : </label>
            <select name= "profile-selector" id="form-profile-selector" v-model="searchParams.profile">
                <option value="Nutty">Nutty</option>
                <option value="Mild">Mild</option>
                <option value="Strong">Strong</option>
                <option value="Refreshing">Refreshing</option>
                <option value="Citrusy">Citrusy</option>
            </select>
            <button id="search-submit-button" @click.prevent="beerSearch(searchParams)">Search for beers</button>
          </form>
      </div>
  </div>
</template>

<script>
import breweryService from '@/services/BreweryService'
import beerService from '@/services/BeerService'

export default {
    components: {
       
    },
    data() {
        return {
            breweries: [],
            beers: [],
            searchParams : {
                style: '',
                profile: ''
            }

        }
    },
    methods : {
        beerSearch(searchParams) {
            beerService.getBeerBySearch(searchParams).then((response) => {
                this.beers = response.data
                if(this.beers.length === 0) {
                    window.alert('No matches found.')
                }
            })
        }
    },
    created() {
        breweryService.getBreweries().then(
            (response) => {
                this.breweries = response.data;
            }
        )
    }

}
</script>

<style>

</style>