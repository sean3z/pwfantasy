// ga.js via Goole Analytics
function c(a){
	var d=[], e=document.cookie.split(";"); a=RegExp("^\\s*"+a+"=\\s*(.*?)\\s*$");
	for(var b=0;b<e.length;b++){ var f=e[b].match(a); f&&d.push(f[1]) }
	return d
}

Date.strtotime = function(text, now) {
  //  discuss at: http://phpjs.org/functions/strtotime/
  //     version: 1109.2016
  // original by: Caio Ariede (http://caioariede.com)
  //        note: Examples all have a fixed timestamp to prevent tests to fail because of variable time(zones)
  //   example 1: strtotime('+1 day', 1129633200);
  //   returns 1: 1129719600
  //   example 2: strtotime('+1 week 2 days 4 hours 2 seconds', 1129633200);
  //   returns 2: 1130425202
  //   example 3: strtotime('last month', 1129633200);
  //   returns 3: 1127041200
  //   example 4: strtotime('2009-05-04 08:30:00 GMT');
  //   returns 4: 1241425800

  var parsed, match, today, year, date, days, ranges, len, times, regex, i, fail = false;

  if (!text) {
    return fail;
  }

  // Unecessary spaces
  text = text.replace(/^\s+|\s+$/g, '')
    .replace(/\s{2,}/g, ' ')
    .replace(/[\t\r\n]/g, '')
    .toLowerCase();

  // in contrast to php, js Date.parse function interprets:
  // dates given as yyyy-mm-dd as in timezone: UTC,
  // dates with "." or "-" as MDY instead of DMY
  // dates with two-digit years differently
  // etc...etc...
  // ...therefore we manually parse lots of common date formats
  match = text.match(
    /^(\d{1,4})([\-\.\/\:])(\d{1,2})([\-\.\/\:])(\d{1,4})(?:\s(\d{1,2}):(\d{2})?:?(\d{2})?)?(?:\s([A-Z]+)?)?$/);

  if (match && match[2] === match[4]) {
    if (match[1] > 1901) {
      switch (match[2]) {
        case '-':
          { // YYYY-M-D
            if (match[3] > 12 || match[5] > 31) {
              return fail;
            }

            return new Date(match[1], parseInt(match[3], 10) - 1, match[5],
              match[6] || 0, match[7] || 0, match[8] || 0, match[9] || 0) / 1000;
          }
        case '.':
          { // YYYY.M.D is not parsed by strtotime()
            return fail;
          }
        case '/':
          { // YYYY/M/D
            if (match[3] > 12 || match[5] > 31) {
              return fail;
            }

            return new Date(match[1], parseInt(match[3], 10) - 1, match[5],
              match[6] || 0, match[7] || 0, match[8] || 0, match[9] || 0) / 1000;
          }
      }
    } else if (match[5] > 1901) {
      switch (match[2]) {
        case '-':
          { // D-M-YYYY
            if (match[3] > 12 || match[1] > 31) {
              return fail;
            }

            return new Date(match[5], parseInt(match[3], 10) - 1, match[1],
              match[6] || 0, match[7] || 0, match[8] || 0, match[9] || 0) / 1000;
          }
        case '.':
          { // D.M.YYYY
            if (match[3] > 12 || match[1] > 31) {
              return fail;
            }

            return new Date(match[5], parseInt(match[3], 10) - 1, match[1],
              match[6] || 0, match[7] || 0, match[8] || 0, match[9] || 0) / 1000;
          }
        case '/':
          { // M/D/YYYY
            if (match[1] > 12 || match[3] > 31) {
              return fail;
            }

            return new Date(match[5], parseInt(match[1], 10) - 1, match[3],
              match[6] || 0, match[7] || 0, match[8] || 0, match[9] || 0) / 1000;
          }
      }
    } else {
      switch (match[2]) {
        case '-':
          { // YY-M-D
            if (match[3] > 12 || match[5] > 31 || (match[1] < 70 && match[1] > 38)) {
              return fail;
            }

            year = match[1] >= 0 && match[1] <= 38 ? +match[1] + 2000 : match[1];
            return new Date(year, parseInt(match[3], 10) - 1, match[5],
              match[6] || 0, match[7] || 0, match[8] || 0, match[9] || 0) / 1000;
          }
        case '.':
          { // D.M.YY or H.MM.SS
            if (match[5] >= 70) { // D.M.YY
              if (match[3] > 12 || match[1] > 31) {
                return fail;
              }

              return new Date(match[5], parseInt(match[3], 10) - 1, match[1],
                match[6] || 0, match[7] || 0, match[8] || 0, match[9] || 0) / 1000;
            }
            if (match[5] < 60 && !match[6]) { // H.MM.SS
              if (match[1] > 23 || match[3] > 59) {
                return fail;
              }

              today = new Date();
              return new Date(today.getFullYear(), today.getMonth(), today.getDate(),
                match[1] || 0, match[3] || 0, match[5] || 0, match[9] || 0) / 1000;
            }

            return fail; // invalid format, cannot be parsed
          }
        case '/':
          { // M/D/YY
            if (match[1] > 12 || match[3] > 31 || (match[5] < 70 && match[5] > 38)) {
              return fail;
            }

            year = match[5] >= 0 && match[5] <= 38 ? +match[5] + 2000 : match[5];
            return new Date(year, parseInt(match[1], 10) - 1, match[3],
              match[6] || 0, match[7] || 0, match[8] || 0, match[9] || 0) / 1000;
          }
        case ':':
          { // HH:MM:SS
            if (match[1] > 23 || match[3] > 59 || match[5] > 59) {
              return fail;
            }

            today = new Date();
            return new Date(today.getFullYear(), today.getMonth(), today.getDate(),
              match[1] || 0, match[3] || 0, match[5] || 0) / 1000;
          }
      }
    }
  }

  // other formats and "now" should be parsed by Date.parse()
  if (text === 'now') {
    return now === null || isNaN(now) ? new Date()
      .getTime() / 1000 | 0 : now | 0;
  }
  if (!isNaN(parsed = Date.parse(text))) {
    return parsed / 1000 | 0;
  }

  date = now ? new Date(now * 1000) : new Date();
  days = {
    'sun': 0,
    'mon': 1,
    'tue': 2,
    'wed': 3,
    'thu': 4,
    'fri': 5,
    'sat': 6
  };
  ranges = {
    'yea': 'FullYear',
    'mon': 'Month',
    'day': 'Date',
    'hou': 'Hours',
    'min': 'Minutes',
    'sec': 'Seconds'
  };

  function lastNext(type, range, modifier) {
    var diff, day = days[range];

    if (typeof day !== 'undefined') {
      diff = day - date.getDay();

      if (diff === 0) {
        diff = 7 * modifier;
      } else if (diff > 0 && type === 'last') {
        diff -= 7;
      } else if (diff < 0 && type === 'next') {
        diff += 7;
      }

      date.setDate(date.getDate() + diff);
    }
  }

  function process(val) {
    var splt = val.split(' '), // Todo: Reconcile this with regex using \s, taking into account browser issues with split and regexes
      type = splt[0],
      range = splt[1].substring(0, 3),
      typeIsNumber = /\d+/.test(type),
      ago = splt[2] === 'ago',
      num = (type === 'last' ? -1 : 1) * (ago ? -1 : 1);

    if (typeIsNumber) {
      num *= parseInt(type, 10);
    }

    if (ranges.hasOwnProperty(range) && !splt[1].match(/^mon(day|\.)?$/i)) {
      return date['set' + ranges[range]](date['get' + ranges[range]]() + num);
    }

    if (range === 'wee') {
      return date.setDate(date.getDate() + (num * 7));
    }

    if (type === 'next' || type === 'last') {
      lastNext(type, range, num);
    } else if (!typeIsNumber) {
      return false;
    }

    return true;
  }

  times = '(years?|months?|weeks?|days?|hours?|minutes?|min|seconds?|sec' +
    '|sunday|sun\\.?|monday|mon\\.?|tuesday|tue\\.?|wednesday|wed\\.?' +
    '|thursday|thu\\.?|friday|fri\\.?|saturday|sat\\.?)';
  regex = '([+-]?\\d+\\s' + times + '|' + '(last|next)\\s' + times + ')(\\sago)?';

  match = text.match(new RegExp(regex, 'gi'));
  if (!match) {
    return fail;
  }

  for (i = 0, len = match.length; i < len; i++) {
    if (!process(match[i])) {
      return fail;
    }
  }

  // ECMAScript 5 only
  // if (!match.every(process))
  //    return false;

  return (date.getTime() / 1000);
}

