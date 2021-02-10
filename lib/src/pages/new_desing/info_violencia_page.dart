import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:violencia_cero/src/models/info_violencia_model.dart';
import 'package:violencia_cero/src/providers/violence_provider.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class InfoViolenciaPage extends StatelessWidget {
  final ViolenceProvider _violenceProvider = new ViolenceProvider();

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _fondo(sizeScreen),
            _title(sizeScreen, data),
            _elements(sizeScreen, context, data),
          ],
        ),
      ),
      bottomNavigationBar: var_utils.phoneBar,
    );
  }

  Widget _fondo(Size sizeScreen) {
    return Container(
      height: sizeScreen.height * .35,
      width: sizeScreen.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment(0.0, 2.0),
          image: AssetImage('assets/images/principal3.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _elements(Size sizeScreen, BuildContext context, data) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: sizeScreen.height * 0.05),
      child: FutureBuilder(
        future: _violenceProvider.getViolenceInfoDetail(data["id"].toString()),
        builder: (BuildContext context, AsyncSnapshot<InfoViolencia> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: sizeScreen.height * 0.32,
                ),
                _description(snapshot.data.description),
                SizedBox(
                  height: sizeScreen.height * 0.06,
                ),
                _buttonLink(context, snapshot.data.url),
              ],
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: sizeScreen.height * 0.4,
                ),
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            );
          }
        },
      ),
    );
  }

  Widget _title(Size sizeScreen, data) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: sizeScreen.height * 0.06),
      child: Text(
        data["title"],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _description(String description) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        description,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: var_utils.colors[1],
          fontSize: 18.0,
          //fontWeight: FontWeight.bold,
          //height: 1.2,
        ),
      ),
    );
  }

  Widget _buttonLink(BuildContext context, String url) {
    return RaisedButton(
      child: Container(
        child: Text(
          'Denuncia Digital',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      color: Color.fromRGBO(244, 99, 212, 1.0),
      textColor: Colors.white,
      onPressed: () {
        _launchURL(url);
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
