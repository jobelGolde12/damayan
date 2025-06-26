<script setup>
import { ref, onMounted, watch, nextTick, onUnmounted, defineProps } from 'vue';
import * as echarts from 'echarts';

const props = defineProps({
  data: {
    type: Array,
    default: () => [{}, []],
  },
});

const chartRef = ref(null);
let chartInstance = null;

const monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];

const updateChart = () => {
  if (!chartInstance) return;

  const collectedMap = props.data[0] || {};
  const disbursedMap = props.data[1] || {};

  const collected = [];
  const disbursed = [];

  for (let i = 1; i <= 12; i++) {
    collected.push(collectedMap[i]?.total_collected ?? 0);
    disbursed.push(disbursedMap[i]?.total_disbursed ?? 0);
  }

  chartInstance.setOption({
    title: { text: 'Monthly Overview', left: 'center' },
    tooltip: { trigger: 'axis' },
    legend: {
      data: ['Collected', 'Disbursed'],
      top: '10%',
    },
    xAxis: { type: 'category', data: monthLabels },
    yAxis: {
      type: 'value',
      minInterval: 1,
      splitLine: { show: true },
      axisLine: { show: true },
    },
    series: [
      {
        name: 'Collected',
        type: 'bar',
        data: collected,
        itemStyle: { color: '#0000ff', borderColor: '#333', borderWidth: 1 },
        label: { show: true, position: 'top' },
      },
      {
        name: 'Disbursed',
        type: 'bar',
        data: disbursed,
        itemStyle: { color: '#00cc00', borderColor: '#333', borderWidth: 1 },
        label: { show: true, position: 'top' },
      },
    ],
  });

  chartInstance.resize();
};

watch(
  () => props.data,
  () => updateChart(),
  { immediate: true }
);

onMounted(async () => {
  await nextTick();
  if (!chartRef.value) {
    console.warn('Chart container not found');
    return;
  }

  chartInstance = echarts.init(chartRef.value);
  updateChart();
});

onUnmounted(() => {
  if (chartInstance) {
    chartInstance.dispose();
    chartInstance = null;
  }
});
</script>

<template>
  <div ref="chartRef" style="height: 300px;" class="bg-white rounded shadow-sm p-3"></div>
</template>
