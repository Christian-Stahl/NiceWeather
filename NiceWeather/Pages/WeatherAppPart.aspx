<%@ Page language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<WebPartPages:AllowFraming ID="AllowFraming" runat="server" />
<html>
<head>
    <title>Current Weather</title>
    <link rel="Stylesheet" type="text/css" href="../Content/currentWeather.min.css?rev=4" />
    <!-- if jquery's already loaded then load it from CDN instead -->
    <script type="text/javascript">window.jQuery || document.write('<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"><\/script>')</script>
    <script type="text/javascript" src="../Scripts/moment.min.js"></script>
    <script type="text/javascript" src="../Scripts/skycons.min.js"></script>
    <script type="text/javascript" src="../Scripts/todaysWeather.js?rev=4"></script>
    <script type="text/javascript" src="../scripts/Resources.<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,language_value%>' EncodeMethod='HtmlEncode' />.js"></script>
    <script type="text/javascript">
        // Let the style be consistent with the host web
        (function () {
            'use strict';
            var hostUrl = '';
            if (document.URL.indexOf('?') != -1) {
                var params = document.URL.split('?')[1].split('&');
                for (var i = 0; i < params.length; i++) {
                    var p = decodeURIComponent(params[i]);
                    if (/^SPHostUrl=/i.test(p)) {
                        hostUrl = p.split('=')[1];
                        document.write('<link rel="stylesheet" href="' + hostUrl + '/_layouts/15/defaultcss.ashx" />');
                        break;
                    }
                }
            }
            if (hostUrl == '') {
                document.write('<link rel="stylesheet" href="/_layouts/15/1033/styles/themable/corev15.css" />');
            }
        })();
    </script>
</head>
<body>


<div id="cwWrapper">
	<div class="cwLocation"><h1></h1></div>
	<div id="cwToday"></div>
	<div class="cwIconWrapper">
		<div class="cwIconPlaceholder"></div>
		<div class="cwTemp"><span class="cwTempInt"></span><span class="unitScale"></span></div>
    </div>
	<div class="cwDescription"><h1></h1></div>
	<div class="cwInfoWrapper">
		<div class="cwInfoCols cwInfoAlfa"></div>
		<div class="cwInfoCols cwInfoBeta"><span class="fa fa-chevron-up"></span> <span class="cwInfoBetaTemp"></span><span class="unitScale"></span></div>
		<div class="cwInfoCols cwInfoGamma"><span class="fa fa-chevron-down"></span> <span class="cwInfoGammaTemp"></span><span class="unitScale"></span></div>
		<div class="cwInfoCols cwInfoDelta"><span class="fa fa-tint"></span> <span class="cwInfoDeltaHum"></span><span class="cwInfoDeltaHumPercent"></span></div>
		<div class="cwInfoCols cwInfoEpsilon"></div>
	</div>
	<div class="cwExtendedInfo">
		<div class="cwExtInfoCols cwExtInfoAlfa">
			<div class="cwExtDay cwExtDayAlfa"></div>
			<div class="cwExtIcon">
				<canvas id="day1icon" width="18" height="18"></canvas>
			</div>
			<div class="cwAlfaMaxTemp"></div>
		</div>
		<div class="cwExtInfoCols cwExtInfoBeta">
			<div class="cwExtDay cwExtDayBeta"></div>
			<div class="cwExtIcon">
				<canvas id="day2icon" width="18" height="18"></canvas>
			</div>
			<div class="cwBetaMaxTemp"></div>
		</div>
		<div class="cwExtInfoCols cwExtInfoGamma">
			<div class="cwExtDay cwExtDayGamma"></div>
			<div class="cwExtIcon">
				<canvas id="day3icon" width="18" height="18"></canvas>
			</div>
			<div class="cwGammaMaxTemp"></div>
		</div>
		<div class="cwExtInfoCols cwExtInfoDelta">
			<div class="cwExtDay cwExtDayDelta"></div>
			<div class="cwExtIcon">
				<canvas id="day4icon" width="18" height="18"></canvas>
			</div>
			<div class="cwDeltaMaxTemp"></div>
		</div>
		<div class="cwExtInfoCols cwExtInfoEpsilon">
			<div class="cwExtDay cwExtDayEpsilon"></div>
			<div class="cwExtIcon">
				<canvas id="day5icon" width="18" height="18"></canvas>
			</div>
			<div class="cwEpsilonMaxTemp"></div>
		</div>
	</div>
</div>

</body>
</html>