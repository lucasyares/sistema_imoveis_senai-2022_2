//TYPE
type s_num = number | string; //String ou número;
//
function mask(a: string, type: string): string{
    if(type === "telefone"){
    const phone = a.replace(/\D/g, '');
    const { length } = phone
    if(length <= 11){
        return phone
        .replace(/^(\d)/, '($1') 
        .replace(/(\d{2})(\d)/, '$1) $2')
        .replace(/(\d{5})(\d)/, '$1-$2');
    }} else if(type === "cpf"){
        return a
        .replace(/\D/g, '') // Remove todos os caracteres que não são dígitos
        .replace(/(\d{3})(\d)/, '$1.$2') // Adiciona um ponto após os primeiros três dígitos
        .replace(/(\d{3})(\d)/, '$1.$2') // Adiciona outro ponto após os próximos três dígitos
        .replace(/(\d{3})(\d{1,2})/, '$1-$2');
        
    }
    return a;
 } 
