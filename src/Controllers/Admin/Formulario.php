<?php

namespace Controllers\Admin;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Servicios\Servicios as ServiciosDao;
use Utilities\Validators;
use Utilities\Site;
use Utilities\ArrUtils;
use Utilities\Context;

class Formulario extends PublicController
{

    private $viewData = array();
    private $servicioId = 0;
    private $servicioNombre = "";
    private $servicioPrecio = "";
    private $servicioCategoria = "";
    private $servicioTipo = "";
    private $servicioDescripcion = "";
    private $servicioImagen = "";
    private $nombreImagen = "";
    private $servicioPlataforma = "";
    private $servicioStock = "";

    private $prueba = "";
    private $mode = "DSP";
    private $modeDscArr = [
        "DSP" => "Mostrar %s",
        "INS" => "Insertar %s",
        "DEL" => "Eliminar %s",
        "UPD" => "Actualizar %s"
    ];

    private $errors = [];
    private $hasErrors = false;
    private $isReadOnly = "readonly";
    private $showActions = true;


    private function getDatos()
    {
        if (isset($_GET["mode"])) {
            $this->mode = $_GET["mode"];

            if (!isset($this->modeDscArr[$this->mode])) {
                $this->addError("modo invalido");
            }
        }

        if (isset($_GET["id"])) {
            $this->servicioId = intval($_GET["id"]);
            $tmpDataFromDb = ServiciosDao::getServicioById($this->servicioId);

            if ($tmpDataFromDb) {
                $this->servicioNombre = $tmpDataFromDb["servicioNombre"];
                $this->servicioDescripcion = $tmpDataFromDb["servicioDescripcion"];
                $this->servicioPrecio = $tmpDataFromDb["servicioPrecio"];
                $this->servicioImagen = $tmpDataFromDb["servicioImagen"];
                $this->servicioStock = $tmpDataFromDb["stock"];
                $this->servicioTipo = $tmpDataFromDb["servicioTipoDesc"];
                $this->servicioPlataforma = $tmpDataFromDb["plataformaNombre"];
                $this->servicioCategoria = $tmpDataFromDb["categoriaNombre"];
            } else {
                $this->addError("Servicio no encontrado");
            }
        }
    }


    private function getPostData()
    {

        $tmpMode = "";

        if (isset($_POST["mode"])) {
            $tmpMode = $_POST["mode"];

            if (!isset($this->modeDscArr[$tmpMode])) {
                $this->addError("Modo Invalido");
            }

            if ($this->mode != $tmpMode) {
                $this->addError("Modo Invalido");
            }
        }

        if (isset($_POST["servicioId"])) {
            $this->servicioId = $_POST["servicioId"];

        }

        if (isset($_POST["nombreServicio"])) {
            $this->servicioNombre = $_POST["nombreServicio"];

            if (Validators::IsEmpty($this->servicioNombre)) {
                $this->addError("Se necesita un nombre del servicio", "nombre_error");
            }
        }


        if (isset($_POST["servicioStock"])) {
            $this->servicioStock = $_POST["servicioStock"];

            if (Validators::IsEmpty($this->servicioStock)) {
                $this->addError("Se necesita un stock", "stock_error");
            }
        }

        if (isset($_POST["servicioPrecio"])) {
            $this->servicioPrecio = $_POST["servicioPrecio"];

            if (Validators::IsEmpty($this->servicioPrecio)) {
                $this->addError("Se necesita un precio", "precio_error");
            }
        }


        if (isset($_POST["servicioCategoria"])) {
            $this->servicioCategoria = $_POST["servicioCategoria"];

            if (Validators::IsEmpty($this->servicioCategoria)) {
                $this->addError("Categoria invalida", "categoria_error");
            }
        }

        if (isset($_POST["servicioPlataforma"])) {
            $this->servicioPlataforma = $_POST["servicioPlataforma"];

            if (Validators::IsEmpty($this->servicioPlataforma)) {
                $this->addError("Plataforma Invalida invalida", "plataforma_error");
            }
        }

        if (isset($_POST["servicioTipo"])) {
            $this->servicioTipo = $_POST["servicioTipo"];

            if (Validators::IsEmpty($this->servicioTipo)) {
                $this->addError("Servicio invalido", "servicio_error");
            }
        }

        if (isset($_POST["servicioDescripcion"])) {
            $this->servicioDescripcion = $_POST["servicioDescripcion"];

            if (Validators::IsEmpty($this->servicioDescripcion)) {
                $this->addError("Descripcion invalida", "descripcion_error");
            }
        }

        if (isset($_FILES["servicioImagen"])) {
            $tmpServicioImagen = $_FILES["servicioImagen"];
            
            //validar que la imagen no sea mayor a 1mega
            $medida = 1000 * 1000;
            
            if ($tmpServicioImagen["size"] > $medida) {
                $this->addError("La imagen no puede ser mayor a 1MB", "imagen_error");
            }
            if ($tmpServicioImagen["name"] || $tmpServicioImagen["size"] === 0) {
                $this->addError("Debes Agregar una imagen", "imagen_error");
            }
            $this->imagenAcciones($tmpServicioImagen);
        }
        
        
    }

