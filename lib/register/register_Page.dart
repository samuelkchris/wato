import 'package:flutter/material.dart';
import 'package:wato/profile/profile_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  List<String> courses = ['Math', 'Science', 'English', 'History'];
  String? selectedCourse;
  String? selectedCountryCode;
  List<String>? countryCodes;

  @override
  void initState() {
    super.initState();
    countryCodes = [
      '+1',
      '+256',
      '+91',
      '+234',
      '+81',
      '+86',
      '+61',
      '+64',
      '+27',
    ];
    selectedCountryCode = countryCodes![1];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.green,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const Text("Register",
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Registration Number",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                DropdownButtonFormField<String>(
                  items: courses.map((String course) {
                    return DropdownMenuItem<String>(
                      value: course,
                      child: Text(course),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedCourse = value;
                    });
                  },
                  value: selectedCourse,
                  decoration: const InputDecoration(
                    labelText: 'Select a course',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.25,
                      child: DropdownButtonFormField<String>(
                        items: countryCodes?.map((String? countryCode) {
                          return DropdownMenuItem<String>(
                            value: countryCode,
                            child: Text(countryCode!),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedCountryCode = value;
                          });
                        },
                        value: selectedCountryCode,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'Enter your phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(size.width * 0.5, size.height * 0.07),
                    minimumSize: Size(size.width * 0.5, size.height * 0.07),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
