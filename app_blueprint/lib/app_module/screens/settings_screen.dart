import 'package:app_blueprint/design_system/button.dart';
import 'package:app_blueprint/design_system/spacing.dart';
import 'package:app_blueprint/utils/local_storage_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  String? token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Settings",
              style: GoogleFonts.roboto(color: Colors.white)
          ),
          elevation: 0.0,
          backgroundColor: Color(0xFF000000)
        ),
        body: Container(
            padding: EdgeInsets.all(DSSpacing.l),
            child: Column(
                children: [
                  TextField(
                      decoration: InputDecoration(labelText: "API Token"),
                      onChanged: (text) => token = text
                  ),
                  SizedBox(height: DSSpacing.l),
                  DSButton(
                      title: "Salvar",
                      onPressed: () async {
                          bool save = await Modular.get<LocalStorageUtil>().save('API-Token', token);

                          if(save)
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Salvo com sucesso!',
                                          style: GoogleFonts.roboto(color: Colors.white)
                                      ),
                                      backgroundColor: Colors.black
                                  )
                              );
                      }
                  )
                ]
            )
        )
    );
  }
}