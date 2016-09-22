define(['react', 'react-dom', 'jsx!InputComponent', 'jsx!ButtonComponent'], function(React, ReactDOM, InputComponent, ButtonComponent){
	var FormComponent = React.createClass({
		inputVal : {
			Name : '',
			Email : '',
			Message : ''
		},
		submitHandler : function(e){
			console.log({
				Name : this.inputVal.Name,
				Email : this.inputVal.Email,
				Message : this.inputVal.Message
			});
			e.preventDefault();
		},
		getInputVal : function(e){
			this.inputVal[e.target.placeholder] = e.target.value;
		},
		render : function(){
			var styleObj = {
				width : '300px',
				height : '50px'
			};
			var messageObj = {
				width : '300px',
				height : '100px'
			};
			return (
				<form onSubmit={this.submitHandler}>
					<InputComponent placeHolder="Name" styleObj={styleObj} getInputVal={this.getInputVal}/>
					<InputComponent placeHolder="Email" styleObj={styleObj} getInputVal={this.getInputVal}/>
					<InputComponent placeHolder="Message" styleObj={messageObj} getInputVal={this.getInputVal}/>
					<ButtonComponent/>
				</form>
			);
		}
	});
	return FormComponent;
});