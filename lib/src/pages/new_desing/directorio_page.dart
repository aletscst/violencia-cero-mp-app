import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/attention_center_model.dart';
import 'package:violencia_cero/src/providers/attention_center_provider.dart';

import 'package:violencia_cero/src/utils/variables_utils.dart' as var_utils;

class DirectorioPage extends StatefulWidget {
  @override
  _DirectorioPageState createState() => _DirectorioPageState();
}

class _DirectorioPageState extends State<DirectorioPage> {
  final AttentionCenterProvider _attCentProvider =
      new AttentionCenterProvider();

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          _fondo(sizeScreen),
          _elements(sizeScreen, context),
          _getAttentionCenters(sizeScreen, context)
        ],
      ),
      bottomNavigationBar: var_utils.phoneBar,
    );
  }

  Widget _fondo(Size sizeScreen) {
    return Container(
      height: sizeScreen.height * .30,
      width: sizeScreen.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment(0.0, 2.5),
          image: AssetImage('assets/images/principal3.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _elements(Size sizeScreen, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: sizeScreen.height * 0.06),
      child: Column(
        children: [
          SizedBox(
            height: sizeScreen.height * 0.25,
          ),
          _directorioText(),
        ],
      ),
    );
  }

  Widget _directorioText() {
    return Container(
      child: Text(
        'Directorio',
        style: TextStyle(
            fontSize: 35.0,
            color: Color.fromRGBO(140, 99, 218, 1.0),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _getAttentionCenters(Size sizeScreen, BuildContext context) {
    return FutureBuilder(
      future: _attCentProvider.getAttentionCenters(),
      builder: (BuildContext context, AsyncSnapshot<AttentionCenter> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            padding: EdgeInsets.only(top: sizeScreen.height * 0.40),
            children: _fillAttCentsList(context, snapshot.data),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  List<Widget> _fillAttCentsList(
      BuildContext context, AttentionCenter attCentsList) {
    List<Widget> attCents = new List<Widget>();
    final sizeScreen = MediaQuery.of(context).size;

    for (var i = 0; i < attCentsList.data.length; i++) {
      final tempAttCent = ListTile(
        leading: CircleAvatar(
          backgroundColor: var_utils.colors[i],
          child: Icon(
            Icons.pin_drop,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        title: Text(
          attCentsList.data[i].nombre,
          style: TextStyle(
              color: var_utils.colors[i],
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          attCentsList.data[i].descripcion,
          style: TextStyle(color: var_utils.colors[i], fontSize: 12.0),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: var_utils.colors[i],
        ),
        onTap: () => {
          Navigator.pushNamed(context, 'attention',
              arguments: attCentsList.data[i])
        },
      );

      final cardTemp = Card(
        child: Column(
          children: [
            tempAttCent,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: var_utils.colors[i],
                  width: sizeScreen.width - 10,
                  child: Column(
                    children: [
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 5.0,
                        ),
                        onPressed: () => {},
                        child: Text(
                          attCentsList.data[i].direccion,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
      attCents.add(cardTemp);
    }
    return attCents;
  }
}
