var graficos = {}, tempo = 20000

function recarregar(){
    
}

function carregar_arquivos(){
  $.getJSON(url_arquivos, function(dado){
    if (window.console)
      console.log(dado)

  })
}
$(function () {
    $('#chart').css({width: $(window).width()-50, height: '300px'})
    $.plot($('#chart'), [])
    $('#btnDialogArquivos')
    //.button()
    .click(carregar_arquivos)
});
