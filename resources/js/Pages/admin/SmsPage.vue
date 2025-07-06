  <script setup>
  import { ref, defineProps, computed } from 'vue'
  import { router, Head, Link } from '@inertiajs/vue3'
  import AdminLayout from '@/Layouts/AdminLayout.vue'
  import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue'
  import { watch } from 'vue'

  const props = defineProps({
    deathReport: {
      type: Object,
      default: () => ({})
    },
    scheduleContribution: {
      type: Object,
      default: () => ({})
    },
    reminders: {
      type: Object,
      default: () => ({})
    },
    fundUpdates: {
      type: Object,
      default: () => ({})
    }
  })

  const getDeathReport = ref([]);
  const getScheduleContribution = ref([]);
  const getReminders = ref([]);
  const getFundUpdates = ref([]);

  watch(
    () => props.deathReport,
    (data) => {
      getDeathReport.value = data;
    }, 
    {immediate: true}
  )
    watch(
    () => props.scheduleContribution,
    (data) => {
     getScheduleContribution.value = data;
    }, 
    {immediate: true}
  )
    watch(
    () => props.reminders,
    (data) => {
      getReminders.value = data;
    }, 
    {immediate: true}
  )
    watch(
    () => props.fundUpdates,
    (data) => {
      getFundUpdates.value = data;
    }, 
    {immediate: true}
  )

  </script>


  <template>
    <div>
      <AdminLayout>
        <Head title="Sms notification" />
        <HeaderComponent />
        <div class="container">
          <h4 class="mb-4 fw-bold sticky-header text-start ps-2 pt-3">SMS</h4>

          <div class="scroll-content">
            <!-- Death Report -->
            <div class="mb-4 position-relative">
            <div>
                  <label for="deathReport" class="form-label">Death Report</label>
                </div>
              <textarea v-model="getDeathReport.message" id="deathReport" class="form-control"></textarea>
              <button class="save-btn" @click="save('deathReport')">SAVE</button>
            </div>

            <!-- Schedule Contribution -->
            <div class="mb-4 position-relative">
              <div>
                  <label for="scheduleContribution" class="form-label">Schedule Contribution</label>
                </div>
              <textarea v-model="getScheduleContribution.message" id="scheduleContribution" class="form-control"></textarea>
              <button class="save-btn" @click="save('scheduleContribution')">SAVE</button>
            </div>

            <!-- Reminders -->
            <div class="mb-4 position-relative">
              <div>
                  <label for="reminders" class="form-label">Reminders</label>
                </div>
              <textarea v-model="getReminders.message" id="reminders" class="form-control"></textarea>
              <button class="save-btn" @click="save('reminders')">SAVE</button>
            </div>

            <!-- Fund Updates -->
            <div class="mb-4 position-relative">
              <div>
                  <label for="fundUpdates" class="form-label">Fund Updates</label>
                </div>
              <textarea v-model="getFundUpdates.message" id="fundUpdates" class="form-control"></textarea>
              <button class="save-btn" @click="save('fundUpdates')">SAVE</button>
            </div>
        <div class="container extra-space w-100"></div>
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
  .extra-space{
    width: 100%;
    height: 20%;
  }
  </style>
