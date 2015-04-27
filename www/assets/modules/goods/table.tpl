<div id="main">
	<form method='POST' action='<?=$url;?>&get=search'/>
		<input type="text" class="input-medium search-query" placeholder="Enter keyword for search" name="search"/></input>
		<button type="submit" class="searchbutton btn btn-small btn-success"/>Search!</button>
	</form>
</div>
<div class="main">
	<table class="table table-striped">
		<thead>
			<tr>
				<td><b>Name of the tour</b></td>
				<td><b>Kind of tour</b></td>
				<td><b>Country of tour</b></td>
				<td><b></b></td>
				<td><b>Show</b></td>
				<td><b>Main cover</b></td>
				<td><b>Price</b></td>
				<td><b></b></td>
				<td><b></b></td>
			</tr>
		</thead>
		<tbody>
		<?php for($i=0;$i<$count_goods;$i++) {$a=$id[$i];//выводим записи?>
			<tr>	
				<td><?php echo $title[$i];?></td>
				<td><?php if (isset($types[$a]))foreach($types[$a] as $type) echo $type."<br>";/*var_dump($type['pagetitle']); foreach($type as $each) echo $each;*/?></td>
				<td><?php echo $country[$i]['pagetitle'];?></td>
				<td></td>
				<td> 
					<?php	if ($showing[$i]==1){echo "<span class='label label-success'>yes</span>";}else{echo "<span class='label label-warning'>No<span>";}?>
				</td>
				<td>
					<?php if ($firstImage[$i]!="")
						{echo '<img src="'.$firstImage[$i].'" width="50" height="50" >';}
					?>
				</td>
				<td>
					<?php echo $price[$i];?>
				</td>
				<td align="center" class="active">
					<input type="hidden" name="edit" value="<?php echo $id[$i];?>">
						<a href="<?php echo $url.'&get=add&item_id='.$id[$i];?>" class="btn btn-small btn-success">
							<span class="icon icon-retweet">Edit</span>
						</a>
				</td>
				<td align="center" class="active">
					<input type="hidden" name="delete" value="<?php echo $id[$i];?>">
					<a href="<?php echo$url.'&get=delete&item_id='.$id[$i];?>" class="btn btn-small btn-danger">
						<span class="icon icon-retweet"> Delete</span>
					</a>
				</td>
			</tr>
		<?php }?> 
		</tbody>
	</table>
</div>