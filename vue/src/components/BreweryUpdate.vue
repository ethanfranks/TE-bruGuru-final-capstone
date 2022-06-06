<template>
  <div>
    {{ brewery }}
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
          <div class="form-group">
            <label for="promptOpenDays"
              >Select your business days and hours below.
            </label>
            <label for="sunday">Sunday</label>
            <input type="checkbox" id="daysOpen" name="sunday" value="Sunday" />
            <label for="sundayOpen">Select a Sunday Opening Hour: </label>
            <select name="sunday_open" id="sundayOpen">
              <option>7:00AM</option>
              <option>8:00AM</option>
              <option>9:00AM</option>
              <option>10:00AM</option>
              <option>11:00AM</option>
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>

            <label for="sundayClose">Select a Sunday Closing Hour: </label>
            <select name="sunday_close" id="sundayClose">
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <br />
            <label for="monday">Monday</label>
            <input type="checkbox" id="daysOpen" name="monday" value="Monday" />
            <label for="mondayOpen">Select a Monday Opening Hour: </label>
            <select name="monday_open" id="mondayOpen">
              <option>7:00AM</option>
              <option>8:00AM</option>
              <option>9:00AM</option>
              <option>10:00AM</option>
              <option>11:00AM</option>
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <label for="mondayClose">Select a Monday Closing Hour: </label>
            <select name="monday_close" id="mondayClose">
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <br />
            <label for="tuesday">Tuesday</label>
            <input
              type="checkbox"
              id="daysOpen"
              name="tuesday"
              value="Tuesday"
            />
            <label for="tuesdayOpen">Select a Tuesday Opening Hour: </label>
            <select name="tuesday_open" id="tuesdayOpen">
              <option>7:00AM</option>
              <option>8:00AM</option>
              <option>9:00AM</option>
              <option>10:00AM</option>
              <option>11:00AM</option>
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <label for="tuesdayClose">Select a Tuesday Closing Hour: </label>
            <select name="tuesday_close" id="tuesdayClose">
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <br />

            <label for="wednesday">Wednesday</label>
            <input
              type="checkbox"
              id="daysOpen"
              name="wednesday"
              value="Wednesday"
            />
            <label for="wednesdayOpen">Select a Wednesday Opening Hour: </label>
            <select name="wednesday_open" id="wednesdayOpen">
              <option>7:00AM</option>
              <option>8:00AM</option>
              <option>9:00AM</option>
              <option>10:00AM</option>
              <option>11:00AM</option>
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <label for="wednesdayClose"
              >Select a Wednesday Closing Hour:
            </label>
            <select name="wednesday_close" id="wednesdayClose">
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <br />

            <label for="thursday">Thursday</label>
            <input
              type="checkbox"
              id="daysOpen"
              name="thursday"
              value="Thursday"
            />
            <label for="thursdayOpen">Select a Thursday Opening Hour: </label>
            <select name="thursday_open" id="thursdayOpen" multiple="true">
              <option>7:00AM</option>
              <option>8:00AM</option>
              <option>9:00AM</option>
              <option>10:00AM</option>
              <option>11:00AM</option>
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <label for="thursdayClose">Select a Thursday Closing Hour: </label>
            <select name="thursday_close" id="thursdayClose">
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <br />

            <label for="friday">Friday</label>
            <input type="checkbox" id="daysOpen" name="friday" value="Friday" />
            <label for="fridayOpen">Select a Friday Opening Hour: </label>
            <select name="friday_open" id="fridayOpen" multiple="true">
              <option>7:00AM</option>
              <option>8:00AM</option>
              <option>9:00AM</option>
              <option>10:00AM</option>
              <option>11:00AM</option>
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <label for="fridayClose">Select a Friday Closing Hour: </label>
            <select name="friday_close" id="fridayClose">
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <br />

            <label for="saturday">Saturday</label>
            <input
              type="checkbox"
              id="daysOpen"
              name="saturday"
              value="Saturday"
            />
            <label for="saturdayOpen">Select a Saturday Opening Hour: </label>
            <select name="saturday_open" id="saturdayOpen" multiple="true">
              <option>7:00AM</option>
              <option>8:00AM</option>
              <option>9:00AM</option>
              <option>10:00AM</option>
              <option>11:00AM</option>
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <label for="saturdayClose">Select a Saturday Closing Hour: </label>
            <select name="saturday_close" id="saturdayClose">
              <option>12:00PM</option>
              <option>1:00PM</option>
              <option>2:00PM</option>
              <option>3:00PM</option>
              <option>4:00PM</option>
              <option>5:00PM</option>
              <option>6:00PM</option>
              <option>7:00PM</option>
              <option>8:00PM</option>
              <option>9:00PM</option>
              <option>10:00PM</option>
              <option>11:00PM</option>
              <option>12:00AM</option>
            </select>
            <br />
          </div>
          <!-- <label for="hours">Hours:</label>
          <textarea
            id="hours"
            class="form-control"
            v-model="brewery.hours"
          ></textarea> -->
          <!-- BREWERY IMAGERY?!?!! -->
          <label for="Address">Address:</label>
          <textarea
            id="address"
            class="form-control"
            v-model="brewery.street_address"
          ></textarea>
          <label for="food">Food Available: Yes</label>
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
      brewery: {
        brewery_id: Number(this.$route.params.id),
        brewery_name: "",
        email: "",
        phone: "",
        ig_link: "",
        fb_link: "",
        about_us: "",
        hours: "",
        images: "",
        street_address: "",
        food_available: "",
      },
      updatedBrewery: {},

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
};
</script>