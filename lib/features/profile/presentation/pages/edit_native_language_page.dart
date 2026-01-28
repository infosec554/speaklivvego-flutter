import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/features/common/presentation/providers/app_serch_controller/app_search_controller_provider.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_error_widget.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_loading.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_radio_tile.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/text_fields/app_search_field.dart';
import 'package:speak_live_go/features/initial_info/data/models/language/language_model.dart';
import 'package:speak_live_go/features/initial_info/presentation/providers/language_list/language_list_provider.dart';

class EditNativeLanguagePage extends ConsumerStatefulWidget {
  const EditNativeLanguagePage({
    this.initialLanguage,
    super.key,
  });

  final LanguageModel? initialLanguage;

  @override
  ConsumerState<EditNativeLanguagePage> createState() =>
      _EditNativeLanguagePageState();
}

class _EditNativeLanguagePageState
    extends ConsumerState<EditNativeLanguagePage> {
  LanguageModel? selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.initialLanguage;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(languageListProvider);

    return Scaffold(
      appBar: const AppAppBar(
        title: 'What is your native language?',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppSearchField(
              hintText: 'Language search',
              onChanged: (v) {
                ref.read(searchQueryProvider.notifier).setQuery(v);
              },
            ),
            const HBox(20),
            Expanded(
              child: state.when(
                data: (data) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      final item = data[index];
                      final active = item == selectedLanguage;
                      return AppRadioTile(
                        onTap: () {
                          setState(() {
                            selectedLanguage = item;
                          });
                        },
                        title: item.name,
                        active: active,
                      );
                    },
                    separatorBuilder: (_, _) => const HBox(10),
                    itemCount: data.length,
                  );
                },
                error: (error, stackTrace) => AppErrorWidget(error),
                loading: () => const AppLoading(),
              ),
            ),
            const HBox(16),
            AppButton(
              title: 'Done',
              onPressed: selectedLanguage != null
                  ? () {
                      context.pop(selectedLanguage);
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
