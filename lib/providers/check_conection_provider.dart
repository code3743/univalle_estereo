import 'dart:async';

import 'package:flutter/material.dart';
import 'package:univalle_estereo/utils/check_internet_connection.dart';

class CheckConectionProvider extends ChangeNotifier {
  CheckInternetConnection checkInternetConnection = CheckInternetConnection();
  late StreamSubscription _streamSubscription;
  ConnectionStatus connectionStatus = ConnectionStatus.online;
  bool conectado = true;
  CheckConectionProvider() {
    _streamSubscription =
        checkInternetConnection.internetStatus().listen((event) {
      connectionStatus = event;
      conectado = event == ConnectionStatus.online;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
