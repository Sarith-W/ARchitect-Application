import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'classifier.dart';

class Model extends Classifier {
  Model({int? numThreads}) : super(numThreads: numThreads);

  @override
  String get modelName => 'furniture_classification_model.tflite';

  @override
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(150, 150);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);
}
