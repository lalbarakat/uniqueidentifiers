// QRCODE reader Copyright 2011 Lazar Laszlo
// http://www.webqr.com

var gCtx = null;
var gCanvas = null;
var c=0;
var stype=0;
var gUM=false;
var webkit=false;
var moz=false;
var v=null;
var webcam_stream;
var read_ids = [];

var imghtml='<div id="qrfile"><canvas id="out-canvas" width="320" height="240"></canvas>'+
    '<div id="imghelp">drag and drop a QRCode here'+
	'<br>or select a file'+
	'<input type="file" onchange="handleFiles(this.files)"/>'+
	'</div>'+
'</div>';

var vidhtml = '<video id="v" autoplay></video>';

function initCanvas(w,h) {
    gCanvas = document.getElementById("qr-canvas");
    gCanvas.style.width = w + "px";
    gCanvas.style.height = h + "px";
    gCanvas.width = w;
    gCanvas.height = h;
    gCtx = gCanvas.getContext("2d");
    gCtx.clearRect(0, 0, w, h);
}


function captureToCanvas() {
    if(stype != 1)
        return;
    if(gUM) {
        try{
            gCtx.drawImage(v,0,0);
            try{
                qrcode.decode();
            }
            catch(e){       
                console.log(e);
                setTimeout(captureToCanvas, 500);
            };
        }
        catch(e){       
                console.log(e);
                setTimeout(captureToCanvas, 500);
        };
    }
}

function htmlEntities(str) {
    return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}

function close_webcam() {
   v.pause();
   v.src="";
   webcam_stream.stop();
}

function read(a) {
    if(a in read_ids) { 
    	setTimeout(captureToCanvas, 500);	// Keep scanning
    	return; // We've already read this ID
    }
    read_ids[a] = true;
    add_row(a);
    document.getElementById('scanned').play();
    setTimeout(captureToCanvas, 500);	// Keep scanning
    //close_webcam();
}	

function isCanvasSupported(){
  	var elem = document.createElement('canvas');
  	return !!(elem.getContext && elem.getContext('2d'));
}

function success(stream) {
    webcam_stream = stream;
    if(webkit) {
        v.src = window.webkitURL.createObjectURL(stream);
    } else if(moz) {
	v.mozSrcObject = stream;
	v.play();
    } else {
	v.src = stream;
    }
    gUM=true;
    setTimeout(captureToCanvas, 500);
}
		
function error(error) {
    gUM=false;
    return;
}

function load() {
	if(isCanvasSupported() && window.File && window.FileReader) {
		initCanvas(870, 600);
		qrcode.callback = function(data) { read(data); }
        	setwebcam();
	} else {
		document.getElementById("mainbody").style.display="inline";
		document.getElementById("mainbody").innerHTML='<p id="mp1">QR code scanner for HTML5 capable browsers</p><br>'+
        		'<br><p id="mp2">sorry your browser is not supported</p><br><br>'+
        		'<p id="mp1">try <a href="http://www.mozilla.com/firefox"><img src="firefox.png"/></a>' + 
        		'or <a href="http://chrome.google.com"><img src="chrome_logo.gif"/></a> or <a href="http://www.opera.com"><img src="Opera-logo.png"/></a></p>';
	}
}

function setwebcam(constraints) {
    constraints = (constraints === undefined)? {video: true, audio: false} : constraints;
    if(stype==1) {
        setTimeout(captureToCanvas, 500);    
        return;
    }

    var n=navigator;
    document.getElementById("outdiv").innerHTML = vidhtml;
    v = document.getElementById("v");
    if(v.src != "") close_webcam();

    if(n.getUserMedia) {
    	n.getUserMedia(constraints, success, error);
    } else if(n.webkitGetUserMedia) {
	webkit=true;
	n.webkitGetUserMedia(constraints, success, error);
    } else if(n.mozGetUserMedia) {
	moz=true;
	n.mozGetUserMedia(constraints, success, error);
    }

    stype=1;
    setTimeout(captureToCanvas, 500);
}
