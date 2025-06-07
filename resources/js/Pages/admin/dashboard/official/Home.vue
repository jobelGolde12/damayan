
<script setup>
import { router, Head } from '@inertiajs/vue3'
import { defineProps, ref, watch } from 'vue'
import AdminLayout from '@/Layouts/AdminLayout.vue'
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue'

const props = defineProps({
  officials: Array,
})
let getOfficials = ref([]);
watch(
() => props.officials,
(newData) => {
    getOfficials.value =  newData;
},
{immediate: true}
)
const toggleStatus = (official) => {
  router.put(`/officials/${official.id}/toggle-status`, {
    status: !official.status,
  })
}

const editOfficial = (official) => {
  router.get(route('officials.edit', {id: official}))
}

const deleteOfficial = (id) => {
  if (confirm('Are you sure you want to delete this official?')) {
    router.delete(route('officials.delete', {id: id}))
  }
}

const addOfficial = () => {
  router.get(route('officials.addOfficialRoute'))
}
const formatDate = (dateString) => {
  const options = { year: "numeric" };
  return new Date(dateString).toLocaleDateString(undefined, options);
};

</script>

<template>
  <Head title="View officials" />
    <div>
        <AdminLayout>
            <HeaderComponent />
            <div class="container mt-4">
    <h4 class="mb-4">Protect Damayan Officials</h4>
    <table class="table table-bordered table-striped" v-if="getOfficials.length > 0">
      <thead class="table-primary">
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Position</th>
          <th>Term</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="official in getOfficials" :key="official.id">
          <td>{{ official.id }}</td>
          <td>{{ official.name }}</td>
          <td>{{ official.position }}</td>
          <td>{{ formatDate(official.term_start) }} - {{ formatDate(official.term_end) }}</td>
          <td>
            <div class="form-check form-switch d-flex justify-content-center">
              <input
                class="form-check-input bg-success"
                type="checkbox"
                :checked="official.status"
                @change="toggleStatus(official)"
              />
            </div>
          </td>
          <td>
            <button class="btn btn-sm btn-outline-light me-2" @click="editOfficial(official.id)">
              <i class="bi bi-pencil"></i>
            </button>
            <button class="btn btn-sm btn-outline-light" @click="deleteOfficial(official.id)">
              <i class="bi bi-trash"></i>
            </button>
          </td>
        </tr>
      </tbody>
    </table>

    <div class="container text-center" v-else>
        <img src="../../../../../images/not_found.svg" alt="NO data" class="image-fluid no-data">
        <h5 class="text-dark fw-light">No data for official.</h5>
    </div>

            <div class="container-fluid d-flex justify-content-end">
                 <button class="btn btn-primary mt-3" @click="addOfficial">
                       Add New Official
                </button>
            </div>
  </div>
        </AdminLayout>
    </div>

</template>

<style scoped>
.no-data{
    width: 200px;
    height: 200px;
    margin: auto;
}
.bi{
  font-size: 1rem;
  color: #333;
}
.bi:hover{
  color: #517e65;
}
</style>