<?php 
$type = (isset($_GET['type']) ? $_GET['type'] : 'standard');
if (empty($_POST)) {
	
}
?>
<style type="text/css">
	.odd { 
		background-color: #f6f6f6; 
	}

	.section-container {
		border: solid 1px #ddd; 
		overflow: hidden;
	}

	.section-container div.row {
		padding: 10px;
	}

	.small-12 {
		font-size: 90%;
	}

	input[type="text"] {
		margin-bottom: 0;
	}
</style>
<h1>Create League</h1>
<form method="POST" action="">
	<h4>General Settings</h4>
	<div class="section-container">
		<div class="row">
			<div class="small-12 medium-3 column">
				<label>League Name</label>
			</div>
			<div class="small-12 medium-9 column">
				<input type="text" placeholder="Bryan's League" required />
			</div>
		</div>

		<div class="row odd">
			<div class="small-12 medium-3 column">
				<label>League Motto</label>
			</div>
			<div class="small-12 medium-9 column">
				<input type="text" placeholder="YES!! YES!! YES!!" required />
			</div>
		</div>

		<div class="row ">
			<div class="small-12 medium-3 column">
				<label>League Type</label>
			</div>
			<div class="small-12 medium-9 column">
				<?php echo ucfirst($type); ?> League
			</div>
		</div>
	</div>
	<br />
	<h4>League Access</h4>
	<div class="section-container">
		<div class="row">
			<div class="small-12 medium-3 column">
				<input type="radio" name="access" value="1" checked /><label>Public Access</label>
			</div>
			<div class="small-12 medium-9 column">
				Anyone can join this league. It was also be displayed within the League Directory.
			</div>
		</div>

		<div class="row odd">
			<div class="small-12 medium-3 column">
				<input type="radio" name="access" value="2" /><label>Request Access</label>
			</div>
			<div class="small-12 medium-9 column">
				This league will be listed within the League Directory; however, users will have to request access. You will need to grant access manually.
			</div>
		</div>

		<div class="row">
			<div class="small-12 medium-3 column">
				<input type="radio" name="access" value="3" /><label>Invite only</label>
			</div>
			<div class="small-12 medium-9 column">
				Only those that you explicity invite will be able to join this league. It will not be display within the League Directory.
			</div>
		</div>
	</div>
	<br />
	<h4>Draft Method</h4>
	<div  class="section-container">
		<div class="row">
			<div class="small-12 medium-3 column">
				<input type="radio" name="draftmethod" value="1" checked /><label>Snake Draft</label>
			</div>
			<div class="small-12 medium-9 column">
				Your league will participate in a live draft. Set the time and date below. If you're unsure of the date or time, you can set it later.
			</div>
		</div>

		<div class="row odd">
			<div class="small-12 medium-3 column">
				<input type="radio" name="draftmethod" value="2" /><label>Automatic Draft</label>
			</div>
			<div class="small-12 medium-9 column">
				Your league's rosters will be automatically drafted based on each superstar's pre-ranked list.
			</div>
		</div>

		<div class="row">
			<div class="small-12 medium-3 column">
				<input type="radio" name="draftmethod" value="3" /><label>Auction Draft</label>
			</div>
			<div class="small-12 medium-9 column">
				Your league will draft superstars based on a bidding format. Set the time and date below. If you're unsure of the date or time, you can set it later.
			</div>
		</div>

		<div class="row odd">
			<div class="small-12 medium-3 column">
				<input type="radio" name="draftmethod" value="4" /><label>Offline Draft</label>
			</div>
			<div class="small-12 medium-9 column">
				Your league will conduct its own offline draft and you submit the results manually.
			</div>
		</div>
	</div>
	<br />
	<input type="submit" class="button tiny" value="Create League" /> <a href="/" class="button tiny alert">Cancel</a>
</form>