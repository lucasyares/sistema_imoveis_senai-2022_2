const menuLateral = document.getElementById("menu-lateral");
const fundo = document.getElementById("menu-fundo");

function exibirMenuLateral() {
    // menuLateral.style.display = "block";
    menuLateral.style.width = "30vw";
    fundo.style.display = "block";

    // var time = 2000;
    // setTimeout(function () {
    //     for (let index = 0; index < 100; index++) {
    //         menuLateral.style.width = index + "%";
    //         console.log("cu");
    //     }
    // }, time);
}


function esconderMenuLateral() {
    // menuLateral.style.display = "none";
    menuLateral.style.width = "0";
    fundo.style.display = "none";
}