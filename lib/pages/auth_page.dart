import 'package:flutter/material.dart';
import 'package:ilunch/widgets/login_widget.dart';
import 'package:ilunch/widgets/signup_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with TickerProviderStateMixin {
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
        title: const Center(
          child: Text(
            "iLunch",
            style: TextStyle(
              color: Color(0xffea1d2c),
              fontFamily: 'Roclwell',
              fontSize: 55,
            ),
          ),
        ),
        backgroundColor: const Color(0xfff6f6f6),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xff1a1423),
          tabs: const [
            Center(
              child: Text(
                "Login",
                style: TextStyle(color: Color(0xff1a1423)),
              ),
            ),
            Center(
              child: Text(
                "Cadastro",
                style: TextStyle(color: Color(0xff1a1423)),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 5),
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            LoginWidgtet(),
            SignUpWidget(),
          ],
        ),
      ),
    );
  }
}
