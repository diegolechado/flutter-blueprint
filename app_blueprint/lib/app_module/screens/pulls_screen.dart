import 'package:app_blueprint/app_module/blocs/pulls/pulls_bloc.dart';
import 'package:app_blueprint/app_module/models/pulls_model.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class PullsScreen extends StatefulWidget {
    final String name;
    final String url;

    const PullsScreen({
        required this.name,
        required this.url, Key? key}) : super(key: key);

  @override
  _PullsScreenState createState() => _PullsScreenState();
}

class _PullsScreenState extends State<PullsScreen> {
    final PullsBloc _pullsBloc = Modular.get<PullsBloc>();

    @override
    void initState() {
        _pullsBloc.add(StartEventPulls(url: widget.url));
        super.initState();
    }

    @override
    void dispose() {
        _pullsBloc.close();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: AutoSizeText(
                    widget.name,
                    minFontSize: 16,
                    maxFontSize: 20,
                    maxLines: 1,
                    style: GoogleFonts.roboto(color: Colors.white)
                ),
                centerTitle: true,
                elevation: 0.0,
                backgroundColor: Colors.black
            ),
            body: SafeArea(
                child: BlocBuilder(
                    bloc: _pullsBloc,
                    builder: (context, state) {
                        if(state is FailureStatePulls)
                            return Padding(
                                padding: EdgeInsets.all(DSSpacing.l),
                                child: Center(
                                    child: Text(
                                        '${state.message}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black
                                        )
                                    )
                                )
                            );
                        else if(state is SuccessStatePulls)
                            return buildSuccess(state.listPullsModel);
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
            )
        );
    }

    Widget buildSuccess(List<PullsModel> listPullsModel) => SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(DSSpacing.l),
            child: listPullsModel.length > 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    listPullsModel.length,
                    (i) => buildItem(listPullsModel[i])
                )
            )
            : Padding(
                padding: EdgeInsets.all(DSSpacing.l),
                child: Center(
                    child: Text(
                        "Este repositorio não tem nenhum PR",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.black
                        )
                    )
                )
            )
        )
    );

    Widget buildItem(PullsModel pullsModel) => Container(
          height: 214,
          color: Color(0xFFF0F0F0),
          margin: EdgeInsets.symmetric(vertical: DSSpacing.m),
          child: Row(
              children: [
                  Container(color: Colors.black, width: 2),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(DSSpacing.m),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                          ClipOval(
                                              child: Image.network(
                                                  pullsModel.user.avatar_url,
                                                  width: 50,
                                                  height: 50
                                              )
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                              child: AutoSizeText(
                                                  '${pullsModel.user.login}',
                                                  minFontSize: 18,
                                                  maxFontSize: 22,
                                                  maxLines: 1,
                                                  style: GoogleFonts.roboto(color: Colors.black)
                                              )
                                          )
                                      ]
                                  ),
                                  SizedBox(height: DSSpacing.m),
                                  AutoSizeText(
                                      'Title: ${pullsModel.title}',
                                      minFontSize: 15,
                                      maxFontSize: 18,
                                      maxLines: 1,
                                      style: GoogleFonts.roboto(color: Colors.black)
                                  ),
                                  SizedBox(height: DSSpacing.s),
                                  AutoSizeText(
                                      'Status: ${pullsModel.state}',
                                      minFontSize: 12,
                                      maxFontSize: 15,
                                      maxLines: 1,
                                      style: GoogleFonts.roboto(color: Colors.black)
                                  ),
                                  SizedBox(height: DSSpacing.s),
                                  AutoSizeText(
                                      'Data de criação: ${formatDate(pullsModel.created_at)}',
                                      minFontSize: 12,
                                      maxFontSize: 15,
                                      style: GoogleFonts.roboto(color: Colors.black)
                                  ),
                                  SizedBox(height: DSSpacing.s),
                                  AutoSizeText(
                                      'Data de fechamento: ${formatDate(pullsModel.closed_at)}',
                                      minFontSize: 12,
                                      maxFontSize: 15,
                                      style: GoogleFonts.roboto(color: Colors.black)
                                  ),
                                  SizedBox(height: DSSpacing.s),
                                  pullsModel.differenceTime != null
                                  ? AutoSizeText(
                                      getTimeString(pullsModel.differenceTime!.inMinutes),
                                      minFontSize: 15,
                                      maxFontSize: 18,
                                      maxLines: 1,
                                      style: GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.bold)
                                  )
                                  : Container()
                              ]
                          )
                      )
                  )
              ]
          )
      );

    String getTimeString(int value) {
        final int hour = value ~/ 60;
        final int minutes = value % 60;
        return 'Ficou ${hour.toString().padLeft(2, "0")} horas e ${minutes.toString().padLeft(2, "0")} minutos aberto';
    }

    String formatDate(String? value) {
        if(value == null)
            return "--/--/----";

        final x = value.split("T");
        final data = x[0].split("-");
        final hora = x[1].replaceAll("Z", "");

        return "${data[2]}/${data[1]}/${data[0]} às $hora";
    }
}