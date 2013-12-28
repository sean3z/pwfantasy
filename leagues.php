<?php 
include 'includes/design/header.php'; 
$method = (isset($_GET['method']) && !empty($_GET['method'])) ? $_GET['method'] : 'leagues';

?>

<?php if ($method == 'create'): ?>
	<h1>Create League</h1>
	<style type="text/css">td { text-align: center; }</style>
	<table style="width: 100%;">
		<thead>
			<tr><th></th><th class="text-center" width="250">Standard League</th><th class="text-center" width="250">Pro Membership</th></tr>
		</thead>
		<tbody>
			<tr><td class="text-left">Access</td><td>Public</td><td>Public or Private</td></tr>
			<tr><td class="text-left">Live Scoring</td><td><i class="fa fa-check"></i></td><td><i class="fa fa-check"></i></td></tr>
			<tr><td class="text-left">Teams in League</td><td>8</td><td>8</td></tr>
			<tr><td class="text-left">League History</td><td></td><td><i class="fa fa-check"></i></td></tr>
			<tr><td class="text-left">League Prize</td><td></td><td><i class="fa fa-check"></i></td></tr>
			<tr><td class="text-left">Leaderboard Eligable</td><td></td><td><i class="fa fa-check"></i></td></tr>
			<tr><td class="text-left">Cost</td><td>100% FREE</td><td>Create League for Pricing</td></tr>
			<tr><td></td><td><a class="button tiny" href="#">Create League</a></td><td><a class="button tiny alert" href="#">Create Pro League</a></td></tr>
		</tbody>
	</table>

<?php elseif ($method == 'myleagues'): ?>
	<?php if (require_login('leagues.php?method=myleagues')): ?>
		<h1>My Leagues</h1>
		<p><a href="?method=create" class="button tiny right">Create League</a>Below are a list of leagues you've joined for the current season.</p>
		<table class="small-12">
			<thead>
				<tr><th>Name</th><th>Type</th><th>Draft Type</th><th>Teams</th><th>Draft Date</th></tr>
			</thead>
			<tbody>
				<?php 
					$leagues = LeagueApplication::getLeaguesByUserId($user->userId);
					foreach($leagues as $league) {
						echo '<tr><td><a href="game/dashboard.php?leagueId=', $league->leagueId ,'">', $league->leagueName ,'</a></td><td>', $league->type ,'</td><td>', $league->draftType,'</td><td>', $league->players,'/', $league->maxPlayers,'</td><td>', date('M d, Y', strtotime($league->created)) ,'</td></tr>';
					}
				?>
			</tbody>
		</table>
	<?php endif; ?>
<?php elseif ($method == 'leagues'): ?>
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
<?php endif; ?>


<?php include 'includes/design/footer.php'; ?>