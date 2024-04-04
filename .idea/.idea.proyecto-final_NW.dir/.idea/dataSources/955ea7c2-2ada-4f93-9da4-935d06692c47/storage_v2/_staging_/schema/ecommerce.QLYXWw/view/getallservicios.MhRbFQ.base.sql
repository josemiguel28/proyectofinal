create definer = root@localhost view getallservicios as
select `ecommerce`.`productos`.`productoNombre`            AS `productoNombre`,
       `ecommerce`.`productos`.`productoDescripcion`       AS `productoDescripcion`,
       `ecommerce`.`productos`.`productoPrecio`            AS `productoPrecio`,
       `ecommerce`.`productos`.`productoImagen`            AS `productoImagen`,
       `ecommerce`.`productos`.`stock`                     AS `stock`,
       `ecommerce`.`productotipo`.`productoTipoDesc`       AS `productoTipo`,
       `ecommerce`.`productoplataforma`.`plataformaNombre` AS `productoPlataforma`,
       `ecommerce`.`productocategoria`.`categoriaNombre`   AS `productoCategoria`
from (((`ecommerce`.`productos` join `ecommerce`.`productotipo` on (`ecommerce`.`productotipo`.`productoTipoId` =
                                                                    `ecommerce`.`productos`.`productoTipoId`)) join `ecommerce`.`productoplataforma`
       on (`ecommerce`.`productoplataforma`.`plataformaId` =
           `ecommerce`.`productos`.`plataformaId`)) join `ecommerce`.`productocategoria`
      on (`ecommerce`.`productocategoria`.`categoriaId` = `ecommerce`.`productos`.`categoriaId`));

