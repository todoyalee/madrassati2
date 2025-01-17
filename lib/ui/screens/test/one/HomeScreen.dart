import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:madrassati/presentation/presentation.dart';
import 'package:madrassati/presentation/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  final zoomController;
  const HomeScreen({Key? key, this.zoomController}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
///////////////////////////////////////////////////////
///  @faiz.rhm on Instagram
///
///
///  https://github.com/Faiz-rhm
///
//////////////////////////////////////////////////////

class _HomeScreenState extends State<HomeScreen> {
  List science = [
    Assets.science1,
    Assets.science2,
    Assets.science3,
  ];

  List math = [
    Assets.math1,
    Assets.math2,
    Assets.math3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 5),
            child: InkWell(
              onTap: () => widget.zoomController.toggle(),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey)),
                child: const Icon(
                  IconlyBroken.category,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today's Activity",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                '12 new assignments uploaded',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              overlapped(),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 28.0,
                  child: Image.asset(Assets.icon1),
                ),
                title: const Text(
                  'Science',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('3 Assignment'),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 230,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: science.length,
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 1.5,
                        child: Container(
                          height: 250,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(science[index]),
                                  fit: BoxFit.contain),
                              color: Colors.yellow),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 28.0,
                  child: Image.asset(Assets.icon2),
                ),
                title: const Text(
                  'Math',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('4 Assignment'),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 230,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: math.length,
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 1.5,
                        child: Container(
                          height: 250,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(math[index]),
                                  fit: BoxFit.contain),
                              color: Colors.yellow),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, height: 0.8),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyBroken.home), label: '_'),
          BottomNavigationBarItem(icon: Icon(IconlyBroken.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBroken.search,
                size: 5,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(IconlyBroken.notification), label: ''),
          BottomNavigationBarItem(icon: Icon(IconlyBroken.profile), label: '')
        ],
        onTap: (index) {
          // _incrementTab(index);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget overlapped() {
    const overlap = 35.0;
    final items = [
      Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              child: Image.asset(Assets.icon3), backgroundColor: Colors.red)),
      Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              child: Image.asset(Assets.icon2), backgroundColor: Colors.green)),
      Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              child: Image.asset(Assets.icon3), backgroundColor: Colors.blue)),
      Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              child: Image.asset(Assets.icon6), backgroundColor: Colors.blue)),
      Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              child: Text(
                '9',
                style: TextStyle(color: Colors.grey[600], fontSize: 20),
              ),
              backgroundColor: Colors.yellow)),
    ];

    List<Widget> stackLayers = List<Widget>.generate(items.length, (index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
        child: items[index],
      );
    });

    return Stack(children: stackLayers);
  }
}
