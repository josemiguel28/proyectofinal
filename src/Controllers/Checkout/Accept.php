<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\CartV2\CartV2;
use Utilities\Security;

class Accept extends PublicController
{
    public function run(): void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";
        if ($token !== "" && $token == $session_token) {
            $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
            );
            $result = $PayPalRestApi->captureOrder($session_token);
            $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
            $orderData = json_decode($dataview["orderjson"], true);
            $dataview["orderId"] = $orderId = $orderData['id'];
            $orderStatus = $orderData['status'];
            $dataview["total"] = $orderCaptureAmount = $orderData['purchase_units'][0]['payments']['captures'][0]['amount']['value'];
            $dataview["fecha"] = $orderData['purchase_units'][0]['payments']['captures'][0]['create_time'];
            $usercod = Security::getUserId();
            
            $dataview["tmpProducts"] = CartV2::obtenerProductosEnCarrito($usercod);
            
            CartV2::insertarOrden($orderId, $usercod,$orderStatus, $orderCaptureAmount );
        } else {
            $dataview["orderjson"] = "No Order Available!!!";
        }
        \Views\Renderer::render("paypal/accept", $dataview);
    }
}