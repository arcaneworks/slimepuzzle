// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function auto_gen_mapname(directory, nameSeed = "level"){
    var ct = 0; // number of files with this nameSeed we've found
    var file = file_find_first(directory, 0); 
    while (file != "") {
        if (string_letters(file) == nameSeed) ct++;
        file = file_find_next();
    }
    file_find_close();
    return nameSeed + string(ct);
}

