use bookstore;

select usuario, nombre
from empleado
inner join usuario on usuario.idempleado = empleado.idempleado;


select email as correo 
from empleado 
inner join usuario on usuario.idempleado = empleado.idempleado && usuario.activo != 0;


select count(idpublicacion)
from publicacion
where publicacion.autor = 'Eric G. Coronel Castillo';


select sum(precio)
from venta
inner join empleado on empleado.idempleado = venta.idempleado && empleado.nombre = 'EMILIO'

