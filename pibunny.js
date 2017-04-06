#!/usr/bin/nodejs
var fs = require('fs');
const exec = require('child_process').exec;
var mainInterval = 0;
var lastOn = false;

function runLED( HEXCODE ){
	console.log( "neouart " + HEXCODE  );
	exec("neouart " + HEXCODE , function(){});
  
};

function updateLed(){
	clearInterval( mainInterval );
	fs.readFile('/tmp/lastled', 'utf8', function (err,data) {
		var ms = String( data ).replace( /[^0-9]/g , '' )
		var params =  ( String( data ).indexOf( "R" ) !== -1 ? "FF" : "00" ) + ( String( data ).indexOf( "G" ) !== -1 ? "FF" : "00" ) + ( String( data ).indexOf( "B" ) !== -1 ? "FF" : "00" ) ;
		if( ms != "" ){
			mainInterval = setInterval( function(){
			if( lastOn ){
				runLED( "000000" );
			} else {
				runLED( params );
			}
			lastOn = !lastOn;
			 } , parseInt( ms ) );
		} else {
			runLED( params );
		}
		
	});
}
fs.writeFile( "/tmp/lastled" , "G" , function(){
    fs.watch( "/tmp/lastled" , function(){
        updateLed();
    });
    updateLed();
});

var gpio = require("pi-gpio");
var pin = 11;
gpio.open(pin, "input", function(err) {         // Open pin 16 for output
        gpio.read(pin, function(err , val ) {
		if( val == 1 ){
			exec("/scripts/armingMode.sh" , function(){} );
		} else {
			exec("/scripts/switch1.sh" , function(){} );
		}
        });
});

