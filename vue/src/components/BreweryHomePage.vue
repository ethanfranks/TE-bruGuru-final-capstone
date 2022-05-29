<template>
  <div>
      <h2>{{brewery.name}}</h2>
      <h3>{{brewery.address}}</h3>
      <h3>{{brewery.phoneNumber}}</h3>
      <h3>{{brewery.email}}</h3>
      <h3>{{brewery.aboutUs}}</h3>
      <h3>{{brewery.igLink}}</h3>
      <h3>{{brewery.fbLink}}</h3>
      <h2>Our Offerings</h2>
      <h3 v-for="beer in brewery.offerings" v-bind:key="beer.id">{{beer.name}}</h3>
      <h2>Reviews:</h2>
      <h3 v-for="review in brewery.reviews" v-bind:key="review.id">
          "{{review.review}}"-{{review.reviewerUsername}}</h3>
  </div>
</template>

<script>
import breweryService from '@/services/BreweryService'

export default {
    data() {
        return {
            brewery: {}
        }
    },
    created() {
        const thisId = this.$route.params.id
        return breweryService.getBreweryById(thisId).then(
            (response) => {
                this.brewery = response.data
            }
        )
    }
}
</script>

<style>

</style>