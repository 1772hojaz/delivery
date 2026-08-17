import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import 'controller.dart';

/// TODO: replace with the real "Voucher Promo" screen from Figma.
class VoucherPromoView extends GetView<VoucherPromoController> {
  const VoucherPromoView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      appBar: AppBar(title: Text('Voucher Promo')),
      body: Center(
        child: Text('Voucher Promo', style: AppTextStyles.h3(ext.headingColor)),
      ),
    );
  }
}
