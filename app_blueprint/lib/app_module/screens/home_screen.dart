import 'package:app_blueprint/app_module/blocs/home/home_bloc.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/design_system/button.dart';
import 'package:app_blueprint/design_system/search_box.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = Modular.get<HomeBloc>();

  @override
  void initState() {
    homeBloc.add(StartEventHome());
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => Navigator.pushNamed(context, "/settings")
            )
          ]
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(DSSpacing.l),
                child: BlocBuilder(
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
                            return Column(
                              children: [
                                  Container(
                                      padding: EdgeInsets.all(DSSpacing.m),
                                      child: DSButton(
                                          title: "Salvar",
                                          onPressed: () => homeBloc.add(StartEventHome())
                                      )
                                  ),
                                  Center(
                                      child: Text('${state.message}')
                                  )
                              ]
                            );
                        else if(state is SuccessStateHome)
                            return buildSuccess(state.list);
                        else
                            return Container();
                    }
                )
            )
        )
    );
  }

  Widget buildSuccess(List<ReposModel> list) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Padding(
                  padding: EdgeInsets.only(bottom: DSSpacing.l),
                  child: DSSearchBox(
                      placeholder: "Repository name",
                      onSearch: (text) {}
                  )
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      list.length,
                      (i) => buildItem(list[i])
                  )
              )
          ]
      );
  }

  Widget buildItem(ReposModel repo) {
      return ConstrainedBox(
          constraints: BoxConstraints(minHeight: 100, maxHeight: 150),
          child: Container(
              color: Color(0xFFF0F0F0),
              margin: EdgeInsets.symmetric(vertical: DSSpacing.m),
              child: Row(
                children: [
                  Container(color: Color(0xFF000000), width: 2),
                  Container(
                      padding: EdgeInsets.all(DSSpacing.m),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                              Text(
                                'Nome: ${repo.fullName}',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Color(0xFF000000)
                                )
                              ),
                              SizedBox(height: DSSpacing.xs),
                              Text(
                                  'Descrição: ${repo.description}',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Color(0xFF000000)
                                  )
                              ),
                              SizedBox(height: DSSpacing.xs),
                              Text(
                                  'Forks: ${repo.forks}',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Color(0xFF000000)
                                  )
                              ),
                              SizedBox(height: DSSpacing.xs),
                              Text(
                                  'Watchers: ${repo.watchers}',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Color(0xFF000000)
                                  )
                              )
                          ]
                      )
                  )
                ]
              )
          )
      );
  }
}