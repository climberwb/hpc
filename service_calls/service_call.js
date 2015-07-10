var requests = ["https://httpbin.org/delay/5","https://httpbin.org/ip","https://httpbin.org/user-agent"]

function Requests(url,i,callback,parameters){
    console.log('call to '+url[i]+' was made, waiting for a response...');
    $.ajax({
      url: url[i],
      method: "GET",
      dataType: "json"
    }).done(function(msg){
        if(i ===1){
           parameters.origin = callback.call(msg).origin; 
        }else if(i===2){
           parameters.userAgent = callback.call(msg)["user-agent"]; 
           return console.log("IP = "+parameters.origin  +"\nUA = "+parameters.userAgent);
        }
         i++;
         if(i< url.length){
           Requests(url,i,callback,parameters);
         }   
        }).fail(function( jqXHR, textStatus ) {
            var  responseStringUrl = "request "+url[i] + " failed";
            return alert(responseStringUrl);
        });
}

Requests(requests,0,function(){
    return this;
},{origin:"",userAgent:""});


