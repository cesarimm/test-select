<?php
    ///Realizar la conexion a la base de datos
    include("conection.php");

    ///Consulta para obtener todas las categorias
    $consulta = "SELECT * FROM `categories`";

    ///Crear el arreglo de las categorias
    if($resultado = mysqli_query($enlace, $consulta)) {
        $categories = [];
        while ($row = mysqli_fetch_assoc($resultado)) {
            $categories [] = array(
                "idCategory" => $row['idCategory'],
                "categoryName" => $row['categoryName'],
                "idCategoryRelated" => $row['idCategoryRelated'],
                "level" => !$row['idCategoryRelated'] ? 0 : '',
                "order" => ''
            );
        }
    }
    
    $array_keys = array_keys(array_column($categories, 'level'), '0');
    $GLOBALS['count'] = 0;

    ///Tomar los indices que son padre o de nivel 0 y a partir de aqui ordenarlo
    foreach ($array_keys as $key => $indice) {
        $categories[$indice]['order'] = $count;
        $categories[$indice]['level'] = 0;
        $GLOBALS['count']++;
        ordenar($categories, $indice, 0);
    }

    //suponemos que siempre es un estatus 200
    $return = array(
        'status' => 200,
        'categories' => bubble_sort($categories)
    );

    http_response_code(200);
    print_r(json_encode($return));


    //Funciones a utilizar
    ///ordenar de acuerdo a la categorizacion
    function ordenar(&$array, $indice, $level) { //El array se modifica por referencia
        $array_aux = array_keys(array_column($array, 'idCategoryRelated'), $array[$indice]['idCategory']);
        if ($array_aux) {
            foreach ($array_aux as $key => $value) {
                $array[$value]['order'] = $GLOBALS['count'];
                $array[$value]['level'] = $level + 1;
                $GLOBALS['count']++;
                ordenar($array, $value, $level + 1);
            }
        } else return;
    }

    //Implementar bubble sort 
    function bubble_sort($arr) {
        $size = count($arr)-1;
        for ($i=0; $i<$size; $i++) {
            for ($j=0; $j<$size-$i; $j++) {
                $k = $j+1;
                if ($arr[$k]['order'] < $arr[$j]['order']) {
                    // Swap elements at indices: $j, $k
                    list($arr[$j], $arr[$k]) = array($arr[$k], $arr[$j]);
                }
            }
        }
        return $arr;
    }

    mysqli_close($enlace);
?>