Date.dateDiff = function(d1, d2) {
	d1 /= 1000;
	d2 /= 1000;
	// if (d1 > d2) d2 = [d1, d1 = d2][0];

	var diffs = {
		year: 0,
		month: 0,
		day: 0,
		hour: 0,
		minute: 0,
		second: 0
	}

	$.each(diffs, function(interval) {
	while (d2 >= (d3 = Date.strtotime('+1 '+interval, d1))) {
		d1 = d3;
		++diffs[interval];
		}
	});

	return diffs;
};

function User(sessionId) {
	this.userId = 0;
	this.username = null;
	this.sessionId = sessionId;
	this.avatar = null;
	this.membership = 0;
	this.queue = [];

	this.__construct = function(sessionId) {
		this.getUserBySessionId();
	};

	this.getUserBySessionId = function() {
		$.ajax({
			url: '/user/getUserBySessionId/'+ this.sessionId,
			async: false,
			context: this,
			success: this.updateUserInfo
		});
	};

	this.updateUserInfo = function(data) {
		if (typeof data.error == 'undefined') {
			this.userId = data.userId;
			this.username = data.username;
			this.avatar = data.avatar;
			this.membership = data.membership;
			$('.top-bar-section ul li a').html(data.username);
		} else {
			stageLeft();
		}
	};

	this.addSuperstarToQueue = function(superstarId) {
		this.queue.push(superstarId);
	}

	this.__construct(sessionId);
}

