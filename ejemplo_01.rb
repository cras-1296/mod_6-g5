puts "Ingrese la url:"
url_solicitud = gets.chomp


require "uri"
require "net/http"
require 'json'

def request(url_request)
    url = URI(url_request)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    #puts response.read_body[0..700] # Cortamos el texto para no imprimir las respuesta completa

    results = JSON.parse(response.read_body)
end

resultado = request(url_solicitud)


resultado.each do |post|
    puts post['userId']
end
