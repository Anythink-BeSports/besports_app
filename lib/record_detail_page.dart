import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'calendar_page.dart';

class RecordDetailPage extends StatefulWidget {

  @override
  State<RecordDetailPage> createState() => _RecordDetailPageState();
}

class _RecordDetailPageState extends State<RecordDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Record'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(                                                               // 운동 종류 부분
              margin: EdgeInsets.fromLTRB(20.0.w, 0.0.h, 20.0.w, 0.0.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular((8.0.sp))
              ),
              elevation: 5.h,
              child: ListTile(
                  title: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Bench-Press', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.sp)),
                      ],
                    ),
                  )
              ),
            ),
            Row(                                                                // 날짜 부분
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20.0.w, 0),
                  child: Text('2022-06-30', style: TextStyle(fontWeight: FontWeight.w500),),
                )
              ],
            ),
            Container(                                                          // 분류 글자 부분
              margin: EdgeInsets.fromLTRB(20.0.w, 0.0.h, 20.0.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('세트', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),),
                  Text('중량', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),),
                  Text('횟수', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),),
                  Text('휴식시간', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),),
                ],
              ),
            ),
            Container(                                                               // 각 카드들을 모아둔 큰 카드 부분
              margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0.sp)),
                color: Colors.grey[350],
              ),
              height: 300.h,
              child: ListView(
                children: [
                  viewCard('#1', '80KG', '15회', '30초'),                       // 각 카드들
                  viewCard('#2', '85KG', '10회', '30초'),
                  viewCard('#3', '90KG', '8회', '30초'),
                  viewCard('#4', '95KG', '6회', '30초'),
                  viewCard('#5', '100KG', '3회', '30초'),
                  viewCard('#6', '105KG', '2회', '30초'),
                ],
              ),
            ),
            Card(                                                               // 트레이너 공유 부분
              margin: EdgeInsets.fromLTRB(20.0.w, 10.0.h, 20.0.w, 10.0.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular((8.0.sp))
              ),
              elevation: 5.h,
              child: ListTile(
                  onTap: () {

                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular((8.0.sp))
                  ),
                  title: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('트레이너에게 데이터 공유', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp)),
                      ],
                    ),
                  )
              ),
            ),
          ],
        )
    );
  }
  Container viewCard(String set_num, String wieght, String count_num, String rest_time) => Container(
    margin: EdgeInsets.fromLTRB(10.w, 10.0.h, 10.w, 1.h),
    height: 50.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.sp),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(set_num, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),),
        Text(wieght, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),),
        Text(count_num, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),),
        Text(rest_time, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),),
      ],
    ),
  );
}