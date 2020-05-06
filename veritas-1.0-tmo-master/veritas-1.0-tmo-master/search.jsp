<script type="text/javascript">
$(document).ready(function(){
	// Search all columns ON THE PAGE, not db
	$('#txt_searchall').keyup(function(){
		// Search Text
	    var search = $(this).val();
		
		if(search.length> 0){
			// Hide all table tbody rows
	    	$('table tbody tr').hide();
			
			// Count total search result
			var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;
			
			if(len > 0){
				// Searching text in columns and show match row
				$('table tbody tr:not(.notfound) td:contains('+search+')').each(function(){
					$(this).closest('tr').show();
					});
			}else {
				$('.notfound').show();
			}
		}
	});
});

//Case-insensitive searching (Note - remove the below script for Case sensitive search )
$.expr[":"].contains = $.expr.createPseudo(function(arg) {
	return function( elem ) {
		
		return $.trim(elem.innerHTML.toLowerCase()).indexOf(arg.toLowerCase())>=0;
		//return $(elem).text().indexOf(arg) >= 0; <-- I don't know what this does but it was enabled instead of the case-insensitive return statement right above this
   };
});
</script>

<thead>
    <tr  style="border:2px double #FF0099;border-style:  solid double;">
    <td width=100% colspan=3>
   <input type="text" id='txt_searchall'  placeholder="Search by any field below..." >
   </td>
 
   <% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
   <td width=10% align =center>
   <i class="fa fa-file-excel-o fa-2x" aria-hidden="true" title="Export to Excel" onclick="Export('Veritas_Project_Export.xls')"></i></td>
   <%}%>
   </tr>
</thead>