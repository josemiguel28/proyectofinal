<?php 

namespace Controllers\Servicios;

use Controllers\PublicController;
use Views\Renderer;

class Ofertas extends PublicController{
    public function run() :void
    {
        Renderer::render("servicios/ofertas", ['hola']);
    }
}