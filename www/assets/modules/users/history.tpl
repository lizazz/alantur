<h1>Отчет о движении материальных средств <?=$username;?></h1>
<div class="container">
	<form method = "POST" action = "index.php?a=112&id=5&get=history" >
		<div class = "row">
			<div class = 'col-md-2 '>
				<label>Показать отчет за период</label>
				<input type = "hidden" class="form-control" name="user" value = <?=$_GET['item_id'];?>>
			</div>
		    <div class = 'col-md-3'>
		        <div class = "form-group">
		            <div class = 'input-group date' id='datetimepicker6'>
		                <input type = 'text' class="form-control" name = "min" value = "<?=$modx->db->escape($_POST['min'])?>"/>
		                <span class = "input-group-addon">
		                    <span class = "glyphicon glyphicon-calendar"></span>
		                </span>
		            </div>
		        </div>
		    </div>
		    <div class = 'col-md-3'>
		        <div class = "form-group">
		            <div class = 'input-group date' id='datetimepicker7'>
		                <input type = 'text' class="form-control" name = "max" value = "<?=$modx->db->escape($_POST['max'])?>"/>
		                <span class = "input-group-addon">
		                    <span class = "glyphicon glyphicon-calendar"></span>
		                </span>
		            </div>
		        </div>
		    </div>
			<div class = 'col-md-2 form-group'>
					<select name="operation" class = "form-control" >
					<	<label class="">
							<option class=""  selected value = "<?=$_POST['operation'];?>">
								<?=$title_operation;?>
							</option>
						</label>
						<label class="">
							<option value="1">
								Дебет
							</option>
						</label>
						<label class="">
							<option value="2" class="">
								Кредит
							</option>
						</label>
					</select>
			</div>
			<input type="submit" class="btn btn-small btn-default" value="<?php echo "Задать интервал";?>"/>
		</div>
	<!--	<div class = "row text-center"> -->
	    	
	 <!--   </div>-->
	</form>
<br>	
</div>
<table class = "table table-bordered table-striped table-hover">	
	<thead class = "table-hover">
		<tr>
			<td class = "success"><b>Дата транзакции</b></td>
			<td class = "success"><b>Сумма транзакции</b></td>
			<td class = "success"><b>Тип транзакции</b></td>	
		</tr>
	</thead>
	<tbody>
		<?php foreach($balance as $payment): //выводим записи?>
			<tr>
				<td>
					<?=$payment['time'];?>
				</td>
				<td>
					<?=$payment['balance'];?>	
				</td>
				<td>
					<?=$payment['distonation'];?>
				</td>
			</tr>
		<?php endforeach ?> 
	</tbody>
</table>