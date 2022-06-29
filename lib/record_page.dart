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
        body: Column(
          children: [
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('2022-06-25', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),),
                SizedBox(width: 20.w,),
              ],
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 5.h,),
                  viewSizeBox('Bench-Press', 'Set', '5', 'Count', '42'),
                  SizedBox(height: 13.h,),
                  viewSizeBox('Dead-Lift', 'Set', '3', 'Count', '20'),
                  SizedBox(height: 13.h,),
                  viewSizeBox('Shoulder-Press', 'Set', '3', 'Count', '15'),
                  SizedBox(height: 13.h,),
                  viewSizeBox('Squat', 'Set', '3', 'Count', '20'),
                  SizedBox(height: 13.h,),
                  viewSizeBox('Leg-Press', 'Set', '3', 'Count', '30'),
                  SizedBox(height: 13.h,),
                  viewSizeBox('Chest-Press', 'Set', '3', 'Count', '20'),
                  SizedBox(height: 13.h,),
                  viewSizeBox('Lat-Pull-Down', 'Set', '3', 'Count', '10'),
                  SizedBox(height: 13.h,),
                ],
              ),
            )
          ],
        )
    );
  }

  SizedBox viewSizeBox(String string1, String string2, String string3, String string4, String string5) {
    return SizedBox(
      width: 330.w, height: 50.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(primary: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 110.w,
              child: Text(string1,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15.sp),
              ),
            ),
            SizedBox(width: 90.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(string2,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
                Text(string3,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
              ],
            ),
            SizedBox(width: 30.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(string4,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
                Text(string5,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}