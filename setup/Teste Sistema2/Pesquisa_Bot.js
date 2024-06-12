function expandir() {
    var conteudoExpandido = document.getElementById("conteudoExpandido");
    var resultados = document.getElementById("resultados");
    var expandirBotao = document.getElementById("expandirBotao");

    if (conteudoExpandido.style.display == "inline") {
        conteudoExpandido.style.display = "none"; 
        resultados.className = "container-fluid d-flex m-0 p-0 center";
        expandirBotao.innerHTML = "<p class = 'TextoBot'>Expandir Extras</p>"; 
    } else {
        conteudoExpandido.style.display = "inline"; 
        resultados.className = "container-fluid d-flex m-0 p-0";
        expandirBotao.innerHTML = "<p class = 'TextoBot'>Diminuir Extras</p>"; 
    }
}