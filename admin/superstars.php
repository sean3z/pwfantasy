<?php include 'includes/header.php'; ?>

<div class="row">
	<div class="span3">
		<div class="well" style="padding: 8px 0;">
			<div class="input-append" style="margin-left: 4px;">
				<form method="POST" action="superstars.php?search" style="margin-bottom: 0;">
					<input class="span2" name="superstar" type="text" />
					<input type="submit" class="btn" value="Search" />
				</form>
			</div>
			<ul class="nav nav-list">
				<li class="nav-header">Filter By</li>
				<li <?php if (isset($_GET['rosters'])) echo 'class="active"'; ?>><a href="?rosters">Shows</a></li>
				<li <?php if (isset($_GET['tiers'])) echo 'class="active"'; ?>><a href="?tiers">Tiers</a></li>
				<li <?php if (isset($_GET['champions'])) echo 'class="active"'; ?>><a href="?champions">Champions</a></li>
			</ul>
		</div>
	</div>

	<div class="span9">
		<div class="row">
			<div class="span12">
				<?php
					if (count($_POST) > 0) {
						if (isset($_GET['update'])) {
							if (isset($_GET['superstarId'])) {
								$update = $_POST; $params = array();
								if ($_POST['factionId'] <= 0) $update['factionId'] = 'null';
								if ($_POST['championshipId'] <= 0) $update['championshipId'] = 'null';
								$update['superstarName'] = '"'. db_escape_string($_POST['superstarName']) .'"';
								$update['superstarSlug'] = '"'. db_escape_string($_POST['superstarSlug']) .'"';
								foreach($update as $field => $value) $params[] = $field .' = '. $value;
								db_query('UPDATE superstars SET '. implode(', ', $params) .' WHERE superstarId = %d',$_GET['superstarId']);
								echo '<div class="alert alert-success"><b>Success</b>! Superstar (ID: ', $_GET['superstarId'],') has been successfully updated</div>';
							}
						} 
					}

					if (isset($_GET['rosters'])) {
						if (!isset($_GET['showId'])) {
							echo '<h4>Show Selection</h4>';
							$shows = db_query('SELECT s.*, (SELECT COUNT(*) FROM superstars where showId = s.showId) as count FROM shows s WHERE hasRoster > 0');
							while($show = $shows->fetch_object()) {
								echo '<b>', $show->showName ,' <small>(', $show->count,' Superstars)</small></b><br />
										<a href="?rosters&showId=',  $show->showId,'">
											<img src="../assets/img/shows/header/', $show->showId,'.png" title="', $show->showName,'"/>
										</a><br /><br />';
							}
						} else {
							$show = db_query('SELECT * FROM shows WHERE showId = %d', $_GET['showId'])->fetch_object();
							echo '<h4>', $show->showName,' Roster</h4>';
							$roster = db_query('SELECT superstarId, superstarName FROM superstars WHERE showId = %d ORDER BY superstarName ASC', $_GET['showId']);
							while($talent = $roster->fetch_object()) {
								echo '<a href="superstars.php?superstarId=',  $talent->superstarId,'">', $talent->superstarName,'</a><br />';
							}
						}
					} else if (isset($_GET['tiers'])) {
						if (!isset($_GET['tierId'])) {
							echo '<h4>Tier Selection</h4>';
							$tiers = db_query('SELECT t.*, (SELECT COUNT(*) FROM superstars where tierId = t.tierId) as count FROM tiers t ORDER BY t.tierName ASC');
							while($tier = $tiers->fetch_object()) {
								echo '<a href="?tiers&tierId=', $tier->tierId,'">', $tier->tierName,'</a> <small>(', $tier->count,' superstars)</small><br />';
							}
						} else {
							$tier = db_query('SELECT * FROM tiers WHERE tierId = %d', $_GET['tierId'])->fetch_object();
							echo '<h4>', $tier->tierName,' Roster</h4>';
							$roster = db_query('SELECT superstarId, superstarName FROM superstars WHERE tierId = %d', $_GET['tierId']);
							while($talent = $roster->fetch_object()) {
								echo '<a href="superstars.php?superstarId=',  $talent->superstarId,'">', $talent->superstarName,'</a><br />';
							}
						}
					} else if (isset($_GET['champions'])) {
						echo '<h4>Championship Selection</h4>';
						$titles = array();
						$champions = db_query('SELECT s.superstarId, s.superstarName, c.championshipName, c.championshipId FROM superstars s INNER JOIN championships c ON c.championshipId = s.championshipId WHERE s.championshipId IS NOT NULL');
						while($superstar = $champions->fetch_object()) $titles[$superstar->championshipName][] = '<img src="../assets/img/championships/166x62/'. $superstar->championshipId .'.png" style="width: 70px;">&nbsp;<a href="superstars.php?superstarId='. $superstar->superstarId .'">'. $superstar->superstarName .'</a>';
						foreach($titles as $title => $champs) echo '<h6>', $title,'</h6>'. implode('<br />', $champs);
					} else if (isset($_GET['search'])) {
						$talents = db_query('SELECT * FROM superstars WHERE superstarName LIKE ("%%%s%%") OR superstarSlug LIKE ("%%%1$s%%")', $_POST['superstar']);
						echo '<h4>Superstar Search <small>(TERM: "', $_POST['superstar'] ,'")</small></h4>';
						while($talent = $talents->fetch_object()) {
							echo '<a href="superstars.php?superstarId=',  $talent->superstarId,'">', $talent->superstarName,'</a><br />';
						}
					}else if (isset($_GET['superstarId'])) {
						$talent = db_query('SELECT * FROM superstars WHERE superstarId = %d', $_GET['superstarId'])->fetch_object();
						if (isset($talent->superstarId)) {
							$query = db_query('SELECT * FROM tiers'); $tiers = '';
							while($tier = $query->fetch_object()) $tiers .= '<option value="'. $tier->tierId .'" '. (($tier->tierId == $talent->tierId) ? 'selected' : '') .'>'. $tier->tierName .'</option>';
							
							$query = db_query('SELECT * FROM shows WHERE hasRoster > 0'); $shows = '';
							while($show = $query->fetch_object()) $shows .= '<option value="'. $show->showId .'" '. (($show->showId == $talent->showId) ? 'selected' : '') .'>'. $show->showName .'</option>';
							
							$query = db_query('SELECT * FROM championships WHERE isActive > 0'); $championships = '<option value="0">None</option>';
							while($title = $query->fetch_object()) $championships .= '<option value="'. $title->championshipId .'" '. (($title->championshipId == $talent->championshipId) ? 'selected' : '') .'>'. $title->championshipName .'</option>';
							
							$query = db_query('SELECT * FROM factions'); $factions = '<option value="0">None</option>';
							while($faction = $query->fetch_object()) $factions .= '<option value="'. $faction->factionId .'" '. (($faction->factionId == $talent->factionId) ? 'selected' : '') .'>'. $faction->factionName .'</option>';
							
							echo '<h4>',  ( ($talent->isActive < 1) ? '<span class="label label-important">Inactive</span>' : '<span class="label label-success">Active</span>'), ' ', $talent->superstarName,' <small>(ID: ', $talent->superstarId,')</small></h4>
								<div class="well" style="padding: 3px 5px;">
									<form class="form-horizontal" style="margin-bottom: 0px;" method="POST" action="superstars.php?update&superstarId=', $_GET['superstarId'],'">
										<h6>Superstar Information</h6>
										<div class="row">
											<div class="span4">
												<div class="control-group">
													<label class="control-label" for="superstarName">Name:</label>
													<div class="controls">
														<input type="text" name="superstarName" value="', htmlentities($talent->superstarName),'">
													</div>
												</div>

												<div class="control-group">
													<label class="control-label" for="superstarSlug">Slug:</label>
													<div class="controls">
														<input type="text" name="superstarSlug" value="', $talent->superstarSlug,'">
													</div>
												</div>

												<div class="control-group">
													<label class="control-label" for="championshipId">Championship:</label>
													<div class="controls">
														<select name="championshipId">', $championships,'</select>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label" for="isActive">Active:</label>
													<div class="controls">
														<select name="isActive">
															<option value="0" ', (($talent->isActive < 0) ? 'selected' : ''),'>Inactive</option>
															<option value="1" ', (($talent->isActive > 0) ? 'selected' : ''),'>Active</option>
														</select>
													</div>
												</div>
											</div> <!-- div.span4 -->

											<div class="span5">
												<div class="control-group">
													<label class="control-label" for="showId">Show:</label>
													<div class="controls">
														<select name="showId">', $shows,'</select>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label" for="factionId">Faction:</label>
													<div class="controls">
														<select name="factionId">', $factions,'</select>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label" for="tierId">Tier:</label>
													<div class="controls">
														<select name="tierId">', $tiers,'</select>
													</div>
												</div>';

												if (!is_null($talent->championshipId)) {
													echo  '<div class="control-group">
																<div class="controls">
																	<img src="../assets/img/championships/166x62/'. $talent->championshipId .'.png" style="width: 100px;" />
																</div>
															</div>';
												}

											echo '</div> <!-- div.span5 -->
											<div class="span2">
												<img src="../assets/img/superstars/170x387/',$talent->superstarId,'.png" style="margin-top: -25px; margin-left: 60px; height: 210px;" />
											</div>
										</div>
										<div class="form-actions" style="background-color: #e5e5e5; margin: 0px;">
											<button type="submit" class="btn btn-small btn-primary">Update Information</button>
											&nbsp;&nbsp;<button onclick="return false;" class="btn btn-small btn-danger">Delete Superstar</button>
										</div>
									</form>
								</div>';
						}
					} 
				?>
			</div>
		</div> <!-- div.row -->
		<?php if (isset($_GET['superstarId'])): ?>
			<div class="row">
				<div class="span12">
					<h5>Superstar Stats</h5>
					<?php
						$seasons = db_query('CALL spGetSeasonsBySuperstarId(%d)', $_GET['superstarId']); $stats = array();
						while($season = $seasons->fetch_object()) $stats[] = '<a href="stats.php?season='. $season->season .'&superstarId='. $_GET['superstarId'] .'">'. $season->season .'</a>';
						if (empty($stats)) $stats[] = '<a href="stats.php?season=1&superstarId='. $_GET['superstarId'] .'">Season 1</a>';
						echo implode('&nbsp;|&nbsp;', $stats);
					?>
					<br /><br />
				</div>
			</div>

			<div class="row">
				<div class="span12">
					<div class="well" style="padding: 5px;">
						<h6>Superstar Bio</h6>
						<textarea style="width: 98%;" rows="5"></textarea>
						<button type="submit" class="btn btn-small btn-primary pull-right">Update Bio</button>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		<?php endif; ?>
	</div>
</div>


<?php include 'includes/footer.php'; ?>