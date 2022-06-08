<template>
  <div id="header">
    <h1>bruGuru</h1>
    <nav id="main-nav" :class="[!isLoggedIn ? 'two-nav' : 'three-nav']">
      <router-link class="router" id="home" v-bind:to="{ name: 'home' }"
        >Home</router-link
      >
      <router-link
        class="router"
        id="account"
        v-bind:to="{ name: 'account' }"
        v-if="isLoggedIn"
        >Account</router-link
      >
      <router-link
        class="router"
        id="login-logout"
        v-bind:to="{ name: !isLoggedIn ? 'login' : 'logout' }"
      >
        {{ isLoggedIn ? "Logout" : "Login" }}
      </router-link>
    </nav>
  </div>
</template>

<script>
export default {
  name: "header-component",
  computed: {
    isLoggedIn() {
      return this.$store.state.isLoggedIn;
    },
  },
};
</script>

<style>
#header {
  font-family: "Nunito Sans", sans-serif;
  text-align: center;
  background-color: #55595c;
  width: 100vw;
  background-image: url("../assets/brewery-web-header.jpg");
  background-position: center;
  background-size: 100vw;
  margin: 0;
}

#header > h1 {
  margin: 0;
  padding-top: 2%;
  font-family: "Montserrat", "Nunito Sans", sans-serif;
  color: #f8f9fa;
}

#main-nav {
  padding-bottom: 0.5%;
}

.three-nav {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas: "home account login-logout";
}

.two-nav {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-areas: "home login-logout";
}

#home {
  grid-area: "home";
}

#account {
  grid-area: "account";
}

#login-logout {
  grid-area: "login-logout";
}

.router {
  text-decoration: none;
  color: #f8f9fa;
}

.router:hover {
  color: #41596B;
}
</style>