using ServiceReference1;
using System.ServiceModel;


//var client = new report_PortClient();
//var binding = new BasicHttpBinding();
//binding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
//binding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
//binding.MaxReceivedMessageSize = 9999999;
//client.Endpoint.Binding = binding;
//client.Endpoint.Address = new EndpointAddress("http://win-85vflm7uj5v:7047/BC210/WS/CRONUS%20International%20Ltd./Codeunit/report");
//client.ClientCredentials.UserName.UserName = "Administrator";
//client.ClientCredentials.UserName.Password = "Ahasan03";



var client = new report_PortClient();
var binding = new BasicHttpBinding();
binding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
binding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Windows;
binding.MaxReceivedMessageSize = 9999999;
client.Endpoint.Binding = binding;
client.Endpoint.Address = new EndpointAddress("http://win-85vflm7uj5v:7047/BC210/WS/CRONUS%20International%20Ltd./Codeunit/report");
client.ClientCredentials.Windows.ClientCredential.UserName = "Administrator";
client.ClientCredentials.Windows.ClientCredential.Password = "Ahasan03";


try
{
	var reportNo = 111;
	var parameters = "<?xml version=\"1.0\" standalone=\"yes\"?><ReportParameters name=\"Customer - Top 10 List\" id=\"111\"><Options><Field name=\"ShowType\">0</Field><Field name=\"NoOfRecordsToPrint\">10</Field><Field name=\"ChartType\">0</Field></Options><DataItems><DataItem name=\"Customer\">VERSION(1) SORTING(Field1)</DataItem><DataItem name=\"Integer\">VERSION(1) SORTING(Field1)</DataItem></DataItems></ReportParameters>";
	var result = await client.RunReportAsync(reportNo, parameters);
	
	using (System.IO.FileStream stream = System.IO.File.Create(@"c:\\temp1\\file.pdf"))
	{
		System.Byte[] byteArray = System.Convert.FromBase64String(result.return_value);
		stream.Write(byteArray, 0, byteArray.Length);
	}
}
catch (Exception ex)
{
	Console.WriteLine(ex.ToString());
	//throw;
}

