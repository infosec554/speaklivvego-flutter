import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/auth/presentation/widgets/step_skeleton.dart';
import 'package:speak_live_go/features/common/presentation/providers/app_serch_controller/app_search_controller_provider.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_error_widget.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_radio_tile.dart';
import 'package:speak_live_go/features/common/presentation/widgets/text_fields/app_search_field.dart';
import 'package:speak_live_go/features/initial_info/data/models/language/language_model.dart';
import 'package:speak_live_go/features/initial_info/presentation/providers/language_list/language_list_provider.dart';

class ChooseLanguageStep extends ConsumerWidget {
  const ChooseLanguageStep({
    required this.title,
    required this.onChangeLanguage,
    required this.onContinue,
    super.key,
    this.currentLanguage,
  });

  final LanguageModel? currentLanguage;
  final ValueChanged<LanguageModel> onChangeLanguage;
  final VoidCallback? onContinue;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(languageListProvider);
    return StepSkeleton(
      title: title,
      onContinue: onContinue,
      children: [
        AppSearchField(
          hintText: 'Language search',
          onChanged: (v) {
            ref.read(searchQueryProvider.notifier).setQuery(v);
          },
        ),

        state.when(
          data: (data) {
            return Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context, index) {
                  final item = data[index];
                  final active = item == currentLanguage;
                  return AppRadioTile(
                    onTap: () => onChangeLanguage(item),
                    title: item.name,
                    active: active,
                  );
                },
                separatorBuilder: (_, _) => const HBox(10),
                itemCount: data.length,
              ),
            );
          },
          error: (error, stackTrace) => AppErrorWidget(error),
          loading: () => const AppLoading(),
        ),
      ],
    );
  }
}
