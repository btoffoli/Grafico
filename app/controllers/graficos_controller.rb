#require 'googlecharts'
require 'net/ftp'
class GraficosController < ApplicationController
  def action
  end

  def grafico1
    #GoogleChart.pie_3d_350x150('year 1997'=>10,'year 1998'=>20,'year 1999'=>15,'year 2000'=>55).to_url
    #render GoogleChart.pie_100x200(10,20,40,30).to_url
    #render GoogleChart.pie(10,20,40,30).to_url
  end

  def ondulacao
    @mares = []
    dados = File.open('tmp/Teste_Mare_04_May_2011.wvr')
    dados.each do |linha|
      @mares << linha.split(' ').first.to_f
    end
    puts @mares
  end

  
  def ondulacao_gruff
    g = Gruff::Line.new
    g.title = "My Graph" 

    g.data("Apples", [1, 2, 3, 4, 4, 3])
    g.data("Oranges", [4, 8, 7, 9, 8, 9])
    g.data("Watermelon", [2, 3, 1, 5, 6, 8])
    g.data("Peaches", [9, 9, 10, 8, 7, 9])

    g.labels = {0 => '2003', 2 => '2004', 4 => '2005'}

    g.write('tmp/my_fruity_graph.png')

  end

  def ondulacao_flot
    @mares = []
    _indice = 0
    #dados = File.open('tmp/Teste_Mare_04_May_2011.wvr')
    #dados.each do |linha|
    ftp = Net::FTP.new('ambidados.com.br')
    ftp.passive = true
    ftp.login 'ambidados', 'ambi0011dados@'
    ftp.gettextfile('Dados/RF/Dados/Teste_Mare_04_May_2011.wvr') do |linha|
      _dados = linha.split ' '
      #puts _dados[4]
      #puts _dados[5]
      @mares << ["#{_dados[4]}#{_dados[5]}".to_i , _dados.first.to_f]
      _indice += 1
    end
    puts @mares
    @dados = {data: @mares, label: 'lalala'}
    ftp.close
  end

  def ondulacao_flot_ajax
    #ondulacao_flot
    
  end

end
