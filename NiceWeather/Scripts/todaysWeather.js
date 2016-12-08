'use strict';

function getQueryStringParameter(urlParameterKey) {
    var params = document.URL.split('?')[1].split('&');
    var strParams = '';
    for (var i = 0; i < params.length; i = i + 1) {
        var singleParam = params[i].split('=');
        if (singleParam[0] == urlParameterKey)
            return decodeURIComponent(singleParam[1]);
    }
}

jQuery.noConflict();
(function ($) {
    var urlForecast = 'https://api.darksky.net/forecast/';

    // Add-In parameter settings
    var apiKey = getQueryStringParameter('appKey');
    var unit = getQueryStringParameter('Unit');
    var translationLang = getQueryStringParameter('Language');
    var lati = getQueryStringParameter('Latitude');
    var longi = getQueryStringParameter('Longitude');
    var customCitySetting = getQueryStringParameter('customCity');

    jQuery.ajax({
        url: urlForecast + apiKey + "/" + lati + "," + longi + "?callback=?&units=" + unit + '&lang=' + translationLang,
        type: 'GET',
        dataType: 'jsonp',
        timeout: 3500,

        success: function (data) {

            // Add UnitScalee to HTML
            var unitScale = "";
            if (unit == 'si') {
                unitScale = '&deg;C';
            } else {
                unitScale = '&deg;F';
            }

            // Add the word Today in different languages
            var selectedLang = "";
            if (translationLang == 'en') {
                selectedLang = 'Today';
            }
            else if (translationLang == 'ar') {
                selectedLang = 'اليوم';
            }
            else if (translationLang == 'de') {
                selectedLang = 'Heute';
            }
            else if (translationLang == 'es') {
                selectedLang = 'Hoy';
            }
            else if (translationLang == 'fr') {
                selectedLang = 'Aujourd´hui';
            }
            else if (translationLang == 'it') {
                selectedLang = 'Oggi';
            }
            else if (translationLang == 'nl') {
                selectedLang = 'Vandaag';
            }
            else if (translationLang == 'pt') {
                selectedLang = 'Hoje';
            }
            else if (translationLang == 'pl') {
                selectedLang = 'Dzisiaj';
            }
            else if (translationLang == 'ru') {
                selectedLang = 'Cегодня';
            }
            else if (translationLang == 'sl') {
                selectedLang = 'Danes';
            }
            else if (translationLang == 'sv') {
                selectedLang = 'I dag';
            }
            else {
                selectedLang = '';
            }

            // Add City to HTML
            if (customCitySetting != '') {
                $('.cwLocation h1').html(customCitySetting);
            }
            else {
                $('.cwLocation h1').html('<i>Add a city in settings..</i>');
            }

            // Add text to HTML
            $('.cwInfoDeltaHumPercent').html('%');

            // Add data to HTML
            $('.unitScale').html(unitScale);

            // Add data to HTML
            $('#cwToday').html(selectedLang);

            // Forecast today big
            $('.cwTempInt').html(data.currently.temperature.toFixed(0));
            $('.cwDescription h1').html(data.currently.summary);

            // Current weather icons
            var currIcon = data.currently.icon;
            switch (currIcon) {
                case "clear-day": $('.cwIconPlaceholder').addClass("cwIconPlaceholderSunSpin").append('<img src="../images/tick/sunny.png">');
                    break;
                case "clear-night": $('.cwIconPlaceholder').append('<img src="../images/tick/sunny_night.png">');
                    break;
                case "rain": $('.cwIconPlaceholder').append('<img src="../images/tick/hail.png">');
                    break;
                case "snow": $('.cwIconPlaceholder').append('<img src="../images/tick/snow4.png">');
                    break;
                case "sleet": $('.cwIconPlaceholder').append('<img src="../images/tick/sleet.png">');
                    break;
                case "wind": $('.cwIconPlaceholder').append('<img src="../images/tick/cloudy5.png">');
                    break;
                case "fog": $('.cwIconPlaceholder').append('<img src="../images/tick/mist.png">');
                    break;
                case "cloudy": $('.cwIconPlaceholder').append('<img src="../images/tick/cloudy5.png">');
                    break;
                case "partly-cloudy-day": $('.cwIconPlaceholder').append('<img src="../images/tick/cloudy2.png">');
                    break;
                case "partly-cloudy-night": $('.cwIconPlaceholder').append('<img src="../images/tick/cloudy1_night.png">');
                    break;
                default: $('.cwIconPlaceholder').append('<img src="../images/tick/cloudy5.png">');
                    break;
            }

            // Forecast today
            $('.cwInfoGammaTemp').html(data.daily.data[0].temperatureMin.toFixed(0));
            $('.cwInfoBetaTemp').html(data.daily.data[0].temperatureMax.toFixed(0));
            $('.cwInfoDeltaHum').html(data.currently.humidity.toString().substr(2)); // remove decimals, convert to string first

            // Forecast + 1 day
            $('.cwAlfaMaxTemp').html(data.daily.data[1].temperatureMax.toFixed(0)).addClass('cwExtTemp');
            $('.cwExtDayAlfa').html(moment.unix(data.daily.data[1].time).format("dd")); // Using moment for unix time convertion (calc seconds from 1970) to a JS date object

            // Forecast + 2 day
            $('.cwBetaMaxTemp').html(data.daily.data[2].temperatureMax.toFixed(0)).addClass('cwExtTemp');
            $('.cwExtDayBeta').html(moment.unix(data.daily.data[2].time).format("dd"));

            // Forecast + 3 day
            $('.cwGammaMaxTemp').html(data.daily.data[3].temperatureMax.toFixed(0)).addClass('cwExtTemp');
            $('.cwExtDayGamma').html(moment.unix(data.daily.data[3].time).format("dd"));

            // Forecast + 4 day
            $('.cwDeltaMaxTemp').html(data.daily.data[4].temperatureMax.toFixed(0)).addClass('cwExtTemp');
            $('.cwExtDayDelta').html(moment.unix(data.daily.data[4].time).format("dd"));

            // Forecast + 5 day
            $('.cwEpsilonMaxTemp').html(data.daily.data[5].temperatureMax.toFixed(0)).addClass('cwExtTemp');
            $('.cwExtDayEpsilon').html(moment.unix(data.daily.data[5].time).format("dd"));

            // Icons
            var skycons = new Skycons({ "color": "#555" });
            var day1_icon = data.daily.data[1].icon;
            var day2_icon = data.daily.data[2].icon;
            var day3_icon = data.daily.data[3].icon;
            var day4_icon = data.daily.data[4].icon;
            var day5_icon = data.daily.data[5].icon;
            skycons.set('day1icon', day1_icon);
            skycons.set('day2icon', day2_icon);
            skycons.set('day3icon', day3_icon);
            skycons.set('day4icon', day4_icon);
            skycons.set('day5icon', day5_icon);
            skycons.play();

            // Show the wrapper when the document are ready 
            $(document).ready(function () {
                $('#cwWrapper').show();
            });
        },

        error: function (parsedjson) {
            if ($('.cwLocation').length) {
                $(document).ready(function () {
                    $('#cwWrapper').show();
                    $('.cwExtendedInfo').hide();
                    $('.cwInfoBeta, .cwInfoGamma, .cwInfoDelta').hide();
                    $('.cwIconWrapper').addClass('cwNoResponse').html('The weather services in not responding, please add a valid API key in the settings for this Add-in. <br /><br />If you dont have a key yet you can get <a href="https://darksky.net/dev/register" target="_blank">a free key from here..</a> ');
                });
            }
        }

    });
})(jQuery); 