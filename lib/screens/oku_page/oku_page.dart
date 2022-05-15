import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/constants/colors.dart';
import 'package:hackathon/layouts/main_layout.dart';

import '../../constants/Values.dart';

class OkuPage extends StatefulWidget {
  const OkuPage({Key? key}) : super(key: key);

  @override
  _OkuPageState createState() => _OkuPageState();
}

class _OkuPageState extends State<OkuPage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
              Navigator.pushNamed(context, '/history');
          }, icon: Icon(Icons.favorite))
        ],
      ),
      content: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("posts").snapshots(),
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
                          width: 280.w,
                            child: Image.network(doc['url'])),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30,0,0,0),
                            child: Text(doc['name'].toString()+ ' : ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text(doc['description'].toString(),
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300
                                ),
                              ),
                            ),
                          ),
                          IconButton(onPressed: (){
                            FirebaseFirestore.instance.collection('posts').doc(doc.id).update({
                              'likes': FieldValue.arrayUnion([Values.uid]),
                            });
                          }, icon: Icon(Icons.add,))
                        ],
                      ),
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
