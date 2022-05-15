import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/constants/colors.dart';

import '../../layouts/main_layout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/oku');
              },
              child: Container(
                width: 130.w,
                height: 130.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),

                child: Center(child: Text('Oku',
                style: TextStyle(
                  fontSize: 30,

                ),
                )),
              ),
            ),
            SizedBox(height: 50.h,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/yaz');
              },
              child: Container(
                width: 130.w,
                height: 130.h,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: Center(child: Text('Yaz',
                  style: TextStyle(
                    fontSize: 30,

                  ),

                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
