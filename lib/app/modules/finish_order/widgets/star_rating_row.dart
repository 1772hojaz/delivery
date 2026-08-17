import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Interactive 5-star rating row shared by the Finish Order / Rate Food /
/// Rate Restaurant screens.
class StarRatingRow extends StatelessWidget {
  const StarRatingRow({super.key, required this.rating, required this.onChanged, this.size = 38});

  final int rating;
  final ValueChanged<int> onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final filled = index < rating;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () => onChanged(index + 1),
            child: Icon(
              filled ? Icons.star_rounded : Icons.star_border_rounded,
              color: AppColors.star,
              size: size,
            ),
          ),
        );
      }),
    );
  }
}
