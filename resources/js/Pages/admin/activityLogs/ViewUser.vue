<script setup>
import { defineProps } from 'vue';
import { Head, router, Link } from '@inertiajs/vue3';
const props = defineProps({
  user: Object,
  isCurrentUserAdmin: Boolean,
  isSameUser: Boolean,
  contributionSum: Number,
  contributionThisMonth: Number,
});

const deleteUser = () => {
    router.delete(route('role.deleteUser', {id: props?.user.id}))
}
const editUser = () => {
  router.get(route('activityLog.edit', {id: props?.user.id}));
}
</script>

<template>
  <div>
    <Head title="View user" />
    <div class="container mt-5 d-flex justify-content-center" v-if="props.user">
    <div class="card rounded-4 p-4" style="max-width: 500px; width: 100%;">
      <Link :href="route('activityLog.index')" class="text-decoration-none d-flex justify-content-end text-dark"><i class="bi bi-x-lg"></i></Link> 
      <div class="text-center mb-4">
        <div class="rounded-circle bg-primary text-white d-inline-flex justify-content-center align-items-center"
             style="width: 80px; height: 80px; font-size: 2rem;">
          {{ user.name[0] }}
        </div>
        <h4 class="mt-3">{{ user.name }}</h4>
        <small class="text-muted">{{ user.role }}</small>
      </div>
      <div class="list-group list-group-flush">
        <div class="list-group-item d-flex justify-content-between">
          <strong>Email:</strong> <span>{{ user.email }}</span>
        </div>
        <div class="list-group-item d-flex justify-content-between">
          <strong>User ID:</strong> <span>{{ user.id }}</span>
        </div>

        <div class="list-group-item d-flex justify-content-between">
          <strong>Contribution this month:</strong> <span class="text-success">{{ props.contributionThisMonth || 'none' }}</span>
        </div>

        <div class="list-group-item d-flex justify-content-between">
         <strong>All contributions:</strong> <span class="text-success">{{ props.contributionSum || 'none' }}</span>
        </div>

      </div>
      <!-- Kapag admin ang role san current user pwede cya mag delete or update user  -->
      <div class="mt-4 d-flex align-items-center" v-if="isCurrentUserAdmin">
        <button class="btn btn-outline-primary me-2" @click="editUser">
          <i class="bi bi-pencil"></i> 
        </button>
        <button class="btn btn-outline-danger" @click="deleteUser" v-if="props?.isSameUser != true">
          <i class="bi bi-trash" ></i> 
        </button>
      </div>
    </div>
  </div>

  <div class="container text-center text-muted" v-else>No user found.</div>
  </div>
</template>

<style scoped>
.card {
  background: #fff;
}
</style>
