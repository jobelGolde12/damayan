<script setup>
import { useForm } from '@inertiajs/vue3';
import { Head, Link } from '@inertiajs/vue3';
import AdminLayout from '@/Layouts/AdminLayout.vue';



const form = useForm({
  name: '',
  email: '',
  role: '',
  password: '',
});

const submit = () => {
    if(form.password.length < 8){
        alert('Please provide a password with at least 8 characters.');
        return;
    }
  form.post(route('role.addUser'), {
    onSuccess: () => {
      alert('User added successfully!');
    },
    onError: (e) => {
      console.log('Failed to add user. Please check the form for errors.', e);
    },
    preserveScroll: true,
  });
};
</script>

<template>
  <AdminLayout>
    <Head title="Edit User" />

    <div class="container py-5">
      <div class="card rounded-4 p-4 border-0">
        <h4 class="mb-4 text-primary">Add User</h4>

        <form @submit.prevent="submit">
          <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input
              id="name"
              v-model="form.name"
              type="text"
              class="form-control"
              :class="{ 'is-invalid': form.errors.name }"
              placeholder="Full name"
            />
            <div class="invalid-feedback">{{ form.errors.name }}</div>
          </div>

          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input
              id="email"
              v-model="form.email"
              type="email"
              class="form-control"
              :class="{ 'is-invalid': form.errors.email }"
              placeholder="example@email.com"
            />
            <div class="invalid-feedback">{{ form.errors.email }}</div>
          </div>

          <div class="mb-3">
            <label for="role" class="form-label">Role</label>
            <select
              id="role"
              v-model="form.role"
              class="form-select"
              :class="{ 'is-invalid': form.errors.role }"
            >
              <option value="" disabled>Select Role</option>
              <option value="admin">Admin</option>  
              <option value="president">President</option>
              <option value="vice-president">Vise President</option>
              <option value="secretary">Secretary</option>
              <option value="treasurer">treasurer</option>
              <option value="purok-leader">Purok Leader</option>
              <option value="member">Member</option>

            </select>
            <div class="invalid-feedback">{{ form.errors.role }}</div>
          </div>

          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input
              id="password"
              v-model="form.password"
              type="password"
              class="form-control"
              :class="{ 'is-invalid': form.errors.password }"
              placeholder="••••••••"
            />
            <div class="invalid-feedback">{{ form.errors.password }}</div>
          </div>

          <div class="d-flex justify-content-end gap-2 mt-4">
            <Link :href="route('role.index')" class="btn btn-secondary">Cancel</Link>
            <button type="submit" class="btn btn-primary" :disabled="form.processing">
              Submit
            </button>
          </div>
        </form>
      </div>
    </div>
  </AdminLayout>
</template>

<style scoped>
input,
select {
  border-radius: 0.5rem;
}

.card {
  max-width: 700px;
  margin: auto;
  background-color: #ffffff;
}
</style>
