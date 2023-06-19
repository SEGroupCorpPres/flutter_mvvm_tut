import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;

  const MainButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return loading
        ? const CircularProgressIndicator.adaptive()
        : CupertinoButton(
            color: CupertinoColors.activeBlue,
            onPressed: onPressed,
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              width: 130,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: CupertinoColors.systemBackground),
              ),
            ),
          );
  }
}
