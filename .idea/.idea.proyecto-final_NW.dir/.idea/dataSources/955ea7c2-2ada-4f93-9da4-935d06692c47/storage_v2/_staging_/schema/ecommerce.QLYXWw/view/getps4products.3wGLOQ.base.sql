create definer = root@localhost view getps4products as
select `ecommerce`.`productos`.`productoNombre`            AS `productoNombre`,
       `ecommerce`.`productos`.`productoDescripcion`       AS `productoDescripcion`,
       `ecommerce`.`productos`.`productoPrecio`            AS `productoPrecio`,
       `ecommerce`.`productos`.`productoImagen`            AS `productoImagen`,
       `ecommerce`.`productotipo`.`productoTipoDesc`       AS `productoTipoDesc`,
       `ecommerce`.`productoplataforma`.`plataformaNombre` AS `plataformaNombre`
from ((`ecommerce`.`productos` join `ecommerce`.`productotipo` on (`ecommerce`.`productotipo`.`productoTipoId` =
                                                                   `ecommerce`.`productos`.`productoTipoId`)) join `ecommerce`.`productoplataforma`
      on (`ecommerce`.`productoplataforma`.`plataformaId` = `ecommerce`.`productos`.`plataformaId`))
where `ecommerce`.`productoplataforma`.`plataformaNombre` = 'PS4';

