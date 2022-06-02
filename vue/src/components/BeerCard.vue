<template>
  <div class="card">
    <div class="beer-name">{{beer.name}}</div>
    <div class="brewery-name">{{beer.brewery_name}}</div>
    <img class="beer-img" :src="beer.imageURL">
    <div class="beer-style">{{beer.style}}</div>
    <div class="beer-abv">{{beer.abv}}</div>
    <div class="flavor-profile">{{beer.profile}}</div>
    <div class="beer-description">{{beer.description}}</div>
  </div>
</template>

<script>
export default {
    name: "beer-card",
    props: ["beer"],
};
</script>

<style>
.card {
  border: 2px solid black;
  border-radius: 10px;
  width: 250px;
  height: 550px;
  margin: 20px;
}

.card .beer-name {
  font-size: 1.5rem;
}

.card .brewery-name {
  font-size: 1rem;
}
</style>