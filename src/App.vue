<template>
  <div class="title">
    WORLD CLOCK
  </div>
  <div>
    <TimeZoneBlock
      v-for="(item, index) in data"
      :key="index"
      :zone="item.zone"
      :city="item.city"
      :type="index % 2 === 1 ? 'white' : 'block'"
    />
  </div>
</template>

<script>
import TimeZoneBlock from "@/components/time-zone-block.vue";
import { defineComponent } from "vue";

export default defineComponent({
  name: "App",
  components: {
    TimeZoneBlock
  },
  setup() {
    const data = [
      {
        city: "new york",
        zone: -4
      },
      {
        city: "london",
        zone: 0
      },
      {
        city: "bangkok",
        zone: 7
      },
      {
        city: "taiwan",
        zone: 8
      },
      {
        city: "sydney",
        zone: 8
      }
    ];
    return {
      data
    };
  }
});
</script>

<style lang="scss">
body,
html {
  margin: 0;
  padding: 0;
  background-color: #e5e5e5;
  width: 100%;
  height: 100%;
}
#app {
  width: 600px;
  margin: 0 auto;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-family: sans-serif;
  text-align: center;
  color: #000;
  > div {
    width: 100%;
  }
}

.title {
  font-size: 72px;
  font-weight: 800;
  border-top: 10px solid #000;
  border-bottom: 10px solid #000;
  margin-bottom: 32px;
}
</style>
