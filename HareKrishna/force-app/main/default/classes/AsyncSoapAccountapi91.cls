//Generated by wsdl2apex

public class AsyncSoapAccountapi91 {
    public class NameResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            SoapAccountapi91.NameResponse_element response = (SoapAccountapi91.NameResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncAccountApi {
        public String endpoint_x = 'https://ap24.salesforce.com/services/Soap/class/AccountApi';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public SoapAccountapi91.DebuggingHeader_element DebuggingHeader;
        public SoapAccountapi91.CallOptions_element CallOptions;
        public SoapAccountapi91.DebuggingInfo_element DebuggingInfo;
        public SoapAccountapi91.SessionHeader_element SessionHeader;
        public SoapAccountapi91.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/AccountApi';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/AccountApi';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/AccountApi';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/AccountApi';
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/AccountApi';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/AccountApi', 'SoapAccountapi91'};
        public AsyncSoapAccountapi91.NameResponse_elementFuture beginName(System.Continuation continuation,String accName) {
            SoapAccountapi91.Name_element request_x = new SoapAccountapi91.Name_element();
            request_x.accName = accName;
            return (AsyncSoapAccountapi91.NameResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSoapAccountapi91.NameResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/AccountApi',
              'Name',
              'http://soap.sforce.com/schemas/class/AccountApi',
              'NameResponse',
              'SoapAccountapi91.NameResponse_element'}
            );
        }
    }
}