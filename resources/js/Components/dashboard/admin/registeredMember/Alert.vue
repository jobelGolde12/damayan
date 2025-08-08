<script setup>
import { defineProps, watch, ref } from 'vue';

const props = defineProps({
  status: {
    type: Boolean,
    default: false
  },
  name: {
    type: String,
    default: ''
  }
});

const showAlert = ref(false);
const lastStatus = ref(null);
const animationClass = ref('');

watch(
  () => props.status,
  (newVal) => {
    lastStatus.value = newVal;
    animationClass.value = 'bounce-in';
    showAlert.value = true;

    // After 3s, play the slide-out animation (balik sa -100%)
    setTimeout(() => {
      animationClass.value = 'slide-out';
      setTimeout(() => {
        showAlert.value = false;
      }, 500); // match slide-out duration
    }, 3000);
  }
);
</script>

<template>
  <div>
    <div 
      class="alert alert-info" 
      :class="animationClass"
      role="alert" 
      v-if="showAlert"
    >
      {{ name }}'s status has been changed to 
      <strong>{{ lastStatus ? 'Active' : 'Inactive' }}</strong>
    </div>
  </div>
</template>

<style scoped>
.alert {
  position: absolute;
  bottom: 2%;
  right: -100%;
  z-index: 1000;
}

/* Bounce in animation */
.bounce-in {
  animation: bounceIn 0.6s ease forwards;
}

/* Slide out animation */
.slide-out {
  animation: slideOut 0.5s ease forwards;
}

@keyframes bounceIn {
  0% {
    right: -100%;
  }
  60% {
    right: 0%;
  }
  80% {
    right: 4%;
  }
  100% {
    right: 2%;
  }
}

@keyframes slideOut {
  from {
    right: 2%;
  }
  to {
    right: -100%;
  }
}
</style>
