import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/parrafo_model.dart';
import 'package:violencia_cero/src/models/procedure_detail_model.dart';
import 'package:violencia_cero/src/models/procedure_model.dart';
import 'package:violencia_cero/src/providers/procedures_provider.dart';

class ProcedureDetailPage extends StatelessWidget {
  final ProcedureProvider procedureProvider = new ProcedureProvider();

  @override
  Widget build(BuildContext context) {
    final Datum procedure = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(procedure.nombre),
        backgroundColor: Colors.purple[300],
      ),
      body: _getDetail(procedure.id.toString()),
    );
  }

  Widget _getDetail(String idProcedure) {
    return FutureBuilder(
      future: procedureProvider.getProcedureDetail(idProcedure),
      builder: (BuildContext context, AsyncSnapshot<ProcedureDetail> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: _getParagraphs(snapshot.data.parrafos),
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
