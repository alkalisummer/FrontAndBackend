function Person(name, first,second,third){
  this.name=name,
  this.first=first,
  this.second=second,
 this.third=third,
  this.sum=function() {
       return this.first+this.second+this.third;
  }
 }
 var kim = new Person('kim',10,20,30);
 var lee = new Person('lee',10,10,10);


  console.log("kim.sum()", kim.sum());
  console.log("lee.sum()", lee.sum());

 var d1 =  new Date('2019-4-10');
 console.log('d1.getFullYear()',d1.getFullYear());
 console.log('d1.getFullYear()',d1.getMonth());
 
 console.log('Date',Date);

 
  console.log('new Person()', new Person()); // 함수 앞에 new 를 붙이면 객체를 생성하는 생성자가 됨, constructor function
  



