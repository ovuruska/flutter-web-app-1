
// Import backendUrl from .env file
//
// Path: lib/constants.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';
//
final backendUrl = dotenv.env['BACKEND_URL']!;

//final backendUrl = "localhost:8000";