<template>
    <div>
        <div class="h1">Hello From Websocket</div>
        <p>{{ username }}</p>
    </div>
</template>
<script>
import Echo from 'laravel-echo';
export default {
    name : 'WelcomeComponent',
    data(){
    	return {
    		username : ''
    	}
    },

    mounted(){
	    window.Echo.channel('newpost')
	    .listen('Notify', (e) => {
	    	this.newpost.push({
		        user: {
		            name: 'namba'
		        },
		        body: 'hello biar'
		    });
	        console.log(e);
	    });
    }
}
</script>