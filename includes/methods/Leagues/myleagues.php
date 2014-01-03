<?php 
if (require_login('leagues.php?method=myleagues')): 
	$leagues = LeagueApplication::getLeaguesByUserIdSeason($user->userId, 0); ?>
	<h1>My Leagues</h1>
	<?php if (count($leagues) > 0): ?>
		<p><a href="?method=create" class="button tiny right">Create League</a>Below are a list of leagues you've joined for the current season.</p>
		<table class="small-12">
			<thead>
				<tr><th>Name</th><th>Type</th><th>Draft Type</th><th>Teams</th><th>Draft Date</th></tr>
			</thead>
			<tbody>
				<?php 
					foreach($leagues as $league) {
						echo '<tr><td><a href="game/dashboard.php?leagueId=', $league->leagueId ,'">', $league->leagueName ,'</a></td><td>', $league->type ,'</td><td>', $league->draftType,'</td><td>', $league->players,'/', $league->maxPlayers,'</td><td>', date('M d, Y', strtotime($league->created)) ,'</td></tr>';
					}
				?>
			</tbody>
		</table>
	<?php else: ?>
		<p>You haven't joined any leagues.<br />Check out the <a href="leagues.php">Leagues Directory</a> to see which are available or <a href="?method=create">Create your own League</a> to get started.</p>
	<?php endif; ?>
<?php endif; ?>