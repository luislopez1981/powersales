/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cice.powersales.dto;

/**
 *
 * @author NYL
 */
public class UsuarioDTO {
    
    private Integer idUsuario;
    private String user;
    private String pass;

    public UsuarioDTO() {
    }

    public UsuarioDTO(Integer idUsuario, String user, String pass) {
        this.idUsuario = idUsuario;
        this.user = user;
        this.pass = pass;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    
}
