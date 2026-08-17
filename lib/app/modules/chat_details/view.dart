import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme_extension.dart';
import '../../core/widgets/app_back_button.dart';
import 'controller.dart';

class ChatDetailsView extends GetView<ChatDetailsController> {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = context.appColors;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
              child: Row(
                children: [
                  AppBackButton(onPressed: () => Get.back()),
                  const SizedBox(width: 14),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: controller.avatarColor.withValues(alpha: 0.16),
                        child: Text(
                          controller.avatarInitial,
                          style: AppTextStyles.bodyBold(controller.avatarColor),
                        ),
                      ),
                      if (controller.online)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreenDark,
                              shape: BoxShape.circle,
                              border: Border.all(color: ext.cardColor, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.contactName, style: AppTextStyles.bodyBold(ext.headingColor)),
                        Text(
                          controller.online ? 'Online' : 'Offline',
                          style: AppTextStyles.caption(
                            controller.online ? AppColors.primaryGreenDark : ext.mutedTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: AppColors.primaryGradient.colors.first.withValues(alpha: 0.14),
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: controller.startCall,
                      child: const SizedBox(
                        height: 44,
                        width: 44,
                        child: Icon(Icons.call_rounded, color: AppColors.primaryGreenDark, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[controller.messages.length - 1 - index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Column(
                        crossAxisAlignment:
                            message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              gradient: message.isMe ? AppColors.primaryGradient : null,
                              color: message.isMe ? null : ext.cardColor,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(18),
                                topRight: const Radius.circular(18),
                                bottomLeft: Radius.circular(message.isMe ? 18 : 4),
                                bottomRight: Radius.circular(message.isMe ? 4 : 18),
                              ),
                              boxShadow: ext.cardShadow,
                            ),
                            child: Text(
                              message.text,
                              style: AppTextStyles.bodyRegular(
                                message.isMe ? Colors.white : ext.headingColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(message.time, style: AppTextStyles.caption(ext.mutedTextColor)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: ext.searchFieldColor,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: TextField(
                        controller: controller.textController,
                        style: AppTextStyles.bodyRegular(ext.headingColor),
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Type a message...',
                          hintStyle: AppTextStyles.caption(AppColors.accentOrangeSoft),
                        ),
                        onSubmitted: (_) => controller.send(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: controller.send,
                        child: const SizedBox(
                          height: 52,
                          width: 52,
                          child: Icon(Icons.send_rounded, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
