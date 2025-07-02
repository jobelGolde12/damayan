<script setup>
import { defineProps, ref, onMounted, onBeforeUnmount } from 'vue';
import { Head, Link, router } from '@inertiajs/vue3';
import AdminLayout from '@/Layouts/AdminLayout.vue';

const props = defineProps({
  users: Array,
  currentUserId: Number,
});

// Track kung cno na user ang in click
const activeMenuId = ref(null);

// Close the menu (popup) when clicking outside
const handleClickOutside = (event) => {
  const menuElements = document.querySelectorAll('.dropdown-menu');
  const dotIcons = document.querySelectorAll('.bi-three-dots-vertical');

  let clickedInside = false;

  menuElements.forEach(menu => {
    if (menu.contains(event.target)) clickedInside = true;
  });

  dotIcons.forEach(icon => {
    if (icon.contains(event.target)) clickedInside = true;
  });

  if (!clickedInside) {
    activeMenuId.value = null;
  }
};

onMounted(() => {
  window.addEventListener('click', handleClickOutside);
});

onBeforeUnmount(() => {
  window.removeEventListener('click', handleClickOutside);
});

// Toggle menu
const toggleMenu = (userId) => {
  activeMenuId.value = activeMenuId.value === userId ? null : userId;
};

const deleteUser = (id) => {
    router.delete(route('role.deleteUser', {id: id}))
}
const editUser = (id) => {
  router.get(route('activityLog.edit', {id: id}));
}
</script>

<template>
  <div>
    <Head title="Activity logs" />
    <AdminLayout>
      <div class="container mt-5">
        <h3 class="mb-4">Activity Logs</h3>
        <p class="text-muted">System users</p>
        <table class="table table-striped table-bordered">
          <thead class="table-light">
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Name</th>
              <th scope="col">Email</th>
              <th scope="col">Users</th>
              <th scope="col">Action</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="user in users" :key="user.id" class="position-relative">
              <td>{{ user.id }}</td>
              <td>{{ user.name }}</td>
              <td>{{ user.email }}</td>
              <td>{{ user.role }}</td>
              <td class="d-flex gap-2 position-relative">
                <Link :href="route('activityLog.viewUser', { id: user.id })" class="text-dark text-decoration-none">
                  <i class="bi bi-eye"></i>
                </Link>
                <i class="bi bi-three-dots-vertical" @click.stop="toggleMenu(user.id)"></i>
                <div v-if="activeMenuId === user.id" class="dropdown-menu show shadow-sm p-2 rounded" style="position: absolute; top: 30px; right: 0; background: white; z-index: 10;">
                  <button class="btn btn-sm btn-outline-primary w-100 mb-1" @click="editUser(user.id)">Edit</button>
                  <button class="btn btn-sm btn-outline-danger w-100" v-if="props.currentUserId != user.id" @click="deleteUser(user.id)">Delete</button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </AdminLayout>
  </div>
</template>

<style scoped>
.table th, .table td {
  vertical-align: middle;
}
.bi {
  cursor: pointer;
}
</style>
