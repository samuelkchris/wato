import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  bool isNightMode = false;
  bool isNotifyMode = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Stack(children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 3,
                      ),
                    ),
                    child: const CircleAvatar(
                      foregroundImage: AssetImage("assets/logo.jpg"),
                      maxRadius: 50,
                      minRadius: 40,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 143,
                  child: Container(
                      alignment: Alignment.center,
                      height: size.height * 0.03,
                      width: size.width * 0.2,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Text("Nison")),
                ),
              ]),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Text("Katerega Nicholas",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      color: Colors.green,
                      width: size.width,
                      height: size.height * 0.05,
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("General",
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Edit profile",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Preferences",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Privacy",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ))),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 26),
                        child: Text(
                          "Night mode",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: isNightMode,
                        onChanged: (bool value) {
                          setState(() {
                            isNightMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Language",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ))),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 26),
                        child: Text(
                          "Notifications",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: isNotifyMode,
                        onChanged: (bool value) {
                          setState(() {
                            isNotifyMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                      color: Colors.green,
                      width: size.width,
                      height: size.height * 0.05,
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Other",
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "About",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Help & Support",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Logout",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
