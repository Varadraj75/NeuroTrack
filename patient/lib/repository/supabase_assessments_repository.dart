import 'package:patient/core/entities/assessment_entities/assessment_answer_entity.dart';
import 'package:patient/core/repository/assessment/assessment_repository.dart';
import 'package:patient/core/result/result.dart';
import 'package:patient/model/assessment_models/assessment_model.dart';
import 'package:patient/model/assessment_models/assessment_question_model.dart';
import 'package:patient/model/assessment_models/assessment_option_model.dart';
import 'package:patient/model/assessment_models/assessment_result_model.dart';
import 'package:patient/repository/supabase_auth_repository.dart'; // To access the static mock

class SupabaseAssessmentsRepository implements AssessmentsRepository {
  SupabaseAssessmentsRepository({dynamic supabaseClient});

  List<AssessmentModel> get _mockAssessments => [
    AssessmentModel(
      assessmentId: 'mock-assessment-id',
      createdAt: DateTime.now().toIso8601String(),
      name: 'Basic Cognitive Assessment',
      description: 'A basic assessment required before starting.',
      category: 'General',
      cutoffScore: 50,
      imageUrl: 'https://via.placeholder.com/150',
      questions: [
        AssessmentQuestionModel(
          questionId: 'q1',
          text: 'How are you feeling today?',
          options: [
            AssessmentOptionModel(optionId: 'opt1', text: 'Great', score: 10),
            AssessmentOptionModel(optionId: 'opt2', text: 'Okay', score: 5),
            AssessmentOptionModel(optionId: 'opt3', text: 'Not good', score: 0),
          ]
        ),
      ]
    )
  ];

  @override
  Future<List<Map<String, dynamic>>> fetchAssessmentById(String id) async => [];

  @override
  Future<ActionResult> fetchAllAssessments() async {
    return ActionResultSuccess(data: _mockAssessments, statusCode: 200);
  }

  @override
  Future<ActionResult> submitAssessment(AssessmentAnswerEntity answers) async {
    SupabaseAuthRepository.hasTakenAssessmentMock = true; // Fulfill assessment progress
    return ActionResultSuccess(
      data: AssessmentResultModel(
         assessmentScore: 10,
         isAutistic: false,
         message: 'Thank you for completing the assessment! Your progress has been saved.',
      ),
      statusCode: 200
    );
  }
}
