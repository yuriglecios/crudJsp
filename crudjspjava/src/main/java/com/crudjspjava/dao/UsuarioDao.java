package com.crudjspjava.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.crudjspjava.bean.Usuario;

public class UsuarioDao {
	public static Connection getConnection() throws ClassNotFoundException {
		Connection con = null;
		
		try {
			Class.forName("org.postgresql.Driver");
			con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/teste","postgres","admin");
		} catch (SQLException e) {
			System.out.println(e);
		}
		 return con;
	}
	
	public static int deletarUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM usuario WHERE id=?");
			ps.setInt(1, u.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
		
	}
	
	
	public static int salvarUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			
			PreparedStatement psConsulta = con.prepareStatement("SELECT MAX(id) FROM usuario");
			ResultSet rs = psConsulta.executeQuery();
			int novoId = 1;
			if (rs.next()) {
				novoId = rs.getInt(1)+1;
			}
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO usuario (id, nome, cpf, idade) VALUES (?, ?, ?, ?)");
			ps.setInt(1, novoId);
			ps.setString(2, u.getNome());
			ps.setString(3, u.getCpf());
			ps.setInt(4, u.getIdade());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
		
	}
	
	public static Usuario getRegistroById(int id) {
		Usuario usuario = null;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("Select * FROM usuario WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setCpf(rs.getString("cpf"));
				usuario.setIdade(rs.getInt("idade"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return usuario;
	}
	
	public static int updateUsuario (Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE usuario SET nome=?, "
					+ "cpf=?, idade=? WHERE id=?");
			
			ps.setString(1, u.getNome());
			ps.setString(2, u.getCpf());
			ps.setInt(3, u.getIdade());
			ps.setInt(4, u.getId());
			status = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static List<Usuario> getALLUsuarios() throws ClassNotFoundException{
		List<Usuario> list = new ArrayList<Usuario>();
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM public.usuario");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setCpf(rs.getString("cpf"));
				usuario.setIdade(rs.getInt("idade"));
				list.add(usuario);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return list;
	}
	
		
	
}
