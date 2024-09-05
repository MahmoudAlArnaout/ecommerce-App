import 'package:ecommerce/blocs/pages/text_recognition_screen.dart';
import 'package:ecommerce/clean/domain/use_case/get_items.dart';
import 'package:ecommerce/clean/presentation/manager/home_bloc/home_bloc.dart';
import 'package:ecommerce/clean/presentation/manager/home_bloc/home_event.dart';
import 'package:ecommerce/clean/presentation/manager/home_bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/basic_flutter/DetailsPage.dart';
import 'package:ecommerce/basic_flutter/LoginPage.dart';
import 'package:ecommerce/getx/view/LapTopPageGetx.dart';
import 'package:ecommerce/getx/view/ProfileGetx.dart';
import '../../../getx/view/ApiDataPageGetx.dart';
import '../../domain/repositories/items_repositorie.dart';

class HomeScreenClean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(GetItems(repository: context.read<ItemsRepositorie>()))..add(LoadItems()),
      child: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Home",
                style:
                TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: const Icon(Icons.laptop),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => LapTopPageGetx()),
                    );
                  },
                  child: const Text("Laptop"),
                ),
              ),
              Tab(
                icon: const Icon(Icons.api),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ApiDataPageGetx()),
                    );
                  },
                  child: const Text("API Data"),
                ),
              ),
              Tab(
                  icon: const Icon(Icons.receipt_outlined),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TextRecognitionScreen()),
                      );
                    },
                    child: const Text(
                      "Text Recognition", textAlign: TextAlign.center,),
                  )),
              Tab(
                icon: Icon(Icons.mobile_friendly),
                child: Text("Mobile"),
              ),
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
                      title: Text(
                        "user@example.com",
                        style: const TextStyle(
                            fontSize: 20, color: Colors.black),
                      ),
                      subtitle: Text(
                        "UserName",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: const Icon(Icons.person),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ListTile(
                    title: const Text("Home"),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => HomeScreenClean()),
                        );
                      },
                      icon: const Icon(Icons.home),
                    ),
                  ),
                  ListTile(
                    title: const Text("Profile"),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ProfileGetx()),
                        );
                      },
                      icon: const Icon(Icons.person),
                    ),
                  ),
                  ListTile(
                    title: const Text("Contact Us"),
                    subtitle: const Text(
                      "077798574",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // Add action for contact us
                      },
                      icon: const Icon(Icons.phone),
                    ),
                  ),
                  ListTile(
                    title: const Text("Dark Mode"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.dark_mode),
                    ),
                  ),
                  ListTile(
                    title: const Text("Logout"),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => Loginpage()),
                        );
                      },
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoaded) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Image.asset("images/123.jpg"),
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
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 250),
                        itemCount: state.items.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsPage(data: state.items[i]),
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.grey,
                                    child: Image.asset(
                                        state.items[i]["image"]),
                                  ),
                                  Text(
                                    state.items[i]['title']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    state.items[i]['subTitle']!,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  Text(
                                    state.items[i]['price']!,
                                    style: const TextStyle(
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: Text("Something went wrong"));
              }
            }
          ),
        ),
      ),
    )
    );
  }
}
