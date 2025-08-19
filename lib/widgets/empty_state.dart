import 'package:flutter/material.dart';


class EmptyState extends StatelessWidget {
  const EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            } else {
              return Image.asset(
                'assets/images/empty.png',
                fit: BoxFit.contain,
                width: 200,
                height: 200,
              );
            }
          },
        ),
      ),
    );
  }
}
