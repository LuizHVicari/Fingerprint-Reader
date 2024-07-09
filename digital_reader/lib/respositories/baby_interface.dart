import 'package:digital_reader/models/baby_model.dart';

abstract class BabyInterface {
  Future<BabyModel?> createBaby({required String code, required String birthDate, required String gender});
  Future<List<BabyModel>?> getBabies();
}