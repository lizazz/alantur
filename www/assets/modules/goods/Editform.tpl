<form method="post" action="index.php?a=112&id=2&get=<?php echo $class;?>"  enctype='multipart/form-data'>
	<h2>
		<i>
			<?php 
				if(isset($data['title'])) 
					echo "Edit of ".$data['title'];
			?>
		</i>
	</h2>
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active">
			<a href="#home" aria-controls="home" role="tab" data-toggle="tab">Main preferences</a>
		</li>
		<li role="presentation">
			<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Description</a>
		</li>
		<li role="presentation">
			<a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Images</a>
		</li>
	</ul>
	<!-- Tab panes -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="home">	
			<div class="input-group">
				<span class="input-group-addon">Title</span>
				<input type="text" class="form-control" name="title" value="<?php echo $data['title'];?>" />
				<br/>	
			</div>
			<br>
			<div class="input-group">
				<span class="input-group-addon">Price</span>
				<input type="text" class="form-control" name="price" value="<?php echo $data['price'];?>" />
				<span class="input-group-addon"> UAH</span>	
				<br/>	
			</div>
			<br>
			<div class="input-group">
				<span class="input-group-addon">Kind of the tour (It may have multiple values)</span>
				<br>
				<div>
					<?php for ($i=0;$i<count($alltype['id']);$i++){
						if(in_array($alltype['id'][$i], $type)) $checked="checked"; else $checked="";
						echo "<label>".$alltype['title'][$i]."</label><input type='checkbox' ".$checked." name='type[".$alltype['id'][$i]."]'/><br>";
					}?>
					<br>
				</div>
			</div>
			<br>
			<div class="input-group">
				<span class="input-group-addon">Country of the tour</span>
				<select name="country" data-active="<?=$data['country']?>">
					<option disabled selected>Select country</option>
					<?=$modx->runSnippet("Ditto", array("tpl" => 'tpl_option', "startID" => 4))?>
				</select>	
			</div>
			<br>
			<div class="input-group">
				<span class="input-group-addon">
					Display on main page (only 12 tours)
					<input type="checkbox" name="showing" <?php echo $showing; ?> />
				</span>
			</div>
			<br>
		</div>
		<div role="tabpanel" class="tab-pane" id="profile">
			Description
			<br />
			<textarea name="description" cols="40" rows="5"><?php echo $data['description'];?></textarea>
		</div>
		<div role="tabpanel" class="tab-pane" id="messages">
			<div>
				<?php foreach ($filename as $file):?>
					<br>
					<div>
						<img src="<?=$file?>" width="400px" class="thumbnail" alt="" />
					</div>
					<br>
					<a href='<?=$url?>&get=DeleteImage&filename=<?=$file?>'class='btn btn-small btn-danger'>Delete this image</a>
					<br>
				<?php endforeach ?>
			</div>
			<br>
			Add one more image
			<br />
			<input type="hidden" name="item_id"  value='<?php echo $_GET['item_id'];?>'>
			<br>
			<input class="btn btn-small btn-default" type="file" name="cover"/>
		</div>
	</div>
	<input type="submit" class="btn btn-small btn-success" value="<?php echo $class;?>"/>
</form>