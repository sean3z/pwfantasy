<?php if (require_login('leagues.php?method=myleagues')): ?>
	<h1>My Leagues</h1>
	<p><a href="?method=create" class="button tiny right">Create League</a>Below are a list of leagues you've joined for the current season.</p>
	<table class="small-12">
		<thead>
			<tr><th>Name</th><th>Type</th><th>Draft Type</th><th>Teams</th><th>Draft Date</th></tr>
		</thead>
		<tbody>
			<?php 
				$leagues = LeagueApplication::getLeaguesByUserIdSeason($user->userId);
				foreach($leagues as $league) {
					echo '<tr><td><a href="game/dashboard.php?leagueId=', $league->leagueId ,'">', $league->leagueName ,'</a></td><td>', $league->type ,'</td><td>', $league->draftType,'</td><td>', $league->players,'/', $league->maxPlayers,'</td><td>', date('M d, Y', strtotime($league->created)) ,'</td></tr>';
				}
			?>
		</tbody>
	</table>
<?php endif; ?>