    /**
     * Maneja las diferentes acciones de la imagen que se alojan en el servidor
     *
     * @param array $servicioImagen
     */
    private function imagenAcciones($servicioImagen): void
    {
        $getImagenFromDB = ServiciosDao::getServicioById($this->servicioId);

        $carpetaImagenes = '../../' . Context::getContextByKey("BASE_DIR") . "/imagenes";
        
        //revisa si la carpeta existe
        if (!is_dir($carpetaImagenes)) {
            mkdir($carpetaImagenes);
        }
        
        switch ($this->mode){
            case "INS":
                $this->nombreImagen = md5(uniqid(rand(), true)) . ".svg";
                move_uploaded_file($servicioImagen['tmp_name'], $carpetaImagenes . "/" . $this->nombreImagen);
                break;
            case "UPD":
                if ($servicioImagen["name"]) {
                    $temp = unlink($carpetaImagenes . "/" . $getImagenFromDB["servicioImagen"]);
                    $this->nombreImagen = md5(uniqid(rand(), true)) . ".svg";
                    move_uploaded_file($servicioImagen['tmp_name'], $carpetaImagenes . "/" . $this->nombreImagen);
                } else {
                    $this->nombreImagen = $getImagenFromDB["servicioImagen"];
                }
                break;
            case "DEL":
                unlink($carpetaImagenes . "/" . $getImagenFromDB["servicioImagen"]);
                break;
        }
      
    }
    
    private function executePostAction()
    {
        switch ($this->mode) {
            case "INS":
                $result = ServiciosDao::insertarServicio(
                    $this->servicioNombre,
                    $this->servicioPrecio,
                    $this->servicioCategoria,
                    $this->servicioTipo,
                    $this->servicioDescripcion,
                    $this->nombreImagen,
                    $this->servicioPlataforma,
                    $this->servicioStock
                );

                if ($result > 0) {
                    Site::redirectToWithMsg(
                        "index.php?page=Admin_ListaServicios",
                        "Servicio Creado"
                    );
                } else {

                    $this->addError("Error al crear el servicio");
                }
                break;

            case "UPD":
                //$this->rutaImagen($this->servicioImagen);
                $result = ServiciosDao::actualizarServicio(
                    $this->servicioId,
                    $this->servicioNombre,
                    $this->servicioPrecio,
                    $this->servicioCategoria,
                    $this->servicioTipo,
                    $this->servicioDescripcion,
                    $this->nombreImagen,
                    $this->servicioPlataforma,
                    $this->servicioStock
                );


                if ($result > 0) {
                    Site::redirectToWithMsg(
                        "index.php?page=Admin_ListaServicios",
                        "Servicio Actualizado"
                    );
                } else {
                    // Agrega aquí el mensaje o la acción que quieras realizar si no se realizó ninguna actualización
                    Site::redirectToWithMsg(
                        "index.php?page=Admin_ListaServicios",
                        "No se realizó ninguna actualización"
                    );
                }
                break;


            case "DEL":
                $result = ServiciosDao::eliminarServicio(
                    $this->servicioId
                );

                if ($result > 0) {
                    Site::redirectToWithMsg(
                        "index.php?page=Admin_ListaServicios",
                        "Servicio Eliminado"
                    );
                }
                break;
        }
    }


    private function prepareView()
    {

        $this->viewData["modeDsc"] = sprintf($this->modeDscArr[$this->mode], $this->mode);
        $this->viewData["mode"] = $this->mode;
        $this->viewData["servicioId"] = $this->servicioId;
        $this->viewData["nombreServicio"] = $this->servicioNombre;
        $this->viewData["servicioStock"] = $this->servicioStock;
        $this->viewData["servicioPrecio"] = $this->servicioPrecio;
        $this->viewData["servicioCategoria"] = $this->servicioCategoria;
        $this->viewData["servicioImagen"] = $this->servicioImagen;
        $this->viewData ["prueba"] = $this->prueba;
        $this->viewData["servicioCategoriaOpciones"] = ArrUtils::objectArrToOptionsArray($tempCategoriesOption = ServiciosDao::getAllCategorias(),
            "categoriaId",
            "categoriaNombre",
            "categoriaNombre",
            $this->servicioCategoria);

        $this->viewData["servicioPlataformaOpciones"] = ArrUtils::objectArrToOptionsArray($tempPlataformasOpciones = ServiciosDao::getAllPlataformas(),
            "plataformaId",
            "plataformaNombre",
            "plataformaNombre",
            $this->servicioPlataforma);

        $this->viewData["servicioTipoOpciones"] = ArrUtils::objectArrToOptionsArray($tempTiposOption = ServiciosDao::getAllTipoServicio(),
            "servicioTipoId",
            "servicioTipoDesc",
            "servicioTipoDesc",
            $this->servicioTipo);
        $this->viewData["servicioDescripcion"] = $this->servicioDescripcion;
        $this->viewData["error"] = $this->errors;
        $this->viewData["has_errors"] = $this->hasErrors;

        if ($this->mode == "DSP" || $this->mode == "DEL") {

            $this->isReadOnly = "readonly disabled";

            if ($this->mode == "DSP") {
                $this->showActions = false;
            }
        } else {
            $this->isReadOnly = "";
            $this->showActions = true;
        }
        $this->viewData["isReadOnly"] = $this->isReadOnly;
        $this->viewData["showActions"] = $this->showActions;
    }

    private function addError($errorMsg, $origin = "global"): void
    {
        if (!isset($this->errors[$origin])) {
            $this->errors[$origin] = [];
        }

        $this->errors[$origin][] = $errorMsg;
        $this->hasErrors = true;
    }

    public function run(): void
    {
        $this->getDatos();

        if ($this->isPostBack()) {
            $this->getPostData();
            $this->executePostAction();
        }
        $this->prepareView();

        Renderer::render("admin/formulario", $this->viewData);
    }
}
