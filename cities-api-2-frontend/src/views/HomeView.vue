<script>
import axios from "axios";
export default {
  data: function () {
    return {
      message: "Welcome to Cities!",
      cities: []
    };
  },
  created: function () {
    this.indexCities();
  },
  methods: {
    indexCities: function () {
      axios.get("/cities").then(response => {
        console.log("index cities", response.data)
        this.cities = response.data
      })
    }
  },
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <div v-for="city in cities" v-bind:key="city">
      <p>{{ city.name }}</p>
    </div>
  </div>
</template>

<style></style>