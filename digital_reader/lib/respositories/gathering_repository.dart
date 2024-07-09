import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:digital_reader/dio.dart';
import 'package:digital_reader/models/gathering_model.dart';
import 'package:digital_reader/respositories/gathering_interface.dart';
import 'package:dio/dio.dart';

class GatheringRepository implements GatheringInterface {
  @override
  Future<GatheringModel?> createGathering({required String baby, required int months, required XFile fingerprint}) async  {
    try {
      FormData formData = FormData.fromMap({
        'fingerprint': await MultipartFile.fromFile(fingerprint.path, filename: fingerprint.path.split('/').last),
          'baby': baby,
          'months': months
      });
      final response = await dio.post(
        '/fingerprints/gatherings/',
        data: formData
      );
      return GatheringModel.fromJson(response.data);
    } on DioException catch(e) {
      log(e.toString());
    }
    return null;

  }

  @override
  Future<List<GatheringModel>?> getGatherings() async {
    final response = await dio.get('/fingerprints/gatherings');
    return response.data.map<GatheringModel>((e) => GatheringModel.fromJson(e)).toList();
  }
}