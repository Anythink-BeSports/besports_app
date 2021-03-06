import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Record'),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 26.sp,
              fontWeight: FontWeight.bold
          ),
          toolbarHeight: 85.h,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1.5,
        ),
        body: ListView(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0.h, 20.0.w, 10.0.h),
                    child: Text('2022-06-30', style: TextStyle(fontWeight: FontWeight.w500),),)
                ]
            ),
            viewCard('Bench-Press', '5', '42'),
            viewCard('Ded-Lift', '3', '20'),
            viewCard('Shoulder-Press', '3', '12'),
            viewCard('Squat', '3', '15'),
            viewCard('Leg-Press', '3', '20'),
            viewCard('Chest-Press', '3', '12'),
            viewCard('Lat-Pull-Down', '3', '12'),
            viewCard('Shoulder-Press', '3', '12'),
            viewCard('Shoulder-Press', '3', '12'),
          ],
        )
    );
  }
  Card viewCard(String exercise_name, String set_num, String count_num) => Card(
    margin: EdgeInsets.fromLTRB(20.0.w, 0, 20.0.w, 13.0.h),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0.sp)
    ),
    elevation: 10,
    child: ListTile(
        title: Text(exercise_name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),),
        trailing: Container(
          margin: EdgeInsets.zero,
          width: 150.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Set', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),),
                  Text(set_num, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Count', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),),
                  Text(count_num, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),),
                ],
              ),
            ],
          ),
        )
    ),
  );
}