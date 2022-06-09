<template>
  <div id="brewery-component">
    <div id="brewery-grid-container">
      <div id="brewery-name">
        <h3>{{ brewery.name }}</h3>
      </div>
<!-- 
      <div id="brewery-logo">
        <img
          @error="imgWorks = false"
          v-if="imgWorks == true"
          src="https://images-platform.99static.com//L1FuYJMN22WF_A-KhpWCunb2HHA=/543x73:1248x778/fit-in/590x590/99designs-contests-attachments/88/88532/attachment_88532157"
          alt="brewery logo"
        />
      </div> -->
    </div>

    <div id="brewery-info">
      <h5>Find Us Here</h5>
      <p>{{ brewery.address }}</p>
      <p>{{ brewery.phoneNumber }}</p>
      <p>{{ brewery.email }}</p>
      <a :href="brewery.igLink">Instagram</a>
      <br />
      <a :href="brewery.fbLink">Facebook</a>
      <br />
      <h5>About Us</h5>
      <p>{{ brewery.aboutUs }}</p>
      <h5>Hours of Operation</h5>
      <p>Monday: {{ brewery.mondayHours }}</p>
      <p>Tuesday: {{ brewery.tuesdayHours }}</p>
      <p>Wednesday: {{ brewery.wednesdayHours }}</p>
      <p>Thursday: {{ brewery.thursdayHours }}</p>
      <p>Friday: {{ brewery.fridayHours }}</p>
      <p>Saturday: {{ brewery.saturdayHours }}</p>
      <p>Sunday: {{ brewery.sundayHours }}</p>
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
  // props: ['breweryId'],
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
  font-size: 0.75rem;
  margin: 0.2rem;
  margin: 0;
}

#brewery-info > a {
  text-decoration: none;
}

#brewery-info > h5 {
  margin-top: 0.3rem;
  margin-bottom: 0.3rem;
  text-decoration: underline;
}

#brewery-name {
  height: 50%;
}

#brewery-logo {
  overflow: hidden;
  position: relative;
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
