<h1>League Directory</h1>
<?php 
$leagues = LeagueApplication::getLeaguesBySeason(0); 
if (count($leagues) > 0): ?>
	<p><a href="?method=create" class="button tiny right">Create League</a>Below are a list of all current leagues. You can join an existing one or create your own.</p>
	<table class="small-12">
		<thead>
			<tr><th>Name</th><th>Type</th><th>Draft Type</th><th>Teams</th><th>Draft Date</th><th width="150"></th></tr>
		</thead>
		<tbody>
			<?php 
				foreach($leagues as $league) {
					echo '<tr>
							<td><a href="game/dashboard.php?leagueId=', $league->leagueId ,'">', $league->leagueName ,'</a></td>
							<td>', $league->type ,'</td>
							<td>', $league->draftType,'</td>
							<td>', $league->players,'/', $league->maxPlayers,'</td>
							<td>', date(SITE_DATETIME, strtotime($league->created)) ,'</td>
							<td><a class="button tiny" style="margin-bottom: 0;" href="?method=joinleague&leagueId=', $league->leagueId,'">Join League</a></td>
						</tr>';
				}
			?>
		</tbody>
	</table>
<?php else: ?>
	<p>Woah! There are currently no leagues for this season. Get started now!<br /><br /><a href="?method=create" class="button tiny">Create League</a></p>
<?php endif; ?>