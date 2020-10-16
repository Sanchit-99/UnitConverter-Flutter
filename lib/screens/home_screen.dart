import 'package:flutter/material.dart';
import 'package:unitConverter/screens/distanceScreen.dart';
import 'package:unitConverter/screens/speedScreen.dart';
import 'package:unitConverter/screens/tempScreen.dart';
import 'package:unitConverter/screens/weightScreen.dart';

class HomeScreen extends StatelessWidget {
  Widget myCard(String title, String imgName) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/$imgName.png',
              height: 70,
              width: 70,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Select a category',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DistanceConverter()));
                  },
                  child: myCard('Distance', 'distance'),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SpeedConverter()));
                  },child: myCard('Speed', 'speed')),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>TempConverter()));
                  },child: myCard('Temperature', 'temp')),
                SizedBox(
                  width: 15,
                ),
               GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>WeightConverter()));
                  },child: myCard('Weight', 'weight')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
