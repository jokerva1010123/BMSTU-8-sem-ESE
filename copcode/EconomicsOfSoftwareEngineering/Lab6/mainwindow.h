#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtCharts>
#include <QMessageBox>

#include <memory>

#include "Task1Dialog.h"

using namespace std;

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
  Q_OBJECT

public:
  MainWindow(QWidget *parent = nullptr);
  ~MainWindow();

  void calculate_COCOMO(int kloc, double c1, double c2, double p1, double p2, double eaf);

private slots:
  void on_calculate_btn_clicked();

  void on_task1_pushButton_clicked();

  void on_task2_pushButton_clicked();

private:
  Ui::MainWindow *ui;

  double labor_costs = 0;
  double time = 0;

  unique_ptr<Task1Dialog> task1_dialog;
};
#endif // MAINWINDOW_H
