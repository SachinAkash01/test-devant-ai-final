import ballerina/http;
import ballerinax/ai.agent;

listener agent:Listener mathtutorListener = new (listenOn = check http:getDefaultListener());

service /mathtutor on mathtutorListener {
    resource function post chat(@http:Payload agent:ChatReqMessage request) returns agent:ChatRespMessage|error {

        string stringResult = check _mathtutorAgent->run(request.message);
        return {message: stringResult};
    }
}
