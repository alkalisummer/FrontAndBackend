
//const weather = document.querySelector(".js-weather");

const API_KEY = "76b90e82bc42d40347901d67ad32f0a2";
const COORDS = 'coords';
//http://api.openweathermap.org/data/2.5/forecast?APPID=76b90e82bc42d40347901d67ad32f0a2&id=1835848&mode=xml&units=metric&cnt=5
function getWeatherHere(lat,lng){
    fetch(`https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lng}&appid=${API_KEY}&units=metric&cnt=5`).then(function(response){
    return response.json();
    }).then(function(json){
    	
   console.log(json);
   	for( var i =0; i<5;i++){
    		const temp = Math.round(json.list[i].main.temp);
    	    const weather =json.list[i].weather[0].main;
   
    	   var str=`<h1>${weather}</h1><br><h1>${temp}°</h1>`;
    	   //console.log(`#today+${i}`);
    	    $(`.container #today${i}`).append(str);
    		
     }
    	
    	
    	console.log(json.list[0].weather[0].main);
    	console.log(json.list[0].main.temp);
       // const temperature = json.list.main.temp;
        //const place = json.name;
       // weather.innerText= Math.round(temperature)+"°\n"+place;
    });
}



function saveCoords(coordsObj){
   localStorage.setItem(COORDS,JSON.stringify(coordsObj));

}

function handleGeoSucces(position){
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    const coordsObj = {
         latitude,
         longitude
    };
    saveCoords(coordsObj);
    getWeatherHere(latitude,longitude);
}

function handleGeoError(){
    console.log('Cant access geo location');
}

function askForCoords(){
    navigator.geolocation.getCurrentPosition(handleGeoSucces, handleGeoError);
}

function loadCoords(){
    const loadedCoords = localStorage.getItem(COORDS);
    if(loadedCoords ===null){
        askForCoords();
    }else {
        const parseCoords=JSON.parse(loadedCoords);
        getWeatherHere(parseCoords.latitude,parseCoords.longitude);

    }
}

function init() {
    loadCoords();
}

init();