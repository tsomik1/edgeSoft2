<!DOCTYPE HTML>

<html>

<head>
<title>SoftEdge | Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.0/bootstrap-table.min.js"></script>
 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.0/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

</head>


Tesdt

<cfsilent>
	
</cfsilent>	

<body bgcolor="#FFFFFF" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" >


<div class="content">
	<h1>Search >>></h1>


<div class="container"><br />
	<div class="row">
        <div class="page-header">
           
        </div>
       
		
		<div id="toolbar" class="btn-group">
                    
		</div>
		
        <div id="Error" class="text-danger"></div>
        <div class="col-sm-12 col-md-12 col-lg-12">
            <table id="users" data-height="400" data-side-pagination="server" data-pagination="true" data-search="true"  clickToSelect="true" singleSelect="true" data-single-select="true"
            	data-toolbar="#toolbar"
            	data-show-refresh="true"
            	data-show-toggle="true"
		 		data-url="/cfc/myCFC.cfc?method=getMembers"
				data-show-columns="true"
				data-toolbar-align="left">
            </table>
        </div>
    </div>
</div>

<style>
	.form-control{
		font-size:14px;
	}

	#toolbar2{
		width:30%;
	}
</style>
<script type="text/javascript">

	$(document).ready(function(e) {
		
		$("#categoty").change(function(){
			$('#users').bootstrapTable('refresh',{query: {categoryid: $(this).val()}});
		})

		$('#users').bootstrapTable({
                method: 'get',
                url: '/cfc/myCFC.cfc?method=getMembers',
                cache: false,
                height: 600,
                striped: true,
                pagination: true,
                pageSize: 20,
                pageList: [10, 25, 50, 100, 200],
                search: true,
                showColumns: false,
                showRefresh: true,
	            singleSelect:true,
                smartDisplay	:true,
                minimumCountColumns: 2,
                clickToSelect: true,
                columns: [
				          {field: 'COUNT',title: 'WIKI #',align: 'right',valign: 'bottom',sortable: false},
						  {field: 'wikiid',title: 'Wiki ID',visible:false},
						  {field: 'name',title: 'Wiki Title',align: 'left',valign: 'middle',sortable: true},
						  {field: 'docUploaded',title: 'File Uploaded',align: 'left',valign: 'middle',sortable: true},
						  {field: 'status',title: 'Status',align: 'left',valign: 'top',sortable: true},
						  {field: 'operate',title: 'Actions',align: 'center',valign: 'middle',clickToSelect: false,formatter: operateFormatter,events: operateEvents}]
            });
    });

</script>

</div>
</body>
</html>