import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/common/presentation/providers/app_serch_controller/app_search_controller_provider.dart';
import 'package:speak_live_go/features/initial_info/data/models/language/language_model.dart';

final AutoDisposeFutureProvider<List<LanguageModel>> languageListProvider =
    FutureProvider.autoDispose<List<LanguageModel>>(
      (ref) {
        final total = List.generate(
          24,
          (v) => LanguageModel(
            id: v,
            name: 'Language $v',
          ),
        );
        final search = ref.watch(searchQueryProvider);
        if (search.isEmpty) {
          return total;
        }
        return total.where((e) => e.name.contains(search)).toList();
      },
    );
