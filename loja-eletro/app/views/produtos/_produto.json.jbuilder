json.extract! produto, :id, :codigo_produto, :marca, :modelo, :numero_serie, :created_at, :updated_at
json.url produto_url(produto, format: :json)
