import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class Design extends StatefulWidget {
  const Design({Key? key}) : super(key: key);

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hi"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30),
            textStyle: TextStyle(fontSize: 24),
          ),
          child: Text("open sheet"),
          onPressed: () => showModalBottomSheet(
            context: context, builder: (context) => buildSheet(),
            // enableDrag: false,
            // isDismissible: false
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet() => makeDismissible(
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.86,
          minChildSize: 0.3,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                controller: controller,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "I am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstone",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "I am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstone",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "I am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstone",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "I am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstoneI am a jetani harshil i am seneior developer in gemstone",
                    style: TextStyle(fontSize: 16),
                  ),

                  // Center(
                  //   child: ElevatedButton(
                  //     child: Text("close"),
                  //     onPressed: (){
                  //       Navigator.of(context).pop();
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      );
}
