<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AdminLayout from '@/Layouts/AdminLayout.vue';
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue';

const users = [
  { name: 'Melva C. Delariarte', email: 'melva_protectadamayan@gmail.org', role: 'Admin' },
  { name: 'Mary Jane V. Golde', email: 'mj_protectadamayan@gmail.org', role: 'Admin' },
  { name: 'Milanie G. Gimoro', email: 'milanie_protectadamayan@gmail.org', role: 'Collector-purok 2' },
  { name: 'Lorilyn P. Gimoro', email: 'lorilyn_protectadamayan@gmail.org', role: 'Collector-purok 3' },
  { name: 'Emiretta Gimoro', email: 'emiretta_protectadamayan@gmail.org', role: 'Collector-purok 1' },
  { name: 'Jiji V. Gimoro', email: 'jiji_protectadamayan@gmail.org', role: 'Collector-purok 4' },
];

const roles = [
  { name: 'Admin', description: 'Full access', users: '2 users', access: 'Full modules', icon: 'bi bi-person' },
  { name: 'Collector', description: 'Jurisdiction-based', users: '4 users', access: 'Status updates', icon: 'bi bi-people' },
];
</script>
<template>
    <div>
        <Head title="Role Management" />
        <AdminLayout>
            <HeaderComponent />

             <div class="container mt-4 role-container">
    <h5 class="fw-bold">User and Role Management</h5>
    
    <!-- User Management Table -->
    <div class="card mt-3">
      <div class="card-body">
        <h6 class="fw-semibold">User Management</h6>
        <div class="table-responsive">
          <table class="table table-bordered align-middle">
            <thead class="table-light">
              <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>USERS</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(user, index) in users" :key="index">
                <td><i class="bi bi-person"></i></td>
                <td>{{ user.name }}</td>
                <td>{{ user.email }}</td>
                <td>{{ user.role }}</td>
                <td>
                  <button class="btn btn-sm btn-light">
                    <i class="bi bi-three-dots-vertical"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <button class="btn btn-primary float-end mt-2">Add User</button>
      </div>
    </div>

    <!-- Roles and Permissions Table -->
    <div class="card mt-4">
      <div class="card-body">
        <h6 class="fw-semibold">Roles and Permissions</h6>
        <div class="table-responsive">
          <table class="table table-bordered align-middle">
            <thead class="table-light">
              <tr>
                <th>Role</th>
                <th>Description</th>
                <th>Users</th>
                <th>Access</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(role, index) in roles" :key="index">
                <td><i :class="role.icon"></i> {{ role.name }}</td>
                <td>{{ role.description }}</td>
                <td>{{ role.users }}</td>
                <td>{{ role.access }}</td>
                <td>
                  <button class="btn btn-sm btn-light">
                    <i class="bi bi-three-dots-vertical"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
            <div class="bottom-role-container container"></div>
  </div>
        </AdminLayout>
    </div>
</template>
<style scoped>
.role-container {
    width: 100%;
    height: 100%;
    overflow-y: scroll;
}
.bottom-role-container {
    width: 100%;
    height: 30%;
}
</style>