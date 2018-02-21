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
public class PedidoDTO {
    
    private Integer idPedido;
    private Integer idOferta;
    private String senal;
    private String financiado;
    private String tasacion;
    private String fechaPedido;
    private String fechaEntrega;

    public PedidoDTO() {
    }

    public PedidoDTO(Integer idPedido, Integer idOferta, String senal, String financiado, String tasacion, String fechaPedido, String fechaEntrega) {
        this.idPedido = idPedido;
        this.idOferta = idOferta;
        this.senal = senal;
        this.financiado = financiado;
        this.tasacion = tasacion;
        this.fechaPedido = fechaPedido;
        this.fechaEntrega = fechaEntrega;
    }

    public Integer getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Integer idPedido) {
        this.idPedido = idPedido;
    }

    public Integer getIdOferta() {
        return idOferta;
    }

    public void setIdOferta(Integer idOferta) {
        this.idOferta = idOferta;
    }

    public String getSenal() {
        return senal;
    }

    public void setSenal(String senal) {
        this.senal = senal;
    }

    public String getFinanciado() {
        return financiado;
    }

    public void setFinanciado(String financiado) {
        this.financiado = financiado;
    }

    public String getTasacion() {
        return tasacion;
    }

    public void setTasacion(String tasacion) {
        this.tasacion = tasacion;
    }

    public String getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(String fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }
    
    
    
}
