#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
  : QMainWindow(parent)
  , ui(new Ui::MainWindow)
{
  ui->setupUi(this);
  task1_dialog = make_unique<Task1Dialog>(this);

  ui->tableWidget->horizontalHeader()->setSectionResizeMode(QHeaderView::ResizeToContents);
  ui->tableWidget->horizontalHeader()->setStretchLastSection(true);
  ui->tableWidget->verticalHeader()->setSectionResizeMode(QHeaderView::Stretch);

  ui->tableWidget_2->horizontalHeader()->setSectionResizeMode(QHeaderView::ResizeToContents);
  ui->tableWidget_2->horizontalHeader()->setStretchLastSection(true);
  ui->tableWidget_2->verticalHeader()->setSectionResizeMode(QHeaderView::Stretch);
  ui->tableWidget_2->setColumnHidden(2,true);
}

MainWindow::~MainWindow()
{
  delete ui;
}

void MainWindow::calculate_COCOMO(int kloc, double c1, double c2, double p1, double p2, double eaf)
{
  labor_costs = c1 * eaf * powl((kloc), p1);
  time = c2 * powl(labor_costs, p2);
  labor_costs*= 1.08;
}

void MainWindow::on_calculate_btn_clicked()
{
  unsigned int kloc = ui->KLOC_spinBox->value();
  double c1 = 0, c2 = 0, p1 = 0, p2 = 0;

  if (kloc < 50)
  {
    c1 = 3.2;
    c2 = 2.5;
    p1 = 1.05;
    p2 = 0.38;
  }
  else if (kloc < 100)
  {
    c1 = 3.0;
    c2 = 2.5;
    p1 = 1.12;
    p2 = 0.35;
  }
  else
  {
    c1 = 2.8;
    c2 = 2.5;
    p1 = 1.2;
    p2 = 0.32;
  }

  double eaf = ui->RELY_doubleSpinBox->value() * ui->DATA_doubleSpinBox->value() * ui->CPLX_doubleSpinBox->value() *
               ui->TIME_doubleSpinBox->value() * ui->STOR_doubleSpinBox->value() * ui->VIRT_doubleSpinBox->value() *
               ui->TURN_doubleSpinBox->value() * ui->ACAP_doubleSpinBox->value() * ui->AEXP_doubleSpinBox->value() *
               ui->PCAP_doubleSpinBox->value() * ui->VEXP_doubleSpinBox->value() * ui->LEXP_doubleSpinBox->value() *
               ui->MODP_doubleSpinBox->value() * ui->TOOL_doubleSpinBox->value() * ui->SCED_doubleSpinBox->value();

  labor_costs = c1 * eaf * powl((kloc), p1);
  time = c2 * powl(labor_costs, p2);

  ui->tableWidget->setItem(0, 1, new QTableWidgetItem(QString::number(labor_costs * 0.08)));
  ui->tableWidget->setItem(1, 1, new QTableWidgetItem(QString::number(labor_costs * 0.18)));
  ui->tableWidget->setItem(2, 1, new QTableWidgetItem(QString::number(labor_costs * 0.25)));
  ui->tableWidget->setItem(3, 1, new QTableWidgetItem(QString::number(labor_costs * 0.26)));
  ui->tableWidget->setItem(4, 1, new QTableWidgetItem(QString::number(labor_costs * 0.31)));
  ui->tableWidget->setItem(5, 1, new QTableWidgetItem(QString::number(labor_costs)));
  ui->tableWidget->setItem(6, 1, new QTableWidgetItem(QString::number(labor_costs * 1.08)));

  ui->tableWidget->setItem(0, 3, new QTableWidgetItem(QString::number(time * 0.36)));
  ui->tableWidget->setItem(1, 3, new QTableWidgetItem(QString::number(time * 0.36)));
  ui->tableWidget->setItem(2, 3, new QTableWidgetItem(QString::number(time * 0.18)));
  ui->tableWidget->setItem(3, 3, new QTableWidgetItem(QString::number(time * 0.18)));
  ui->tableWidget->setItem(4, 3, new QTableWidgetItem(QString::number(time * 0.28)));
  ui->tableWidget->setItem(5, 3, new QTableWidgetItem(QString::number(time)));
  ui->tableWidget->setItem(6, 3, new QTableWidgetItem(QString::number(time * 1.36)));

  labor_costs*= 1.08;

  ui->tableWidget_2->setItem(0, 1, new QTableWidgetItem(QString::number(labor_costs * 0.04)));
  ui->tableWidget_2->setItem(1, 1, new QTableWidgetItem(QString::number(labor_costs * 0.12)));
  ui->tableWidget_2->setItem(2, 1, new QTableWidgetItem(QString::number(labor_costs * 0.44)));
  ui->tableWidget_2->setItem(3, 1, new QTableWidgetItem(QString::number(labor_costs * 0.06)));
  ui->tableWidget_2->setItem(4, 1, new QTableWidgetItem(QString::number(labor_costs * 0.14)));
  ui->tableWidget_2->setItem(5, 1, new QTableWidgetItem(QString::number(labor_costs * 0.07)));
  ui->tableWidget_2->setItem(6, 1, new QTableWidgetItem(QString::number(labor_costs * 0.07)));
  ui->tableWidget_2->setItem(7, 1, new QTableWidgetItem(QString::number(labor_costs * 0.06)));
  ui->tableWidget_2->setItem(8, 1, new QTableWidgetItem(QString::number(labor_costs * 1.00)));
}

