<template>
  <div id="register-container">
    <div id="register-pic-container">
      <img :src="image" alt="Fancy flight of beer" id="register-pic" />
    </div>

    <div id="registration-form">
      <form class="form-register" @submit.prevent="register">
        <h2 class="h3 mb-3 font-weight-normal">Create Account</h2>
        <div class="alert alert-danger" role="alert" v-if="registrationErrors">
          {{ registrationErrorMsg }}
        </div>
        <label for="username" class="sr-only">Username</label>
        <br />
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        />
        <!-- <br /> -->
        <br />
        <label for="password" class="sr-only">Password</label>
        <br />
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
        />
        <br />
        <label for="confirmPassword" class="sr-only">Confirm</label>
        <br />
        <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="Confirm Password"
          v-model="user.confirmPassword"
          required
        />
        <br />
        <br />
        <div>
          <label for="checkbox">Do you represent a brewery? </label>
          <input
            type="checkbox"
            id="isBrewer"
            class="form-control"
            v-on:change="addBrewerRole($event)"
          />
        </div>
        <!-- <br /> -->
        <br />
        <button class="btn btn-lg btn-primary btn-block" type="submit">
          Create Account
        </button>
        <br />
        <br />
        <router-link :to="{ name: 'login' }"
          >Already have an account?</router-link
        >
      </form>
    </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";
import image from "../assets/favoritebeerflight.png";

export default {
  name: "register",

  data() {
    return {
      user: {
        username: "",
        password: "",
        confirmPassword: "",
        role: "Beer Lover",
      },
      registrationErrors: false,
      registrationErrorMsg: "There were problems registering this user.",
      image: image,
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = "Password & Confirm Password do not match.";
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: "/login",
                query: { registration: "success" },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = "Bad Request: Validation Errors";
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = "There were problems registering this user.";
    },
    addBrewerRole(evt) {
      if (evt.target.checked) {
        this.user.role = "Beer Lover,Brewer";
      } else {
        this.user.role = "Beer Lover";
      }
    },
  },
};
</script>

<style>
#register-container {
  display: flex;
  justify-content: space-between;
  /* flex-grow: 1; */
}

#register-pic-container {
  display: flex;
  height: 100%;
  width: 50%;
  justify-content: center;
  align-items: center;
}

#registration-form {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 50%;
  height: 100%;
  overflow-y: auto;
}

.form-register {
  height: 100%;
}

#register-pic {
  width: 100%;
  height: fit-content;
}

.text-center {
  display: flex;
  align-items: center;
}

@media screen and (max-width: 480px) {
  #register-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100%;
  }

  #register-pic-container {
    display: flex;
    height: 100%;
    width: 100%;
    justify-content: center;
    align-items: center;
  }

  #registration-form {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  overflow-y: auto;
}

@media screen and (max-height: )
}
</style>