var Draft = {
	init: function(leagueId) {
		var info = this.getDraftInformationByLeagueId(leagueId);
		if (typeof info.error == 'undefined') {
			if (this.isParticipant(info.players) && !info.isComplete) {
				var countdown = Date.dateDiff(new Date(), new Date(info.draftTime));
				if (countdown.minute > 0 || countdown.second > 0) {
					// initiate countdown
					$('#pre-draft > div p').html('starts in '+ countdown.hour +' hours '+ countdown.minute +' minutes '+ countdown.second +' seconds');
					// send time to internal clock so we can initiate draft without refresh
					// this.draftStart();
				} else {
					// draft has already started
					this.getDraftableSuperstars();
					$('#pre-draft, #draft-content').toggle();
					// get draft status - setInterval() every 2seconds, pull draft 
					setInterval(function() {
						Draft.getDraftStatusByLeagueId(leagueId)
					}, 3000);
				}
			} else {
				// not a participant
				stageLeft();
			}
		}
	},

	getDraftInformationByLeagueId: function(leagueId) {
		return $.parseJSON(
			$.ajax({
				url: '/draft/getDraftInformationByLeagueId/'+ leagueId,
				async: false,
				dataType: 'json',
			}).responseText
		);
	},

	getDraftStatusByLeagueId: function(leagueId) {
		$.ajax({
			url: '/draft/getDraftStatusByLeagueId/'+ leagueId,
			dataType: 'json',
			success: this.incomingStatus
		});
	},

	getDraftableSuperstars: function() {
		$.ajax({
			url: '/draft/getDraftableSuperstars',
			dataType: 'json',
			success: this.initiateDraftables
		});
	},

	isParticipant: function(players) {
		if (players.indexOf(user.userId) >= 0) {
			return true;
		} 
		return false;
	},

	initiateDraftables: function(superstars) {
		if (typeof superstars.error == 'undefined') {
			var $table = $('#draftables table');
			for(i in superstars) {
				var superstar = superstars[i];
				var factionName = typeof superstar.factionName != 'object' ? '<small>'+ superstar.factionName +'</small>' : '';
				$table.append('<tr><td>+</td><td>'+ superstar.superstarName +' '+ factionName +'</td></tr>');
			}
		}
	},

	incomingStatus: function(status) {
		// essentially the controller for visiual events on the page
		// console.log(status);
	}
}

function stageLeft() {
	alert('exit stage left');
	// window.location = window.location.hostname;
}

// calculate sessionId
var sessionId = c('SESSION').length > 0 ? c('SESSION') : c('PHPSESSID');
var leagueId  = 1;

if (typeof sessionId[0] != 'undefined' && sessionId[0].length > 0) {
	var user = new User(sessionId[0]);
	Draft.init(leagueId);
} else {
	// redirect to login; no session found
	stageLeft();
}