<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head } from '@inertiajs/vue3';
import * as echarts from 'echarts';
import { onMounted } from 'vue';
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue';
onMounted(() => {
    // Bar Chart
    const barChart = echarts.init(document.getElementById('barChart'));
    barChart.setOption({
        title: {
            text: 'Current Month',
            left: 'center',
        },
        tooltip: {},
        xAxis: {
            data: ['Total', 'Disbursed', 'Balance']
        },
        yAxis: {},
        series: [
            {
                name: 'Amount',
                type: 'bar',
                data: [12000, 12000, 5000],
                itemStyle: {
                    color: function (params) {
                        const colors = ['#0000ff', '#ffa500', '#00cc00'];
                        return colors[params.dataIndex];
                    }
                }
            }
        ]
    });

    // Pie Chart (para sa year na chart)
const pieChart = echarts.init(document.getElementById('pieChart'));
pieChart.setOption({
    title: {
        text: 'YEAR',
        left: 'right',
        top: 10, 
        textStyle: {
            fontSize: 18,
            fontWeight: 'bold',
        
        }
    },
    tooltip: {
        trigger: 'item'
    },
    legend: {
        orient: 'vertical',
        left: 'left'
    },
    series: [
        {
            name: 'Fund Overview',
            type: 'pie',
            radius: '70%',
            center: ['50%', '60%'],
            data: [
                { value: 40000, name: 'Total Fund Collected', itemStyle: { color: '#0000ff' } },
                { value: 30000, name: 'Total Fund Disbursed', itemStyle: { color: '#00cc00' } },
                { value: 10000, name: 'Available Balance', itemStyle: { color: '#ffa500' } }
            ],
            label: {
                fontSize: 8 
            },
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
});


    // Monthly Line Chart
    const monthlyChart = echarts.init(document.getElementById('monthlyChart'));
    monthlyChart.setOption({
        title: {
            text: 'Monthly Overview',
            left: 'center'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['Total Collected', 'Total Disbursed'],
            top: '10%'
        },
        xAxis: {
            type: 'category',
            data: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name: 'Total Collected',
                type: 'bar',
                data: [40000, 30000, 35000, 45000, 30000, 40000],
                itemStyle: { color: '#0000ff' }
            },
            {
                name: 'Total Disbursed',
                type: 'bar',
                data: [30000, 25000, 30000, 35000, 20000, 30000],
                itemStyle: { color: '#00cc00' }
            }
        ]
    });
});
</script>

<template>
    <Head title="Dashboard" />

    <AdminLayout>
        <Head title="Dashboard" />
        <div class="container-fluid mx-0 px-0 home-container">
            <HeaderComponent />
            <h2 class="fw-normal fs-5 my-4">Analytics Dashboard</h2>

            <div class="row g-4">
                <!-- Left Column with Bar Chart -->
                <div class="col-md-8">
                    <div id="barChart" style="height: 300px;" class="bg-white rounded shadow-sm p-3"></div>
                </div>

                <!-- Right Column with Pie Chart -->
                <div class="col-md-4">
                    <div id="pieChart" style="height: 300px;" class="bg-white rounded shadow-sm p-3"></div>
                </div>
            </div>

            <!-- Monthly Overview Chart -->
            <div class="row mt-4">
                <div class="col-12">
                    <div id="monthlyChart" style="height: 300px;" class="bg-white rounded shadow-sm p-3"></div>
                </div>
            </div>
        </div>
    </AdminLayout>
</template>

<style scoped>
.home-container{
    width: 100%;
    height: 100%;
    overflow-x: hidden;
    overflow-y: scroll;
}
</style>