'use strict';

/* FONCTIONS */

function saisie(txt_defaut,nom_controle)
{
    if(document.getElementById(nom_controle).placeholder==txt_defaut){
        document.getElementById(nom_controle).placeholder="Utilise ton clavier";
    }
}

function retablir(txt_defaut,nom_controle)
{
    if(document.getElementById(nom_controle).placeholder=="Utilise ton clavier"){
        document.getElementById(nom_controle).placeholder=txt_defaut;
    }
}