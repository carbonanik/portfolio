import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

showDialogAnimated({required BuildContext context, required Widget Function(BuildContext context) builder}) {
  showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scaleY: curve,
        child: builder(ctx),
      );
    },
    transitionDuration: 200.milliseconds,
  );
}