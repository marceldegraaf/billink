Fabricator(:delivery_address, from: Billink::DeliveryAddress) do
  street        "P.C. Hooftstraat"
  house_number  34
  house_number_extension "b"
  postal_code   "1012 BQ"
  country_code  "NL"
  city          "Amsterdam"
  company_name  "Acme Corp."
  first_name    "John"
  last_name     "Doe"
end
