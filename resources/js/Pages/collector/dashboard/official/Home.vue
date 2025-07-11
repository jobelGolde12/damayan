
<script setup>
import { router, Head } from '@inertiajs/vue3'
import { defineProps, ref, watch } from 'vue'
import CollectorLayout from '@/Layouts/CollectorLayout.vue'

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
        <CollectorLayout>
            <div class="container mt-4">
    <h4 class="mb-4">Protect Damayan Officials</h4>
    <table class="table table-bordered table-striped" v-if="getOfficials.length > 0">
      <thead class="table-primary">
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Position</th>
          <th>Term</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="official in getOfficials" :key="official.id">
          <td>{{ official.id }}</td>
          <td>{{ official.name }}</td>
          <td>{{ official.position }}</td>
          <td>{{ formatDate(official.term_start) }} - {{ formatDate(official.term_end) }}</td>
        </tr>
      </tbody>
    </table>

    <div class="container text-center" v-else>
        <img src="../../../../../images/not_found.svg" alt="NO data" class="image-fluid no-data">
        <h5 class="text-dark fw-light">No data for official.</h5>
    </div>
  </div>
        </CollectorLayout>
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