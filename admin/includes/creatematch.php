<?php
if (count($_POST) > 0) {
	//die(sprintf('<pre>%s</pre>', print_r($_POST, 1)));
	if (isset($_GET['matchadd'])) {
		$isDraw = ((!isset($_POST['match_draw'])) ? 0 : 1);
		$isTitleMatch = ((!isset($_POST['match_title'])) ? 0 : 1);
		$season = db_query('SELECT season FROM seasons WHERE startDate <= "%s" AND endDate >= "%1$s"', $_POST['match_date'] .' 00:00:00')->fetch_object()->season;
		$matches = array(
			'season' => $season, 
			'date' => $_POST['match_date'].' 00:00:00',
			'showId' => $_POST['match_showId'], 
			'matchTypeId' => $_POST['match_matchTypeId'], 
			'decisionId' => ((!$isDraw) ? $_POST['match_decisionId'] : 0),
			'isDraw' => $isDraw, 
			'isTitleMatch' => $isTitleMatch
		);
		$matchId = db_insert('matches', $matches, true);

		$participants = array();
		if ($isDraw <= 0) {
			foreach($_POST['matchstats_superstar_winners'] as $k => $superstarId) $participants[] = array('superstarId' => $superstarId, 'matchId' => $matchId, 'match_won' => 1);
			foreach($_POST['matchstats_superstar_losers'] as $k => $superstarId) $participants[] = array('superstarId' => $superstarId, 'matchId' => $matchId, 'match_loss' => 1);
		} else {
			foreach($_POST['matchstats_superstar_participants'] as $k => $superstarId) $participants[] = array('superstarId' => $superstarId, 'matchId' => $matchId, 'match_draw' => 1);
		}
		
		if ((int)$_POST['matchstats_superstar_guest_referee'] <= 0) {
			if ((int)$_POST['matchstats_referee'] > 0) {
				$participants[] = array('superstarId' => $_POST['matchstats_referee'], 'matchId' => $matchId, 'match_referee' => 1);
			}
		} else {
			$superstarId = $_POST['matchstats_superstar_guest_referee'];
			$participants[] = array('superstarId' => $superstarId, 'matchId' => $matchId, 'match_referee' => 1);
			$event = array('superstarId' => $superstarId, 'eventTypeId' => 4, 'showId' => $_POST['match_showId'], 'matchId' => $matchId, 'date' => $_POST['match_date'] .' 00:00:00');
			db_insert('events', $event);
		}
		foreach($participants as $k => $row) db_insert('matchstats', $row);

		if (isset($_POST['matchstats_superstar_interference'])) {
			$events = array();
			foreach($_POST['matchstats_superstar_interference'] as $k => $superstarId) $events[] = array('superstarId' => $superstarId, 'eventTypeId' => 1, 'showId' => $_POST['match_showId'], 'matchId' => $matchId, 'date' => $_POST['match_date'] .' 00:00:00');
			foreach($events as $k => $row) db_insert('events', $row);
		}

		if (isset($_POST['bonus_superstar'])) {
			$bonus = array();
			foreach($_POST['bonus_superstar'] as $k => $superstarId) {
				if ((int)$superstarId > 0) {
					$bonus[] = array('superstarId' => $superstarId, 'matchId' => $matchId, 'bonusTypeId' => $_POST['bonus_type'][$k]);
				}
			}
			foreach($bonus as $k => $row) db_insert('bonuses', $row);
		}

		echo '<div class="alert alert-success"><b>Success</b>! Match (ID: ', $matchId,') has been successfully added</div>';
	}
}

if (isset($_GET['superstarId'])) $superstarId = $_GET['superstarId'];

$season = date('Y');
if (!empty($_GET['season'])) $season = $_GET['season'];

$query = db_query('SELECT * FROM matchtypes'); $matchtypes = '';
while($m = $query->fetch_object()) $matchtypes .= '<option value="'. $m->matchTypeId .'">'. $m->matchTypeName .' (PTS: '. $m->matchTypePoints .')</option>';

$query = db_query('SELECT * FROM shows WHERE isActive > 0'); $shows = '';
while($s = $query->fetch_object()) $shows .= '<option value="'. $s->showId .'" '. ((isset($_POST['match_showId']) && $s->showId == $_POST['match_showId']) ? 'selected' : '').'>'. $s->showName .'</option>';

$query = db_query('SELECT * FROM bonustypes'); $bonuses = '';
while($b = $query->fetch_object()) $bonuses .= '<option value="'. $b->bonusTypeId .'">'. $b->bonusTypeName .' (PTS: '. $b->bonusTypePoints .')</option>';

$query = db_query('SELECT * FROM matchdecisions'); $decisions = '';
while($d = $query->fetch_object()) $decisions .= '<option value="'. $d->decisionId .'">'. $d->decisionName .' (PTS: '. $d->decisionPoints .')</option>';

$query = db_query('SELECT * FROM superstars WHERE tierId = 4'); $refs = '<option value="0" data-data="{&quot;superstarId&quot;: &quot;0&quot;, &quot;superstarName&quot;: &quot;None&quot;}">None</option>';
while($r = $query->fetch_object()) $refs .= '<option value="'. $r->superstarId .'" data-data="'. htmlentities(json_encode($r)) .'">'. $r->superstarName .'</option>';
?>

