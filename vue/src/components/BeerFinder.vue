<template>
  <div>
      <div v-for="brewery in breweries" v-bind:key="brewery.id">
          <router-link v-bind:to="{name: 'brewery-details', params:{id: brewery.id}}" v-bind:brewery="brewery">{{brewery.name}}</router-link>
      </div>
  </div>
</template>

<script>
import breweryService from '@/services/BreweryService'

export default {
    components: {
       
    },
    data() {
        return {
            breweries: [],

        }
    },
    methods : {

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