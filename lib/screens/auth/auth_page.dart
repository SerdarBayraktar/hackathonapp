import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hackathon/constants/Values.dart';
import 'package:hackathon/constants/colors.dart';
import 'package:hackathon/layouts/main_layout.dart';
import 'package:hackathon/screens/auth/widgets/custom_text_form_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stech App',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: AppColors.white
              ),
            ),
            SizedBox(height: 100.h,),
            TextFormField(
              controller: emailController,
              style: TextStyle(color: AppColors.light_grey),
              decoration: InputDecoration(
                hintText: 'Email',
                labelStyle: TextStyle(color: AppColors.sand),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.light_grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.sand,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h,),
            CustomTextFormField(
            label: "Şifre",
            controller: passwordController,
            isPassword: true,
            validator: (String? val) {
              if (val == null || val == '') {
                return 'This Field is Required';
              }
              if (val.length < 6) {
                return 'Please enter 6 or more letter';
              }
              return null;
            },
          ),
            SizedBox(height: 50.h,),
            Container(
              width: 100.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),              child: InkWell(
                child: Center(child: Text('Giris Yap')),
                onTap: auth,
              ),
            )
          ],
        ),
      ),
    );
  }
  auth()async{
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString());
    print(user.user!.uid);
    Values.uid = user.user!.uid;
    Navigator.pushNamed(context, '/mainScreen');
  }
}
