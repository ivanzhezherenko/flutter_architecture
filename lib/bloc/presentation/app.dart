import 'package:flutter/material.dart';
import 'package:flutter_architecture/bloc/data/network/api_network.dart';
import 'package:flutter_architecture/bloc/data/repository/object_repository.dart';
import 'package:flutter_architecture/bloc/domain/bloc/object_bloc.dart';
import 'package:flutter_architecture/bloc/domain/bloc/object_events.dart';
import 'package:flutter_architecture/bloc/presentation/country_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyBloc extends StatefulWidget {
  const MyBloc({super.key});

  @override
  State<MyBloc> createState() => _MyAppState();
}

class _MyAppState extends State<MyBloc> {
  late ApiClient apiClient;
  late ObjectRepository repository;

  @override
  void initState() {
    super.initState();
    apiClient = ApiClient(baseUrl: 'https://api.restful-api.dev');
    repository = ObjectRepository(apiClient: apiClient);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ObjectBloc(repository: repository)..add(FetchObjects()),
        child: HomePage(),
      ),
    );
  }
}
