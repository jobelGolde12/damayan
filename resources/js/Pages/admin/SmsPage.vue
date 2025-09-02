<script setup>
import { ref, defineProps, watch } from 'vue'
import { router, Head } from '@inertiajs/vue3'
import AdminLayout from '@/Layouts/AdminLayout.vue'

const props = defineProps({
  deathReport: { type: Object, default: () => ({}) },
  scheduleContribution: { type: Object, default: () => ({}) },
  reminders: { type: Object, default: () => ({}) },
  fundUpdates: { type: Object, default: () => ({}) }
})

const getDeathReport = ref({})
const getScheduleContribution = ref({})
const getReminders = ref({})
const getFundUpdates = ref({})

// sync props → local refs
watch(() => props.deathReport, (d) => getDeathReport.value = d, { immediate: true })
watch(() => props.scheduleContribution, (d) => getScheduleContribution.value = d, { immediate: true })
watch(() => props.reminders, (d) => getReminders.value = d, { immediate: true })
watch(() => props.fundUpdates, (d) => getFundUpdates.value = d, { immediate: true })

// send directly to all members
const sendToAll = (type) => {
  let message = ''
  if (type === 'deathReport') message = getDeathReport.value.message
  if (type === 'scheduleContribution') message = getScheduleContribution.value.message
  if (type === 'reminders') message = getReminders.value.message
  if (type === 'fundUpdates') message = getFundUpdates.value.message

  router.post('/sms/send-to-all', { type, message })
}

// redirect to select member page
const sendToSelected = (type) => {
  let message = ''
  if (type === 'deathReport') message = getDeathReport.value.message
  if (type === 'scheduleContribution') message = getScheduleContribution.value.message
  if (type === 'reminders') message = getReminders.value.message
  if (type === 'fundUpdates') message = getFundUpdates.value.message

  router.get(route('smsNotification.selectMembers'), { type, message })
}
</script>

<template>
  <AdminLayout>
    <Head title="Sms notification" />
    <div class="container">
      <h4 class="mb-4 fw-bold sticky-header text-start ps-2 pt-3">SMS</h4>

      <div class="scroll-content">
        <!-- Death Report -->
        <div class="mb-4 position-relative">
          <label for="deathReport" class="form-label">Death Report</label>
          <textarea v-model="getDeathReport.message" id="deathReport" class="form-control"></textarea>

          <div class="container-fluid d-flex flex-row align-items-center gap-3 justify-content-end mt-3">
            <button class="save-btn text-uppercase" @click="sendToSelected('deathReport')">send to all selected</button>
            <button class="save-btn text-uppercase" @click="sendToAll('deathReport')">send</button>
          </div>
        </div>

        <!-- Schedule Contribution -->
        <div class="mb-4 position-relative">
          <label for="scheduleContribution" class="form-label">Schedule Contribution</label>
          <textarea v-model="getScheduleContribution.message" id="scheduleContribution" class="form-control"></textarea>

          <div class="container-fluid d-flex flex-row align-items-center gap-3 justify-content-end mt-3">
            <button class="save-btn text-uppercase" @click="sendToSelected('scheduleContribution')">send to all selected</button>
            <button class="save-btn text-uppercase" @click="sendToAll('scheduleContribution')">send</button>
          </div>
        </div>

        <!-- Reminders -->
        <div class="mb-4 position-relative">
          <label for="reminders" class="form-label">Reminders</label>
          <textarea v-model="getReminders.message" id="reminders" class="form-control"></textarea>

          <div class="container-fluid d-flex flex-row align-items-center gap-3 justify-content-end mt-3">
            <button class="save-btn text-uppercase" @click="sendToSelected('reminders')">send to all selected</button>
            <button class="save-btn text-uppercase" @click="sendToAll('reminders')">send</button>
          </div>
        </div>

        <!-- Fund Updates -->
        <div class="mb-4 position-relative">
          <label for="fundUpdates" class="form-label">Fund Updates</label>
          <textarea v-model="getFundUpdates.message" id="fundUpdates" class="form-control"></textarea>

          <div class="container-fluid d-flex flex-row align-items-center gap-3 justify-content-end mt-3">
            <button class="save-btn text-uppercase" @click="sendToSelected('fundUpdates')">send to all selected</button>
            <button class="save-btn text-uppercase" @click="sendToAll('fundUpdates')">send</button>
          </div>
        </div>

        <div class="container extra-space w-100"></div>
      </div>
    </div>
  </AdminLayout>
</template>

<style scoped>
.container {
  height: 100vh;
  display: flex;
  flex-direction: column;
}
.sticky-header {
  border-bottom: 2px solid #eaeaea;
  padding-bottom: 10px;
  background: white;
  position: sticky;
  top: 0;
  z-index: 10;
}
.scroll-content {
  flex: 1;
  overflow-y: auto;
  padding-right: 5px;
}
.position-relative {
  position: relative;
}
textarea.form-control {
  height: 120px;
  resize: none;
}
.save-btn {
  background-color: #16bd2f;
  border: none;
  color: white;
  padding: 6px 12px;
  border-radius: 4px;
  cursor: pointer;
}
.save-btn:hover {
  background-color: #0ad929;
}
.extra-space {
  width: 100%;
  height: 20%;
}
</style>
