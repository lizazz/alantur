<div class="main">
	<div>
		<table class="table table-striped">
			<thead>
				<tr>
					<td><b>Номер заказа</b></td>
					<td><b>Имя Пользователя</b></td>
					<td><b>Название тура</b></td>
					<td><b>Изменить статус</b></td>

					<td><b></b></td>
					<td><b></b></td>
				</tr>
			</thead>
			<tbody>

			<?php foreach($sales as $sale): //выводим записи?>
					<tr>
						<td><?=$sale['id'];?></td>
						<td><?=$sale['name'];?></td>
						<td><?=$sale['title'];?></td>
						<td>
							<div>
								<select class="form-control" data-active="<?=$sale['status']?>" data-status="<?=$sale['id'];?>">
									<option disabled selected><?=$status[$i]?></option>
									<option value="1">Новый заказ тура</option>
									<option value="2">Заказ тура находится в обработке</option>
									<option value="3">Заказчику отослан счет, ждем оплаты</option>
									<option value="4">Заказ тура отменен</option>
								</select>
							</div>
						</td>
					</tr>

				<?php endforeach ?> 
			</tbody>
		</table>
	</div>
</div>