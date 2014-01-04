<?php 
include 'includes/design/header.php'; 
if (!isset($_GET['season']) || empty($_GET['season'])) $_GET['season'] = 1;
?>

<div class="row">
	<div class="span2">
		<div class="well" style="padding: 8px 0;">
			<ul class="nav nav-list">
				<li class="nav-header">Seasons</li>
				<?php
					$seasons = db_query('SELECT season FROM seasons ORDER BY season ASC LIMIT 5');
					while($season = $seasons->fetch_object()) {
						echo '<li ', (($season->season == $_GET['season']) ? 'class="active"' : ''),'><a href="stats.php?season=', $season->season,'">Season ',  $season->season,'</a></li>';
					}
				?>
			</ul>
		</div>
	</div>

	<div class="span10">
		<div class="row">
			<div class="span12">
				<?php
					if (isset($_GET['superstarId'])) {
						$talent = db_query('SELECT superstarId, superstarName, showId, GetPointsBySuperstarIdSeason(superstarId, GetCurrentSeason()) as points FROM superstars WHERE superstarId = %d', $_GET['superstarId'])->fetch_object();

						echo '<h4>', $talent->superstarName ,' Stats <small>(ID: ', $_GET['superstarId'],')</small></h4>';
						include 'includes/methods/Match/creatematch.php';
						echo '<h4>Season ', $_GET['season'],' Statistics <small>(', $talent->points,' PTS)</small></h4>';

					} else if (isset($_GET['season'])) {
						include 'includes/methods/Match/creatematch.php';
						echo '<h4>Season ', $_GET['season'],' Stats</h4>';
					}

					if (isset($_GET['superstarId'])) {
						$query = db_query('SELECT s.matchId FROM matchstats s LEFT JOIN matches m ON m.matchId = s.matchId WHERE m.season = %d AND s.superstarId = %d GROUP BY s.matchId ORDER BY `date` DESC LIMIT 15', $_GET['season'], $_GET['superstarId']);
					} else {
						$query = db_query('SELECT s.matchId FROM matchstats s LEFT JOIN matches m ON m.matchId = s.matchId WHERE m.season = %d GROUP BY s.matchId ORDER BY `date` DESC LIMIT 15', $_GET['season']);
					}
					echo '<table class="table table-condensed table-striped">
								<tr><th>#</th><th class="span5">Summary</th><th>Match</th><th class="span2">Show</th><th class="span2">Date</th></tr>';
						while($m = $query->fetch_object()) {
							$match = MatchApplication::getMatchSummaryByMatchId($m->matchId);
							//printf('<pre>%s</pre>', print_r($match, 1));
							echo '<tr class="parent">
									<td>', $match->summary->matchId,'</td>
									<td>', $match->summary->matchTitle, '</td>
									<td>', $match->summary->matchTypeShortName,' Match ', (($match->summary->isTitle == 'Yes') ? '<small>(Title Match)</small>' : '') ,'</td>
									<td>', $match->summary->matchShowShortName,'</td>
									<td>', $match->summary->matchDate,'</td>
								</tr>
								<tr style="display:none;">
									<td>&nbsp;</td>
									<td colspan="5">
										<div class="pull-right">
											<a href="?editmatch&matchId=', $match->summary->matchId,'&season=', $_GET['season'],'" class="btn btn-mini btn-info">Edit</a>&nbsp;
											<a href="?delmatch&matchId=', $match->summary->matchId,'&season=', $_GET['season'],'" class="btn btn-mini btn-danger">Remove</a>
										</div>
										<small><em>Participants</em><br />';
										$participants = array();
										if ($match->summary->isDraw == 'Yes') $participants = $match->participants->draw;
										else $participants = array_merge($match->participants->won, $match->participants->loss);

										foreach($participants as $k => $superstar) {
											echo '<a href="?season=', $_GET['season'],'&superstarId=', $superstar->superstarId,'">', $superstar->superstarName,'</a><br />';
										}
									echo '</small></td>
								</tr>';
						}
						echo '</table>';
				?>
			</div>
		</div>
	</div>
</div>

<style type="text/css">
	.alt { background-color: #f3f3f3; }
	table tr.parent:hover { cursor: pointer; }
</style>

<script type="text/javascript">
	(function($) {
		$(document).ready(function() {
			$('tr.parent').bind('click', function(e) {
				e.preventDefault();
				$(this).next().toggle();
				return false;
			});

			$('table').find('tbody tr').not(':hidden').filter(':even').addClass('alt');
		});
	})(jQuery);
</script>

<?php include 'includes/design/footer.php'; ?>