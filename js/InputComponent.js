define(['react', 'react-dom'], function(React, ReactDOM){
	var InputComponent = React.createClass({
		render : function(){
			var style = this.props.styleObj;
			return (
				<p>
					<input type="text" placeholder={this.props.placeHolder} style={style} onChange={this.props.getInputVal}/>
				</p>
			);
		}
	});
	return InputComponent;
});