//added by Kandisa technologies on 05/02/2019
global class cultivistAPICalloutMock implements HttpCalloutMock {

    global static string strResponseBody;

    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(strResponseBody);
        res.setStatusCode(200);
        return res;
    }
}