<template>
  <div>
    <header-component></header-component>
    <div id="login" class="text-center">
      <img :src="image" alt="Flight of beer" class="logo" />
      <form class="form-signin" @submit.prevent="login">
        <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
        <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
          Invalid username and password!
        </div>
        <div
          class="alert alert-success"
          role="alert"
          v-if="this.$route.query.registration"
        >
          Thank you for registering, please sign in.
        </div>
        <label for="username" class="sr-only">Username </label>
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        />
        <label for="password" class="sr-only"> Password </label>
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
        />
        <br />
        <button type="submit">Sign in</button>
        <br />
        <br />
        <router-link :to="{ name: 'register' }">Need an account?</router-link>
      </form>
      <footer-component></footer-component>
    </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";
import headerComponent from "../components/Header.vue";
import footerComponent from "../components/Footer.vue";
import image from "../assets/secondBeerFlight.png";

export default {
  name: "login",
  components: {
    headerComponent,
    footerComponent,
  },
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
      image: image,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>
<style scoped>
.logo {
  width: 750px;
  margin: 75px;
}
#login {
  display: flex;
  justify-content: space-around;
}
</style>