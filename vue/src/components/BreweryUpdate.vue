<template>
  <div>
    <button @click="toggleUpdateForm()">Update Brewery Info</button>

    <h2 v-show="showUpdateForm">Update Brewery</h2>

    <form
      v-on:submit.prevent="submitForm"
      class="breweryForm"
      v-show="showUpdateForm"
    >
      <div class="status-message error" v-show="errorMsg !== ''"></div>
      <div class="form-group">
        <label for="Name">Name: </label>
        <input
          id="name"
          type="text"
          class="form-control"
          v-model="brewery.brewery_name"
          autocomplete="off"
        /><br />
        <label for="number">Phone Number: </label>
        <input
          id="number"
          type="tel"
          class="form-control"
          v-model="brewery.phone"
          autocomplete="off"
        /><br />
        <label for="email">Email: </label>
        <input
          id="email"
          type="email"
          class="form-control"
          v-model="brewery.email"
          autocomplete="off"
        /><br />
        <label for="url">IG Link: </label>
        <input
          id="ig_url"
          type="url"
          class="form-control"
          v-model="brewery.ig_link"
          autocomplete="off"
        /><br />
        <label for="url">FB Link: </label>
        <input
          id="fb_url"
          type="url"
          class="form-control"
          v-model="brewery.fb_link"
          autocomplete="off"
        />
        <br />
        <label for="Address">Address: </label>
        <textarea
          id="address"
          class="form-control"
          v-model="brewery.street_address"
        ></textarea>
        <br />
        <label for="food"> Food Available? </label>
        <input
          id="food"
          type="checkbox"
          class="form-control"
          v-model="brewery.food_available"
        />
        <br>
        <div class="form-group">
          <p id="hours-of-operation-title">Hours of Operation</p>
          <label for="mondayHours"> Monday: </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.monday_hours"
          />
          <br />
          <label for="tuesdayHours">Tuesday: </label>

          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.tuesday_hours"
          />
          <br />
          <label for="wednesdayHours">Wednesday: </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.wednesday_hours"
          />
          <br />
          <label for="thursdayHours">Thursday: </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.thursday_hours"
          />
          <br />
          <label for="fridayHours">Friday: </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.friday_hours"
          />
          <br />
          <label for="saturdayHours">Saturday: </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.saturday_hours"
          />
          <br />
          <label for="sundayHours">Sunday: </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.sunday_hours"
          />
          <br />
          <input
            id="submit"
            type="submit"
            @click="sendUpdate()"
            value="Submit"
          />
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import BreweryService from "@/services/BreweryService";

export default {
  components: {},
  data() {
    return {
      brewery: {},

      errorMsg: "",

      showUpdateForm: false,
    };
  },
  methods: {
    sendUpdate() {
      return BreweryService.updateBrewery(this.brewery).then((response) => {
        this.brewery = response.data;
      });
    },
    toggleUpdateForm() {
      this.showUpdateForm = !this.showUpdateForm;
    },
  },
  created() {
    return BreweryService.getBreweryByUsername().then((response) => {
      this.brewery = response.data;
    });
  },
};
</script>

<style scoped>
#hours-of-operation-title {
  font-weight: bold;
  text-decoration: underline;
  margin: 0;
}
</style>