package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Pais;
import com.redsocial.entidad.Periodico;

@Repository
public class PeriodicoMySqlRepositorio implements PeriodicoRepositorio{

	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<Periodico> mapperPeriodico = new RowMapper<Periodico>() {
		@Override
		public Periodico mapRow(ResultSet rs, int rowNum) throws SQLException {
			Periodico obj = new Periodico();
			obj.setIdperiodico(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			obj.setPrecio(rs.getDouble(3));
			obj.setSerie(rs.getString(4));
			obj.setCategoria(rs.getString(5));
			obj.setFechalanzamiento(rs.getDate(6));
			obj.setFechaedicion(rs.getDate(7));
			
			Pais objPai = new Pais();
			objPai.setIdPais(rs.getInt(8));
			objPai.setNombre(rs.getString(9));
		
			obj.setPais(objPai);
			
			return obj;
		}
	};
	
	@Override
	public Periodico insertaActualizaPeriodico(Periodico obj) {
		Periodico salida = null;
		if (obj.getIdperiodico() == 0) {
			jdbcTemplate.update("insert into periodico values(null,?,?,?,?,?,?,?)",
			new Object[] {obj.getNombre(), obj.getPrecio(), obj.getSerie(), obj.getCategoria(),obj.getFechalanzamiento(),obj.getFechaedicion(),obj.getPais().getIdPais()});	
			List<Periodico> lista = jdbcTemplate.query("select m.*,d.nombre from periodico m inner join pais d on m.idPais = d.idpais order by m.idperiodico desc limit 0, 1",new Object[] {} ,mapperPeriodico);
			salida = lista.get(0);
		}else {
			jdbcTemplate.update("update periodico set nombre=?,precio=?,serie=?,categoria=?,fechalanzamiento =?, fechaedicion =?, idpais = ? where idperiodico=?", new Object[] {obj.getNombre(), obj.getPrecio(), obj.getSerie(), obj.getCategoria(),obj.getFechalanzamiento(), obj.getFechaedicion(), obj.getPais().getIdPais(), obj.getIdperiodico()});
			List<Periodico> lista = jdbcTemplate.query("select m.*,d.nombre from periodico m inner join pais d on m.idPais = d.idpais where m.idperiodico =?",new Object[] {obj.getIdperiodico()} ,mapperPeriodico);
			salida = lista.get(0);
		}
		return salida;
	}

	@Override
	public void eliminaPeriodico(int idPeriodico) {
		jdbcTemplate.update("delete from periodico where idperiodico = ?",new Object[] {idPeriodico});		
	}

	@Override
	public List<Periodico> listaPeriodico() {
		List<Periodico> lista = jdbcTemplate.query("select m.*,d.nombre from periodico m inner join deporte d on m.idDeporte = d.iddeporte", new Object[] {} ,mapperPeriodico);
		return lista;
	}

	@Override
	public List<Periodico> listaPeriodicoPorNombre(String nom) {
		List<Periodico> lista = jdbcTemplate.query("select m.*,d.nombre from periodico m inner join pais d on m.idPais = d.idpais where m.nombre like ?", new Object[] {nom} ,mapperPeriodico);
		return lista;
	}

	@Override
	public List<Periodico> listaPeriodico(int idPais, String nombre) {
		List<Periodico> lista = jdbcTemplate.query("select m.*,d.nombre from periodico m inner join pais d on m.idPais = d.idpais where m.idPais =? and m.nombre like ? ", new Object[] {idPais, nombre} ,mapperPeriodico);
		return lista;
	}

}
