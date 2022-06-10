<template>
  <div id="login-view">
    <div class="flex-container">

      <div id="login-img-container">
        <img :src="image" alt="Flight of beer" id="login-pic" />
      </div>

      <div id="login-form-container" class="text-center">
        <form class="form-signin" @submit.prevent="login">
          <h2 class="h3 mb-3 font-weight-normal">Please Sign In</h2>
          <div
            class="alert alert-danger"
            role="alert"
            v-if="invalidCredentials"
          >
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
          <br>
          <input
            type="text"
            id="username"
            class="form-control"
            placeholder="Username"
            v-model="user.username"
            required
            autofocus
          />
          <br />
          <label for="password" class="sr-only"> Password </label>
          <br>
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
      </div>
    </div>
  </div>
</template>


<script>
import authService from "../services/AuthService";
import image from "../assets/bruGuru.svg";

export default {
  name: "login",
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
#login-view {
  font-family: "Nunito Sans", sans-serif;
  display: flex;
  flex-grow: 1;
}

.flex-container {
  display: flex;
  height: 100%;
  width: 100%;
  justify-content: space-around;
}

#login-img-container {
  display: flex;
  align-items: flex;
  justify-content: center;
  width: 100%;
  height: 100%;
}

#login-pic {
  width: 30vw;
}

#login-form-container {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  flex-shrink: 1;
  overflow-y: auto;
}

</style>