function Person(name, first,second){
  this.name=name,
  this.first=first,
  this.second=second

 }
 Person.prototype.sum=function() { // -> Person이 실행될때마다 생성되지않기 때문에 성능 향상 
     return 'prototype:'+ (this.first+this.second);
}

 var kim = new Person('kim',10,20);
  kim.sum = function(){
       return 'this: ' + (this.first+this.second);
  }
 var lee = new Person('lee',10,10);



  console.log("kim.sum()", kim.sum());
  console.log("lee.sum()", lee.sum());

 

