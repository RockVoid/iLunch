import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Authenticator extends StatefulWidget {
  const Authenticator({Key? key}) : super(key: key);

  @override
  State<Authenticator> createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator>
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
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffffffff),
                    labelText: "Login",
                    hintText: "E-mail ou Número de Celular",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff222222)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffffffff),
                    labelText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff222222)),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(color: Color(0xffea1d2c)),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xfff6f6f6),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffea1d2c),
                          fixedSize: const Size(3000, 55),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "ou",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: FaIcon(
                          FontAwesomeIcons.facebook,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Login com o Facebook",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xfff6f6f6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff4062bb),
                    fixedSize: const Size(3000, 55),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: FaIcon(
                          FontAwesomeIcons.google,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26.5),
                        child: Text(
                          "Login com o Google",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xfff6f6f6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffea1d2c),
                    fixedSize: const Size(3000, 55),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Cadastro",
                          style: TextStyle(
                            color: Color(0xffea1d2c),
                          ),
                        ),
                      ),
                      IconButtom(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.facebook),
                      ),
                      Divider(),
                      IconButtom(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.google),
                      ),
                    ],
                  ),
                  Divider(),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffffffff),
                      labelText: "Nome Completo",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0x00000000)),
                      ),
                    ),
                  ),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffffffff),
                      labelText: "E-mail",
                      hintText: "exemplo@gmai.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0x000000000)),
                      ),
                    ),
                  ),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffffffff),
                      labelText: "Senha",
                      hintText: "Senha forte!",
                      //adicionar um obscure text
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0x000000000)),
                      ),
                    ),
                  ),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffffffff),
                      labelText: "Confirmar senha",
                      hintText: "Redigite a senha!",
                      // add um obscute text
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0x000000000)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffea1d2c),
                      fixedSize: const Size(3000, 55),
                    ),
                    onPressed: () {},
                    child: Text("Cadastrar",
                      style: TextStyle(
                        color: Color(0xfff6f6f6),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
