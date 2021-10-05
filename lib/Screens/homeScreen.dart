import 'package:firstapp/Models/Profile.dart';
import 'package:firstapp/Providers/ProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatelessWidget {
  //const homeScreen({Key? key}) : super(key: key);
  final _profileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    profileBuilder(BuildContext context) {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Form(
                key: _profileFormKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Create a New Profile",
                          style: TextStyle(
                              color: Color(0xfb124568),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Opacity(opacity: 0, child: Divider()),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty)
                              return 'This field cannot be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Your name",
                            labelText: "Name",
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty)
                              return 'This field cannot be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Your age",
                            labelText: "Age",
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty)
                              return 'This field cannot be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Your sex",
                            labelText: "Sex",
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty)
                              return 'This field cannot be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Your education",
                            labelText: "Education",
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Field cannot be empty';
                            else if (value.length != 10)
                              return 'Phone number should have 10 digits';
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Number"
                            ,
                            labelText: "Contact Number",
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
      );
    }

    List<Profile> displayListOfFriends =
        Provider.of<ProfileProvider>(context).fetchListOfProfiles;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfb124568),
        title: Text(
          'Friends',
          style: TextStyle(),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add), onPressed: () => profileBuilder(context)),
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: () => print('Button Clicked'),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: (displayListOfFriends.length == 0)
            ? Center(
                child: Text(
                  'Ooops !! Its seems you are an introvert',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}