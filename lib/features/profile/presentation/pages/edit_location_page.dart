import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speak_live_go/features/common/presentation/providers/app_serch_controller/app_search_controller_provider.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_app_bar.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_error_widget.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_gap.dart';
import 'package:speak_live_go/features/common/presentation/widgets/app_radio_tile.dart';
import 'package:speak_live_go/features/common/presentation/widgets/buttons/app_button.dart';
import 'package:speak_live_go/features/common/presentation/widgets/text_fields/app_search_field.dart';

// Mock location provider - replace with actual location provider
final locationListProvider = FutureProvider.autoDispose<List<String>>(
  (ref) async {
    final locations = [
      'New York',
      'London',
      'Tokyo',
      'Paris',
      'Sydney',
      'Berlin',
      'Moscow',
      'Dubai',
      'Singapore',
      'Toronto',
      'Los Angeles',
      'Chicago',
      'Houston',
      'Miami',
      'Seattle',
      'Boston',
      'San Francisco',
      'Washington',
      'Atlanta',
      'Denver',
    ];
    final search = ref.watch(searchQueryProvider);
    if (search.isEmpty) {
      return locations;
    }
    return locations
        .where((e) => e.toLowerCase().contains(search.toLowerCase()))
        .toList();
  },
);

class EditLocationPage extends ConsumerStatefulWidget {
  const EditLocationPage({
    this.initialLocation,
    super.key,
  });

  final String? initialLocation;

  @override
  ConsumerState<EditLocationPage> createState() => _EditLocationPageState();
}

class _EditLocationPageState extends ConsumerState<EditLocationPage> {
  String? selectedLocation;

  @override
  void initState() {
    super.initState();
    selectedLocation = widget.initialLocation;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(locationListProvider);

    return Scaffold(
      appBar: const AppAppBar(
        title: 'Location',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppSearchField(
              hintText: 'Location search',
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
                      final active = item == selectedLocation;
                      return AppRadioTile(
                        onTap: () {
                          setState(() {
                            selectedLocation = item;
                          });
                        },
                        title: item,
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
              onPressed: selectedLocation != null
                  ? () {
                      context.pop(selectedLocation);
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

