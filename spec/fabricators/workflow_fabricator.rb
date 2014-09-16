Fabricator(:workflow, from: Billink::Workflow) do
  workflow_number 3
  order_numbers   [ "I2014.001.234" ]
  client
end
