import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/success_model.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataSuccess success = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/icons/purple-check.png',
              scale: 2.5,
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                success.message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50.0),
            Visibility(
              visible: success.route2 != 'home',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    color: Colors.purple[300],
                    child: Text(
                      'Ir al Inicio',
                      style: TextStyle(color: Colors.white, fontSize: 19.0),
                    ),
                    onPressed: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName(success.route1));
                    },
                  ),
                  Container(
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10.0),
                      color: Colors.purple[300],
                      child: Text(
                        'Continuar',
                        style: TextStyle(color: Colors.white, fontSize: 19.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            success.route2, ModalRoute.withName('inicio'));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: success.route2 == 'home',
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                color: Colors.purple[300],
                child: Text(
                  'Ir al Inicio',
                  style: TextStyle(color: Colors.white, fontSize: 19.0),
                ),
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(success.route1));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
