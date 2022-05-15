import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/constants/Values.dart';
import 'package:hackathon/layouts/main_layout.dart';

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
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                              width: 270.w,
                              child: Image.network(doc['url'])),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(doc['name'].toString()+ ' : ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                            Container(

                              height: 50.h,
                              child: Text(doc['description'].toString(),
                                maxLines: 3,
                                style: TextStyle(

                                    fontSize: 14,
                                    fontWeight: FontWeight.w300
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  });
            }
          }
      ),
    );
  }
}
