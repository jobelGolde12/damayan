<script setup>
import { ref } from 'vue'
import { router, Head, Link } from '@inertiajs/vue3'
import AdminLayout from '@/Layouts/AdminLayout.vue'
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue'
const deathReport = ref('')
const scheduleContribution = ref('')
const reminders = ref('')
const fundUpdates = ref('')

// Modal states
const suggestionText = ref('')
const modalTitle = ref('')

// Example dynamic value for fund updates
const totalDisbursedAmount = ref(10500) // you can fetch this from props/api

function showSuggestion(type) {
  if (type === 'deathReport') {
    modalTitle.value = 'Death Report Suggestion'
    suggestionText.value = 
      "'We regret to inform you that [Name of Dead] has passed away. Last night will be held on [Date]. Collection for burial assistance starts on [Date].'"
  }
  else if (type === 'scheduleContribution') {
    modalTitle.value = 'Schedule Contribution Suggestion'
    suggestionText.value = 
      "'Hello [Name], thank you for paying your contribution. This message confirms your payment for the upcoming schedule.'"
  }
  else if (type === 'reminders') {
    modalTitle.value = 'Reminder Suggestion'
    suggestionText.value = 
      "'Hello, our records show you still have an unpaid balance for the contribution (Damayan). Please settle it at your earliest convenience. Thank you.'"
  }
  else if (type === 'fundUpdates') {
    modalTitle.value = 'Fund Update Suggestion'
    suggestionText.value = 
      `'Total money disbursed so far is ₱${totalDisbursedAmount.value}. Thank you for your continuous support.'`
  }
}

function save(type) {
  let payload = {}

  if (type === 'deathReport') payload.message = deathReport.value
  if (type === 'scheduleContribution') payload.message = scheduleContribution.value
  if (type === 'reminders') payload.message = reminders.value
  if (type === 'fundUpdates') payload.message = fundUpdates.value

  router.post(`/sms-notification/${type}`, payload)
}

//Copy the text in the clipboard
async function copyText(text) {
  try {
    await navigator.clipboard.writeText(text)
    alert('Text copied to clipboard!')
  } catch (err) {
    console.error('Failed to copy text: ', err)
    alert('Failed to copy text. Please try again or copy manually.')
  }
}
</script>


<template>
  <div>
    <AdminLayout>
      <Head title="Sms notification" />
      <HeaderComponent />
      <div class="container">
        <h4 class="mb-4 fw-bold sticky-header text-start ps-2 pt-3">SMS Notification</h4>

        <div class="scroll-content">
          <!-- Death Report -->
          <div class="mb-4 position-relative">
            <div class="container-fluid d-flex flex-row justify-content-between align-items-center">
              <div>
                <label for="deathReport" class="form-label">Death Report</label>
              </div>
              <div>
                <i class="bi bi-info-circle" data-bs-toggle="modal" data-bs-target="#suggestionModal" @click="showSuggestion('deathReport')"></i>
              </div>
            </div>
            <textarea v-model="deathReport" id="deathReport" class="form-control"></textarea>
            <button class="save-btn" @click="save('deathReport')">SAVE</button>
          </div>

          <!-- Schedule Contribution -->
          <div class="mb-4 position-relative">
            <div class="container-fluid d-flex flex-row justify-content-between align-items-center">
              <div>
                <label for="scheduleContribution" class="form-label">Schedule Contribution</label>
              </div>
              <div>
                <i class="bi bi-info-circle" data-bs-toggle="modal" data-bs-target="#suggestionModal" @click="showSuggestion('scheduleContribution')"></i>
              </div>
            </div>
            <textarea v-model="scheduleContribution" id="scheduleContribution" class="form-control"></textarea>
            <button class="save-btn" @click="save('scheduleContribution')">SAVE</button>
          </div>

          <!-- Reminders -->
          <div class="mb-4 position-relative">
            <div class="container-fluid d-flex flex-row justify-content-between align-items-center">
              <div>
                <label for="reminders" class="form-label">Reminders</label>
              </div>
              <div>
                <i class="bi bi-info-circle" data-bs-toggle="modal" data-bs-target="#suggestionModal" @click="showSuggestion('reminders')"></i>
              </div>
            </div>
            <textarea v-model="reminders" id="reminders" class="form-control"></textarea>
            <button class="save-btn" @click="save('reminders')">SAVE</button>
          </div>

          <!-- Fund Updates -->
          <div class="mb-4 position-relative">
            <div class="container-fluid d-flex flex-row justify-content-between align-items-center">
              <div>
                <label for="fundUpdates" class="form-label">Fund Updates</label>
              </div>
              <div>
                <i class="bi bi-info-circle" data-bs-toggle="modal" data-bs-target="#suggestionModal" @click="showSuggestion('fundUpdates')"></i>
              </div>
            </div>
            <textarea v-model="fundUpdates" id="fundUpdates" class="form-control"></textarea>
            <button class="save-btn" @click="save('fundUpdates')">SAVE</button>
          </div>
        </div>
      </div>

      <!-- Modal For suggestions -->
      <div class="modal fade" id="suggestionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5">{{ modalTitle }}</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              {{ suggestionText }}
               <span class=" text-dark rounded py-1 px-2 copy" @click="copyText(suggestionText)" title="Copy text">
                <i class="bi bi-copy"></i>
              </span>
            </div>
            <div class="modal-footer d-flex justify-content-between align-items-center ">
              <div>
                <p class="text-muted mt-3">Copy it and paste to the input field</p>
              </div>
              <div>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </AdminLayout>
  </div>
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
  position: absolute;
  bottom: 10px;
  right: 10px;
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
.copy{
  cursor: pointer;
}
</style>
