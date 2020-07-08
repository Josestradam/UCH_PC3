<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registra Periodico </title>
</head>
<body> 

 <div class="container">
 <h1>Registra Periodico</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaPeriodico">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="listaPeriodico" class="simple_form" id="defaultForm2"  method="get">
		       		<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_periodico_filtro">PERIODICO</label>
							  	<input class="form-control" id="id_periodico_filtro"  name="filtro" placeholder="Ingrese periodico" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tablePeriodico" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Precio</th>
												<th>Serie</th>
												<th>Categoria</th>
												<th>FechaLanzamiento</th>
												<th>FechaEdicion</th>
												<th>Pais</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												     
												<c:forEach items="${periodico}" var="x">
													<tr>
														<td>${x.idperiodico}</td>
														<td>${x.nombre}</td>
														<td>${x.precio}</td>
														<td>${x.serie}</td>
														<td>${x.categoria}</td>
														<td>${x.fechalanzamiento}</td>
														<td>${x.fechaedicion}</td>
														<td>${x.pais.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idperiodico}','${x.nombre}','${x.precio}','${x.serie}','${x.categoria}','${x.fechalanzamiento}','${x.fechaedicion}','${x.pais.idPais}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idPeriodico}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
														
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Periodico</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraPeriodico" class="form-horizontal"     method="post">
				            <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Periodico</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_Nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_Nombre" name="Nombre" placeholder="Ingrese nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_Precio">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_Precio" name="Precio" placeholder="Ingrese Precio" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_Serie">Serie</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_Serie" name="Serie" placeholder="Ingrese la serie" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_Categoria">Categoria</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_Categoria" name="Categoria" placeholder="Ingrese la categoria" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_FechaLanzamiento">FechaLanzamiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_FechaLanzamiento" name="fechalanzamiento" placeholder="Ingrese Fecha de lanzamiento" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_FechaEdicion">FechaEdicion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_FechaEdicion" name="fechaedicion" placeholder="Ingrese Fecha de Edicion" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">Pais</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_pais" name="deporte.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Periodico</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="actualizaPeriodico" class="form-horizontal"     method="post">
							<div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Periodico</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idPeriodico" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_Nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_Nombre" name="Nombre" placeholder="Ingrese Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_Precio">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_Precio" name="Precio" placeholder="Ingrese Precio" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_Serie">Serie</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_Serie" name="Serie" placeholder="Ingrese Serie" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_Categoria">Categoria</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_Categoria" name="categoria" placeholder="Ingrese Categoria" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_FechaLanzamiento">FechaLanzamiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_FechaLanzamiento" name="fechalanzamiento" placeholder="Ingrese la Fecha de Lanzamiento" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_FechaEdicion">FechaEdicion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_FechaEdicion" name="fechaedicion" placeholder="Ingrese la Fecha de Edicion" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Pais</label>
		                                        <div class="col-lg-5">
													<select id="id_act_pais" name="deporte.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">
$.getJSON("cargaPais", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,Nombre,Precio,Serie,Categoria,FechaLanzamiento,FechaEdicion,idPais){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_Nombre]').val(Nombre);
	$('input[id=id_act_Precio]').val(Precio);
	$('input[id=id_act_Serie]').val(Serie);
	$('input[id=id_act_Categoria]').val(Categoria);
	$('input[id=id_act_FechaLanzamiento]').val(FechaLanamiento);
	$('input[id=id_act_FechaEdicion]').val(FechaEdicion);
	$('select[id=id_act_pais]').val(idPais);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePeriodico').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_reg_Nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                }
            },
        	"precio": {
        		selector : '#id_reg_Precio',
                validators: {
                    notEmpty: {
                        message: 'El Precio es un campo obligatorio'
                    },
                }
            },
        	"serie": {
        		selector : '#id_reg_Serie',
                validators: {
                    notEmpty: {
                        message: 'La serie es un campo obligatorio'
                    },
                }
            },     
            "categoria": {
        		selector : '#id_reg_Categoria',
                validators: {
                    notEmpty: {
                        message: 'La categoria es un campo obligatorio'
                    },
                }
            },   
            "fechaLanzamiento": {
        		selector : '#id_reg_FechaLanzamiento',
                validators: {
                    notEmpty: {
                        message: 'La fecha de lanzamiento es un campo obligatorio'
                    },
                }
            },
            "fechaEdicion": {
        		selector : '#id_reg_FechaEdicion',
                validators: {
                    notEmpty: {
                        message: 'La fecha de edicion es un campo obligatorio'
                    },
                }
            },
            "pais.idPais": {
        		selector : '#id_reg_pais',
                validators: {
                	notEmpty: {
                        message: 'El pais un campo obligatorio'
                    },
                }
            },              
        }   
    });
</script>

<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_act_Nombre',
                validators: {
                    notEmpty: {
                        message: 'El Nombre es un campo obligatorio'
                    },
                }
            },
        	"precio": {
        		selector : '#id_act_Precio',
                validators: {
                    notEmpty: {
                        message: 'El Precio es un campo obligatorio'
                    },
                }
            },
        	"serie": {
        		selector : '#id_act_Serie',
                validators: {
                    notEmpty: {
                        message: 'La Serie es un campo obligatorio'
                    },
                }
            },     
            "categoria": {
        		selector : '#id_act_Categoria',
                validators: {
                    notEmpty: {
                        message: 'La categoria es un campo obligatorio'
                    },
                }
            },                 
            "fechaLanzamiento": {
        		selector : '#id_act_FechaLanzamiento',
                validators: {
                    notEmpty: {
                        message: 'La fecha de lanzamiento es un campo obligatorio'
                    },
                }
            },
            "fechaEdicion": {
        		selector : '#id_act_FechaEdicion',
                validators: {
                    notEmpty: {
                        message: 'La fecha de edicion es un campo obligatorio'
                    },
                }
            },
            "pais.idPais": {
        		selector : '#id_act_pais',
                validators: {
                	notEmpty: {
                        message: 'El pais un campo obligatorio'
                    },
                }
            },    
          
        }   
    });
</script>

    
</body>
</html> 