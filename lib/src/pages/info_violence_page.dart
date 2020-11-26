import 'package:flutter/material.dart';
import 'package:violencia_cero/src/models/violence_information_model.dart';
import 'package:violencia_cero/src/providers/violence_provider.dart';

class InfoViolencePage extends StatelessWidget {
  final ViolenceProvider _violenceProvider = new ViolenceProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inforacion Sobre Violencia'),
        backgroundColor: Colors.purple[300],
      ),
      body: _getListData(context),
    );
  }

  Widget _getListData(BuildContext context) {
    return FutureBuilder(
      future: _violenceProvider.getListViolenceInfo(),
      builder:
          (BuildContext context, AsyncSnapshot<ViolenceInformation> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: _fillViolenceInfList(context, snapshot.data),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  List<Widget> _fillViolenceInfList(
      BuildContext context, ViolenceInformation dataList) {
    List<Widget> listDataViolence = new List<Widget>();
    dataList.data.forEach((item) {
      final tempItem = ListTile(
        leading: Icon(
          Icons.article,
          color: Colors.purple[300],
        ),
        title: Text(item.nombre),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.purple[300],
        ),
        onTap: () =>
            {Navigator.pushNamed(context, 'violencedetail', arguments: item)},
      );
      listDataViolence.add(tempItem);
      listDataViolence.add(Divider());
    });

    return listDataViolence;
  }
}
