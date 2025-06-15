<script setup>
import { ref } from 'vue';
import { Link, router } from '@inertiajs/vue3';

const showingNavigationDropdown = ref(false);
const logoFunc = () => {
  router.push(route('dashboard'));
};
</script>

<template>
  <div class="d-flex min-vh-100 main-container">
    <!-- Sidebar -->
    <div class="sidebar text-white p-3 d-flex flex-column" style="width: 20%; min-width: 250px;">
      <!-- Logo -->
      <div class="text-center mb-4 logo-container" @click="logoFunc">
        <img src="../../images/logo.png" alt="Logo" class="img-fluid rounded-circle mb-2 logo">
        <h5 class="fw-bold text-dark">PROTECT DAMAYAN SYSTEM</h5>
      </div>

      <!-- Navigation -->
      <div class="nav flex-column">

        <div class="nav-item mb-2">
          <hr class="hr">
          <Link href="/dashboard" class="nav-link text-dark d-flex align-items-center py-0">
            <i class="bi bi-person-circle me-2"></i> User
          </Link>
          <hr class="hr">
        </div>

        <div class="nav-item mb-2">
          <Link href="/dashboard" class="nav-link text-dark d-flex align-items-center">
            <i class="bi bi-house-door me-2"></i> Dashboard
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('collector.viewMembersAsCollector')" class="nav-link text-dark d-flex align-items-center">
            <i class="bi bi-people me-2"></i> All Members
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('contributions.index')" class="nav-link text-dark d-flex align-items-center">
            <i class="bi bi-cash-coin me-2"></i> Contribution
          </Link>
        </div>

         <div class="nav-item mb-2">
          <Link :href="route('reports.index')" class="nav-link text-dark d-flex align-items-center">
            <i class="bi bi-file-earmark-text me-2"></i> Reports
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('officials.index')" class="nav-link text-dark d-flex align-items-center">
            <i class="bi bi-people me-2"></i> Officials
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('archive.index')" class="nav-link text-dark d-flex align-items-center">
            <i class="bi bi-archive me-2"></i> Archived
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link href="/sms" class="nav-link text-dark d-flex align-items-center">
            <i class="bi bi-bell me-2"></i> SMS
          </Link>
        </div>

          <div class="nav-item mb-2">
          <Link :href="route('settings.viewSettings')" class="nav-link text-dark d-flex align-items-center">
            <i class="bi bi-gear me-2"></i> Settings
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('logout')" method="post" class="nav-link text-dark d-flex align-items-center">
            <i class="bi bi-gear me-2"></i> Logout
          </Link>
        </div>

      </div>
    </div>

    <div class="flex-grow-1 bg-light" style="width: 80%;">
      <div v-if="$slots.header" class="mb-4 bg-white p-3 rounded shadow-sm">
        <slot name="header" />
      </div>

      <!-- Page Content -->
      <slot />
    </div>
  </div>
</template>

<style scoped>
.nav-link:hover {
  background-color: rgba(255, 255, 255, 0.2);
  border-radius: 4px;
}
.sidebar {
  background: #7FEAFE;
  color: #333;
}
.main-container {
  width: 100%;
  height: 100vh;
  overflow: hidden !important;
}
.hr{
  height: 3px;
  background: #333;
  margin: 10px 0;
}
.logo {
  position: relative;
  width: 60%;
  height: 120px;
  margin: auto;
}
.damayan-text {
  font-size: medium;
}
.logo-container {
  cursor: pointer;
}
</style>
