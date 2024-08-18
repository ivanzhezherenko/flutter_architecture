import 'package:flutter_architecture/bloc/data/network/api_network.dart';
import 'package:flutter_architecture/bloc/domain/models/object_model.dart';


class ObjectRepository {
  final ApiClient apiClient;

  ObjectRepository({required this.apiClient});

  Future<List<ObjectModel>> fetchObjects() async {
    final objectsData = await apiClient.getObjects();

    return objectsData.map((json) => ObjectModel.fromJson(json)).toList();
  }
}
