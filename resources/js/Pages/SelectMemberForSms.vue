<script setup>
import { ref } from 'vue'
import { router, Head } from '@inertiajs/vue3'
import AdminLayout from '@/Layouts/AdminLayout.vue'

const props = defineProps({
  members: { type: Array, default: () => [] },
  message: { type: String, default: '' },
  type: { type: String, default: '' }
})

const selectedMembers = ref([])

const toggleSelection = (id) => {
  if (selectedMembers.value.includes(id)) {
    selectedMembers.value = selectedMembers.value.filter(m => m !== id)
  } else {
    selectedMembers.value.push(id)
  }
}

const sendToSelectedMembers = () => {
  router.post('/sms/send-to-selected', {
    type: props.type,
    message: props.message,
    members: selectedMembers.value
  })
}
</script>

<template>
  <AdminLayout>
    <Head title="Select Members" />

    <div class="container mt-4">
      <h4 class="fw-bold mb-3">Select Members for: {{ props.type }}</h4>
      <p class="mb-3"><strong>Message:</strong> {{ props.message }}</p>

      <div class="list-group">
        <div v-for="member in props.members" :key="member.id" class="list-group-item d-flex align-items-center">
          <input type="checkbox" :value="member.id" v-model="selectedMembers" class="me-2" />
          {{ member.first_name }} {{ member.last_name }}
        </div>
      </div>

      <button class="save-btn mt-3" @click="sendToSelectedMembers">Send Message</button>
    </div>
  </AdminLayout>
</template>

<style scoped>
.save-btn {
  background-color: #16bd2f;
  border: none;
  color: white;
  padding: 8px 14px;
  border-radius: 4px;
  cursor: pointer;
}
.save-btn:hover {
  background-color: #0ad929;
}
</style>
