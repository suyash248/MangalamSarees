$(function(){
	initAll();
});

function initAll(){
	initializeDataTable();
	initializeDatepicker();
}

function getBasePath(){
	return "/mangalamSaree";
}

function initializeDatepicker(){
	$('.datepicker').datepicker({
		//dateFormat: 'yy-mm-dd'
	});
}

function initializeDataTable(){
	$('.datatable').dataTable({
		"pagingType": "full_numbers",
		"jQueryUI": true,
		 "paging":   true,
	      "ordering": true,
	      "info":     true,
	      "scrollY": 180,
	      "scrollCollapse": true,
	      "bPaginate": true
	});
}

function showMessage(msg, selector){
	if(selector==null)
		selector="#msgDiv";
	$(selector).html(msg);
	$(selector).slideDown();
	$(selector).delay(5000).slideUp();
}

function showError(error, selector){
	if(selector==null)
		selector="#errDiv";
	$(selector).html(error);
	$(selector).slideDown();
	$(selector).delay(5000).slideUp();
}

function spin(target){
	var imgLoader = getBasePath()+"/resources/images/ajax-loader.gif";
	$(document).ajaxStart(function() {
	    $(target).append('<div id="loading-image"><img style="position:absolute; top: 50%;left: 50%;margin-left: -50px;margin-top: -50px;text-align:center;z-index:1234;overflow: auto;width: 100pxheight: 102px" src="'+imgLoader+'" alt="Loading..." /></div>');
	})
	$(document).ajaxStop(function() {
		$('#loading-image').remove();
	})
}

function initializeTooltip(title, target){
	if(target==null)
		target=".tooltip";
	$(target).tooltip({
		placement: "auto bottom",
		title: title
	});
}