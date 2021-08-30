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
            title: AutoSizeText(
                "Home",
                minFontSize: 16,
                maxFontSize: 20,
                maxLines: 1,
                style: GoogleFonts.roboto(color: Colors.white)
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.black,
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
                    if(state is FailureStateHome)
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
                                                color: Colors.black
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
                    else if(state is SuccessStateHome)
                        return buildSuccess(_visible ? _listSearchResult : state.list);
                    else
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
                }
            )
        ),
        floatingActionButton: BlocBuilder(
            bloc: _homeBloc,
            builder: (context, state) {
                if(state is SuccessStateHome)
                    return FloatingActionButton.extended(
                        onPressed: () => _homeBloc.add(StartEventHome()),
                        icon: Icon(Icons.download_outlined, color: Colors.white),
                        label: Text("Carregar mais"),
                        backgroundColor: Colors.black
                    );
                else
                  return Container();
            }
        )
    );
  }

  Widget buildSuccess(List<ReposModel> list) {
      return ListView(
          padding: EdgeInsets.all(DSSpacing.l),
          children: [
              DSSearchBox(
                  placeholder: "Repository name",
                  onSearch: (String text) {
                      _listSearchResult.clear();

                      if(text.isEmpty) {
                          setState(() {
                              _visible = false;
                          });
                          return;
                      }

                      list.forEach((item) {
                          if(item.name.contains(text))
                              _listSearchResult.add(item);
                      });

                      setState(() {
                          _visible = true;
                      });
                  }
              ),
              SizedBox(height: DSSpacing.l),
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
              margin: EdgeInsets.symmetric(vertical: DSSpacing.m),
              color: Color(0xFFF0F0F0),
              height: 50,
              child: Row(
                  children: [
                      Container(color: Colors.black, width: 2),
                      SizedBox(width: DSSpacing.m),
                      AutoSizeText(
                          repo.name,
                          minFontSize: 15,
                          maxFontSize: 18,
                          maxLines: 1,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                          )
                      )
                  ]
              )
          )
      );
  }
}