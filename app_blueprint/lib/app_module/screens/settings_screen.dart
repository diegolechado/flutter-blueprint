import 'package:app_blueprint/app_module/blocs/settings/settings_bloc.dart';
import 'package:app_blueprint/design_system/button.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsBloc _settingsBloc = Modular.get<SettingsBloc>();
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: _settingsBloc,
        listener: (BuildContext context, SaveEnum state) {
            if (state == SaveEnum.save)
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Salvo com sucesso!',
                            style: GoogleFonts.roboto(color: Colors.white)
                        ),
                        backgroundColor: Colors.black
                    )
                );
          },
        child: Scaffold(
            appBar: AppBar(
                title: AutoSizeText(
                    "Settings",
                    minFontSize: 16,
                    maxFontSize: 20,
                    maxLines: 1,
                    style: GoogleFonts.roboto(color: Colors.white)
                ),
                centerTitle: true,
                elevation: 0.0,
                backgroundColor: Colors.black
            ),
            body: Padding(
                padding: EdgeInsets.all(DSSpacing.l),
                child: Column(
                    children: [
                      TextFormField(
                          decoration: InputDecoration(labelText: "API Token"),
                          controller: _controller,
                          focusNode: _focusNode
                      ),
                      SizedBox(height: DSSpacing.l),
                      BlocBuilder(
                          bloc: _settingsBloc,
                          builder: (context, state) {
                              if(state == SaveEnum.loading)
                                  return Center(
                                      child: Container(
                                          width: 45,
                                          height: 45,
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2.4,
                                              color: Colors.black,
                                              backgroundColor: Color(0xFFF0F0F0)
                                          )
                                      )
                                  );
                              else
                                  return DSButton(
                                      title: "Salvar",
                                      onPressed: () {
                                          if(_controller.text != "") {
                                              _focusNode.unfocus();
                                              _settingsBloc.add(_controller.text);
                                          }
                                      }
                                  );
                          }
                      )
                    ]
                )
            )
        )
    );
  }
}