<h1>Leagues</h1>
<p><a href="?method=create" class="button tiny right">Create League</a>Below are a list of all current leagues. You can join an existing one or create your own.</p>
<table class="small-12">
	<thead>
		<tr><th>Name</th><th>Type</th><th>Draft Type</th><th>Teams</th><th>Draft Date</th></tr>
	</thead>
	<tbody>
		<?php 
			$leagues = LeagueApplication::getLeagues(15);
			foreach($leagues as $league) {
				echo '<tr><td><a href="game/dashboard.php?leagueId=', $league->leagueId ,'">', $league->leagueName ,'</a></td><td>', $league->type ,'</td><td>', $league->draftType,'</td><td>', $league->players,'/', $league->maxPlayers,'</td><td>', date('M d, Y', strtotime($league->created)) ,'</td></tr>';
			}
		?>
	</tbody>
</table>