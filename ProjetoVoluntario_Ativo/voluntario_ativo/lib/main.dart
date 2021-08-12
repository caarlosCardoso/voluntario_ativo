import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voluntario_ativo/repositories/comentariosRepository.dart';
import 'package:voluntario_ativo/repositories/projetosRepository.dart';
import 'package:voluntario_ativo/services/auth_service.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(
          create: (context) => ProjetosRepository(
            auth: context.read<AuthService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ComentariosRepository(
            auth: context.read<AuthService>(),
          ),
        )
      ],
      child: MeuAplicativo(),
    ),
  );
}
