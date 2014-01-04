<?php include 'includes/design/header.php'; ?>

<div class="row">
	<div class="span3">
		<div class="well" style="padding: 8px 0;">
			<div class="input-append" style="margin-left: 4px;">
				<form method="POST" action="factions.php?search" style="margin-bottom: 0;">
					<input class="span2" name="faction" type="text" />
					<input type="submit" class="btn" value="Search" />
				</form>
			</div>
		</div>
	</div>

	<div class="span9">
		<div class="row">
			<div class="span12">
				<?php
					if (isset($_GET['search'])) {
						echo '<h4>Faction Search <small>(TERM: "', $_POST['faction'] ,'")</small></h4>';
						$query = db_query('SELECT * FROM factions WHERE factionName LIKE ("%%%s%%") OR factionShortName LIKE ("%%%1$s%%")', $_POST['faction']);
						while($faction = $query->fetch_object()) {
							echo '<a href="factions.php?factionId=', $faction->factionId,'">', $faction->factionName,'</a><br />';
						}
					} else if (isset($_GET['factionId'])) {
						$faction = db_query('SELECT * FROM factions WHERE factionId = %d', $_GET['factionId'])->fetch_object();
						
						$query = db_query('SELECT * FROM promotions'); $promotions = '';
						while($promotion = $query->fetch_object()) $promotions .= '<option value="'. $promotion->promotionId .'" '. (($promotion->promotionId == $faction->promotionId) ? 'selected' : '') .'>'. $promotion->promotionShortName .'</option>';

						echo '<h4>', $faction->factionName,' <small>(ID: ', $faction->factionId,')</small></h4>
							<div class="well" style="padding: 3px 5px;">
							<form class="form-horizontal" style="margin-bottom: 0px;" method="POST" action="factions.php?update&factionId=', $_GET['factionId'],'">
								<input type="hidden" name="factionId" value="', $_GET['factionId'],'" />
								<input type="text" name="factionName" value="', $faction->factionName,'" />
								<input type="text" name="factionShortName" value="', $faction->factionShortName,'" />
								<select name="promotionId" class="span1">', $promotions,'</select>
								<select name="isActive" class="span1">
									<option value="0" ', (($faction->isActive < 0) ? 'selected' : ''),'>Inactive</option>
									<option value="1" ', (($faction->isActive > 0) ? 'selected' : ''),'>Active</option>
								</select>
								<button class="btn btn-small btn-primary">Update</button>
							</form>
						</div>';

						$members = array();
						$query = db_query('SELECT s.superstarId, s.superstarName, c.championshipName, c.championshipId FROM superstars s LEFT JOIN championships c ON c.championshipId = s.championshipId WHERE s.factionId = %d', $faction->factionId);
						while($superstar = $query->fetch_object()) {
							$members[] = '<tr>
												<td>'. $superstar->superstarId .'</td>
												<td><a href="superstars.php?superstarId='. $superstar->superstarId .'">'. $superstar->superstarName .'</a></td>
												<td>'. ( (!empty($superstar->championshipName)) ? '<img src="../assets/img/championships/166x62/'. $superstar->championshipId .'.png" style="width: 70px;" /> '. $superstar->championshipName : 'None' ) .'</td>
												<td><a href="factions.php?delmember&superstarId='. $superstar->superstarId .'&factionId='. $faction->factionId .'" class="btn btn-small btn-danger">Remove</a></td>
											</tr>';
						}

						echo '<h4>Members <small>(', count($members),' TOTAL)</small></h4>
							<div style="width: 700px;">
								<table class="table table-striped table-condensed table-hover">
								<tr><th class="span1">#</th><th class="span3">Name</th><th>Championship</th><th>Remove</th></tr>', 
									implode('', $members), 
								'</table>
							</div>';

					} else {
						echo '<h4>Factions</h4>';
						$factions = db_query('SELECT f.*, p.promotionShortName FROM factions f LEFT JOIN promotions p ON p.promotionId = f.promotionId');
						while($faction = $factions->fetch_object()) {
							echo '<a href="factions.php?factionId=', $faction->factionId,'">', $faction->factionName,'</a> <small>(', $faction->promotionShortName,')</small><br />';
						}
					}
				?>
			</div>
		</div>
	</div>
</div>

<?php include 'includes/design/footer.php'; ?>