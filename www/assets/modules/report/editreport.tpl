<div class="row">
	<h1>Редактирование фотоотчета № <?php echo $_GET['id_order']?></h1>
</div>	
<div>
	<a href="<?=$url?>&get=public&result=2&id_order=<?php echo $_GET['id_order'];?>" class='btn btn-small btn-success public'>Опубликовать отчет</a>
	<a href="<?=$url?>&get=public&result=3&id_order=<?php echo $_GET['id_order'];?>" class='btn btn-small btn-danger public'>Отклонить отчет</a>
</div>	
<div class="row">
	<?php for($i=0;$i<count($id_photo);$i++){?>
		<div class = "col-md-3">
			<div>
				<a href="/assets/images/reports/<?php echo $_GET['id_order']."/".$photo_name[$i];?>" title="<?php echo $description[$i];?>"><img src="/assets/images/reports/<?php echo $_GET['id_order']."/".$photo_name[$i];?>" class="img-thumbnail" width="425"/></a>
			</div>
			<div><?php echo $description[$i];?></div>
			<div>
				<a href="<?=$url?>&get=DeleteImage&filename=<?php echo $photo_name[$i];?>&id_order=<?php echo $_GET['id_order'];?>" class='btn btn-small btn-danger'>Удалить изображение</a>
			</div>

		</div>
	<?php }?>
</div>		