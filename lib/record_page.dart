import 'package:flutter/material.dart';

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
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),
          toolbarHeight: 85,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Column(
          children: [
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('2022-06-25',
                  style: TextStyle(
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(width: 20,),
              ],
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  viewSizeBox('Bench-Press', 'Set', '5', 'Count', '42'),
                  const SizedBox(height: 13,),
                  viewSizeBox('Dead-Lift', 'Set', '3', 'Count', '20'),
                  const SizedBox(height: 13,),
                  viewSizeBox('Shoulder-Press', 'Set', '3', 'Count', '15'),
                  const SizedBox(height: 13,),
                  viewSizeBox('Squat', 'Set', '3', 'Count', '20'),
                  const SizedBox(height: 13,),
                  viewSizeBox('Leg-Press', 'Set', '3', 'Count', '30'),
                  const SizedBox(height: 13,),
                  viewSizeBox('Chest-Press', 'Set', '3', 'Count', '20'),
                  const SizedBox(height: 13,),
                  viewSizeBox('Lat-Pull-Down', 'Set', '3', 'Count', '10'),
                  const SizedBox(height: 13,),
                ],
              ),
            )
          ],
        )
    );
  }

  SizedBox viewSizeBox(String string1, String string2, String string3, String string4, String string5) {
    return SizedBox(
      width: 380, height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(primary: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 120,
              child: Text(string1,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17),
              ),
            ),
            const SizedBox(width: 100,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(string2,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17),
                ),
                Text(string3,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ],
            ),
            const SizedBox(width: 40,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(string4,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17),
                ),
                Text(string5,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}