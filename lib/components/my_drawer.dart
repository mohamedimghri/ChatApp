import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [

              //logo
          DrawerHeader(
            child: Center(
              child: Icon(Icons.message,color: Theme.of(context).colorScheme.primary,size: 40,),
            )
          ),

        //home
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: ListTile(
            title: Text("H O M E"),
            leading: Icon(Icons.home),
            onTap: (){},
          ),
          ),

          //settings
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: ListTile(
            title: Text("S E T T I N G S"),
            leading: Icon(Icons.settings),
            onTap: (){},
          ),
          ),
            ],
          ),

      //logout
        Padding(
          padding: EdgeInsets.only(left: 25.0,bottom: 25),
          child: ListTile(
            title: Text("L O G O U T"),
            leading: Icon(Icons.logout),
            onTap: (){},
          ),
          ),
        ],
      ),
    ) ;
  }
}