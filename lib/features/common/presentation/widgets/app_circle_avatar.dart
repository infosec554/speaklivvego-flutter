import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    this.size = 70,
    super.key,
    this.avatarUrl,
    this.bgColor,
  });

  final double size;
  final String? avatarUrl;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    final url = kDebugMode ? 'https://i.pravatar.cc/150?img=13' : avatarUrl;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: bgColor,
        gradient: bgColor == null
            ? const LinearGradient(
                colors: [
                  AppColors.cA9CBFF,
                  AppColors.c458BE7,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        image: url != null
            ? DecorationImage(
                image: CachedNetworkImageProvider(url),
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: BorderRadius.circular(
          size / 2,
        ),
      ),
    );
  }
}
