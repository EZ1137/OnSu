<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>
	$(document).ready(function(){ 
		init();
	});
</script>

</head>
<body>

	<video controls width="1000">
		<source src="http://localhost:8787/image/${videoDto.video_directory }" type="video/mp4">
	</video>
	
	<div><canvas id="canvas"></canvas></div>
	
	<script type="text/javascript">
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/pose

    // the link to your model provided by Teachable Machine export panel
    const URL = "${pageContext.request.contextPath}/resources/my_model/";
    let model, webcam, ctx, labelContainer, maxPredictions;

    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // Note: the pose library adds a tmPose object to your window (window.tmPose)
        model = await tmPose.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // Convenience function to setup a webcam
        const size = 200;
        const flip = true; // whether to flip the webcam
        webcam = new tmPose.Webcam(size, size, flip); // width, height, flip
        await webcam.setup(); // request access to the webcam
        await webcam.play();
        window.requestAnimationFrame(loop);

        // append/get elements to the DOM
        const canvas = document.getElementById("canvas");
        canvas.width = size; canvas.height = size;
        ctx = canvas.getContext("2d");
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
        }
    }

    async function loop(timestamp) {
        webcam.update(); // update the webcam frame
        await predict();
        window.requestAnimationFrame(loop);
    }

    var status = "normal";
    var count = 0;
    
    async function predict() {
        // Prediction #1: run input through posenet
        // estimatePose can take in an image, video or canvas html element
        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
        // Prediction 2: run input through teachable machine classification model
        const prediction = await model.predict(posenetOutput);
		
        if(prediction[0].probability.toFixed(2) > 0.95){		
        	status = "normal";									
        	
        }else if(0.20 < prediction[1].probability.toFixed(2) && prediction[1].probability.toFixed(2) < 0.96){	
        	status = "drowse";
        	
        	
        }else if(prediction[1].probability.toFixed(2) > 0.97){	
        	
        	if(status == "drowse") {
        		var audio = new Audio(URL + '졸지마' + count%3 + '.mp3');				
        		audio.play();
        		status = "normal";
        		count++;
        	}
        	
        }else if(0.20 < prediction[2].probability.toFixed(2) && prediction[2].probability.toFixed(2) < 0.96){	
        	status = "drowse";
        	
        	
        }else if(prediction[2].probability.toFixed(2) > 0.97){	
        	
        	if(status == "drowse") {
        		var audio = new Audio(URL + '졸지마' + count%3 + '.mp3');				
        		audio.play();
        		status = "normal";
        		count++;
        	}
        		
        	
        	
        }else if(0.20 < prediction[3].probability.toFixed(2) && prediction[3].probability.toFixed(2) < 0.96){	
        	status = "drowse";
        	
        	
        }else if(prediction[3].probability.toFixed(2) > 0.97){	
        	
        	if(status == "drowse") {
        		var audio = new Audio(URL + '졸지마' + count%3 + '.mp3');				
        		audio.play();
        		status = "normal";
        		count++;
        	}
        	
        }
        
        for (let i = 0; i < maxPredictions; i++) {
            const classPrediction =
                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
            labelContainer.childNodes[i].innerHTML = classPrediction;
        }

        // finally draw the poses
        drawPose(pose);
    }

    function drawPose(pose) {
        if (webcam.canvas) {
            ctx.drawImage(webcam.canvas, 0, 0);
            // draw the keypoints and skeleton
            if (pose) {
                const minPartConfidence = 0.5;
                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
            }
        }
    }
</script>
</body>
</html>