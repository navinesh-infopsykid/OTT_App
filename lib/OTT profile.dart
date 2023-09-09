import 'package:Zera/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import 'OTT Details.dart';
import 'OTT settings.dart';
import 'OTT.dart';
class profileott extends StatefulWidget {
  const profileott({super.key});

  @override
  State<profileott> createState() => _profileottState();
}

class _profileottState extends State<profileott> {
  @override
  Widget build(BuildContext context)
  {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child)
    {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Icon(Icons.logo_dev_sharp),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const settingott()));
            }, icon: Icon(Icons.settings)),
            IconButton(
                icon: Icon(themeNotifier.isDark
                    ? Icons.nightlight_round
                    : Icons.wb_sunny,),
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 390,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Hi Zera user ", style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),),
                            TextButton(onPressed: () {}, child: Row(
                              children: [
                                Text("Zera user mobile"),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("+91 9********2",
                                style: TextStyle(fontSize: 18),),
                            ),
                            Container(
                              height: 40,
                              width: 110,
                              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                                  onPressed: (){
                                    {
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 500,
                                            color: Colors.black,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  const Text(
                                                    'Are you Sure ?!',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 30),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(height: 100,),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                            backgroundColor: Colors
                                                                .white),
                                                        child: const Text('Close',
                                                          style: TextStyle(
                                                              color: Colors.black),),
                                                        onPressed: () =>
                                                            Navigator.pop(context),
                                                      ),
                                                      SizedBox(width: 20,),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                            backgroundColor: Colors
                                                                .white),
                                                        onPressed: (){
                                                          final auth = FirebaseAuth.instance;
                                                          auth.signOut();
                                                          Navigator.of(context).pop();
                                                          // Navigator.pushAndRemoveUntil(
                                                          //   context,
                                                          //   MaterialPageRoute(builder: (context) => const loginott()),
                                                          //       (Route<dynamic>route) => false,
                                                          // );
                                                        },child: const Text('log out',
                                                        style: TextStyle(
                                                            color: Colors.black),),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  }, child: Row(
                                    children: [
                                      GestureDetector(
                                          onTap: (){

                                          },
                                          child: Text("Log out",style: TextStyle(color: Colors.purple.shade300),)),
                                      Icon(Icons.logout_sharp,color: Colors.purple.shade300,)
                                    ],
                                  )),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              color: Colors.black,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/bg.jpeg"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Divider(thickness: 1,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Text("Your Profiles", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,

                      itemCount: 2,
                      itemBuilder: (BuildContext con, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const detailsott()));
                            },
                            child: Column(
                              children: [
                                CircleAvatar(

                                  backgroundImage: AssetImage(
                                      'assets/images/1.jpg'),
                                  radius: 25,
                                ),
                                SizedBox(height: 5,),
                                Text("Profile")
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
              Divider(thickness: 1,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    "Watchlist ", textAlign: TextAlign.left, style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: 1,
                    itemBuilder: (BuildContext con, index) {
                      return Card(
                        elevation: 9,
                        child: Container(
                          height: 100,
                          width: 150,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    // border: null,
                                    // color: Colors.black,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/black.jpg"),
                                    ),
                                  ),
                                ),
                              ),
                              Text("Movie name")
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text("Continue watching", textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: 5,
                    itemBuilder: (BuildContext con, index) {
                      return Card(
                        elevation: 9,
                        child: Container(
                          height: 100,
                          width: 150,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    // border: null,
                                    // color: Colors.black,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/black.jpg"),
                                    ),
                                  ),
                                ),
                              ),
                              Text("Movie name")
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
