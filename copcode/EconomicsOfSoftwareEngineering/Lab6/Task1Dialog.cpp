#include "Task1Dialog.h"
#include "ui_Task1Dialog.h"

Task1Dialog::Task1Dialog(QWidget *parent) :
  QDialog(parent),
  ui(new Ui::Task1Dialog)
{
  ui->setupUi(this);
  //shared_ptr<QChartView> chartView = make_shared<QChartView>(this);
  //ui->horizontalLayout->addWidget(chartView.get());
}

Task1Dialog::~Task1Dialog()
{
  delete ui;
}

void Task1Dialog::setup(shared_ptr<QChartView> chartView1, shared_ptr<QChartView> chartView2)
{
  //this->chartView = chartView;
  ui->verticalLayout->addWidget(chartView1.get());
  ui->verticalLayout->addWidget(chartView2.get());
}

void Task1Dialog::setup(shared_ptr<QChartView> chartView)
{
  //this->chartView = chartView;
  ui->verticalLayout->addWidget(chartView.get());
}
