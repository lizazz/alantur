<?php
$basePath=$modx->config['rb_base_dir'];// путь к сайту
error_reporting(E_ERROR);
$get            = isset($_GET['get']) ? $_GET['get'] : "redirect";
$res            = Array();
$res['version'] = "v 1.0";
$res['url']     = $table['url'] = $url = "index.php?a=112&id=".$_GET['id'];
$res['get']     = isset($_GET['get']) ? $_GET['get'] : "";

//	

switch ($get) {

	//  обновляем данные о статусе заказа с помощью ajax
	case 'changebalance':
		$modx->db->query(
			"INSERT INTO `modx_a_alantur_balance`
				SET
					balance ='".(int)$_POST['balance']."',
					user_id ='".(int)$_POST['user']."',
					payment ='-1',
					direction = 1");
		$res=$modx->db->getValue($modx->db->query(
			"SELECT 
				SUM(balance)
				FROM `modx_a_alantur_balance`
				WHERE user_id ='".(int)$_POST['user']."'"));
		die ($res);		
	break;
	



	//recieve user id and show his financial history
	case "history":
		//die(var_dump($_POST));
		
		switch ($_POST['operation']){
			case "1":
				$title_operation = "Дебет";
			break;
			case "2":
				$title_operation = "Кредит";
			break;
			default:
				$title_operation = "Тип операции";
			break;
		}
				
		if($_POST['min'] != "") 
			$min = " AND time >'".$modx->db->escape($_POST['min'])."'";
		if($_POST['max'] != "")
			$max = " AND time <'".$modx->db->escape($_POST['max'])."'";
		if(isset($_POST['user']))
			$_GET['item_id'] = $modx->db->escape($_POST['user'])."'";
		if($_POST['operation'] != ""){
			$operation = " AND direction = '".(int)$_POST['operation']."'";
		}
		$balance = $modx->db->makeArray($modx->db->query(
			"SELECT *,
				(SELECT title
					FROM `modx_a_alantur_tours`
					WHERE id = t.payment)
					AS TOUR
				FROM `modx_a_alantur_balance` t
				WHERE user_id = '".(int)$_GET['item_id']."'".$min.$max.$operation));
		//transform id payment to human readible inscription
		for ($i = 0; $i < count($balance); $i++){
			switch ($balance[$i]['payment']){
				case -1:
					$balance[$i]['distonation'] = "Пополнение счета";
				break;

				case 0:
					$balance[$i]['distonation'] = "Движений по Вашему счету не было";
				break;

				default:
					$balance[$i]['distonation'] = $balance[$i]['TOUR'];
			break;
			}
		}


		// total balance at this point
		$total = $modx->db->getValue($modx->db->query(
			"SELECT SUM(balance)
				FROM `modx_a_alantur_balance`
				WHERE 
					user_id = '".(int)$_GET['item_id']."'"));
		// transform user id to fullname
		$username = $modx->db->getValue($modx->db->query(
			"SELECT username
				FROM `modx_web_users`
				WHERE 
					id = '".(int)$_GET['item_id']."'"));
		$tpl = MODX_BASE_PATH."assets/modules/users/history.tpl";
	break;
	
	
	
	//Страница модуля users
	default:	
		$users = $modx->db->makeArray($modx->db->query(
		"SELECT *,
			(SELECT 
				SUM(balance)
				FROM `modx_a_alantur_balance`
				WHERE user_id = t.id )
				AS 'balance' 
			FROM `modx_web_users` t
			ORDER BY t.id ASC"
		));

		//die(var_dump($users));
		$a = count($sales);
		$tpl = $basePath."modules/users/table.tpl";			
	break;
}

ob_start();
include $tpl;
$res['content'] = ob_get_contents();
ob_end_clean();

include $basePath."modules/users/html.tpl";

die;

?>