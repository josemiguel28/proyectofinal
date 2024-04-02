<?php 

namespace Controllers\Juegos;

use Controllers\PublicController;
use Views\Renderer;

class Ofertas extends PublicController{
    public function run() :void
    {
        Renderer::render("ofertas/ofertas", ['hola']);
    }
}