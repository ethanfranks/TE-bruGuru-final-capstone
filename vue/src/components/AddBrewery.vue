<template>
  <div class="add-brewery-form">
    <h2>Add Brewery</h2>
    <form v-on:submit.prevent="addNewBrewery">
      <div class="form-element">
        <label for="brewer-id">Brewer ID:</label>
        <input id="brewer-id" type="text" v-model="newBrewery.user_id" />
      </div>
      <div class="form-element">
        <label for="brewery-name">Brewery Name:</label>
        <input
          id="brewery-name"
          type="text"
          v-model="newBrewery.brewery_name"
        />
      </div>
      <div class="actions">
        <button>Submit</button>
        <button v-on:click.prevent="resetForm" type="cancel">Cancel</button>
      </div>
    </form>
    <div>
      <img :src="image" alt="brewery" class="brewery-image" />
    </div>
  </div>
</template>

<script>
import BreweryService from "../services/BreweryService";
import image from "../assets/brewery.png";

export default {
  name: "add-brewery",
  data() {
    return {
      newBrewery: {
        user_id: null,
        brewery_name: "",
      },
      image: image,
    };
  },
  methods: {
    addNewBrewery() {
      BreweryService.addBrewery(this.newBrewery).then((response) => {
        if (response.status == 201) {
          this.$router.push("/admin");
          this.resetForm;
        }
      });
    },
    resetForm() {
      this.newBrewery = {};
    },
  },
};
</script>

<style>
.add-brewery-form {
  top: 200px;
  border-top: 3px solid black;
  border-bottom: 3px solid black;
  position: absolute;
  padding: whitesmoke;
  padding-top: 2.5%;
  padding-bottom: 2.5%;
  background: whitesmoke;
  background-clip: content-box;
  box-shadow: inset 0 0 0 15px whitesmoke;
  text-align: center;
  z-index: -1;
}
.brewery-image {
  min-height: 100%;
  min-width: 1024px;
  width: 100%;
  height: auto;
  position: fixed;
  top: 0;
  left: 0;
  z-index: -2;
}
</style>