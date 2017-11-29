Map = function(){
	this.container = {};
	this.initialize.apply(this, arguments);
}
Map.prototype = {
	initialize: function(){
		this.container = new Array();
	},
	put: function(key, value){
		try{
			if(key != null  &&  key !=""){
				this.container[key] = value;
			}
		}catch(e){
			return e;
		}
	},
	get: function(key){
		try{
			return this.container[key];
		}catch(e){
			return e;
		}
	},
	containsKey:function(key){
		try{
			for(var p in this.container){
				if(p == key)
					return true;
			}
			return false;
		}catch(e){
			return e;
		}
	},
	containsValue: function(value){
		try{
			for(var p in this.container){
				if(this.container[p] == value)
					return true;
			}
			return false;
		}catch(e){
			return e;
		}
	},
	remove: function(key){
		try{
			delete this.container[key];
		}catch(e){
			return e;
		}
	},
	clear: function(){
		try{
			delete this.container;
			this.initialize.apply(this, arguments);
		}catch(e){
			return e;
		}
	},
	keyArray: function(){
		var keys = new Array();
		for(var p in this.container){
			keys.push(p);
		}
		return keys;
	},
	valueArray: function(){
		var values = new Array();
		var keys  = this.keyArray();
		for(var i=0; i < keys.length; i++){
			values.push(this.container[keys[i]]);
		}
		return values;
	},
	isEmpty: function(){
		if(this.keyArray().length = 0)
			return true;
		else
			return false;
	},
	size: function(){
		return this.keyArray().length;
	}
} 