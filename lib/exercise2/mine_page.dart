import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget{
  const MinePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }

}
class _MinePageState extends State<MinePage>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("斯巴达"),
        Row(
          children: [
            Container(
              width: 50,
              height: 150,
              decoration: BoxDecoration(
               border: Border.all(color: Colors.deepPurpleAccent,width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            )
          ],
        ),
      ],
    );
  }
}