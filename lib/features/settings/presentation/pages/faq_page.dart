import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/assets/app_icons.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';
import 'package:speak_live_go/utils/extensions/string_extensions.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  int? expandedIndex;

  final List<FAQItem> faqItems = [
    const FAQItem(
      question: 'What a Speak Live Go?',
      answer:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
    ),
    const FAQItem(
      question: 'How does Speak Live Go work?',
      answer:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    ),
    const FAQItem(
      question: 'Is Speak Live Go free?',
      answer:
          'Yes, Speak Live Go is free to use with basic features. Premium features are available with a subscription.',
    ),
    const FAQItem(
      question: 'How do I find a language partner?',
      answer:
          'You can browse through profiles in the lobby and filter by language, level, and interests.',
    ),
    const FAQItem(
      question: 'Can I change my profile information?',
      answer:
          'Yes, you can edit your profile information anytime from the profile page.',
    ),
    const FAQItem(
      question: 'How do I report inappropriate behavior?',
      answer:
          'You can report users by tapping on their profile and selecting the report option.',
    ),
    const FAQItem(
      question: 'What languages are supported?',
      answer:
          'Speak Live Go supports multiple languages. You can select your native language and English level in your profile.',
    ),
    const FAQItem(
      question: 'How do I delete my account?',
      answer:
          'You can delete your account from the Settings page. This action is permanent and cannot be undone.',
    ),
    const FAQItem(
      question: 'Can I use Speak Live Go offline?',
      answer:
          'No, Speak Live Go requires an internet connection to connect with language partners.',
    ),
    const FAQItem(
      question: 'How do I change my email?',
      answer:
          'You can change your email from the Settings page by selecting "Change email".',
    ),
    const FAQItem(
      question: 'What should I do if I forget my password?',
      answer:
          'You can reset your password from the login page by selecting "Forgot password".',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: 'FAQ',
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: faqItems.length,
        separatorBuilder: (context, index) => const HBox(10),
        itemBuilder: (context, index) {
          final item = faqItems[index];
          final isExpanded = expandedIndex == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.c2A85F3primary,
              ),
            ),
            child: Column(
              children: [
                AppTap(
                  onTap: () {
                    setState(() {
                      expandedIndex = isExpanded ? null : index;
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.question,
                          style: context.cBlackColorTextStyle?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const WBox(12),
                      Transform.rotate(
                        angle: isExpanded ? 3.14159 : 0,
                        child: AppIcons.chevronDown.toSvgAsset(
                          color: AppColors.c2A85F3primary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isExpanded) ...[
                  const HBox(5),
                  Text(
                    item.answer,
                    style: context.c696969ColorTextStyle?.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class FAQItem {
  const FAQItem({
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;
}
