import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_tap.dart';
import 'package:speak_live_go/features/contacts/domain/enums/tab_of_contacts_enum.dart';
import 'package:speak_live_go/utils/extensions/build_context/text_styles.dart';

class TabsOfContacts extends StatelessWidget implements PreferredSizeWidget {
  const TabsOfContacts({
    required this.current,
    required this.onChanged,
    super.key,
  });

  final TabOfContactsEnum current;
  final ValueChanged<TabOfContactsEnum> onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 47,
      margin: const EdgeInsets.fromLTRB(20, 13, 20, 0),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.cC3E5ED,
      ),
      child: Row(
        children: [
          for (final v in TabOfContactsEnum.values)
            Expanded(
              child: AppTap(
                onTap: () => onChanged.call(v),
                child: Builder(
                  builder: (context) {
                    final active = current == v;
                    return Container(
                      height: 39,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: active ? AppColors.c2A85F3primary : null,
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                      ),
                      child: Text(
                        v.toDisplay,
                        style: context.c2A85F3primaryColorTextStyle?.copyWith(
                          color: active ? AppColors.white : null,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}
