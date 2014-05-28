Fabricator(:order, from: Billink::Order) do
  check_uuid      "5e50d746-c37a-415d-a420-dd4d85f026b3"
  additional_text "Some additional text"
  number          { [ "O2014.05.28", (2000 + rand(500)).to_s ].join(".") }

  order_items(count: 2) { |attrs, count| Fabricate(:order_item, description: "Flux capacitor #{count}") }
  client
  delivery_address
end
