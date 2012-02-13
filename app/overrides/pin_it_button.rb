Deface::Override.new(:virtual_path => "spree/shared/_products",
                     :insert_bottom => "[data-hook='products_list_item']",
                     :text => "<%= pin_it_button(product) %>",
                     :name => "index_pin_it")

Deface::Override.new(:virtual_path => "spree/products/show",
                     :insert_after => "#main-image",
                     :text => "<%= pin_it_button(@product) %>",
                     :name => "show_pin_it")
