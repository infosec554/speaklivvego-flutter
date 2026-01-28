import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class WritePublicReviewStep extends ConsumerStatefulWidget {
  const WritePublicReviewStep({
    required this.onReviewChanged,
    required this.review,
    super.key,
  });

  final ValueChanged<String> onReviewChanged;
  final String review;

  @override
  ConsumerState<WritePublicReviewStep> createState() =>
      _WritePublicReviewStepState();
}

class _WritePublicReviewStepState
    extends ConsumerState<WritePublicReviewStep> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.review);
    _controller.addListener(() {
      widget.onReviewChanged(_controller.text);
    });
  }

  @override
  void didUpdateWidget(WritePublicReviewStep oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.review != widget.review &&
        _controller.text != widget.review) {
      _controller.text = widget.review;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Write a public review',
          style: context.cBlackColorTextStyle?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        const HBox(24),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.cC1E2F3disableOrDivider,
            ),
          ),
          child: TextField(
            controller: _controller,
            maxLines: 8,
            maxLength: 300,
            decoration: InputDecoration(
              hintText: 'Share your opinion',
              hintStyle: context.cACADB9TextStyle?.copyWith(fontSize: 16),
              contentPadding: const EdgeInsets.all(16),
              border: InputBorder.none,
              counterText: '${_controller.text.length}/300',
              counterStyle: context.c696969ColorTextStyle?.copyWith(
                fontSize: 14,
              ),
            ),
            style: context.cBlackColorTextStyle?.copyWith(fontSize: 16),
          ),
        ),
        const HBox(16),
        Text(
          'Your review will be visible to your partner and all other users. It will help them find their perfect match.',
          style: context.c696969ColorTextStyle?.copyWith(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

