<template>
  <div class="beer-review-card">
    <div id="beer-review-container">
      <p>"{{ review.reviewBody }}"</p>
      <p>Rating: {{ review.beerRating }}/5</p>
      <p><b>-- {{ review.reviewerUsername }} --</b></p>
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
  font-family: "Nunito Sans", sans-serif;
  border: 2px solid black;
  border-radius: 3px;
  margin: 0.5%;
  max-height: 100%;
  max-width: 100%;
  background-color: whitesmoke;
}

p {
  margin: 2%;
  word-break: break-all;
  white-space: normal;
}

#beer-review-container {
  text-align: center;
  height: 100%;
  width: 100%;
  overflow-y: auto;
  overflow-x: hidden;
}
</style>