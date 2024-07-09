import 'package:camera/camera.dart';
import 'package:digital_reader/models/gathering_model.dart';

abstract class GatheringInterface {
  Future<GatheringModel?> createGathering({required String baby, required int months, required XFile fingerprint});
  Future<List<GatheringModel>?> getGatherings();
}