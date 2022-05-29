<template>
  <div id='map-area'>
      <h2>Map Test</h2>
      <GoogleMap />
  </div>
</template>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwEN5W_3SgcAVL-hJJZQHBe1upWvQoO8w&callback=initMap">
export default {
    name: 'GoogleMap'
}
</script>

<style>
    #map {
    height: 400px;
    width: 100%;
  
}
</style>