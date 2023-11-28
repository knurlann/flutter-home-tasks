void main() {
  // Заданные тарифы
  double upTo10KmRate = 250.0;
  double upTo20KmRate = 200.0;
  double above20KmRate = 150.0;

  // Тарифный план для разных коэффициентов
  Map<int, Map<String, double>> tariffPlan = {
    1: {'upTo10Km': upTo10KmRate, 'upTo20Km': upTo20KmRate, 'above20Km': above20KmRate},
    2: {'upTo10Km': upTo10KmRate * 2, 'upTo20Km': upTo20KmRate * 2, 'above20Km': above20KmRate * 2},
    3: {'upTo10Km': upTo10KmRate * 3, 'upTo20Km': upTo20KmRate * 3, 'above20Km': above20KmRate * 3},
  };

  // Пример использования тарифного плана
  int selectedCoefficient = 2;
  double distance = 15.0; // Пример расстояния в километрах

  double fare = calculateFare(distance, selectedCoefficient, tariffPlan);
  print('Fare for ${distance}km with coefficient $selectedCoefficient: $fare тенге');
}

double calculateFare(double distance, int coefficient, Map<int, Map<String, double>> tariffPlan) {
  double fare;

  if (distance <= 10) {
    fare = distance * tariffPlan[coefficient]!['upTo10Km']!;
  } else if (distance <= 20) {
    fare = distance * tariffPlan[coefficient]!['upTo20Km']!;
  } else {
    fare = distance * tariffPlan[coefficient]!['above20Km']!;
  }

  return fare;
}
