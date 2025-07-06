<script setup>
import { defineProps, ref, watch , defineModel} from 'vue';
const props = defineProps({
    members: Array,
})
const dead = defineModel('dead')
const lastNight = defineModel('lastNight')
const startOfContribution = defineModel('startOfContribution')
</script>
<template>
  <div> 
    <div class="container d-flex flex-column gap-2 justify-content-center ps-0 mb-3">
        <div class="d-flex align-items-center gap-2">
            <label>Name of dead: </label>
            <select class="form-control" v-if="props.members.length > 0" v-model="dead">
                <option :value="data" v-for="data in props.members" :key="data.id"> 
                    {{ data.first_name }} {{ data.last_name }}
                </option>
            </select>
        </div>

        <div class="d-flex align-items-center gap-2">
            <label>Enter last night: </label>
            <input type="date" class="form-control" v-model="lastNight">
        </div>

        <div class="d-flex align-items-center gap-2">
            <label>Start of contribution: </label>
            <input type="date" class="form-control" v-model="startOfContribution">
        </div>

    </div>
    <hr>
  </div>
</template>
<style>

</style>