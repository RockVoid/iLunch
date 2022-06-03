import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilunch/themes/app_themes.dart';
import 'package:ilunch/widgets/login_widget.dart';
import 'package:ilunch/widgets/signup_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        toolbarHeight: 200,
        centerTitle: true,
        title: Center(
          child: Text(
            "iLunch",
            style: GoogleFonts.ultra(
              textStyle: TextStyle(
                color: Appthemes.primary,
                fontSize: 55,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xfff6f6f6),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Appthemes.primary,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 27),
          tabs: [
            Center(
              child: Text(
                "Login",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Cadastro",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          LoginWidgtet(),
          SignUpWidget(),
        ],
      ),
    );
  }
}
