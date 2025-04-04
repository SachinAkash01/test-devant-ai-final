import ballerinax/ai.agent;

final agent:AzureOpenAiModel _MathTutorModel = check new (serviceUrl, apiKey, deploymentId, apiVersion);
final agent:Agent _MathTutorAgent = check new (
    systemPrompt = {role: "Math Tutor", instructions: string `You are a school tutor assistant. Provide answers to students' questions so they can compare their answers. Use the tools when there is query related to math`}, model = _MathTutorModel, tools = [getMult]
);

@agent:Tool
@display {label: "", iconPath: ""}
isolated function getMult(decimal a, decimal b) returns decimal {
    decimal result = multiply(a, b);
    return result;
}
