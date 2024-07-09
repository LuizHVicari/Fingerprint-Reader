import 'dart:developer';
import 'package:digital_reader/dio.dart';
import 'package:digital_reader/models/baby_model.dart';
import 'package:digital_reader/respositories/baby_interface.dart';
import 'package:dio/dio.dart';


class BabyRepostory implements BabyInterface {
  @override
  Future<BabyModel?> createBaby({required String code, required String birthDate, required String gender}) async {
    try {
      final response = await dio.post(
        '/fingerprints/babys/',
        data: {
          'code': code,
          'birth_date': birthDate,
          'gender': gender
        }
      );
      log(response.data);
      return BabyModel.fromJson(response.data);
    } on DioException catch (e) {
      log(e.toString());
    }
    return null;
  }

  @override
  Future<List<BabyModel>?> getBabies() async {
    final response = await dio.get('/fingerprints/babys/');
    return response.data.map<BabyModel>((e) => BabyModel.fromJson(e)).toList();
  }


}