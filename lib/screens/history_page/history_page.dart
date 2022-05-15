import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/constants/Values.dart';
import 'package:hackathon/layouts/main_layout.dart';

import '../../constants/colors.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbar: AppBar(
        elevation: 0,
      ),
      content: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("posts").where('likes',arrayContains: Values.uid).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text(
                'No Data...',
              );
            }else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data!.docs[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30,30,0,10),
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment.center,
                              widthFactor: 1.0,
                              heightFactor: 0.5,
                              child: Container(
                                  width: 280.w,
                                  child: Image.network(doc['url'])),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30,0,0,0),
                              child: Text(doc['name'].toString()+ ' : ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(doc['description'].toString(),
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Divider(color: AppColors.white,thickness: 2,),
                      ],
                    );
                  });
            }
          }
      ),
    );
  }
}
