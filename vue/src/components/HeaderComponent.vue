<template>
  <div class="header">
    <img src="" alt="" />
    <h1>Brewery Finder</h1>
    <nav>
      <router-link class="router" id="home" v-bind:to="{ name: 'home' }"
        >Home</router-link
      >
      <router-link class="router" id="account" v-bind:to="{ name: 'account' }" v-if="isLoggedIn"
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
    }
  }
};
</script>

<style>
.header {
  text-align: center;
  background-color: #55595c;
  color: #f8f9fa;
  width: 100vw;
  padding-bottom: 1rem;
  background-image: url('../assets/brewery-web-header.jpg');
  background-position: center;
  background-size: 100vw;
}

nav {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas: "home account login-logout";
}

.router {
  text-decoration: none;
  color: #f8f9fa;
}

.router:hover {
  color: #ced4da;
}
</style>