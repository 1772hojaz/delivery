import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme_extension.dart';

/// The rounded peach/dark search bar paired with a filter icon button,
/// as seen on Home / Explore Restaurant / Explore Menu.
class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    this.hintText = 'What do you want to order?',
    this.controller,
    this.onFilterTap,
    this.showFilter = true,
  });

  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onFilterTap;
  final bool showFilter;

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: ext.searchFieldColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Icon(Icons.search_rounded, color: AppColors.accentOrange, size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: AppTextStyles.bodyRegular(ext.headingColor),
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: AppTextStyles.caption(AppColors.accentOrangeSoft),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showFilter) ...[
          const SizedBox(width: 12),
          Material(
            color: ext.searchFieldColor,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: onFilterTap,
              child: const SizedBox(
                height: 56,
                width: 56,
                child: Icon(Icons.tune_rounded, color: AppColors.accentOrange, size: 22),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
