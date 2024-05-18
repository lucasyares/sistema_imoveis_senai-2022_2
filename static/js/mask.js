"use strict";
// StringHelper possuí todas as nossas masks
////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//DEVE ALTERAR AS MASKS SOMENTE AQUI!
//COMANDO PARA ALTERAR -> ts -w
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//COLOCAR NO HTML(como chamar)
// oninput="this.value = mask(this.value, 'type?????')"
//
//exemplo:
// <input type="text" oninput="this.value = mask(this.value, 'telefone')">
////////////////////////
function mask(a, type) {
    if (type === "telefone") {
        const phone = a.replace(/\D/g, '');
        const { length } = phone;
        if (length <= 11) {
            return phone
                .replace(/^(\d)/, '($1')
                .replace(/(\d{2})(\d)/, '$1) $2')
                .replace(/(\d{5})(\d)/, '$1-$2');
        }
    }
    else if (type === "cpf") {
        return a
            .replace(/\D/g, '') // Remove todos os caracteres que não são dígitos
            .replace(/(\d{3})(\d)/, '$1.$2') // Adiciona um ponto após os primeiros três dígitos
            .replace(/(\d{3})(\d)/, '$1.$2') // Adiciona outro ponto após os próximos três dígitos
            .replace(/(\d{3})(\d{1,2})/, '$1-$2');
    }
    else if (type === "cep") {
        a = a.replace(/\D/g, '');
        if (a.length > 5) {
            a = a.replace(/^(\d{5})/, '$1-');
        }
    }
    else if (type === "dinheiro") {
        // Remover todos os caracteres não numéricos
        a = a.replace(/\D/g, '');
        // Converter para número
        let numero = parseFloat(a) / 100; // Assumindo que o valor está em centavos
        // Formatando para o formato de moeda brasileira (Real)
        a = numero.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
    }
    return a;
}
