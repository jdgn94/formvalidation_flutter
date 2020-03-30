import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocks/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _background(context),
            _loginForm(context),
          ],
        ),
    );
  }

  Widget _background(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final backgroundBox = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ],
        )
      ),
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.05),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );

    final logo = Container(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        children: <Widget>[
          Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0,),
          SizedBox(height: 10.0, width: double.infinity,),
          Text("Juan González", style: TextStyle(color: Colors.white, fontSize: 25.0)),
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        backgroundBox,
        Positioned( top: 90.0, left: 30.0, child: circle ),
        Positioned( top: 200.0, left: -60.0, child: circle ),
        Positioned( top: -40.0, right: -30.0, child: circle ),
        Positioned( top: 120.0, right: 20.0, child: circle ),
        Positioned( top: 300.0, right: -10.0, child: circle ),
        logo,
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(child: Container(height: 220.0,)),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.0),
              boxShadow: <BoxShadow> [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text("Ingreso", style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 60.0,),
                _email(bloc),
                SizedBox(height: 30.0,),
                _password(bloc),
                SizedBox(height: 30.0,),
                _buttom(bloc, context),
              ],
            ),
          ),
          Text("¿Olvido la contraseña?"),
          SizedBox(height: 100.0,)
        ],
      ),
    );
  }

  Widget _email(LoginBlock bloc){
    return StreamBuilder(
      stream: bloc.emailStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.deepPurple,),
              hintText: "ejemplo@correo.com",
              labelText: "Correo electronico",
              errorText: snapshot.error
            ),
            // esta manera del onChange es la forma recortada
            onChanged: bloc.changeEmail,
            // onChange tradicional
            // onChanged: (value) => block.changeEmail(value),
          ),
        );
      },
    );
  }

  Widget _password(LoginBlock bloc){
    return StreamBuilder(
      stream: bloc.passwordStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.deepPurple,),
              labelText: "Contraseña",
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _buttom(LoginBlock bloc, BuildContext context){
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text("Ingresar"),
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0)
          ),
        );
      },
    );
  }

  _login(LoginBlock bloc, BuildContext context) {
    print("+++++++++++++++++++++++++++++++++++++");
    print("email: ${bloc.email}");
    print("password: ${bloc.password}");
    print("+++++++++++++++++++++++++++++++++++++");

    Navigator.pushReplacementNamed(context, "home");
  }
}

