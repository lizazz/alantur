<div class="main">
	<table class="table table-striped">
		<thead>
		<tr>
			<td><b>Номер отчета</b></td>
			<td><b>Имя Пользователя</b></td>
			<td><b>Страна отчета</b></td>
			<td><b>Статус отчета</b></td>
			<td><b>Заглавное изображение</b></td>
			<td><b></b></td>
			<td><b></b></td>
		</tr>
		</thead>
		<tbody>
			
			<?php for($i=0;$i<$a;$i++) {//выводим записи?>
			<tr>
				<td><?php echo $id_order[$i];?></td>
				<td><?php echo $name[$i]['username'];?></td>
				<td><?php echo $country[$i]['pagetitle'];?></td>
				<td><?php echo $showing[$i];?></td>
				<td>
				<?php if ($detail[$i]["photo_name"]!=""){echo '<img src="/assets/images/reports/'.$id_order[$i].'/'.$detail[$i]["photo_name"].'" width="50" height="50" >';}
				?>
				</td>
				<td align="center" class="active"><input type="hidden" name="edit" value="<?php echo $id_order[$i];?>"><a href="<?php echo $url.'&get=add&id_order='.$id_order[$i];?>" class="btn btn-small btn-success"><span class="icon icon-retweet"></span>Просмотреть отчет</a></td>
				<td align="center" class="active"><input type="hidden" name="delete" value="<?php echo $id_order[$i];?>"><a href="<?=$url?>&get=public&result=3&id_order=<?php echo $id_order[$i];?>" class="btn btn-small btn-danger"><span class="icon icon-retweet"></span>Отклонить отчет</a></td>
			</tr>
			
			<?php };?> 
		</tbody>
	</table>
</div>