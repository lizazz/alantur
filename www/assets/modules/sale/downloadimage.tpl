<?php if($_FILES["cover"]["size"] > 1024*3*1024)
{
	echo ("Размер файла превышает три мегабайта");
	exit;
}
//    Проверяем загружен ли файл
if(is_uploaded_file($_FILES["cover"]["tmp_name"]))
{
//   Если файл загружен успешно, перемещаем его
//    из временной директории в конечную
		move_uploaded_file($_FILES["cover"]["tmp_name"],$basePath . "/images/".$folder."/".$folder.$number.".".$ext);
		//  print_r($_FILES[cover]);
} else {
	echo("Ошибка загрузки файла");
};
?>