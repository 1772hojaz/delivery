import 'package:get/get.dart';

class PaymentMethod {
  const PaymentMethod({
    required this.id,
    required this.label,
    required this.subtitle,
    required this.icon,
  });

  final String id;
  final String label;
  final String subtitle;
  final IconIdentifier icon;
}

/// Lightweight stand-in so this file doesn't need a Flutter import just for
/// an IconData type — kept as a simple enum the view maps to a real icon.
enum IconIdentifier { visa, mastercard, paypal, cash }

class PaymentsController extends GetxController {
  final methods = const [
    PaymentMethod(id: 'visa', label: 'Visa •••• 4831', subtitle: 'Expires 09/28', icon: IconIdentifier.visa),
    PaymentMethod(
      id: 'mastercard',
      label: 'Mastercard •••• 1927',
      subtitle: 'Expires 03/27',
      icon: IconIdentifier.mastercard,
    ),
    PaymentMethod(id: 'paypal', label: 'PayPal', subtitle: 'Linked account', icon: IconIdentifier.paypal),
    PaymentMethod(id: 'cash', label: 'Cash on Delivery', subtitle: 'Pay when your order arrives', icon: IconIdentifier.cash),
  ];

  final selectedId = 'visa'.obs;

  void select(String id) => selectedId.value = id;
}
