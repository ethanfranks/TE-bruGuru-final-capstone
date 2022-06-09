<template>
  <div class="beer-review-card">
    <div>
      <h5>"{{ review.reviewBody }}"</h5>
      <h5>Rating: {{ review.beerRating }}/5</h5>
      <h5>-- {{ review.reviewerUsername }} --</h5>
      <p>{{ review.averageRating }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "beer-review-card",
  props: ["review"],
};
</script>

<style scoped>
.beer-review-card {
  display: flex;
  justify-content: center;
  align-items: center;
  /* text-align: center; */
  font-family: "Nunito Sans", sans-serif;
  border: 2px solid black;
  border-radius: 3px;
  margin: 0.5%;
  max-height: 50%;
  background-color: whitesmoke;
}

.beer-review-card > h5 {
  margin: 0;
}
</style>