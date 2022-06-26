import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 85,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: const [
                      Text('Set', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 6,),
                      Text('0', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 85,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: const [
                      Text('Time', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 6,),
                      Text('00:00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 85,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: const [
                      Text('Rest', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 6,),
                      Text('00:00.0', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: Container(
                width: 230,
                height: 230,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(
                        side: BorderSide(
                          width: 40,
                          color: Colors.grey[350]!,
                        )
                    )
                ),
                child: const Center(
                  child: Text('0', style: TextStyle(fontSize: 34),),
                ),
              ),
            ),
            const Text('Weight : 0kg', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
            SizedBox(
                width: 120,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                    child: const Text('SET', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),)
                )
            )
          ],
        )
    );
  }
}