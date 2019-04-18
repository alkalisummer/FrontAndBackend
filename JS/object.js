var memberArray=['kihoon','bitcamp','dragon'];
console.log("memberArray[2]:",memberArray[1]);

var memberObject = {
  manager:'egoing',
  developer:'graphittie',
  designer:'leezhce'

}
memberObject.designer='kihoon';
console.log("memberObject.designer",memberObject.designer);
console.log("memberObject[designer]",memberObject['designer']);
delete memberObject.manager
console.log('after deletememberObject.manager', memberObject.manager);

