<script setup>
import { onMounted } from 'vue'
import { toggleNav } from '@/piniaStore/toggleNav'

const navStore = toggleNav()

onMounted(() => {
  // navStore.init()
})

const toggleNavAction = () => {
  navStore.change()
}
</script>

<template>
  <div>
    <div class="d-flex align-items-center mb-3 header container-fluid py-2">
      <button class="me-2" @click="toggleNavAction">
        <i class="bi bi-list fs-2"></i>
      </button>
      <h4 class="mb-0 fw-bold">PROTECT DAMAYAN SYSTEM</h4>
    </div>
  </div>
</template>

<style scoped>
.header {
  background: #D4F3F9;
}
</style>
