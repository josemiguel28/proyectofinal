create definer = root@localhost view getallservicios as
select `ecommerce`.servicios.`productoNombre`            AS `productoNombre`,
       `ecommerce`.servicios.`productoDescripcion`       AS `productoDescripcion`,
       `ecommerce`.servicios.`productoPrecio`            AS `productoPrecio`,
       `ecommerce`.servicios.`productoImagen`            AS `productoImagen`,
       `ecommerce`.servicios.`stock`                     AS `stock`,
       `ecommerce`.`productotipo`.`productoTipoDesc`       AS `productoTipo`,
       `ecommerce`.`productoplataforma`.`plataformaNombre` AS `productoPlataforma`,
       `ecommerce`.`productocategoria`.`categoriaNombre`   AS `productoCategoria`
from (((`ecommerce`.servicios join `ecommerce`.`productotipo` on (`ecommerce`.`productotipo`.`productoTipoId` =
                                                                    `ecommerce`.servicios.`productoTipoId`)) join `ecommerce`.`productoplataforma`
       on (`ecommerce`.`productoplataforma`.`plataformaId` =
           `ecommerce`.servicios.`plataformaId`)) join `ecommerce`.`productocategoria`
      on (`ecommerce`.`productocategoria`.`categoriaId` = `ecommerce`.servicios.`categoriaId`));

