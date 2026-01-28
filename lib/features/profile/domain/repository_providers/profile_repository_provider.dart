import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speak_live_go/features/common/presentation/providers/client/client_provider.dart';
import 'package:speak_live_go/features/profile/data/data_sources/profile_data_source.dart';
import 'package:speak_live_go/features/profile/domain/data_sources/profile_data_source.dart';

final profileRepositoryProvider = Provider<ProfileDataSource>(
  (ref) => ProfileDataSourceImpl(
    ref.read(
      clientProvider,
    ),
  ),
);
