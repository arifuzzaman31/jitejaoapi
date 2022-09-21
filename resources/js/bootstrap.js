window._ = require('lodash');

/**
 * We'll load the axios HTTP library which allows us to easily issue requests
 * to our Laravel back-end. This library automatically handles sending the
 * CSRF token as a header based on the value of the "XSRF" token cookie.
 */

window.axios = require('axios');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

/**
 * Echo exposes an expressive API for subscribing to channels and listening
 * for events that are broadcast by Laravel. Echo and event broadcasting
 * allows your team to easily build robust real-time web applications.
 */

import Echo from 'laravel-echo';

window.Pusher = require('pusher-js');
	Pusher.logToConsole = true;

window.Echo = new Echo({
    broadcaster: 'pusher',
    authorizer: (channel, options) => {
		        return {
		            authorize: (socketId, callback) => {
		                axios.post('/api/broadcasting/auth', {
		                    socket_id: socketId,
		                    channel_name: channel.name
		                })
		                .then(response => {
		                    // console.log(response.data)
		                    this.newpost.push({
						        user: {
						            name: e.user.name
						        },
						        body: e.comment.body
						    });
		                    callback(false, response.data);
		                })
		                .catch(error => {
		                    callback(true, error);
		                });
		            }
		        };
		    },
    key: 'myKey',
    wsHost: window.location.hostname,
    wsPort: 6001,
    forceTLS: false,
    disableStats: true,
    // authEndpoint: 'http://localhost/demand-back/public/endpoint/auth'
});
