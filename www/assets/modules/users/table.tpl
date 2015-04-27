<div class="main">
	<div>
		<table class="table table-striped">
			<thead>
				<tr>
					<td><b>№</b></td>
					<td><b>Имя Пользователя</b></td>
					<td><b>Баланс</b></td>
					<td><b>Пополнить баланс</b></td>
					<td><b></b></td>
				</tr>
			</thead>
			<tbody>
				<tr><div class='alert alert-warning hidden' role='alert'>Баланс пользователя оновлен</div><tr>
			<?php foreach($users as $user): //выводим записи?>
					<tr>
						<td><?=$user['id'];?></td>
						<td><?=$user['username'];?></td>
						<td>
							<div class="input-group">
								<span class="input-group-addon">Сумма</span>
								<input type="text" class="form-control" value="<?=$user['balance'];?>" READONLY />
								<span class="input-group-addon">UAH</span>	
							</div>
						</td>
						<td>
							<div class="input-group">
								<span class="input-group-addon">Сумма</span>
								<input type="text" class="form-control" name="balance" data-balance="<?=$user['id'];?>" value="0" />
								<span class="input-group-addon"> UAH</span>	
							</div>
						</td>
						<td>
						<a href="<?php echo $url.'&get=history&item_id='.$user['id'];?>" class="btn btn-small btn-success">
							<span class="icon icon-retweet">finance history</span>
						</a>
						</td>
					</tr>

				<?php endforeach ?> 
			</tbody>
		</table>
	</div>
</div>