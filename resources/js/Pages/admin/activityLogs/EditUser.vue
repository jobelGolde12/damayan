<script setup>
import { Head, Link, useForm } from '@inertiajs/vue3'

const props = defineProps({
  user: Object
})

const form = useForm({
  name: props.user.name,
  email: props.user.email,
  role: props.user.role,
})

const updateUser = () => {
  form.put(route('activityLog.update', props.user.id), {}, {
    onSuccess: () =>  alert('Updated successfully.'),
    onError: () => alert('Something went wrong, please try again.')
  })
}

</script>

<template>
  <div>
    <Head title="Edit User" />
      <div class="container form-container mt-5 pt-5 ">
        <h3 class="mb-4">Edit User</h3>
        <form @submit.prevent="updateUser">
          <div class="mb-3">
            <label class="form-label">Name</label>
            <input v-model="form.name" type="text" class="form-control" />
            <div v-if="form.errors.name" class="text-danger">{{ form.errors.name }}</div>
          </div>

          <div class="mb-3">
            <label class="form-label">Email</label>
            <input v-model="form.email" type="email" class="form-control" />
            <div v-if="form.errors.email" class="text-danger">{{ form.errors.email }}</div>
          </div>

          <div class="mb-3">
            <label class="form-label">Role</label>
            <select v-model="form.role" class="form-select">
              <option value="admin">Admin</option>
              <option value="collector">Collector</option>
              <!-- Add more roles as needed -->
            </select>
            <div v-if="form.errors.role" class="text-danger">{{ form.errors.role }}</div>
          </div>

          <div class="d-flex align-items-center gap-2">
            <button type="submit" class="btn btn-primary" :disabled="form.processing">
            Update
          </button>
          <Link :href="route('activityLog.viewUser', {id: props?.user.id})" class="btn btn-secondary" >
            Go back
          </Link> 
          </div>
        </form>
      </div>
  </div>
</template>

<style scoped>
.form-container{
    width: 50%;
}
@media screen and (max-width: 768px){
    .form-container{
        width: 70%;
    }
}
</style>
