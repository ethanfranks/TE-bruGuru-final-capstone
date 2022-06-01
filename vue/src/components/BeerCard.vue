<template>
  <div class="card">
    <div class="beer-name">{{beer.name}}</div>

    <!-- <h2>{{ beer.name }}</h2>
    <h3>{{ brewery_name }}</h3>
    <p>Style: {{ beer.style }}</p>
    <p>ABV: {{ beer.abv }}%</p>
    <p>Flavor Profile: {{ beer.profile }}</p>
    <h3>Description</h3>
    <p>{{ beer.description }}</p> -->
  </div>
</template>

<script>
export default {
    name: "beer-card",
    props: ["beer"],
};
</script>

<style>
</style>