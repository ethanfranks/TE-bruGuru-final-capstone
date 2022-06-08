<template>
  <div class="beer-review-card">
    <h2>"{{review.reviewBody}}"</h2>
    <h4>{{review.beerRating}}/5.0</h4>
    <p>--{{review.reviewerUsername}}</p>  
    <p> {{review.averageRating}}</p>
  </div>
</template>

<script>


export default {
    name: 'beer-review-card',
    props: ['review']
}

</script>

<style scoped>
.beer-review-card {
  text-align: center;
  font-family: "Nunito Sans", sans-serif;
  border: 2px solid black;
  border-radius: 3px;
  margin: 5px;
}
</style>