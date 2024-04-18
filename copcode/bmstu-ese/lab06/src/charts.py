import matplotlib.pyplot as plt
from cocomo import (
    Driver,
    DRIVERS,
    DRIVERS_INDEXES,
    evaluate_project
)

def plot_employees_bar(employees: list):
    letters = ['A', 'B', 'C', 'D', 'E']
    x = letters
    bars = plt.bar(x, employees)
    ax = plt.gca()

    for i, patch in enumerate(ax.patches):
        ax.text(patch.get_x() + patch.get_width()/2.,
                1.0025 * employees[i],
                '{}'.format(int(employees[i])),
                ha='center', va='bottom')

    plt.xlabel('Стадии жизненного цикла')
    plt.ylabel('Число сотрудников')
    plt.show()


def task1(mode_index: int, kloc: float):
    drivers = [Driver.nominal for _ in range(len(DRIVERS))]
    
    results = {
        'MODP': {'work': [], 'time': []},
        'TOOL': {'work': [], 'time': []},
        'ACAP': {'work': [], 'time': []},
        'PCAP': {'work': [], 'time': []},
    }

    for modp in DRIVERS['MODP']:
        drivers[DRIVERS_INDEXES['MODP']] = modp

        work, time = evaluate_project(mode_index, drivers, kloc)

        results['MODP']['work'].append(work)
        results['MODP']['time'].append(time)

    drivers[DRIVERS_INDEXES['MODP']] = Driver.nominal

    for tool in DRIVERS['TOOL']:
        drivers[DRIVERS_INDEXES['TOOL']] = tool

        work, time = evaluate_project(mode_index, drivers, kloc)

        results['TOOL']['work'].append(work)
        results['TOOL']['time'].append(time)

    drivers[DRIVERS_INDEXES['TOOL']] = Driver.nominal

    for acap in DRIVERS['ACAP']:
        drivers[DRIVERS_INDEXES['ACAP']] = acap

        work, time = evaluate_project(mode_index, drivers, kloc)

        results['ACAP']['work'].append(work)
        results['ACAP']['time'].append(time)

    drivers[DRIVERS_INDEXES['ACAP']] = Driver.nominal

    for pcap in DRIVERS['PCAP']:
        drivers[DRIVERS_INDEXES['PCAP']] = pcap

        work, time = evaluate_project(mode_index, drivers, kloc)

        results['PCAP']['work'].append(work)
        results['PCAP']['time'].append(time)

    drivers[DRIVERS_INDEXES['PCAP']] = Driver.nominal

    __plot_task1(results)

def __plot_task1(results):
    x = ['Очень низкий', 'Низкий', 'Номинальный',
         'Высокий', 'Очень высокий']

    plt.figure(figsize=(15, 8))
    plt.suptitle('Зависимость трудёмкости и времени разработки от атрибутов персонала и проекта')

    plt.subplot(121)
    plt.plot(x, results['MODP']['work'], label='MODP')
    plt.plot(x, results['TOOL']['work'], label='TOOL')
    plt.plot(x, results['ACAP']['work'], label='ACAP')
    plt.plot(x, results['PCAP']['work'], label='PCAP')
    plt.ylabel('Трудоёмкость')
    plt.xlabel('Значение драйвера')
    plt.legend()
    plt.grid(True)

    plt.subplot(122)
    plt.plot(x, results['MODP']['time'], label='MODP')
    plt.plot(x, results['TOOL']['time'], label='TOOL')
    plt.plot(x, results['ACAP']['time'], label='ACAP')
    plt.plot(x, results['PCAP']['time'], label='PCAP')
    plt.ylabel('Время разработки')
    plt.xlabel('Значение драйвера')
    plt.legend()
    plt.grid(True)
    plt.show()

def task2():
    mode_indexes = [0, 1, 2]
    kloc = 100
    drivers = [1 for _ in range(len(DRIVERS))]

    results = {
        '0': {'work': [], 'time': []},
        '1': {'work': [], 'time': []},
        '2': {'work': [], 'time': []},
    }

    for mode_index in mode_indexes:
        work, time = evaluate_project(mode_index, drivers, kloc)

        results[str(mode_index)]['work'].append(work)
        results[str(mode_index)]['time'].append(time)
    __plot_task2(results)

def __plot_task2(results):
    x = ['Обычный', 'Промежуточный', 'Встроенный']

    plt.figure(figsize=(15, 8))
    plt.suptitle('Зависимость трудоёмкости и времени разработки от типа проекта')

    plt.subplot(121)
    plt.plot(x, [results['0']['work'], results['1']['work'], results['2']['work']], label='Трудоёмкость')
    plt.ylabel('Трудоёмкость')
    plt.xlabel('Тип проекта')
    plt.legend()
    plt.grid(True)

    plt.subplot(122)
    plt.plot(x, [results['0']['time'], results['1']['time'], results['2']['time']], label='Время разработки')
    plt.ylabel('Время разработки')
    plt.xlabel('Тип проекта')
    plt.legend()
    plt.grid(True)
    plt.show()