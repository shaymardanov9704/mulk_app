import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){}, child: Text("some")),
          ElevatedButton(onPressed: (){}, child: Text("some")),
          ElevatedButton(onPressed: (){}, child: Text("some")),
          ElevatedButton(onPressed: (){}, child: Text("some")),
          ElevatedButton(onPressed: (){}, child: Text("some")),
        ],
      ),
    );
  }
}