<link rel="stylesheet" type="text/css" href="assets/css/selectize.css" />
<link rel="stylesheet" type="text/css" href="assets/css/datetimepicker.min.css" />
<script type="text/javascript" src="assets/js/selectize.js"></script>
<script type="text/javascript" src="assets/js/datetimepicker.min.js"></script>

<div class="well" style="padding: 3px 5px;">
	<h5><a href="#" id="collapse">Add Match</a></h5>
	<form class="form-horizontal form-inline" style="margin-bottom: 0px; display: none;" method="POST" action="?matchadd&season=<?php echo $season; ?>">
		<select name="match_showId" class="span3"><?php echo $shows; ?></select>

		<div id="match_date_container" class="input-append date">
			<input type="text" style="width: 75px;" data-format="yyyy-MM-dd" name="match_date" value="<?php echo date('Y-m-d'); ?>" />
			<span class="add-on">
				<i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
			</span>
		</div>
		
		<select name="match_matchTypeId"><?php echo $matchtypes; ?></select>
		<label class="checkbox">
			<input type="checkbox" name="match_title"> Title Match
		</label>&nbsp;
		 <label class="checkbox">
			<input type="checkbox" name="match_draw"> Draw
		</label>

		<div id="match_no_draw">
			<h6>Winners <small>(required)</small></h6>
			<select name="matchstats_superstar_winners[]" multiple><?php if (isset($talent)) echo '<option value="', $talent->superstarId,'" data-data="', htmlentities(json_encode($talent)),'" selected>', $talent->superstarName ,'</option>'; ?></select>
			<h6>Losers <small>(required)</small></h6>
			<select name="matchstats_superstar_losers[]" multiple></select>
		</div>
		<div id="match_is_draw" style="display:none;">
			<h6>Participants <small>(required)</small></h6>
			<select name="matchstats_superstar_participants[]" multiple><?php if (isset($talent)) echo '<option value="', $talent->superstarId,'" data-data="', htmlentities(json_encode($talent)),'" selected>', $talent->superstarName ,'</option>'; ?></select>
		</div>

		<div style="float:left; margin-right: 5px;">
			<h6>Referee <small><a href="#" id="special_ref"><span>Special Guest</span><span style="display:none;">Staff Referee</span></a> (optional)</small></h6>
			<div id="non_guest_ref">
				<select name="matchstats_referee" style="width: 250px;"><?php echo $refs; ?></select>
			</div>
			<div id="guest_ref" style="width: 250px; display: none;">
				<select name="matchstats_superstar_guest_referee"><?php echo $refs; ?></select>
			</div>
		</div>
		<div style="float: left; margin-right: 5px;">
			<h6>Decision <small>(required)</small></h6>
			<select name="match_decisionId"><?php echo $decisions; ?></select>
		</div>
		<div class="clearfix"></div>

		<h6>Inteference <small>Bonus will be added to those entered below (optional)</small></h6>
		<select style="width: 100%;" name="matchstats_superstar_interference[]" multiple></select>

		<div class="clearfix"></div>

		<h6>Bonuses <small><a href="#" id="add_bonus">&plus; Add Bonus</a> (optional)</small></h6>
		<div id="bonus_container"></div>
		<div class="clearfix"></div>

		<div class="form-actions" style="background-color: #e5e5e5; margin: 0px;">
			<button class="btn btn-primary pull-right">Add Match</button>
		</div>
		<div class="clearfix"></div>
	</form>
</div>

<style type="text/css">
	div.bonus_add {
		margin-bottom: 5px;
	}
</style>

<script type="text/javascript">
	(function($){
		$(document).ready(function() {
			$('div#match_date_container').datetimepicker({
				language: 'en'
			});

			$('a#collapse').bind('click', function(e) {
				e.preventDefault();
				$(this).parent().next().slideToggle();
				return false;
			});

			$('input[name="match_draw"]').bind('click', function(e){
				$('div#match_is_draw, div#match_no_draw').slideToggle();
			});

			$('a#special_ref').bind('click', function(e){
				e.preventDefault();
				$('div#non_guest_ref, div#guest_ref').slideToggle();
				$(this).find('span').toggle();
				return false;
			});

			$('div#bonus_container').on('click', 'a', function(e) {
				e.preventDefault();
				$(this).parent().remove();
				return false;
			});

			$('a#add_bonus').on('click', function(e) {
				e.preventDefault();
				var options = '';
				$.each($('div.selectize-input div'), function(i, item){
					var $this = $(item);
					options += '<option value="'+ $this.attr('data-value') +'">'+ $this.text() +'</option>'
				});
				var bonus = '<div class="bonus_add"><select name="bonus_superstar[]">'+ options +'</select> <select name="bonus_type[]"><?php echo $bonuses; ?></select> <a class="btn btn-small btn-danger" href="#">Remove</a></div>';
				$('div#bonus_container').append(bonus);
				return false;
			});
		
			$('select[name^="matchstats_superstar"]').selectize({
				valueField: 'superstarId',
				labelField: 'superstarName',
				searchField: 'superstarName',
				create: false,
				render: {
					option: function(item, escape) {
						return '<div>' +
								'<b>'+ item.superstarName +'</b> <small>('+ item.points +' PTS)</small><br />' +
							'</div>';
					}
				},
				load: function(query, callback) {
					if (!query.length) return callback();
					$.ajax({
						url: 'ajax/search.php?method=SuperstarByName',
						type: 'POST',
						data: {superstar: query},
						error: function() {
							callback();
						},
						success: function(data) {
							callback(data);
						}
					});
				}
			});

		});
	})(jQuery);
</script>