<template>
  <div>
    <form v-on:submit.prevent="submitForm" class="breweryForm">
      <div class="status-message error" v-show="errorMsg !== ''"></div>
      <div class="form-group">
        <label for="Name">Name:</label>
        <input
          id="name"
          type="text"
          class="form-control"
          v-model="brewery.brewery_name"
          autocomplete="off"
        />
        <label for="number">Phone Number:</label>
        <input
          id="number"
          type="tel"
          class="form-control"
          v-model="brewery.phone"
          autocomplete="off"
        />
        <label for="email">Email:</label>
        <input
          id="email"
          type="email"
          class="form-control"
          v-model="brewery.email"
          autocomplete="off"
        />
        <label for="url">IG Link:</label>
        <input
          id="ig_url"
          type="url"
          class="form-control"
          v-model="brewery.ig_link"
          autocomplete="off"
        />
        <label for="url">FB Link:</label>
        <input
          id="fb_url"
          type="url"
          class="form-control"
          v-model="brewery.fb_link"
          autocomplete="off"
        />
        <div class="form-group">
          <label for="history">About Us:</label>
          <textarea
            id="history"
            class="form-control"
            v-model="brewery.about_us"
          ></textarea>
          <br />
          <br />
          <label for="sundayHours"
            >Enter Sunday hours of operation or enter "CLOSED":
          </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.sunday_hours"
          />
          <br />
          <label for="mondayHours">
            Enter Monday hours of operation or enter "CLOSED":
          </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.monday_hours"
          />
          <br />
          <label for="tuesdayHours"
            >Enter Tuesday hours of operation or enter "CLOSED":
          </label>

          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.tuesday_hours"
          />
          <br />
          <label for="wednesdayHours"
            >Enter Wednesday hours of operation or enter "CLOSED":
          </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.wednesday_hours"
          />
          <br />
          <label for="thursdayHours"
            >Enter Thursday hours of operation or enter "CLOSED":
          </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.thursday_hours"
          />
          <br />
          <label for="fridayHours"
            >Enter Friday hours of operation or enter "CLOSED":
          </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.friday_hours"
          />
          <br />
          <label for="saturdayHours"
            >Enter Saturday hours of operation or enter "CLOSED":
          </label>
          <input
            type="text"
            id="hours"
            class="form-control"
            v-model="brewery.saturday_hours"
          />
          <br />
          <br />
          <!-- BREWERY IMAGERY?!?!! -->
          <label for="Address">Address:</label>
          <textarea
            id="address"
            class="form-control"
            v-model="brewery.street_address"
          ></textarea>
          <br />
          <br />
          <label for="food"> Food Available: Yes</label>
          <input
            id="food"
            type="checkbox"
            class="form-control"
            v-model="brewery.food_available"
          />
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
  data() {
    return {
      brewery: {},

      errorMsg: "",
    };
  },
  methods: {
    sendUpdate() {
      return BreweryService.updateBrewery(this.brewery).then((response) => {
        this.brewery = response.data;
      });
    },
  },
  created() {
    return BreweryService.getBreweryByUsername().then((response) => {
      this.brewery = response.data;
    });
  },
};
</script>