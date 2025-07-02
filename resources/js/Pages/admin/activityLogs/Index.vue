<script setup>
import { defineProps } from 'vue';
import { Head, Link } from '@inertiajs/vue3';
import AdminLayout from '@/Layouts/AdminLayout.vue';

const props = defineProps({
  users: Array
});
</script>

<template>
    <div>
            <Head title="Activity logs" />
<AdminLayout >
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
        <tr v-for="user in users" :key="user.id">
          <td>{{ user.id }}</td>
          <td>{{ user.name }}</td>
          <td>{{ user.email }}</td>
          <td>{{ user.role }}</td>
          <td class="d-flex gap-2">
            <Link :href="route('activityLog.viewUser', {id: user.id})" class="text-dark text-decoration-none">
              <i class="bi bi-eye"></i>
            </Link>
            <i class="bi bi-three-dots-vertical"></i>
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
.bi{
    cursor: pointer;
}
</style>
