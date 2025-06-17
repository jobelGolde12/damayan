<script setup>
import { defineProps, ref, watch } from 'vue';
import { router } from '@inertiajs/vue3';
const props = defineProps({
    activeStatus: {
        type: String,
        default: 'paid'
    }   
});
let getActiveStatus = ref('paid');
watch(() => props.activeStatus, (newStatus) => {
    getActiveStatus.value = newStatus;
}, { immediate: true });
const toggleStatusFunc = (status) => {
    getActiveStatus.value = status;
    router.get(route('collector.toggleStatus', { status: status }));
};
</script>
<template>
    <div>
        <div class="container-fluid d-flex gap-2 align-items-center">
            <div>
                <h5 
                class="choice" 
                :class="{'active': getActiveStatus == 'paid'}"
                @click="toggleStatusFunc('paid')">
                PAID</h5>
            </div>
             <div>
                <h5 class="choice" 
                :class="{'active': getActiveStatus != 'paid'}"
                @click="toggleStatusFunc('not_paid')">
                UPAID</h5>
            </div>
        </div>
    </div>
</template>



<style lang="css" scoped>
.choice{
    font-size: 1rem;
    cursor: pointer
}
.choice:hover {
    color: #007bff;
    text-decoration: underline;
}
.choice.active {
    color: #0CF32F;
    font-weight: bold;
}
</style>