"use strict";
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
            .replace(/\D/g, '')
            .replace(/(\d{3})(\d)/, '$1.$2')
            .replace(/(\d{3})(\d)/, '$1.$2')
            .replace(/(\d{3})(\d{1,2})/, '$1-$2');
    }
    else if (type === "cep") {
        a = a.replace(/\D/g, '');
        if (a.length > 5) {
            a = a.replace(/^(\d{5})/, '$1-');
        }
    }
    else if (type === "money") {
        a = a.replace(/\D/g, '');
        let numero = parseFloat(a) / 100;
        a = numero.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
    }
    return a;
}
