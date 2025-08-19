import 'package:flutter/material.dart';
import 'package:news_app/constants/flags_map.dart';

class FlagsMenu extends StatelessWidget {
  final String? selectedFlag;
  final ValueChanged<String> onSelected;

  const FlagsMenu({
    super.key,
    required this.selectedFlag,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      surfaceTintColor: Colors.red,
      shadowColor: Colors.black,
      icon: selectedFlag == "General"
          ? const Icon(Icons.public, color: Colors.red)
          : Text(selectedFlag!, style: const TextStyle(fontSize: 20)),
      onSelected: onSelected,
      itemBuilder: (context) {
        final items = <PopupMenuEntry<String>>[];

        for (var flag in flagsMap.keys) {
          items.add(_buildFlagItem(flag));
          if (flag != flagsMap.keys.last) {
            items.add(const PopupMenuDivider());
          }
        }

        return items;
      },
    );
  }

  PopupMenuItem<String> _buildFlagItem(String flag) {
    return PopupMenuItem(
      value: flag,
      child: Center(child: Text(flag, style: const TextStyle(fontSize: 20))),
    );
  }
}
