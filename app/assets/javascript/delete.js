var deleteButton = document.querySelectorAll(".delete-btn");
	  for (var i = 0; i < deleteButton.length; i++){
		  	deleteButton[i].addEventListener("click", deleteConfirmation);
	  	}
	  		function deleteConfirmation(e) {
		    	console.log('FUNC');
		    	if (confirm("Are you sure?")) {
		    	console.log('Delete');
		    	}
		    	else {
		    	console.log('DONT DELETE');
		      event.preventDefault()
		    	}
		  
		  	}