define(['react', 'react-dom'], function(React, ReactDOM){
	var InputComponent = React.createClass({
		render : function(){
			return (
				<input type="text" value="Name"/>
			);
		}
	});
	return InputComponent;
});