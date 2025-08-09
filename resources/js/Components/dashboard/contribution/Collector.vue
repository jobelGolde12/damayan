
<script setup>
import { defineProps, ref } from 'vue';

const props = defineProps({
  collectors: {
    type: Array,
    default: () => [],
  },
  purok: {
    type: String,
    default: '',
  },
});
const currentCollector = ref("");

if(props.collectors.length != 0 && props.purok != ''){
    currentCollector.value = props.collectors.find(collector => collector.purok === props.purok.slice(-1))?.name || 'N/A';
    } else {
    currentCollector.value = 'N/A';
}
</script>

<template>
    <div>
        <p>{{ currentCollector }}</p>
    </div>
</template>

<style lang="css" scoped>

</style>