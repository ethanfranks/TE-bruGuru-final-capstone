<template>
  <div id="brewery-component">
    <div>
      <div id="brewery-name">
        <h2>{{ brewery.name }}</h2>
      </div>

      <div id="brewery-logo" v-if="imgWorks == true">
        <img @error="imgWorks = false" :src="brewery.imageURL" />
      </div>

      <div id="brewery-info">
        <h4>Find Us Here</h4>
        <p>{{ brewery.address }}</p>
        <p>{{ brewery.phoneNumber }}</p>
        <p>{{ brewery.email }}</p>
        <a :href="brewery.igLink">Instagram</a>
        <br />
        <a :href="brewery.fbLink">Facebook</a>
        <br />
        <h4>About Us</h4>
        <p>{{ brewery.aboutUs }}</p>
        <h4>Hours of Operation</h4>
        <p>Monday: {{ brewery.mondayHours }}</p>
        <p>Tuesday: {{ brewery.tuesdayHours }}</p>
        <p>Wednesday: {{ brewery.wednesdayHours }}</p>
        <p>Thursday: {{ brewery.thursdayHours }}</p>
        <p>Friday: {{ brewery.fridayHours }}</p>
        <p>Saturday: {{ brewery.saturdayHours }}</p>
        <p>Sunday: {{ brewery.sundayHours }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import breweryService from "@/services/BreweryService";

export default {
  data() {
    return {
      brewery: {},
      imgWorks: true,
    };
  },
  components: {},
  created() {
    const thisId = this.$route.params.id;
    console.log("this id before if/else" + thisId);
    if (thisId != null) {
      return breweryService.getBreweryById(thisId).then((response) => {
        this.brewery = response.data;
      });
    } else {
      return breweryService.getBreweryByUsername().then((response) => {
        this.brewery = response.data;
      });
    }
  },
};
</script>

<style scoped>
#brewery-component {
  font-family: "Nunito Sans", sans-serif;
  height: 100%;
  width: 100%;
}

#brewery-grid-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  max-height: 30%;
  text-align: center;
  align-items: center;
}

#brewery-info > p,
a {
  font-size: 1rem;
  margin: 0.2rem;
  margin: 0;
}

#brewery-info > a {
  text-decoration: none;
}

#brewery-info > h4 {
  margin-top: 0.3rem;
  margin-bottom: 0.3rem;
  text-decoration: underline;
}

#brewery-name {
  height: 15%;
  /* display: flex;
  justify-content: center;
  align-items: center; */
}

#brewery-name > h2 {
  height: 100%;
  width: 100%;
  margin: 0;
  text-align: center;
}

#brewery-logo {
  height: 15%;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 5%;
}

#brewery-logo > img {
  max-height: 100%;
  max-width: 100%;
  margin: auto;
  display: inline-block;
}

#brewery-details {
  grid-area: "details";
}
</style>
