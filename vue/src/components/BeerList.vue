<template>
  <div v-for: class="beer-list">

  </div>
</template>

<script>
export default {
  data() {
    return {
      beer: {
        name: 'Hazy Dayz',
        description: 'This hazy IPA is everything you ever wanted in a beer. Tasty, cool, refreshing. Drink up delight.',
        abv: 6.5,
        imageURL: '',
        style: 'IPA',
        profile: 'grapefruit, hops',
      }
    }
  },
  props: {
    brewery_id: null,
    brewery_name: null,
  }

}
</script>

<style>

</style>