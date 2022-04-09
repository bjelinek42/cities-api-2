<script>
import axios from "axios";
export default {
  data: function () {
    return {
      message: "Welcome to Cities!",
      cities: [],
      newCityParams: {}
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
    },
    createCity: function () {
      axios.post("/cities", this.newCityParams).then(response => {
        console.log("creating city", response.data)
        this.cities.push(response.data)
      })
    }
  },
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <p>Add Another City</p>
    <p>Name: <input type="text" v-model="newCityParams.name"></p>
    <p>State: <input type="text" v-model="newCityParams.state"></p>
    <p>Population: <input type="text" v-model="newCityParams.population"></p>
    <button @click="createCity()">Create!</button>
    <div v-for="city in cities" v-bind:key="city">
      <p>{{ city.name }}</p>
    </div>
  </div>
</template>

<style></style>