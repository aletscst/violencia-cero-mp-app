import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/parrafo_model.dart';
import 'package:violencia_cero/src/models/violence_inf_detail_model.dart';
import 'package:violencia_cero/src/models/violence_information_model.dart';
import 'package:violencia_cero/src/providers/violence_provider.dart';

class ViolenceDetailPage extends StatelessWidget {
  final ViolenceProvider _violenceProvider = new ViolenceProvider();

  @override
  Widget build(BuildContext context) {
    final Datum violenceData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(violenceData.nombre),
        backgroundColor: Colors.purple[300],
      ),
      body: _getDetail(violenceData.id.toString()),
    );
  }

  Widget _getDetail(String idItem) {
    return FutureBuilder(
      future: _violenceProvider.getViolenceInfoDetail(idItem),
      builder:
          (BuildContext context, AsyncSnapshot<ViolenceInfoDetail> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: _getParagraphs(snapshot.data.parrafos),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _getParagraphs(List<Parrafo> parrafos) {
    List<Widget> data = new List<Widget>();

    parrafos.forEach((paragraph) {
      ListTile title = ListTile(
        title: Text(
          paragraph.subtitulo,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      );

      ListTile text = ListTile(
        title: Text(
          paragraph.texto,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
      );

      data..add(title)..add(text);
    });

    return ListView(
      children: data,
    );
  }
}
