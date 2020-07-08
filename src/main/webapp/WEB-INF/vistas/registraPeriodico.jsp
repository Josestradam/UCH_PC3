<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Registra Periodico </title>
</head>
<body>

<div class="container">
<h1>Registra Periodico</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraMPeriodico" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_precio">Precio</label>
				<input class="form-control" id="id_precio" name="precio" placeholder="Ingrese el precio" type="text" maxlength="100"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_serie">Serie</label>
				<input class="form-control" id="id_serie" name="serie" placeholder="Ingrese la serie" type="text" maxlength="100"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_categoria">Categoria</label>
				<input class="form-control" id="id_categoria" name="categoria" placeholder="Ingrese la categoria" type="text" maxlength="100"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fechaLanzamiento">Fecha de Lanzamiento</label>
				<input class="form-control" type="date" id="id_fechaLanzamiento" name="FechaLanzamiento" placeholder="Ingrese la Fecha de Lanzamiento" maxlength="100"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fechaEdicion">Fecha de Edicion</label>
				<input class="form-control" type="date" id="id_fechaEdicion" name="fechaEdicion" placeholder="Ingrese la Fecha de Edicion" maxlength="100">    
			</div>
			<div class="form-group">
				<label class="control-label" for="id_pais">Pais</label>
				<select id="id_pais" name="pais.idPais" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crear</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$.getJSON("cargaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        precio: {
    		selector : '#id_precio',
            validators: {
                notEmpty: {
                    message: 'El precio es un campo obligatorio'
                },
            }
        },
        serie: {
    		selector : '#id_serie',
            validators: {
            	notEmpty: {
                    message: 'La serie es un campo obligatorio'
                },
            }
        },
        categoria: {
    		selector : '#id_categoria',
            validators: {
            	notEmpty: {
                    message: 'La categoria es un campo obligatorio'
                },
            }
        },
        pais: {
    		selector : '#id_pais',
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
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




