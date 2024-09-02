import 'package:ecommerce/basic_flutter/ApiDataPage.dart';
import 'package:ecommerce/basic_flutter/DetailsPage.dart';
import 'package:ecommerce/basic_flutter/LapTop.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../blocs/pages/login_screen.dart';
import 'Profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List items = [
    {
      "image": "images/111.jpg",
      "title": "apple watch",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/222.webp",
      "title": "apple watch",
      "subTitle": "decription",
      "price": "\$350"
    }
  ];

  //String? userName=User.getUser()?.userName;
  // String? email=User.getUser()?.email;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "home",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ]),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: const Icon(Icons.laptop),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LapTop()));
                    },
                    child: const Text("laptop"),
                  ),
                ),
                Tab(
                  icon: const Icon(Icons.api),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Apidatapage()));
                    },
                    child: const Text("apiData"),
                  ),
                ),
                const Tab(
                  icon: Icon(Icons.electric_bike),
                  child: Text("bike"),
                ),
                const Tab(
                  icon: Icon(Icons.mobile_friendly),
                  child: Text("mopile"),
                )
              ],
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: ListTile(
                      // title: Text("$userName",style: const TextStyle(fontSize:20,color: Colors.black ),),
                      //subtitle: Text("$email",style: const TextStyle(color: Colors.grey),),
                      trailing: const Icon(Icons.person_2),
                    )),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                        title: const Text("home"),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Homepage()));
                          },
                          icon: const Icon(Icons.home),
                        )),
                    ListTile(
                        title: const Text("profile"),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Profile()));
                          },
                          icon: const Icon(Icons.person),
                        )),
                    ListTile(
                        title: const Text("contact us"),
                        subtitle: const Text(
                          "077798574",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.phone),
                        )),
                    ListTile(
                        title: const Text("dark mode"),
                        trailing: IconButton(
                          onPressed: () {
                            if (Get.isDarkMode) {
                              Get.changeTheme(ThemeData.light());
                            } else {
                              Get.changeTheme(ThemeData.dark());
                            }
                          },
                          icon: const Icon(Icons.dark_mode),
                        )),
                    ListTile(
                      title: const Text("logout"),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  LoginScreen()));
                        },
                        icon: const Icon(Icons.logout),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(children: [
              Container(
                child: Image.asset("images/123.jpg"),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Best Selling",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 250),
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => (DetailsPage(
                                  data: items[i],
                                ))));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey,
                              child: Image.asset(items[i]["image"]),
                            ),
                            Text(
                              items[i]['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              items[i]['subTitle'],
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              items[i]['price'],
                              style: const TextStyle(
                                color: Colors.orange,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ]),
          ),
        ));
  }
}
