import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/features/lobby/domain/enums/action_of_user_enum.dart';
import 'package:speak_live_go/features/lobby/presentation/widgets/slide_action.dart';

typedef OnUserAction = void Function(ActionOfUserEnum);

class AppSlideTile extends StatefulWidget {
  const AppSlideTile({
    required this.id,
    required this.child,
    required this.onAction,
    this.isInLobby = true,
    super.key,
  });

  final int id;
  final Widget child;
  final OnUserAction onAction;
  final bool isInLobby;

  @override
  State<AppSlideTile> createState() => _AppSlideTileState();
}

class _AppSlideTileState extends State<AppSlideTile>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onAction(ActionOfUserEnum v) {
      widget.onAction.call(v);
      unawaited(controller.close());
      unawaited(controller.openStartActionPane());
    }

    return Slidable(
      controller: controller,
      key: ValueKey(widget.id),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dragDismissible: false,

        children: [
          if (widget.isInLobby)
            const Spacer(
              flex: 16,
            ),
          for (final v in [
            ActionOfUserEnum.report,
            ActionOfUserEnum.bloc,
          ])
            SlideAction(
              bgColor: AppColors.cF63D4Dred,
              title: v.getTitle,
              icon: v.getIcon,
              onPressed: () => onAction.call(v),
              margin: v.isReport ? const EdgeInsets.only(right: 1) : null,
              borderRadius: v.isReport
                  ? const BorderRadius.horizontal(left: Radius.circular(10))
                  : null,
            ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          for (final v in [
            ActionOfUserEnum.toFriends,
            ActionOfUserEnum.message,
          ])
            SlideAction(
              bgColor: AppColors.c2A85F3primary,
              title: v.getTitle,
              icon: v.getIcon,
              onPressed: () => onAction.call(v),
              margin: v.isMessage ? const EdgeInsets.only(left: 1) : null,
              borderRadius: v.isMessage
                  ? const BorderRadius.horizontal(right: Radius.circular(10))
                  : null,
            ),
          if (widget.isInLobby)
            const Spacer(
              flex: 8,
            ),
        ],
      ),

      child: widget.child,
    );
  }
}
