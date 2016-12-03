<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <meta name="WebPartPageExpansion" content="full" />
    <script type="text/javascript" src="../scripts/Resources.<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,language_value%>' EncodeMethod='HtmlEncode' />.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

<h1>ADD-IN DESCRIPTION</h1>
This Add-In displays current weather conditions and forecast from a given location around the globe.
<p></p>
<img src="../Images/Instructions/6.png" alt="Instruction image 6" />

<p></p>
<ul>
	<li>Install the Add-in</li>
	<li>Add this Add-in as an "App Part" onto a page (<a href="http://office.microsoft.com/en-us/office365-sharepoint-online-enterprise-help/add-an-app-part-to-a-page-HA103995460.aspx" target="_blank">See how</a>)</li>
	<li>Configure the Add-In from the Add-Ins (Web Part) settings. Add your API key</li>
	<li>Enjoy!</li>
</ul>
<img src="../Images/Instructions/1.png" alt="Instruction image 1" />
<p></p>

<h1>ADD-IN SETTINGS</h1>

<ul>
<li><h2>Temperature Scale</h2>
Select Celsius or Fahrenheit
<p></p>
<img src="../Images/Instructions/3.png" alt="Instruction image 3" />
<p></p>
</li>

<li><h2>Desired Language</h2>
Language for today’s weather conditions. More languages will come in later updates.
<p></p>
<img src="../Images/Instructions/4.png" alt="Instruction image 4" />
<p></p>
</li>
	
<li><h2>API Key</h2>
You will need to request an API key and set that key into the API Key text box. If you are using several Add-ins, you can use one key for each Add-in or the same key. The Add-in will not display any weather without the API key. With a free license key you can make up to 1000 requests to the API per day.  
<p></p>
<img src="../Images/Instructions/5.png" alt="Instruction image 5" />
<p></p>
</li>
	
</ul>

<h1>Misc</h1>
<ul>

<li><h2>Icons</h2>
Different icons will be displayed depended of the weather condition at the moment (Sunny, Cloudy, Rainy etc). If the weather conditions are clear, the sun will rotate
<p></p>
</li>

<li><h2>Today's weather detailed</h2>
Display today’s high / low temperature and Humidity
<p></p>
</li>


<li><h2>Forecast</h2>
5-days forecast below the information about today’s weather. The smaller icons are animated
<p></p>
</li>

</ul>

<h1>Note</h1>
This Add-in uses the forecast weather API <a href="http://forecast.io" target="_blank">https://darksky.net/forecast</a> and it’s build with HTML, CSS3 and JS and will work fine in o365 SharePoint Online, intranet or for a public site.
The Add-in is designed to work in all versions of Internet Explorer version 9 and above, and the latest versions of Chrome and Firefox. The Add-in will not work in Internet Explorer version 8 and below.
Developed by @Cstahl <a href="http://chrisstahl.wordpress.com/" target="_blank">Christian Stahl, 2014-2016</a>

 
</asp:Content>
