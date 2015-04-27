<div class="main">
			<input type="text" class="input-medium search-query" placeholder="Enter the items name" name="search"/></input>
			<button type="submit" class="searchbutton btn btn-small btn-success"/>Search!</button>
</div>
	<div class="main">
	<table class="table table-striped">
		<thead>
		<tr>
			<td><b>Name</b></td>
			<td><b>Description</b></td>
			<td><b>Category</b></td>
			<td><b>Price</b></td>
			<td><b>Show</b></td>
			<td><b>Cover</b></td>
			<td><b></b></td>
			<td><b></b></td>
		</tr>
		</thead>
		<tbody>
		
		<?php while ($data= $modx->db->getRow($data_query)) {//выводим записи?>
	<tr>
		<td><?php echo $data['title'];?></td>
		<td><?php echo $data['description'];?></td>
		<td><?php echo $data['category'];?></td>
		<td><?php echo $data['price'];?></td>
		<td> 
		<?php	if ($data['showing']==1){echo "yes";}else{echo "No";};
		?>
		</td>
		<td>
		<?php
		

		$path = MODX_BASE_PATH.'assets/modules/goods/images/'.$data['article']."/*";

	//	echo $path;
		var_dump(glob($path));
		//echo $data['article'];
		//$path="/home/dev/www/specinstrument.loc/www/assets/modules/goods/images/".$data['article']."/*";
		//chdir ($path);
		//echo getcwd();
		//$firstImage=glob("/home/dev/www/specinstrument.loc/www/assets/modules/goods/images/20975/*.*");
		//var_dump($firstImage);
		//echo $path;
		/*if (file_exists("/assets/modules/goods/images/".$data['article']."/".glob()) ){echo '<img src="/assets/modules/goods/images/'.$data['cover'].'" width="50" height="50" >';}else{echo'No foto';};*/?>
		</td>
		<td align="center" class="active"><input type="hidden" name="edit" value="<?php echo $data['id'];?>"><a href="<?php echo $url.'&get=add&item_id='.$data['id'];?>" class="btn btn-small btn-success"><span class="icon icon-retweet"></span> Edit</a></td>
		<td align="center" class="active"><input type="hidden" name="delete" value="<?php echo $data['id'];?>"><a href="<?php echo$url.'&get=delete&item_id='.$data['id'];?>" class="btn btn-small btn-danger"><span class="icon icon-retweet"></span> Delete</a></td>
		</tr>
		
	<?php };?> 
		</tbody></table></div>