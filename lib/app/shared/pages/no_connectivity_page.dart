import 'package:flutter/material.dart';

class NoConnectivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Ocorreu um erro!',
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Não foi possível carregar as\ninformações do aplicativo.\nVerifique sua conexão de\ninternet e tente novamente.',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(top: 30.0),
                alignment: Alignment.center,
                child: Icon(
                  Icons.wifi_off,
                  size: 100.0,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(25),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton.icon(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          icon: Icon(Icons.refresh),
          onPressed: () => Navigator.pushNamed(context, '/home'),
          label: Text('Atualizar'),
        ),
      ),
    );
  }
}