void MainWindow::on_task1_pushButton_clicked()
{
  unsigned int kloc = ui->KLOC_spinBox->value();
  double c1 = 0, c2 = 0, p1 = 0, p2 = 0;

  if (kloc < 50)
  {
    c1 = 3.2;
    c2 = 2.5;
    p1 = 1.05;
    p2 = 0.38;
  }
  else if (kloc < 100)
  {
    c1 = 3.0;
    c2 = 2.5;
    p1 = 1.12;
    p2 = 0.35;
  }
  else
  {
    c1 = 2.8;
    c2 = 2.5;
    p1 = 1.2;
    p2 = 0.32;
  }

  shared_ptr<QChartView> labor_costs_chartView = make_shared<QChartView>(this);
  shared_ptr<QChartView> time_chartView = make_shared<QChartView>(this);

  //ACAP
  QLineSeries *labor_costs_series1 = new QLineSeries();
  labor_costs_series1->setName("ACAP");
  //QLineSet *labor_costs_set = new QLineSet();
  QLineSeries *time_series1 = new QLineSeries();
  time_series1->setName("ACAP");
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.46);
  *labor_costs_series1 << QPointF(0, labor_costs);
  *time_series1 << QPointF(0, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.19);
  *labor_costs_series1 << QPointF(0.2, labor_costs);
  *time_series1 << QPointF(0.2, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.0);
  *labor_costs_series1 << QPointF(0.4, labor_costs);
  *time_series1 << QPointF(0.4, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 0.86);
  *labor_costs_series1 << QPointF(0.6, labor_costs);
  *time_series1 << QPointF(0.6, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 0.71);
  *labor_costs_series1 << QPointF(0.8, labor_costs);
  *time_series1 << QPointF(0.8, time);

  //PCAP
  QLineSeries *labor_costs_series2 = new QLineSeries();
  labor_costs_series2->setName("PCAP");
  QLineSeries *time_series2 = new QLineSeries();
  time_series2->setName("PCAP");
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.42);
  *labor_costs_series2 << QPointF(0, labor_costs);
  *time_series2 << QPointF(0, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.17);
  *labor_costs_series2 << QPointF(0.2, labor_costs);
  *time_series2 << QPointF(0.2, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.0);
  *labor_costs_series2 << QPointF(0.4, labor_costs);
  *time_series2 << QPointF(0.4, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 0.86);
  *labor_costs_series2 << QPointF(0.6, labor_costs);
  *time_series2 << QPointF(0.6, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 0.70);
  *labor_costs_series2 << QPointF(0.8, labor_costs);
  *time_series2 << QPointF(0.8, time);

  //MODP
  QLineSeries *labor_costs_series3 = new QLineSeries();
  labor_costs_series3->setName("MODP");
  QLineSeries *time_series3 = new QLineSeries();
  time_series3->setName("MODP");
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.24);
  *labor_costs_series3 << QPointF(0, labor_costs);
  *time_series3 << QPointF(0, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.1);
  *labor_costs_series3 << QPointF(0.2, labor_costs);
  *time_series3 << QPointF(0.2, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.0);
  *labor_costs_series3 << QPointF(0.4, labor_costs);
  *time_series3 << QPointF(0.4, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 0.91);
  *labor_costs_series3 << QPointF(0.6, labor_costs);
  *time_series3 << QPointF(0.6, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 0.82);
  *labor_costs_series3 << QPointF(0.8, labor_costs);
  *time_series3 << QPointF(0.8, time);

  //TOOL
  QLineSeries *labor_costs_series4 = new QLineSeries();
  labor_costs_series4->setName("TOOL");
  QLineSeries *time_series4 = new QLineSeries();
  time_series4->setName("TOOL");
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.24);
  *labor_costs_series4 << QPointF(0, labor_costs);
  *time_series4 << QPointF(0, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.1);
  *labor_costs_series4 << QPointF(0.2, labor_costs);
  *time_series4 << QPointF(0.2, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 1.0);
  *labor_costs_series4 << QPointF(0.4, labor_costs);
  *time_series4 << QPointF(0.4, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 0.91);
  *labor_costs_series4 << QPointF(0.6, labor_costs);
  *time_series4 << QPointF(0.6, time);
  calculate_COCOMO(kloc, c1, c2, p1, p2, 0.82);
  *labor_costs_series4 << QPointF(0.8, labor_costs);
  *time_series4 << QPointF(0.8, time);

  // 1 labor_costs_chart
  QChart *labor_costs_chart = new QChart();
  labor_costs_chart->addSeries(labor_costs_series1);
  labor_costs_chart->addSeries(labor_costs_series2);
  labor_costs_chart->addSeries(labor_costs_series3);
  labor_costs_chart->addSeries(labor_costs_series4);

  // Настройка осей графика 1
  QValueAxis *axisX1 = new QValueAxis();
  axisX1->setTitleText("Значения драйверов затрат в модели COCOMO от низких к высоким");
  labor_costs_chart->addAxis(axisX1, Qt::AlignBottom);
  labor_costs_series1->attachAxis(axisX1);
  labor_costs_series2->attachAxis(axisX1);
  labor_costs_series3->attachAxis(axisX1);
  labor_costs_series4->attachAxis(axisX1);

  /*QStringList categories;
  categories << "Очень низкий" << "Низкий" << "Номинальный" << "Высокий" << "Очень высокий";
  //QValueAxis *axisX1 = new QValueAxis();
  QBarCategoryAxis *axisX11 = new QBarCategoryAxis();
  axisX11->setTitleText("Значения драйверов затрат в модели COCOMO от низких к высоким");
  axisX11->append(categories);
  labor_costs_chart->addAxis(axisX11, Qt::AlignBottom);*/

  QValueAxis *axisY1 = new QValueAxis();
  axisY1->setTitleText("Трудозатраты");
  //axisY1->setLabelFormat("%g");
  //axisY1->setTickCount(5);
  labor_costs_chart->addAxis(axisY1, Qt::AlignLeft);
  labor_costs_series1->attachAxis(axisY1);
  labor_costs_series2->attachAxis(axisY1);
  labor_costs_series3->attachAxis(axisY1);
  labor_costs_series4->attachAxis(axisY1);

  // 2 time_chart
  QChart *time_chart = new QChart();
  time_chart->addSeries(time_series1);
  time_chart->addSeries(time_series2);
  time_chart->addSeries(time_series3);
  time_chart->addSeries(time_series4);

  //  Настройка осей графика 2
  QValueAxis *axisX2 = new QValueAxis();
  axisX2->setTitleText("Значения драйверов затрат в модели COCOMO от низких к высоким");
  //axisX2->setLabelFormat("%i");
  //axisX2->setTickCount(1);
  time_chart->addAxis(axisX2, Qt::AlignBottom);
  time_series1->attachAxis(axisX2);
  time_series2->attachAxis(axisX2);
  time_series3->attachAxis(axisX2);
  time_series4->attachAxis(axisX2);

  QValueAxis *axisY2 = new QValueAxis();
  axisY2->setTitleText("Время");
  //axisY2->setLabelFormat("%g");
  //axisY2->setTickCount(5);
  time_chart->addAxis(axisY2, Qt::AlignLeft);
  time_series1->attachAxis(axisY2);
  time_series2->attachAxis(axisY2);
  time_series3->attachAxis(axisY2);
  time_series4->attachAxis(axisY2);

  labor_costs_chartView->setChart(labor_costs_chart);
  time_chartView->setChart(time_chart);

  task1_dialog->setup(labor_costs_chartView, time_chartView);
  task1_dialog->exec();
}


