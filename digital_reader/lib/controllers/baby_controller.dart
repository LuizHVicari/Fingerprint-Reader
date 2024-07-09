import 'dart:developer';
import 'package:digital_reader/models/baby_model.dart';
import 'package:digital_reader/respositories/baby_repostory.dart';



class BabyController {
  static BabyController instance = BabyController();

  String code = '';
  String birthDate = '';
  String gender = '';
  late List<BabyModel> babyList; 

  final BabyRepostory _babyRepostory = BabyRepostory();

  Future<BabyModel?> createBaby() async {
    final baby = _babyRepostory.createBaby(
      code: code, 
      birthDate: birthDate, 
      gender: gender);

    return baby;
  }

  Future<List<BabyModel>?> getBabies() async {
    final baby = _babyRepostory.getBabies();
    log(baby.toString());
    return baby;
  }
}