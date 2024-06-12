const menuLateral = document.getElementById("menu-lateral");
const fundo = document.getElementById("menu-fundo");

function exibirMenuLateral() {
    menuLateral.style.right = "0"
    fundo.style.display = "block";
}


function esconderMenuLateral() {
    menuLateral.style.right = "-30vw"
    fundo.style.display = "none";
}