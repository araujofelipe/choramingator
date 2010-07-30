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
		$('#notice').html($.parseJSON(data).message);
		$('#notice').css('display', 'block')
		$('#notice').fadeOut(5000, function(){});
		printResult(data);
		
	})
}

function printResult(json){
	var obj = $.parseJSON(json);
	var div = "<div class='choramingo_item' id='choramingo_item_"+obj.id+"'>";
	div += "<span> Nome: ";
	div += obj.nome;
	div += "</span><br />";
	div += "<span> Choramingo: ";
	div += obj.choro;
	div += "</span><br /><br />";
	div += "</div>";
	$('#choramingos').prepend(div);
	
}
