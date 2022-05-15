import 'package:flutter/material.dart';
import 'package:hackathon/constants/colors.dart';

class MainLayout extends StatelessWidget {
  final AppBar? appbar;

  final Widget? content;
  final Widget? navigationBar;
  final Widget? bottomSheet;
  final String? imagePath;
  final EdgeInsetsGeometry? padding;
  final FloatingActionButton? button;

  MainLayout(
      {Key? key,
        this.appbar,
        this.button,
      this.content,
      this.navigationBar,
      this.bottomSheet,
      this.imagePath,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar == null ? null : appbar!,
      backgroundColor: AppColors.dark_blue,
      body: Stack(
        children: [
          imagePath == null
              ? SizedBox()
              : Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imagePath!), fit: BoxFit.cover),
                  ),
                ),
          SafeArea(
            child: Container(
              padding: padding,
              child: content ?? Container(),
            ),
          ),
        ],
      ),
      floatingActionButton: button,
      bottomNavigationBar: navigationBar,
      bottomSheet: bottomSheet,
    );
  }
}
