Fabricator(:order_item, from: Billink::OrderItem) do
  code              "FX1337"
  description       "Flux capacitor"
  order_quantity    2
  item_quantity     1
  price_without_vat 20
  price_with_vat    24.20
  vat_percentage    21
end
