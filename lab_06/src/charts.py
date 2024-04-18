import matplotlib.pyplot as plt
from cocomo import (
    Driver,
    DRIVERS,
    DRIVERS_INDEXES,
    evaluate_project
)
project_modes = {
    'c1': [3.2, 3.0, 2.8],
    'p1': [1.05, 1.12, 1.2],
    
    'c2': [2.5, 2.5, 2.5],
    'p2': [0.38, 0.35, 0.32]
}
params_table = {
    'RELY': [0.75, 0.86, 1.0, 1.15, 1.40],
    'DATA': [0.94, 1.0, 1.08, 1.16],
    'CPLX': [0.70, 0.85, 1.0, 1.15, 1.30],

    'TIME': [1.0, 1.11, 1.50],
    'STOR': [1.0, 1.06, 1.21],

    'VIRT': [0.87, 1.0, 1.15, 1.30],
    'TURN': [0.87, 1.0, 1.07, 1.15],

    'ACAP': [1.46, 1.19, 1.0, 0.86, 0.71],
    'AEXP': [1.29, 1.15, 1.0, 0.91, 0.82],
    'PCAP': [1.42, 1.17, 1.0, 0.86, 0.70],

    'VEXP': [1.21, 1.10, 1.0, 0.90],
    'LEXP': [1.14, 1.07, 1.0, 0.95],

    'MODP': [1.24, 1.10, 1.0, 0.91, 0.82],
    'TOOL': [1.24, 1.10, 1.0, 0.91, 0.82],
    'SCED': [1.23, 1.08, 1.0, 1.04, 1.10],
}
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

class Task1():
    def __init__(self, mode, size):
        self.mode = mode
        self.RELY = 1
        self.DATA = 1
        self.CPLX = 1
        self.TIME = 1
        self.STOR = 1
        self.VIRT = 1
        self.TURN = 1
        self.ACAP = 1
        self.AEXP = 1
        self.PCAP = 1
        self.VEXP = 1
        self.LEXP = 1
        self.MODP = 1
        self.TOOL = 1
        self.SCED = 1
        self.SIZE = size
    
    
    def EAF(self):
        return self.RELY * self.DATA * self.CPLX * self.TIME * self.STOR * \
               self.VIRT * self.TURN * self.ACAP * self.AEXP * self.PCAP * \
               self.VEXP * self.LEXP * self.MODP * self.TOOL * self.SCED
    
    
    def PM(self):
        return project_modes['c1'][self.mode] * self.EAF() * (self.SIZE ** project_modes['p1'][self.mode])


    def TM(self):
        return project_modes['c2'][self.mode] * (self.PM() ** project_modes['p2'][self.mode])
    

    def getComplexity(self, levelComplexity):
        if levelComplexity == 0:
            complexity = "очень низкая"
        elif levelComplexity == 4:
            complexity = "очень высокая"
        else:
            complexity = "номинальная"

        return complexity
    

    def buildGraph(self, x, y_pm, y_tm, levelComplexity):
        plt.figure(figsize=(14, 6))
        plt.suptitle("Исследование влияния атрибутов персонала на "
                     "трудозатраты и время разработки (Сложность: {})"\
                        .format(self.getComplexity(levelComplexity)))
        
        plt.subplot(121)
        plt.plot(x, y_pm[0], label='ACAP-Способности аналитика')
        plt.plot(x, y_pm[1], label='PCAP- Способности программиста')
        plt.plot(x, y_pm[2], label='AEXP - Знание приложений')
        plt.plot(x, y_pm[3], label='LEXP - Знание языка программирования')
        plt.ylabel('Трудозатраты(человек-месяц)')
        plt.xlabel('Уровень фактора')
        plt.legend()
        plt.grid(True)

        plt.subplot(122)
        plt.plot(x, y_tm[0], label='ACAP-Способности аналитика')
        plt.plot(x, y_tm[1], label='PCAP- Способности программиста')
        plt.plot(x, y_tm[2], label='AEXP - Знание приложений')
        plt.plot(x, y_tm[3], label='LEXP - Знание языка программирования')
        plt.ylabel('Время разработки (месяц)')
        plt.xlabel('Уровень фактора')
        plt.legend()
        plt.grid(True)
        plt.show()


    def exploreAttributes(self):
        for i in [0, 2, 4]: # уровень сложности проекта
            self.CPLX = params_table['CPLX'][i]

            y_pm_acap = []
            y_pm_pcap = []
            y_pm_aexp = []
            y_pm_lexp = []

            y_tm_acap = []
            y_tm_pcap = []
            y_tm_aexp = []
            y_tm_lexp = []
            
            for j in range(4):
                self.ACAP = params_table['ACAP'][j]
                y_pm_acap.append(self.PM())
                y_tm_acap.append(self.TM())
            self.ACAP = 1

            for j in range(4):
                self.PCAP = params_table['PCAP'][j]
                y_pm_pcap.append(self.PM())
                y_tm_pcap.append(self.TM())
            self.PCAP = 1

            for j in range(4):
                self.AEXP = params_table['AEXP'][j]
                y_pm_aexp.append(self.PM())
                y_tm_aexp.append(self.TM())
            self.AEXP = 1

            for j in range(4):
                self.LEXP = params_table['LEXP'][j]
                y_pm_lexp.append(self.PM())
                y_tm_lexp.append(self.TM())
            self.LEXP = 1

            x = ['Очень низкий', 'Низкий', 'Номинальный', 'Высокий']
            y_pm = [y_pm_acap, y_pm_pcap, y_pm_aexp, y_pm_lexp]
            y_tm = [y_tm_acap, y_tm_pcap, y_tm_aexp, y_tm_lexp]
            
            self.buildGraph(x, y_pm, y_tm, i)
