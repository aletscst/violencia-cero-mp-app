import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/procedure_detail_model.dart';
import 'package:violencia_cero/src/models/procedure_model.dart';
import 'package:violencia_cero/src/providers/procedures_provider.dart';

class ProcedureDetailPage extends StatelessWidget {
  final ProcedureProvider procedureProvider = new ProcedureProvider();

  @override
  Widget build(BuildContext context) {
    final Procedure procedure = ModalRoute.of(context).settings.arguments;
    print(procedure.nombre);
    return Scaffold(
      appBar: AppBar(
        title: Text(procedure.nombre),
      ),
      body: _getDetail(procedure.id),
    );
  }

  Widget _getDetail(String idProcedure) {
    return FutureBuilder(
        future: procedureProvider.getProcedureDetail(idProcedure),
        builder:
            (BuildContext context, AsyncSnapshot<ProcedureDetail> snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Text(snapshot.data.parrafos[0].texto),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
