import 'package:flutter/material.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({super.key});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 199, 198, 201),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: const Color(0xFF2882B5)),
                accountName: Text(
                  "Dimalsha kavindi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "madhughd72@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: FlutterLogo(),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Page 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.train,
                ),
                title: const Text('Page 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const AboutListTile(
                // <-- SEE HERE
                icon: Icon(
                  Icons.info,
                ),
                child: Text('About app'),
                applicationIcon: Icon(
                  Icons.local_play,
                ),
                applicationName: 'My Cool App',
                applicationVersion: '1.0.25',
                applicationLegalese: '© 2019 Company',
                aboutBoxChildren: [
                  ///Content goes here...
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notification_add), label: '')
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/com1.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 130),
                  height: 50,
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  color: Colors.black26,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/com3.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            Text(
                              "Software Company",
                              style: TextStyle(
                                fontSize: 25, // Adjust the font size as needed
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .white, // Adjust the text color as needed
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Amazon",
                              style: TextStyle(
                                fontSize: 18, // Adjust the font size as needed
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .white, // Adjust the text color as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 300, top: 10),
                child: Icon(Icons.edit),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text("About Us",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Container(
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 10),
                child: Text(
                    "In a fast-paced and innovative environment, there are so many projects you can work on. And you can take pride in knowing you’ll improve the lives of millions of people around the world.With us, you’ll enhance your skills and work with other talented minds. You’ll have freedom to explore and turn your ideas into reality. The learning possibilities are endless. You’ll build a strong career knowing you have all the tools to thrive."),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text("Industry",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Container(
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 10),
                child: Text("Internet Product"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text("Employee Size",
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Container(
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 10),
                child: Text("132,121 Employees"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text("Head Office",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Container(
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 10),
                child: Text("Mountain View, California, Amerika Serikat"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text("Specialization",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Container(
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 10),
                child: Text(
                    "Search technology, Web computing, Software and Online advertising"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
