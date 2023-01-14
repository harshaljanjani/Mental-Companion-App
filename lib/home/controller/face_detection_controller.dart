import 'package:mental_companion/home/module/face_model.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class FaceDetectorController {
  FaceDetector? _faceDetector;

  Future<List<FaceModel>?> processImage(inputImage) async {
    _faceDetector = GoogleMlKit.vision.faceDetector(
      const FaceDetectorOptions(
        enableClassification: true,
        enableLandmarks: true,
      ),
    );

    final faces = await _faceDetector?.processImage(inputImage);
    return extractFaceInfo(faces);
  }

  List<FaceModel>? extractFaceInfo(List<Face>? faces) {
    List<FaceModel>? response = [];
    double? smile;
    double? leftEars;
    double? rightEars;

    for (Face face in faces!) {
      if (face.smilingProbability != null) {
        smile = face.smilingProbability;
      }

      leftEars = face.leftEyeOpenProbability;
      rightEars = face.rightEyeOpenProbability;

      final faceModel = FaceModel(
        smile: smile,
        leftEarsOpen: leftEars,
        rightEarsOpen: rightEars,
      );

      response.add(faceModel);
    }

    return response;
  }
}
