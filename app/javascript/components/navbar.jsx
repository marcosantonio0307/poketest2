import React, { Component } from 'react'

export default class Navbar extends Component {
  render() {
  	return (
  	  <nav class="navbar navbar-expand-lg navbar-light bg-red">
  	      <img src={this.props.logo} alt="" class="logo" />
		  <a class="navbar-brand" href="/">PokeTest</a>
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item">
		      </li>
		    </ul>
		  </div>
		  <div class="navbar-right">
		  	<a href={this.props.trainer}>{this.props.login}</a>
		  	<a data-method="DELETE" href={this.props.link}>Sair</a>
		  </div>
      </nav>
  	)
  }
}