<template>
  <div class="time-zone-block" :class="`time-zone-block--${type}`">
    <div>
      <div class="time-zone-block__city">
        {{ city.toLocaleUpperCase() }}
      </div>
      <div class="time-zone-block__date">
        {{ zeroPadding(day) }} {{ month }} {{ yaer }}
      </div>
    </div>
    <div class="time-zone-block__time">
      {{ zeroPadding(hour) }}:{{ zeroPadding(minute) }}
    </div>
  </div>
</template>
<script>
import { defineComponent, computed, ref } from "vue";
export default defineComponent({
  props: {
    zone: {
      type: Number,
      defalut: 0
    },
    city: {
      type: String,
      default: ""
    },
    type: {
      validator: function(value) {
        return ["white", "block"].includes(value);
      },
      default: "block"
    }
  },
  setup(props) {
    const months = [
      "Jan.",
      "Feb.",
      "Mar.",
      "Apr.",
      "May.",
      "Jun.",
      "Jul.",
      "Aug.",
      "Sep.",
      "Oct.",
      "Nov.",
      "Dec."
    ];
    let date = ref(new Date());
    const millisecond = 1000;
    const mimnuteMillisecond = 60 * millisecond;
    const hourMillisecond = 60 * mimnuteMillisecond;
    const localZone = computed(() => date.value.getTimezoneOffset() / 60);
    const timeZone0 = computed(
      () => date.value.getTime() + localZone.value * hourMillisecond
    );
    const cityTimeZone = computed(
      () => timeZone0.value + props.zone * hourMillisecond
    );
    console.log(cityTimeZone.value);
    const yaer = computed(() => new Date(cityTimeZone.value).getFullYear());
    const month = computed(
      () => months[new Date(cityTimeZone.value).getMonth()]
    );
    const day = computed(() => new Date(cityTimeZone.value).getDay());
    const hour = computed(() => new Date(cityTimeZone.value).getHours());
    const minute = computed(() => new Date(cityTimeZone.value).getMinutes());

    setInterval(() => {
      console.log("test");
      date.value = new Date();
    }, 5 * millisecond);

    function zeroPadding(number) {
      if (number.toString().length === 1) {
        return `0${number}`;
      }
      return number;
    }

    return {
      yaer,
      month,
      day,
      hour,
      minute,
      zeroPadding
    };
  }
});
</script>

<style scoped lang="scss">
.time-zone-block {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 40px;
  box-sizing: border-box;
  &--block {
    background-color: #000;
    color: #fff;
  }
  &--white {
    background-color: #fff;
    color: #000;
  }
  &__city {
    font-size: 36px;
  }
  &__date {
    font-size: 16px;
    text-align: left;
  }
  &__time {
    font-size: 72px;
  }
}
</style>
