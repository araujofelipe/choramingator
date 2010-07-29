/*
$('#nome').blur( function(){
  if(this.value == ''){
    this.value = 'Anonimo';
  	$('#nome').css('color','#DCDCDC');
  }
});
$('#nome').click( function(){
  if(this.value == 'Anonimo')
    this.value = '';
});
*/	
	
function chorar(){
	var nome = $('#nome').val();
	var choro = $('#choro').val();
	$.post('/chora',{'nome':nome,'choro':choro}, function(data){
		
		$('#notice').css('display', 'block')
		$('#notice').fadeOut(1000, function(){});
		printResult(data);
		
	})
}

function printResult(json){
	var obj = $.parseJSON(json);
	var div = "<div id='"+obj.id+"'>";
	div += "<span> Nome: ";
	div += obj.nome;
	div += "</span>";
	div += "<span> Choramingo: ";
	div += obj.choro;
	div += "</span>";
	div += "</div>";
}