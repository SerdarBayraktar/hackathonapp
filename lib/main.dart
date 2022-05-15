import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/route.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApplication());
}

class MyApplication extends StatefulWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(320, 568), //Iphone se 2nd
        builder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/design_route",
          routes: Routes.getAll(),
          builder: (context, widget) {
            //add this line
            //ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context)
                  .copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        ));
  }
}
