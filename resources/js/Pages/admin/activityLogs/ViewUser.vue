<script setup>
import { defineProps } from 'vue';
import { Head, router } from '@inertiajs/vue3';
const props = defineProps({
  user: Object,
  isCurrentUserAdmin: Boolean,
});

const deleteUser = () => {
    router.delete(route('role.deleteUser', {id: props?.user.id}))
}
</script>

<template>
  <div>
    <Head title="View user" />
    <div class="container mt-5 d-flex justify-content-center" v-if="props.user">
    <div class="card rounded-4 p-4" style="max-width: 500px; width: 100%;">
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
      </div>
      <!-- Kapag admin ang role san current user pwede cya mag delete or update user  -->
      <div class="mt-4 d-flex justify-content-center" v-if="isCurrentUserAdmin">
        <button class="btn btn-outline-primary me-2">
          <i class="bi bi-pencil"></i> Edit
        </button>
        <button class="btn btn-outline-danger" @click="deleteUser">
          <i class="bi bi-trash" ></i> Delete
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
