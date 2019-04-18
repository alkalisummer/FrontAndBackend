//  const mon = "Mon";
//  const tue = "Tue";
//  const wed = "Wed";
//  const thu = "Ths";
//  const fri = "Fri";

//  const daysOfWeek = ["Mon","Tue","Wed","Ths","Fri"
// ,"Sat","Sun",true,23];

// console.log(daysOfWeek[2]);

// const userinfo= ["kihoon","55",true,"seoul"];

// console.log(userinfo[0]) ;

// const kihoon = {
//     name: "kihoon",
//     age:28,
//     gender:'male',
//     isHandsome:false,
//      favMovies:["Lotr", "oldboy","mine"],
//      favFood:[     
//           {name: "kimch", fatty:false},
//          {name: "cheese burger", fatty:true}

//      ]
// }

// function sayHello(name,age){
//     return `Hello ${name} you are ${age} years old`;
// }

// const calculator = {
//     plus:function (num1, num2 ){
//         result = num1 + num2;

//         return result;
//     },
//     sub:function(num1, num2){
       
//         return (num1 - num2);
//     },

//     mul:function(num1,num2){

//         return (num1*num2);
//     },

//     div:function(num1,num2){
//         return (num1/num2);

//     },

//     pow:function(num1){
//         return(num1*num1);
//     }
 

// }

// console.log(calculator.plus(5,5),calculator.sub(10,5),calculator.mul(5,5),calculator.div(10,5),calculator.pow(5));
// console.log(kihoon.favFood[0].fatty, kihoon.favMovies[0]);
// const greetKihoon = sayHello(kihoon.name,kihoon.age);
// console.log(greetKihoon);



//  title.innerHTML ="Hi! JS";
// //title.style.color = "red";
//  document.title = "I own you now";



//window.addEventListener("click",handleClick);

//  if(10===10){
//      console.log("hi");
//  }  else{
//     console.log("ho");
//  }
// // const age = prompt("How old are u?");

// if (age>=18 && age <=21 ){
//     console.log("you can drink but you should not ");
// }else if(age>21){
//     console.log("go ahead")
// }else{
//     console.log("Too young")
// }

// console.log(age);

// function handleClick(){
//     const currentColor = title.style.color;
//     if( currentColor == BASE_COLOR){
//         title.style.color = OTHER_COLOR;
//     }else{
//         title.style.color = BASE_COLOR;
  
//     }
      
//   }
const title = document.querySelector("#title");


const CLICKED_CLASS ="clicked";

function handleClick(){
    title.classList.toggle(CLICKED_CLASS);
}


function init(){
    title.addEventListener("click",handleClick);
}
init();

