<template>
  <div>
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

<style>

</style>