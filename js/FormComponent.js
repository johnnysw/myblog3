define(['react', 'react-dom', 'jsx!InputComponent', 'jsx!ButtonComponent'], function(React, ReactDOM, InputComponent, ButtonComponent){
	var FormComponent = React.createClass({
		render : function(){
			return (
				<div>
					<InputComponent/>
					<ButtonComponent/>
				</div>
			);
		}
	});
	return FormComponent;
});