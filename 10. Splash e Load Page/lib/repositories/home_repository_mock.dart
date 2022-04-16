import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:splash/models/post_model.dart';
import 'package:splash/repositories/home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    //lendo o json no diretório assets
    var value = await rootBundle.loadString('assets/data.json');
    List postJson = jsonDecode(value);

    return postJson.map((e) => PostModel.fromJson(e)).toList();
  }
}
