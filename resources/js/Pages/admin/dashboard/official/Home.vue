
<script setup>
import { router } from '@inertiajs/vue3'
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
  router.get(`/officials/${official.id}/edit`)
}

const deleteOfficial = (id) => {
  if (confirm('Are you sure you want to delete this official?')) {
    router.delete(`/officials/${id}`)
  }
}

const addOfficial = () => {
  router.get('/officials/create')
}
</script>

<template>
    <div>
        <AdminLayout>
            <HeaderComponent />
            <div class="container mt-4">
    <h3 class="mb-4">Protect Damayan Officials</h3>
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
          <td>{{ official.term_start }} - {{ official.term_end }}</td>
          <td>
            <div class="form-check form-switch">
              <input
                class="form-check-input"
                type="checkbox"
                :checked="official.status"
                @change="toggleStatus(official)"
              />
            </div>
          </td>
          <td>
            <button class="btn btn-sm btn-warning me-2" @click="editOfficial(official)">
              ✏️
            </button>
            <button class="btn btn-sm btn-danger" @click="deleteOfficial(official.id)">
              🗑️
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
</style>