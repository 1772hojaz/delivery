import 'package:get/get.dart';

class VoucherItem {
  const VoucherItem({
    required this.title,
    required this.description,
    required this.code,
    required this.expiry,
  });

  final String title;
  final String description;
  final String code;
  final String expiry;
}

class VoucherPromoController extends GetxController {
  final vouchers = const [
    VoucherItem(
      title: '30% Off First Order',
      description: 'Get 30% off up to \$15 on your first order from any restaurant.',
      code: 'WELCOME30',
      expiry: 'Valid until Aug 31',
    ),
    VoucherItem(
      title: 'Free Delivery',
      description: 'Free delivery on all orders above \$20, no minimum item count.',
      code: 'FREESHIP',
      expiry: 'Valid until Sep 15',
    ),
    VoucherItem(
      title: '\$5 Cashback',
      description: 'Earn \$5 cashback credited to your wallet on orders over \$25.',
      code: 'CASH5BACK',
      expiry: 'Valid until Sep 30',
    ),
    VoucherItem(
      title: 'Weekend Special 20%',
      description: '20% off every Saturday & Sunday on orders from partner restaurants.',
      code: 'WEEKEND20',
      expiry: 'Every weekend',
    ),
  ];
}
