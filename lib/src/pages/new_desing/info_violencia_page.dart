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
      body: Stack(
        children: [
          _fondo(sizeScreen),
          _elements(sizeScreen, context, data),
        ],
      ),
      bottomNavigationBar: var_utils.phoneBar,
    );
  }

  Widget _fondo(Size sizeScreen) {
    return Container(
      height: sizeScreen.height * .4,
      width: sizeScreen.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment(0.0, 2.5),
          image: AssetImage('assets/images/fondoSup.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _elements(Size sizeScreen, BuildContext context, data) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: sizeScreen.height * 0.05),
        child: FutureBuilder(
          future:
              _violenceProvider.getViolenceInfoDetail(data["id"].toString()),
          builder:
              (BuildContext context, AsyncSnapshot<InfoViolencia> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: sizeScreen.height * 0.02,
                  ),
                  _title(snapshot.data.title),
                  SizedBox(
                    height: sizeScreen.height * 0.1,
                  ),
                  _imgVcero(sizeScreen),
                  SizedBox(
                    height: sizeScreen.height * 0.05,
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
                    height: sizeScreen.height * 0.02,
                  ),
                  _title(data["title"]),
                  SizedBox(
                    height: sizeScreen.height * 0.1,
                  ),
                  _imgVcero(sizeScreen),
                  SizedBox(
                    height: sizeScreen.height * 0.05,
                  ),
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _imgVcero(Size sizeScreen) {
    return Container(
      child: Material(
        elevation: 12.0,
        shape: CircleBorder(),
        child: Image(
          width: sizeScreen.width * 0.30,
          image: AssetImage('assets/images/principal1.png'),
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
          fontWeight: FontWeight.bold,
          height: 1.4,
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
