import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsla/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      _onBackButtonPressed(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new_sharp)),
                Image(
                    height: MediaQuery.of(context).size.height * 0.05,
                    image: const AssetImage("assets/images/vsla.png"))
              ],
            ),
          ),
          CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.1,
              child: Image(image: AssetImage("assets/images/male.png"))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Abdulsemed Mussema",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
            child: Text(
              "Team Bulee Horaa",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.068,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  onPressed: () {},
                  child: Text(
                    "Edit profile",
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ))),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 8, 15, 8.0),
            child: Divider(),
          ),
          myTiles(
            onPressed: () {},
            title: "Terms of service",
            icon: Icons.terminal_sharp,
          ),
          myTiles(
            onPressed: () {},
            title: "Privacy policy",
            icon: Icons.privacy_tip,
          ),
          myTiles(
            onPressed: () {},
            title: "Language",
            icon: FontAwesomeIcons.language,
          ),
          myTiles(
            onPressed: () {},
            title: "Help and support",
            icon: Icons.help,
          ),
          myTiles(
            onPressed: () {},
            title: "Logout",
            icon: Icons.logout,
            textColor: Colors.red,
            endIcon: false,
          ),
        ],
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text("Confirm Exit"),
            content: const Text("Do you want to Logout?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () async {
                    List<String> user = [];
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    prefs.setStringList("_keyUser", user);
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
  }
}

class myTiles extends StatelessWidget {
  const myTiles(
      {Key? key,
      this.endIcon = true,
      required this.icon,
      required this.onPressed,
      this.textColor,
      required this.title})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
      child: ListTile(
        onTap: onPressed,
        leading: Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.1),
              color: Colors.orange[200]),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, color: textColor),
        ),
        trailing: endIcon
            ? Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.1),
                    color: Colors.grey[100]),
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                ),
              )
            : null,
      ),
    );
  }
}
