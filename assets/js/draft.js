// ga.js via Goole Analytics
function c(a){
	var d=[], e=document.cookie.split(";"); a=RegExp("^\\s*"+a+"=\\s*(.*?)\\s*$");
	for(var b=0;b<e.length;b++){ var f=e[b].match(a); f&&d.push(f[1]) }
	return d
}

// calculate sessionId
var sessionId = c('SESSION').length > 0 ? c('SESSION') : c('PHPSESSID');
var leagueId  = 1;

function User(sessionId) {
	this.userId = 0;
	this.username = null;
	this.sessionId = sessionId;
	this.avatar = null;
	this.membership = 0;

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

	this.updateUserInfo = function(user) {
		if (typeof user.error == 'undefined') {
			this.userId = user.userId;
			this.username = user.username;
			this.avatar = user.avatar;
			this.membership = user.membership;
		}
	};

	this.__construct(sessionId);
}

var Draft = {
	init: function(leagueId) {
		var status = this.getDraftStatusByLeagueId(leagueId);
		console.log(status);
	},

	getDraftStatusByLeagueId: function(leagueId) {
		return $.ajax({
			url: '/draft/getDraftStatusByLeagueId/'+ leagueId,
			async: false
		}).responseText;
	}
}

if (typeof sessionId[0] != 'undefined' && sessionId[0].length > 0) {
	var user = new User(sessionId[0]);
	Draft.init(leagueId);
} else {
	// redirect to login; no session found
}