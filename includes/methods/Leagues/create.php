<?php if (isset($_GET['type']) && !empty($_GET['type'])): ?>
	<?php include 'createleague.php'; ?>
<?php else: ?>
	<h1>Create League</h1>
	<style type="text/css">
	td { text-align: center; }
	</style>
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
			<tr><td class="text-left">Leaderboard Eligible</td><td></td><td><i class="fa fa-check"></i></td></tr>
			<tr><td class="text-left">Cost</td><td>100% FREE</td><td>Create League for Pricing</td></tr>
			<tr><td></td><td><a class="button tiny" href="?method=create&type=standard">Create League</a></td><td><a class="button tiny alert" href="?method=create&type=pro">Create Pro League</a></td></tr>
		</tbody>
	</table>
<?php endif; ?>