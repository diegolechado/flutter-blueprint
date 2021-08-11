import 'package:app_blueprint/app_module/blocs/home/home_bloc.dart';
import 'package:app_blueprint/design_system/search_box.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = Modular.get<HomeBloc>();

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Blueprint app_module"),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => Navigator.pushNamed(context, "/settings")
            )
          ]
        ),
        body: ListView(
            padding: EdgeInsets.all(DSSpacing.m),
            children: [
                Padding(
                    padding: EdgeInsets.only(bottom: DSSpacing.l),
                    child: DSSearchBox(
                        placeholder: "Repository name",
                        onSearch: (text) async {
                          homeBloc.add(StartEventHome(text: text));
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          bool x = await prefs.setString('num',text);
                          print(x);
                        }
                    )
                ),
                BlocBuilder(
                    bloc: homeBloc,
                    builder: (context, state) {
                      if(state is LoadingStateHome)
                          return Center(
                              child: Container(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2.3
                                  )
                              )
                          );
                      else if(state is FailureStateHome)
                          return Center(child: Text('${state.message}'));
                      else if(state is SuccessStateHome)
                          return buildSuccess(state);
                      else
                          return Container();
                    }
                )
            ]
        )
    );
  }

  Widget buildSuccess(SuccessStateHome state) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              state.result.fullName
          ),
          Text(
              state.result.description
          ),
          Text(
              state.result.forks.toString()
          ),
          Text(
              state.result.watchers.toString()
          ),
        ]
    );
  }
}