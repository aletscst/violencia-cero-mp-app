import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/procedure_model.dart';
import 'package:violencia_cero/src/providers/procedures_provider.dart';

class ProceduresPage extends StatelessWidget {
  final ProcedureProvider _procedureProvider = new ProcedureProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Procedimientos'),
      ),
      body: _getProcedures(context),
    );
  }

  Widget _getProcedures(BuildContext context) {
    return FutureBuilder(
      future: _procedureProvider.getListProcedures(),
      builder: (BuildContext context, AsyncSnapshot<List<Procedure>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: _fillProceduresList(context, snapshot.data),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  List<Widget> _fillProceduresList(
      BuildContext context, List<Procedure> contactsList) {
    List<Widget> procedures = new List<Widget>();
    contactsList.forEach((procedure) {
      final tempProcedure = ListTile(
        leading: Icon(Icons.article),
        title: Text(procedure.nombre),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => {
          Navigator.pushNamed(context, 'proceduredetail', arguments: procedure)
        },
      );
      procedures.add(tempProcedure);
      procedures.add(Divider());
    });

    return procedures;
  }
}
