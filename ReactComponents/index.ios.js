'use strict'

import React, { Component } from 'react'
import { 
  AppRegistry,
  Navigator
} from 'react-native'

const View1 = require('./Components/View1')
const View2 = require('./Components/View2')

const RouteStack = {
  routeNameView1: View1,
  routeNameView2: View2
}

class App extends Component {

  constructor(props) {
    super(props)
    this._renderScene = this._renderScene.bind(this)
  }
  
  _renderScene(route, navigator) {
    const Component = route.component
    return <Component {...this.props}/>
  }

  render() {
    const component = RouteStack[this.props.route]
    const props = this.props

    return (<Navigator
      ref='navigator'
      initialRoute={{component, props}}
      renderScene={this._renderScene}
    />)
  }
}

AppRegistry.registerComponent('App', () => App)