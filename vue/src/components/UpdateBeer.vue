<template>
  <div class="update-beer">
      <h2 class="form-title">Update Beer Information</h2>
      <form class="update-beer-form" v-on:submit.prevent="updateBeer">
          <select name="beer" id="beer">
              <option :value="null">Select Beer to be Updated</option>
              <option value=""></option>
          </select>
      </form>

      <h2 class="form-title">Delete Beer</h2>
      <form class="delete-beer-form" v-on:submit.prevent="deleteBeer"></form>
  </div>
</template>

<script>
export default {
name: 'update-beer',
methods: {}
}
</script>

<style>

</style>