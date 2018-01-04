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
public class VehiculoDTO {
    
    private Integer idVehiculo;
    private String matricula;
    private String marca;
    private String modelo;
    private String version;
    private String motor;
    private String potencia;
    private String combustible;
    private String color;
    private Date fechamatricula;
    private String kilometraje;
    private Integer precio;

    public VehiculoDTO() {
    }

    public VehiculoDTO(Integer idVehiculo, String matricula, String marca, String modelo, String version, String motor, String potencia, String combustible, String color, Date fechamatricula, String kilometraje, Integer precio) {
        this.idVehiculo = idVehiculo;
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.version = version;
        this.motor = motor;
        this.potencia = potencia;
        this.combustible = combustible;
        this.color = color;
        this.fechamatricula = fechamatricula;
        this.kilometraje = kilometraje;
        this.precio = precio;
    }

    public Integer getIdVehiculo() {
        return idVehiculo;
    }

    public void setIdVehiculo(Integer idVehiculo) {
        this.idVehiculo = idVehiculo;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getMotor() {
        return motor;
    }

    public void setMotor(String motor) {
        this.motor = motor;
    }

    public String getPotencia() {
        return potencia;
    }

    public void setPotencia(String potencia) {
        this.potencia = potencia;
    }

    public String getCombustible() {
        return combustible;
    }

    public void setCombustible(String combustible) {
        this.combustible = combustible;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Date getFechamatricula() {
        return fechamatricula;
    }

    public void setFechamatricula(Date fechamatricula) {
        this.fechamatricula = fechamatricula;
    }

    public String getKilometraje() {
        return kilometraje;
    }

    public void setKilometraje(String kilometraje) {
        this.kilometraje = kilometraje;
    }

    public Integer getPrecio() {
        return precio;
    }

    public void setPrecio(Integer precio) {
        this.precio = precio;
    }
    
    
    
    
}
