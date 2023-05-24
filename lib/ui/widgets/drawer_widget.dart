import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          IconButton(onPressed: (){}, icon: Text("")),
          ElevatedButton(onPressed: (){}, child: Text("1")),
          ElevatedButton(onPressed: (){}, child: Text("2")),
          ElevatedButton(onPressed: (){}, child: Text("3")),
        ],
      ),
    );
  }
}
