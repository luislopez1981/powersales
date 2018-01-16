/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cice.powersales.dto;

import java.sql.Date;

/**
 *
 * @author NYL
 */
public class OfertaDTO {
    
    private Integer idOferta;
    private Integer contactoId;
    private Integer vehiculoId;
    private Integer precioFinal;
    private String comentario;
    private String fecha;

    public OfertaDTO() {
    }

    public OfertaDTO(Integer idOferta, Integer contactoId, Integer vehiculoId, Integer precioFinal, String comentario, String fecha) {
        this.idOferta = idOferta;
        this.contactoId = contactoId;
        this.vehiculoId = vehiculoId;
        this.precioFinal = precioFinal;
        this.comentario = comentario;
        this.fecha = fecha;
    }

    public Integer getIdOferta() {
        return idOferta;
    }

    public void setIdOferta(Integer idOferta) {
        this.idOferta = idOferta;
    }

    public Integer getContactoId() {
        return contactoId;
    }

    public void setContactoId(Integer contactoId) {
        this.contactoId = contactoId;
    }

    public Integer getVehiculoId() {
        return vehiculoId;
    }

    public void setVehiculoId(Integer vehiculoId) {
        this.vehiculoId = vehiculoId;
    }

    public Integer getPrecioFinal() {
        return precioFinal;
    }

    public void setPrecioFinal(Integer precioFinal) {
        this.precioFinal = precioFinal;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
    
}
