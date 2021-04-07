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
      body: Column(
        children: [
          _fondo(sizeScreen),
          _elements(sizeScreen, context),
          Expanded(
            child: _getAttentionCenters(sizeScreen, context),
          )
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
      child: Column(
        children: [
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
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _getAttentionCenters(Size sizeScreen, BuildContext context) {
    return FutureBuilder(
      future: _attCentProvider.getAttentionCenters(),
      builder: (BuildContext context, AsyncSnapshot<AttentionCenter> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            padding: EdgeInsets.symmetric(vertical: 5.0),
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
    var indexColors = 0;
    for (var i = 0; i < attCentsList.data.length; i++) {
      if (indexColors == var_utils.colors.length) indexColors = 0;
      final tempAttCent = ListTile(
        leading: CircleAvatar(
          backgroundColor: var_utils.colors[indexColors],
          child: Icon(
            Icons.pin_drop,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        title: Text(
          attCentsList.data[i].nombre,
          style: TextStyle(
              color: var_utils.colors[indexColors],
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          attCentsList.data[i].descripcion,
          style:
              TextStyle(color: var_utils.colors[indexColors], fontSize: 12.0),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: var_utils.colors[indexColors],
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
                  color: var_utils.colors[indexColors],
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
      indexColors++;
    }
    return attCents;
  }
}
