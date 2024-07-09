import 'package:camera/camera.dart';
import 'package:digital_reader/models/gathering_model.dart';
import 'package:digital_reader/respositories/gathering_repository.dart';

class GatheringController {
  XFile? image;
  int? baby;
  double months = 0.0;

  final GatheringRepository _gatheringRepository = GatheringRepository();

  static GatheringController instance = GatheringController(); 

  Future<GatheringModel?> createGathering() async {
    final gathering = _gatheringRepository.createGathering(
      baby: baby.toString(),
      months: months.toInt(), 
      fingerprint: image!
    );
    return gathering;
  }

}