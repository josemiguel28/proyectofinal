<?php

namespace Dao\Servicios;

use Dao\Table;

class Servicios extends Table
{

    public static function getAllServicios(): bool|array
    {
        return self::obtenerRegistros("SELECT * FROM getAllServicios", []);
    }

    public static function getServicioById($id)
    {
        
        return self::obtenerUnRegistro("select * from getServicioById where servicioId =:id", ["id" => $id]);
    }

    public static function insertarServicio(
        $servicioNombre,
        $servicioPrecio,
        $servicioCategoria,
        $servicioTipo,
        $servicioDescripcion,
        $servicioImagen,
        $servicioPlataforma,
        $servicioStock

    ): bool
    {

        $sqlstr = "INSERT INTO servicios (servicioNombre, servicioPrecio, categoriaId, servicioTipoId, servicioDescripcion, servicioImagen, plataformaId, stock) 
    VALUES (:servicioNombre, :servicioPrecio, :servicioCategoria, :servicioTipo, :servicioDescripcion, :servicioImagen, :servicioPlataforma, :servicioStock)";

        $params = [
            "servicioNombre" => $servicioNombre,
            "servicioPrecio" => $servicioPrecio,
            "servicioCategoria" => $servicioCategoria,
            "servicioTipo" => $servicioTipo,
            "servicioDescripcion" => $servicioDescripcion,
            "servicioImagen" => $servicioImagen,
            "servicioPlataforma" => $servicioPlataforma,
            "servicioStock" => $servicioStock
        ];

        return self::executeNonQuery($sqlstr, $params);
    }

    public static function actualizarServicio(
        $servicioId,
        $servicioNombre,
        $servicioPrecio,
        $servicioCategoria,
        $servicioTipo,
        $servicioDescripcion,
        $servicioImagen,
        $servicioPlataforma,
        $servicioStock

    ): bool
    {

        $sqlstr = "UPDATE servicios 
    SET servicioNombre = :servicioNombre, 
    servicioPrecio = :servicioPrecio, 
    categoriaId = :servicioCategoria, 
    servicioTipoId = :servicioTipo, 
    servicioDescripcion = :servicioDescripcion, 
    servicioImagen = :servicioImagen, 
    plataformaId = :servicioPlataforma, 
    stock = :servicioStock 
    
    WHERE servicioId = :servicioId";

        $params = [
            "servicioId" => $servicioId,
            "servicioNombre" => $servicioNombre,
            "servicioPrecio" => $servicioPrecio,
            "servicioCategoria" => $servicioCategoria,
            "servicioTipo" => $servicioTipo,
            "servicioDescripcion" => $servicioDescripcion,
            "servicioImagen" => $servicioImagen,
            "servicioPlataforma" => $servicioPlataforma,
            "servicioStock" => $servicioStock
        ];

        return self::executeNonQuery($sqlstr, $params);
    }

    public static function eliminarServicio($servicioId): bool
    {
        $sqlstr = "DELETE FROM servicios WHERE servicioId = :servicioId";
        return self::executeNonQuery($sqlstr, ["servicioId" => $servicioId]);
    }

    public static function getAllCategorias(): bool|array
    {
        return self::obtenerRegistros("SELECT * FROM serviciocategoria ", []);
    }

    public static function getAllPlataformas(): bool|array
    {
        return self::obtenerRegistros("SELECT * FROM servicioplataforma", []);
    }

    public static function getAllTipoServicio()
    {
        return self::obtenerRegistros("SELECT * FROM serviciotipo", []);
    }

    public static function getPS4Products()
    {
        return self::obtenerRegistros("SELECT * FROM getPS4Products", []);
    }
}
