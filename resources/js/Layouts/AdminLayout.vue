<script setup>
import { ref, onMounted, onUnmounted, computed } from 'vue';
import { Link, router } from '@inertiajs/vue3';
import { toggleNav } from '@/piniaStore/toggleNav'; // Adjust the path as needed

const showingNavigationDropdown = ref(false);
const logoFunc = () => {
  router.push(route('dashboard'));
};

const navStore = toggleNav();

// Initialize the store value on component mount
onMounted(() => {
  navStore.init();
  window.addEventListener('resize', handleResize);
  handleResize(); // Initial check
});

onUnmounted(() => {
  window.removeEventListener('resize', handleResize);
});

const isSmallScreen = ref(false);
const handleResize = () => {
  isSmallScreen.value = window.innerWidth < 768;

  if (!isSmallScreen.value && navStore.value) {
    navStore.change(); 
  }
};

const closeSidebar = () => {
  if (isSmallScreen.value && navStore.value) {
    navStore.change();
  }
};


const sidebarStyles = computed(() => {
  if (isSmallScreen.value) {
    return {
      position: 'absolute',
      top: 0,
      left: navStore.value ? '0%' : '-100%',
      width: '50%',
      height: '100vh',
      zIndex: 999,
      transition: 'left 0.3s ease-in-out',
      boxShadow: navStore.value ? '2px 0 10px rgba(0,0,0,0.5)' : 'none', 
    };
  } else {
    return {
      width: '20%',
      minWidth: '250px',
      position: 'relative',
      left: '0',
    };
  }
});

const rightContentStyles = computed(() => {
  if (isSmallScreen.value) {
    return {
      width: '100%',
      position: 'relative', 
    };
  } else {
    return {
      width: '80%',
    };
  }
});

const overlayStyles = computed(() => {
  if (isSmallScreen.value && navStore.value) {
    return {
      display: 'block',
      position: 'absolute',
      top: 0,
      left: 0,
      width: '100%',
      height: '100%',
      backgroundColor: 'rgba(0, 0, 0, 0.5)',
      zIndex: 99, 
    };
  } else {
    return {
      display: 'none',
    };
  }
});
</script>

<template>
  <div class="d-flex min-vh-100 main-container">
    <div class="sidebar text-white p-3 d-flex flex-column" :style="sidebarStyles">
      <div class="text-center mb-4 logo-container" @click="logoFunc">
        <img src="../../images/logo.png" alt="Logo" class="img-fluid rounded-circle mb-2 logo">
        <h5 class="fw-bold text-dark damayan-text">PROTECT DAMAYAN SYSTEM</h5>
      </div>

      <div class="nav flex-column">
        <div class="nav-item mb-2">
          <Link href="/dashboard" class="nav-link text-dark d-flex align-items-center" @click="closeSidebar">
            <i class="bi bi-house-door me-2"></i> Dashboard
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('members.registered')" class="nav-link text-dark d-flex align-items-center" @click="closeSidebar">
            <i class="bi bi-people me-2"></i> Members
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('contributions.index')" class="nav-link text-dark d-flex align-items-center" @click="closeSidebar">
            <i class="bi bi-cash-coin me-2"></i> Contribution
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('reports.index')" class="nav-link text-dark d-flex align-items-center" @click="closeSidebar">
            <i class="bi bi-file-earmark-text me-2"></i> Reports
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('officials.index')" class="nav-link text-dark d-flex align-items-center" @click="closeSidebar">
            <i class="bi bi-people me-2"></i> Officials
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('archive.index')" class="nav-link text-dark d-flex align-items-center" @click="closeSidebar">
            <i class="bi bi-archive me-2"></i> Archived
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link href="/sms" class="nav-link text-dark d-flex align-items-center" @click="closeSidebar">
            <i class="bi bi-bell me-2"></i> SMS
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('settings.viewSettings')" class="nav-link text-dark d-flex align-items-center" @click="closeSidebar">
            <i class="bi bi-gear me-2"></i> Settings
          </Link>
        </div>

        <div class="nav-item mb-2">
          <Link :href="route('logout')" method="post" class="nav-link text-dark d-flex align-items-center" @click="closeSidebar">
            <i class="bi bi-box-arrow-left me-2"></i> Logout
          </Link>
        </div>
      </div>
    </div>

    <div class="flex-grow-1 bg-light right" :style="rightContentStyles">
      <div v-if="isSmallScreen" class="sidebar-overlay" :style="overlayStyles" @click="closeSidebar"></div>

      <div v-if="$slots.header" class="mb-4 bg-white p-3 rounded shadow-sm">
        <slot name="header" />
      </div>

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
.logo {
  position: relative;
  width: 60%;
  height: 120px;
  margin: auto;
}
.main-container {
  width: 100%;
  height: 100vh;
  overflow: hidden !important;
}
.damayan-text {
  font-size: medium;
}
.logo-container {
  cursor: pointer;
}

@media (min-width: 768px) {
  .sidebar {
    width: 20%;
    min-width: 250px;
    position: relative;
    left: 0; 
  }
  .right {
    width: 80%;
  }
}
</style>  