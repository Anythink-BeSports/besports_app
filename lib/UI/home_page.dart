import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Exercise'),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 85.h,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Text('Set', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                      SizedBox(height: 6.h,),
                      Text('0', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 85.h,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Text('Time', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                      SizedBox(height: 6.h,),
                      Text('00:00', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 85.h,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Text('Rest', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                      SizedBox(height: 6.h,),
                      Text('00:00.0', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: 230.w,
              height: 230.h,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(
                      side: BorderSide(
                        width: 35.w,
                        color: Colors.grey[350]!,
                      )
                  )
              ),
              child: Center(
                child: Text('1/15', style: TextStyle(fontSize: 30.sp),),
              ),
            ),
            Text('Weight : 0kg', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),),
            SizedBox(
              width: 110.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
                child: Text('SET', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),)
              ),
            ),
          ],
        )
    );
  }
}