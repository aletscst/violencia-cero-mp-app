import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/attention_center_model.dart';
import 'package:violencia_cero/src/providers/attention_center_provider.dart';

class AttentionCenterListPage extends StatelessWidget {
  final AttentionCenterProvider _attCentProvider =
      new AttentionCenterProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centros de Atencion'),
        backgroundColor: Colors.purple[300],
      ),
      body: _getAttentionCenters(context),
    );
  }

  Widget _getAttentionCenters(BuildContext context) {
    return FutureBuilder(
      future: _attCentProvider.getAttentionCenters(),
      builder: (BuildContext context, AsyncSnapshot<AttentionCenter> snapshot) {
        if (snapshot.hasData) {
          return ListView(
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
    attCentsList.data.forEach((attCent) {
      final tempAttCent = ListTile(
        leading: Icon(
          Icons.corporate_fare,
          color: Colors.purple[300],
        ),
        title: Text(attCent.nombre),
        subtitle: Text(attCent.descripcion),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.purple[300],
        ),
        onTap: () =>
            {Navigator.pushNamed(context, 'attention', arguments: attCent)},
      );
      attCents.add(tempAttCent);
      attCents.add(Divider());
    });

    return attCents;
  }
}
