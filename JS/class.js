class Person{
    constructor(name,first,second){
          this.name = name;
          this.first = first;
          this.second = second;
         
    }
    sum(){ // -> Person이 실행될때마다 생성되지않기 때문에 성능 향상 
        return this.first+this.second;
    }
    avg(){
        return (this.first+this.second)/2;
    }
}
 class PersonPlus extends Person{
    constructor(name,first,second,third){
        super(name,first,second);
       this.third = third;
  }
  sum(){ // -> Person이 실행될때마다 생성되지않기 때문에 성능 향상 
      return super.sum()+this.third;
  }
    
  avg(){
      return (this.first+this.second+this.third)/3;
  }
 }



var kim = new PersonPlus('kim',10,20,30);

   console.log("kim.sum()", kim.sum());
   console.log("kim.sum()", kim.avg());
   