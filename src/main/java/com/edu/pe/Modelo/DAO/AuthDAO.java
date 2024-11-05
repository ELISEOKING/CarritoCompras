package com.edu.pe.Modelo.DAO;

import com.edu.pe.Modelo.Cliente;
import com.edu.pe.config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ENOC
 */
public class AuthDAO {

    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public Cliente Login(String correo, String password) {
        Cliente obj = null;
        try {
            cn = Conexion.getConnection();
            String sql = "select * from Cliente where correo = ? and password = ?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                obj = new Cliente();
                obj.setIdCliente(rs.getInt("id_cli"));
                obj.setNombres(rs.getString("nombres"));
                obj.setApellidos(rs.getString("apellidos"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ex) {
            }
        }
        return obj;
    }
}
