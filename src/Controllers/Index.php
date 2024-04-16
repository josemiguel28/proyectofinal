<?php
/**
 * PHP Version 7.2
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers;

use Dao\CartV2\CartV2;
use Dao\Servicios\Servicios;
use Dao\Servicios\Servicios as ServiciosDao;
use Utilities\Security;
use Utilities\Site;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Index extends PublicController
{
    private $viewData = array();

    private $productoEnCarrito = false;

    public function __construct()
    {
        parent::__construct();

        $this->id_session = session_id();
    }

    private function getPostData()
    {
        $this->servicioId = isset($_POST["servicioId"]) ? $_POST["servicioId"] : 0;
    }

    private function agregarProductoAlCarrito()
    {
        if (Security::isLogged() == false) {
            Site::redirectToWithMsg("index.php?page=Sec_Login", "Debe iniciar sesión para agregar productos al carrito");
        } else {
            $usercod = \Utilities\Security::getUserId();
            $crrctd = 1;
            $crrprc = 0;
            $crrfching = date("Y-m-d H:i:s");

            CartV2::agregarProductoAlCarrito($usercod, $this->servicioId, $crrctd, $crrprc, $crrfching, $this->id_session);
            Site::redirectToWithMsg("index.php?page=Index", "Producto agregado al carrito");
        }
    }

    private function prepareViewData()
    {
        $this->viewData["juegosProductos"] = ServiciosDao::getGamesProducts(4);
        $this->viewData["ofertasProductos"] = ServiciosDao::getOfferProducts(4);
        $this->viewData["giftcardProductos"] = Servicios::getGiftCardProducts(4);
        $this->viewData["productoEnCarrito"] = true;
        $this->viewData["servicioId"] = $this->servicioId;
    }

    /**
     * Index run method
     *
     * @return void
     */
    public function run(): void
    {
        $this->getPostData();
        if ($this->isPostBack()) {
            $this->agregarProductoAlCarrito();
        }
        $this->prepareViewData();

        \Views\Renderer::render("index", $this->viewData);
    }
}

?>
