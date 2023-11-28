void main() {
  // Замыкание для сохранения общего количества заказов за день
  int totalOrders = 0;

  // Функция для создания заказа
  Map<String, dynamic> createOrder(List<Map<String, dynamic>> dishes) {
    int orderId = totalOrders++;
    return {'id': orderId, 'dishes': dishes};
  }

  // Функция для расчета общей стоимости заказа с учетом налогов и скидок
  double calculateTotal(Map<String, dynamic> order, double taxRate, Function discountFunction) {
    double subtotal = 0.0;

    // Рассчитываем сумму заказа
    for (var dish in order['dishes']) {
      subtotal += dish['price'];
    }

    // Применяем скидку, если она задана
    double discount = discountFunction(order);

    // Рассчитываем налог
    double tax = subtotal * taxRate;

    // Итоговая стоимость
    double total = subtotal + tax - discount;

    return total;
  }

  // Анонимная функция для динамического определения скидок
  var discountFunction = (Map<String, dynamic> order) {
    double totalAmount = 0.0;

    // Считаем общую сумму заказа
    for (var dish in order['dishes']) {
      totalAmount += dish['price'];
    }

    // Применяем скидку в зависимости от суммы заказа
    if (totalAmount > 50) {
      return 10.0; // Скидка 10 тенге при заказе на сумму более 50 тенге
    } else {
      return 0.0;
    }
  };

  // Пример использования функций
  var order1 = createOrder([
    {'name': 'Пицца', 'price': 25.0},
    {'name': 'Салат', 'price': 15.0},
    {'name': 'Напиток', 'price': 5.0},
  ]);

  var order2 = createOrder([
    {'name': 'Стейк', 'price': 40.0},
    {'name': 'Картошка', 'price': 20.0},
  ]);

  var total1 = calculateTotal(order1, 0.1, discountFunction);
  var total2 = calculateTotal(order2, 0.1, discountFunction);

  print('Order 1: ${order1['dishes']} - Total: $total1 тенге');
  print('Order 2: ${order2['dishes']} - Total: $total2 тенге');
}
