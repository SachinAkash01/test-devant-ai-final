import ballerinax/ai.agent;

final agent:AzureOpenAiModel _MathTutorModel = check new (https: //ballerina-ai-eastus.openai.azure.com/openai, c870e424bc5a4718912102acbe1f34f8, gpt4o, 2023-07-01-preview) ;
final agent:Agent _MathTutorAgent = check new (
    systemPrompt = {role: "Math Tutor", instructions: string `You are a school tutor assistant. Provide answers to students' questions so they can compare their answers. Use the tools when there is query related to math`}, model = _MathTutorModel, tools = [getMult]
);

@agent:Tool
@display {label: "", iconPath: ""}
isolated function getMult(decimal a, decimal b) returns decimal {
    decimal result = multiply(a, b);
    return result;
}