void MainWindow::on_task2_pushButton_clicked()
{
  on_calculate_btn_clicked();
  try
  {
    shared_ptr<QChartView> chartView = make_shared<QChartView>(this);

    QBarSeries *series = new QBarSeries();
    QBarSet *set = new QBarSet("set");
    *set << ui->tableWidget->item(0, 1)->text().toDouble()/ui->tableWidget->item(0, 3)->text().toDouble() <<
            ui->tableWidget->item(1, 1)->text().toDouble()/ui->tableWidget->item(1, 3)->text().toDouble() <<
            ui->tableWidget->item(2, 1)->text().toDouble()/ui->tableWidget->item(2, 3)->text().toDouble() <<
            ui->tableWidget->item(3, 1)->text().toDouble()/ui->tableWidget->item(3, 3)->text().toDouble() <<
            ui->tableWidget->item(4, 1)->text().toDouble()/ui->tableWidget->item(4, 3)->text().toDouble();
    series->append(set);

    QChart *chart = new QChart();
    chart->legend()->hide();
    chart->addSeries(series);
    chart->setAnimationOptions(QChart::SeriesAnimations);

    QStringList categories;
    categories << "Планирование и определение требований" << "Проектирование продукта" << "Детальное проектирование" <<
                  "Кодирование и тестирование отдельных модулей" << "Интеграция и тестирование";
    QBarCategoryAxis *axisX = new QBarCategoryAxis();
    axisX->setTitleText("Этапы");
    axisX->append(categories);
    chart->addAxis(axisX, Qt::AlignBottom);
    series->attachAxis(axisX);

    QValueAxis *axisY = new QValueAxis();
    axisY->setTitleText("Работники");
    //axisY->setRange(0,15);
    chart->addAxis(axisY, Qt::AlignLeft);
    series->attachAxis(axisY);

    chartView->setChart(chart);

    task1_dialog->setup(chartView);
    task1_dialog->exec();
  }
  catch (...)
  {
    QMessageBox::warning(this, "Error" ,"Error");
  }
}

