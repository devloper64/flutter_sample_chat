import 'package:graphql_flutter/graphql_flutter.dart';

class AuthRemoteDataSource {
  final GraphQLClient client;

  AuthRemoteDataSource({required this.client});

  Future<Map<String, dynamic>> login(String email) async {
    const String loginMutation = """
      mutation Login(\$input: LoginUserInput!) {
        login(input: \$input) {
          ... on UserAuth {
            fingerPrint
            user {
              id
            }
          }
        }
      }
    """;

    final result = await client.mutate(
      MutationOptions(
        document: gql(loginMutation),
        variables: {
          "input": {
            "email": email
          },
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return result.data?['login'];
  }

  Future<Map<String, dynamic>> verifyOtp(String otp, String fingerPrint) async {
    const String verifyOtpMutation = """
      mutation VerifyEmailOtp(\$input: VerifyUserOtpInput!) {
        verifyEmailOtp(input: \$input) {
          ... on TokenResult {
            accessToken
            refreshToken
          }
        }
      }
    """;

    final result = await client.mutate(
      MutationOptions(
        document: gql(verifyOtpMutation),
        variables: {
          "input": {
            "code": otp,
            "fingerPrint": fingerPrint,
          },
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return result.data?['verifyEmailOtp'];
  }
}
