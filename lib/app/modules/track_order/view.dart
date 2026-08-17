import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import '../../core/widgets/primary_button.dart';
import 'controller.dart';

/// "1.38 Track Order". No real maps SDK is used (this is a UI-kit clone) —
/// the map is a styled placeholder: a soft green/tan gradient with a
/// hand-drawn dashed route line and a delivery icon riding along it.
class TrackOrderView extends GetView<TrackOrderController> {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pageBg = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final sheetHeight = MediaQuery.of(context).size.height * 0.5;

    return Scaffold(
      backgroundColor: pageBg,
      body: Stack(
        children: [
          const Positioned.fill(child: _RouteMapPlaceholder()),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 20,
            child: AppBackButton(onPressed: () => Get.back()),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: sheetHeight,
            child: Container(
              decoration: BoxDecoration(
                color: ext.cardColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                boxShadow: ext.cardShadow,
              ),
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.delivery_dining_rounded, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.driverName, style: AppTextStyles.bodyBold(ext.headingColor)),
                            const SizedBox(height: 2),
                            Text('Arriving in ${controller.eta}', style: AppTextStyles.bodySmall(ext.mutedTextColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < controller.steps.length; i++)
                            _TimelineRow(
                              step: controller.steps[i],
                              isLast: i == controller.steps.length - 1,
                              isDone: i <= controller.currentStep.value,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(label: 'Finish Order', onPressed: controller.finishOrder),
                ],
              ),
            ),
          ),
          Positioned(
            right: 24,
            bottom: sheetHeight - 28,
            child: Column(
              children: [
                _FloatingActionCircle(icon: Icons.chat_bubble_rounded, onTap: controller.messageDriver),
                const SizedBox(height: 12),
                _FloatingActionCircle(icon: Icons.call_rounded, onTap: controller.callDriver),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.step, required this.isLast, required this.isDone});

  final TrackStep step;
  final bool isLast;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    final tint = isDone ? AppColors.primaryGreenDark : ext.mutedTextColor;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(
                isDone ? Icons.check_circle_rounded : Icons.circle_outlined,
                size: 20,
                color: tint,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: isDone ? AppColors.primaryGreenDark.withValues(alpha: 0.4) : ext.mutedTextColor.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(step.label, style: AppTextStyles.bodyMedium(ext.headingColor)),
                  const SizedBox(height: 2),
                  Text(step.time, style: AppTextStyles.caption(ext.mutedTextColor)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingActionCircle extends StatelessWidget {
  const _FloatingActionCircle({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 6,
      shadowColor: Colors.black26,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          height: 52,
          width: 52,
          decoration: const BoxDecoration(gradient: AppColors.primaryGradient, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}

/// Decorative stand-in for a live map: a soft diagonal gradient with a
/// dashed route line and a delivery icon riding along it. No map SDK.
class _RouteMapPlaceholder extends StatelessWidget {
  const _RouteMapPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryGreenLight.withValues(alpha: 0.35),
            const Color(0xFFF3E7D0),
          ],
        ),
      ),
      child: CustomPaint(
        painter: _RoutePainter(),
        child: const Align(
          alignment: Alignment(0.05, -0.05),
          child: _DriverPuck(),
        ),
      ),
    );
  }
}

class _DriverPuck extends StatelessWidget {
  const _DriverPuck();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6))],
      ),
      child: const Icon(Icons.two_wheeler_rounded, color: AppColors.primaryGreenDark, size: 26),
    );
  }
}

class _RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(size.width * 0.18, size.height * 0.78);
    final end = Offset(size.width * 0.55, size.height * 0.45);
    final control = Offset(size.width * 0.2, size.height * 0.35);

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);

    final dashPaint = Paint()
      ..color = AppColors.primaryGreenDark.withValues(alpha: 0.6)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _drawDashedPath(canvas, path, dashPaint);

    final pinPaint = Paint()..color = AppColors.accentOrange;
    canvas.drawCircle(start, 7, pinPaint);
    canvas.drawCircle(start, 7, Paint()..color = Colors.white..style = PaintingStyle.stroke..strokeWidth = 2.5);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    const dashWidth = 8.0;
    const dashSpace = 6.0;
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        final segmentEnd = next < metric.length ? next : metric.length;
        canvas.drawPath(metric.extractPath(distance, segmentEnd), paint);
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
