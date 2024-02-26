#ifndef TASK1DIALOG_H
#define TASK1DIALOG_H

#include <QDialog>
#include <QLogValueAxis>
#include <QLineSeries>
#include <QValueAxis>
#include <QChart>
#include <QChartView>

#include <memory>

using namespace std;

namespace Ui {
class Task1Dialog;
}

class Task1Dialog : public QDialog
{
  Q_OBJECT

public:
  explicit Task1Dialog(QWidget *parent = nullptr);
  ~Task1Dialog();

  void setup(shared_ptr<QChartView> chartView1, shared_ptr<QChartView> chartView2);
  void setup(shared_ptr<QChartView> chartView);

private:
  Ui::Task1Dialog *ui;
  //shared_ptr<QChartView> chartView;
};

#endif // TASK1DIALOG_H
