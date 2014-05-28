Fabricator(:order_item, from: Billink::OrderItem) do
  code              "FX1337"
  description       "Flux capacitor"
  order_quantity    2
  item_quantity     1
  price_without_vat 39.90
  price_with_vat    47.48
  vat_percentage    19
end
