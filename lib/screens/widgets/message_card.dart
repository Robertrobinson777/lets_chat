import 'package:flutter/material.dart';

import '../../utils/colors_constants.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    required this.isSender,
    required this.message,
    required this.time,
    super.key,
  });

  final bool isSender;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: size.width * 0.8,
          minWidth: 0.0,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isSender ? AppColors.primary : AppColors.onPrimary,
            borderRadius: BorderRadius.only(
              topLeft: isSender ? const Radius.circular(12.0) : Radius.zero,
              topRight: const Radius.circular(12.0),
              bottomLeft: const Radius.circular(12.0),
              bottomRight: isSender ? Radius.zero : const Radius.circular(12.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: isSender ? AppColors.white : AppColors.black,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: isSender
                              ? AppColors.chatOffWhite
                              : AppColors.grey,
                        ),
                  ),
                  isSender
                      ? const Icon(
                          Icons.check,
                          color: AppColors.chatOffWhite,
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
