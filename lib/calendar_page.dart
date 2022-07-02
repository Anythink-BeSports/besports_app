import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'record_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Record'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 2.w,
                color: const Color(0xFFD6D6D6),
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          height: 450.h,
          width: 330.w,
          child: TableCalendar(
            daysOfWeekHeight: 30.h,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            focusedDay: DateTime.now(),
            locale: 'ko-KR',
            shouldFillViewport: true,
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, dateTime, _) {
                return builderCalendar(context, dateTime, _, true);
              },
              defaultBuilder: (context, dateTime, _) {
                return builderCalendar(context, dateTime, _, false);
              },
            ),
            // To style the calendar
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp
              ),
              weekendStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp
              ),
            ),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp
              ),
            ),
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
              cellMargin: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }


  Widget builderCalendar(BuildContext context, DateTime dateTime, _, bool isToday) {
    return Container(
      margin: EdgeInsets.all(1.5.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE0E0E0),
          width: 2.sp,
        ),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>RecordPage(dateTime: dateTime)),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              Text(dateTime.day.toString(), style: TextStyle(
                color: isToday ? Colors.orange : Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                ),
              ),
              LinearPercentIndicator(
                lineHeight: 6.h,
                percent: 0.8,
                backgroundColor: Colors.white,
                progressColor: Colors.red,
              ),
              LinearPercentIndicator(
                lineHeight: 6.h,
                percent: 1,
                backgroundColor: Colors.white,
                progressColor: Colors.indigo,
              ),
              LinearPercentIndicator(
                lineHeight: 6.h,
                percent: 0.6,
                backgroundColor: Colors.white,
                progressColor: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
