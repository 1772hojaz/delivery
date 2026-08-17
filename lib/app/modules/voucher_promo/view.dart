import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../routes/app_routes.dart';
import 'controller.dart';

/// "1.29 Voucher Promo" — list of voucher/promo cards, each with its own
/// "Order Now" CTA that kicks off browsing restaurants to redeem it.
class VoucherPromoView extends GetView<VoucherPromoController> {
  const VoucherPromoView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 8),
              child: Row(
                children: [
                  AppBackButton(onPressed: () => Get.back()),
                  const SizedBox(width: 16),
                  Text('Voucher & Promo', style: AppTextStyles.h3(ext.headingColor)),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                itemCount: controller.vouchers.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (_, i) => _VoucherCard(voucher: controller.vouchers[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VoucherCard extends StatelessWidget {
  const _VoucherCard({required this.voucher});

  final VoucherItem voucher;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Color(0x4015BE77), offset: Offset(0, 12), blurRadius: 26),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.local_offer_rounded, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(voucher.title, style: AppTextStyles.h4(Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(voucher.description, style: AppTextStyles.bodySmall(Colors.white).copyWith(height: 1.5)),
          const SizedBox(height: 16),
          const DottedDivider(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(voucher.code, style: AppTextStyles.overline(Colors.white).copyWith(letterSpacing: 1.5)),
                  const SizedBox(height: 4),
                  Text(voucher.expiry, style: AppTextStyles.caption(Colors.white70)),
                ],
              ),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => Get.toNamed(Routes.exploreRestaurant),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text('Order Now', style: AppTextStyles.bodyMedium(AppColors.primaryGreenDark)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Small dashed rule used between the voucher description and its code —
/// evokes the perforated coupon edge without needing a custom asset.
class DottedDivider extends StatelessWidget {
  const DottedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashCount = (constraints.maxWidth / 8).floor();
        return Row(
          children: List.generate(
            dashCount,
            (_) => const Expanded(
              child: SizedBox(
                height: 1,
                child: DecoratedBox(decoration: BoxDecoration(color: Colors.white38)),
              ),
            ),
          ).expand((w) => [w, const SizedBox(width: 4)]).toList(),
        );
      },
    );
  }
}
