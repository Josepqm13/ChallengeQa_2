

function fn (){
var env = Karate.env;
if (env === 'pre'){
Karate.log ('ENV PRE');}
else if (env ==='des');{
Karate.log ('ENV DES');}
var pet = 'https://petstore.swagger.io'
var config ={
env:env,
myVarName: 'SomeValue',
petStore:petStore
}
if (env == 'dev'){
}else if (env =='e2e');{
}
return config;
}
