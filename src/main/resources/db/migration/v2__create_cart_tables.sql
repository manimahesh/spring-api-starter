CREATE TABLE `store_api`.`carts` (
  `id` BINARY(16) NOT NULL DEFAULT (uuid_to_bin(uuid())),
  `date_created` DATE NOT NULL DEFAULT (CURRENT_DATE),
  PRIMARY KEY (`id`));

  CREATE TABLE `store_api`.`cart_items` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cart_id` BINARY(16) NOT NULL,
  `product_id` BIGINT NOT NULL,
  `quantity` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `cart_items_products_id_fk_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `cart_items_cart_id_fk`
    FOREIGN KEY (`cart_id`)
    REFERENCES `store_api`.`carts` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `cart_items_products_id_fk`
    FOREIGN KEY (`product_id`)
    REFERENCES `store_api`.`products` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);