import 'package:flutter/material.dart';

class CompanyJob extends StatefulWidget {
  const CompanyJob({super.key});

  @override
  State<CompanyJob> createState() => _CompanyJobState();
}

class _CompanyJobState extends State<CompanyJob> {
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
        body: Column(
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
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 15,
              ),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text("Posted jobs",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 5, 6, 70),
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.only(
                        bottom: 8, left: 10, right: 8, top: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                        left: 20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/com3.jpg',
                              width: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Software Engineer",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Amazon",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Colombo, Sri Lanka",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Rs.60000-Rs.70000/Month",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const SizedBox(height: 18),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(26, 173, 172, 175),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 6, right: 14),
                                      child: Text(
                                        "IT",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      "   Fulltime",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "   Two days ago",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 146, 19, 146),
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.only(
                        bottom: 8, left: 8, right: 8, top: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/com3.jpg',
                              width: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Software Engineer",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Sysco Lab",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Colombo, Sri Lanka",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Rs.60000-Rs.70000/Month",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const SizedBox(height: 18),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(26, 173, 172, 175),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 6, right: 14),
                                      child: Text(
                                        "IT",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      "   Fulltime",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "   Two days ago",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 47, 85, 141),
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.only(
                        bottom: 8, left: 8, right: 8, top: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/com3.jpg',
                              width: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Software Engineer",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Sysco Lab",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Colombo, Sri Lanka",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Rs.60000-Rs.70000/Month",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const SizedBox(height: 18),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(26, 173, 172, 175),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 6, right: 14),
                                      child: Text(
                                        "IT",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      "   Fulltime",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "   Two days ago",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 180,
              margin: EdgeInsets.only(left: 180),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(158, 164, 161, 172),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Post a new job ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
