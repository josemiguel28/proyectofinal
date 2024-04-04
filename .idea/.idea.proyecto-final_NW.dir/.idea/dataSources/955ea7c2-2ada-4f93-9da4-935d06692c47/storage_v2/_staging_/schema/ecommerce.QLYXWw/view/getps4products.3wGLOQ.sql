create definer = root@localhost view getps4products as
select `ecommerce`.servicios.`productoNombre`            AS `productoNombre`,
       `ecommerce`.servicios.`productoDescripcion`       AS `productoDescripcion`,
       `ecommerce`.servicios.`productoPrecio`            AS `productoPrecio`,
       `ecommerce`.servicios.`productoImagen`            AS `productoImagen`,
       `ecommerce`.`productotipo`.`productoTipoDesc`       AS `productoTipoDesc`,
       `ecommerce`.`productoplataforma`.`plataformaNombre` AS `plataformaNombre`
from ((`ecommerce`.servicios join `ecommerce`.`productotipo` on (`ecommerce`.`productotipo`.`productoTipoId` =
                                                                   `ecommerce`.servicios.`productoTipoId`)) join `ecommerce`.`productoplataforma`
      on (`ecommerce`.`productoplataforma`.`plataformaId` = `ecommerce`.servicios.`plataformaId`))
where `ecommerce`.`productoplataforma`.`plataformaNombre` = 'PS4';

