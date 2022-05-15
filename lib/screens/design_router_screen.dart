import 'package:flutter/material.dart';
import 'package:hackathon/route.dart';

class DesignRouterScreen extends StatelessWidget {
  const DesignRouterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, Widget Function(BuildContext)> routes = Routes.getAll();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...routes.keys.map((e) => ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, e),
                child: Text(e),
              ))
        ],
      ),
    );
  }
}
