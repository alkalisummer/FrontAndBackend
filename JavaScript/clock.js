const clockContainer = document.querySelector(".js-clock"),
clockTitle = clockContainer.querySelector("h1");

function getTime(){

const date = new Date();
const minutes = date.getMinutes();
const hours = date.getHours();
const seconds = date.getSeconds();



clockTitle.innerText = `${`${hours}`}:${`${minutes}`<10 ? `0${minutes}` :minutes}`;
clockTitle.classList.add("clock");
}
function init(){
     setInterval(getTime,1000);
}

init();