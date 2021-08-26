import 'package:app_blueprint/app_module/blocs/home/home_bloc.dart';
import 'package:app_blueprint/app_module/models/repos_model.dart';
import 'package:app_blueprint/design_system/button.dart';
import 'package:app_blueprint/design_system/search_box.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = Modular.get<HomeBloc>();
  List<ReposModel> _listSearchResult = [];
  List<ReposModel> _listAllResult = [];
  bool _visible = false;

  @override
  void initState() {
      _homeBloc.add(StartEventHome());
      super.initState();
  }

  @override
  void dispose() {
      _homeBloc.close();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Home",
              style: GoogleFonts.roboto(color: Colors.white)
          ),
          elevation: 0.0,
          backgroundColor: Color(0xFF000000),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => Navigator.pushNamed(context, "/settings")
            )
          ]
        ),
        body: SafeArea(
            child: BlocBuilder(
                bloc: _homeBloc,
                builder: (context, state) {
                    if(state is LoadingStateHome)
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Center(
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2.4,
                                        color: Colors.black,
                                        backgroundColor: Color(0xFFF0F0F0)
                                    )
                                )
                            )
                        );
                    else if(state is FailureStateHome)
                        return Padding(
                            padding: EdgeInsets.all(DSSpacing.l),
                            child: Column(
                                children: [
                                    Center(
                                        child: Text(
                                            '${state.message}',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: Color(0xFF000000)
                                            )
                                        )
                                    ),
                                    SizedBox(height: DSSpacing.l),
                                    DSButton(
                                        title: "Recarregar",
                                        onPressed: () => _homeBloc.add(StartEventHome())
                                    )
                                ]
                            )
                        );
                    else if(state is SuccessStateHome) {
                        _listAllResult.clear();
                        _listAllResult.addAll(state.list);
                        return buildSuccess();
                    }
                    else
                        return Container();
                }
            )
        )
    );
  }

  void onSearchTextChanged(String text) {
      _listSearchResult.clear();

      if(text.isEmpty) {
          setState(() {
              _visible = false;
          });
          return;
      }

      _listAllResult.forEach((item) {
          if(item.name.contains(text))
              _listSearchResult.add(item);
      });

      setState(() {
          _visible = true;
      });
  }

  Widget buildSuccess() {
      return ListView(
          padding: EdgeInsets.all(DSSpacing.l),
          children: [
              Padding(
                  padding: EdgeInsets.only(bottom: DSSpacing.l),
                  child: DSSearchBox(
                      placeholder: "Repository name",
                      onSearch: onSearchTextChanged
                  )
              ),
              Visibility(
                  visible: _visible,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          _listSearchResult.length,
                          (i) => buildItem(_listSearchResult[i])
                      )
                  ),
                  replacement: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          _listAllResult.length,
                          (i) => buildItem(_listAllResult[i])
                      )
                  )
              )
          ]
      );
  }

  Widget buildItem(ReposModel repo) {
      return GestureDetector(
          onTap: () => Navigator.pushNamed(
              context,
              "/pulls",
              arguments: {
                "name": repo.name,
                "url": repo.url
              }
          ),
          child: Container(
              height: 50,
              color: Color(0xFFF0F0F0),
              margin: EdgeInsets.symmetric(vertical: DSSpacing.m),
              child: Row(
                  children: [
                      Container(color: Color(0xFF000000), width: 2),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.all(DSSpacing.m),
                              child: AutoSizeText(
                                  'Nome: ${repo.name}',
                                  minFontSize: 15,
                                  maxFontSize: 18,
                                  style: GoogleFonts.roboto(color: Color(0xFF000000))
                              )
                          )
                      )
                  ]
              )
          )
      );
  }
}