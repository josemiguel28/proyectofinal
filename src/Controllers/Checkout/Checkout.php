<?php

namespace Controllers\Checkout;

use Controllers\Carrito\Carrito;
use Controllers\PrivateController;
use Controllers\PublicController;
use Dao\CartV2\CartV2;
use Utilities\Security;

class Checkout extends PublicController
{

    public function __construct()
    {
        parent::__construct();

        $this->usercod = Security::getUserId();
        $this->id_session = session_id();
    }

    private $nombre = "";
    private $descripcion = "";
    private $id = "";
    private $precio = "";
    private $impuesto = "";
    private $cantidad = "";
    private $categoria = "";


    private function getPostData()
    {
        $this->nombre = isset($_POST["nombre"]) ? $_POST["nombre"] : "";
        $this->descripcion = isset($_POST["descripcion"]) ? $_POST["descripcion"] : "";
        $this->id = isset($_POST["id"]) ? $_POST["id"] : "";
        $this->precio = isset($_POST["precio"]) ? $_POST["precio"] : "";
        $this->impuesto = isset($_POST["impuesto"]) ? $_POST["impuesto"] : "";
        $this->cantidad = isset($_POST["cantidad"]) ? $_POST["cantidad"] : "";
        $this->categoria = isset($_POST["categoria"]) ? $_POST["categoria"] : "";
    }

    public function run(): void
    {
       // $viewData["products"] = CartV2::obtenerProductosEnCarrito($this->usercod, $this->id_session);

        $viewData = array();
        
        if ($this->isPostBack()) {
       
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test" . (time() - 10000000),
                "http://localhost/negociosWeb/proyecto-final_NW/index.php?page=Checkout_Error",
                "http://localhost/negociosWeb/proyecto-final_NW/index.php?page=Checkout_Accept"
            );


            /*
            //<editor-fold desc="working">
            $nombre = $this->nombre;
            $descripcion = $this->descripcion;
            $id = $this->id;
            $precio = $this->precio;
            $impuesto = 0.15;
            $cantidad = $this->cantidad;
            $categoria = "DIGITAL_GOODS";
            
            
            $PayPalOrder->addItem($nombre, $descripcion, intval($id), intval($precio), 7.5, intval($cantidad), $categoria);
            //</editor-fold>
            */

            $productos = CartV2::obtenerProductosEnCarrito($this->usercod, $this->id_session);


// Itera sobre cada producto y agrega el producto a PayPalOrder
            foreach ($productos as $producto) {
                $nombre = $producto["Nombre"];
                $descripcion = $producto["Descripcion"];
                $id = $producto["ID"];
                $precio = $producto["Precio"];
                $impuesto = 0.15; // Ajusta esto según tu necesidad
                $cantidad = $producto["Cantidad"];
                $categoria = "DIGITAL_GOODS"; // Ajusta esto según tu necesidad

                $PayPalOrder->addItem($nombre, $descripcion, intval($id), intval($precio), 15, intval($cantidad), $categoria);
            }


            $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
            );
            $PayPalRestApi->getAccessToken();
            $response = $PayPalRestApi->createOrder($PayPalOrder);

            $_SESSION["orderid"] = $response->id;


            foreach ($response->links as $link) {
                if ($link->rel == "approve") {
                    \Utilities\Site::redirectTo($link->href);
                }
            }
            die();
        }

        \Views\Renderer::render("carrito/carrito", $viewData);
    }
}