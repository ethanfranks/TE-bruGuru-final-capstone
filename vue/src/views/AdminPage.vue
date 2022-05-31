<template>
  <div id="admin-page">
    <h2>Admin Portal</h2>
    <router-link v-bind:to="{ name: 'Add Brewery' }"> Add Brewery</router-link>
  </div>
</template>

<script>
export default {
  name: "admin-page",
};
</script>

<style>
</style>