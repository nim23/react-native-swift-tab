'use strict'

import React, { Component } from 'react'
import {
  StyleSheet,
  View,
  Text,
  Button,
  NativeModules,
  NativeEventEmitter
} from 'react-native'

const { TabViewManager } = NativeModules

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#3498db'
  },
  text: {
    fontSize: 24,
    marginTop: 20,
    color: 'white'
  },
  button: {
    alignItems: 'center',
    justifyContent: 'center',
    flexDirection: 'row',
    backgroundColor: '#ecf0f1',
    marginTop: 20,
    width: 350,
    height: 50
  }
})

class View1 extends Component {

  constructor(props) {
    super(props)
    this._renderButton = this._renderButton.bind(this)
    this._onButtonPress = this._onButtonPress.bind(this)
    this._subscription = null
    this.state = {
      alertResponse: undefined
    }
  }

  componentDidMount() {
    const TabViewManagerEvent = new NativeEventEmitter(TabViewManager)
    this._subscription = TabViewManagerEvent.addListener(
      'TabViewManagerEvent',
      (response) => {
        if (this.props.rootTag === response.reactTag) {
          this.setState({
            alertResponse: response.message
          })
        }
      }
    )
  }

  componentWillUnmount() {
    this._subscription.remove()
  } 
  _onButtonPress() {
    TabViewManager.showAlert(this.props.rootTag, this.constructor.displayName)
  }

  _renderButton() {
    return (
      <View style={styles.button}>
        <Button onPress={this._onButtonPress}
        title='Show Alert'
        color='#000'
        accessibilityLabel='Click here to show native alert'/>
      </View>
    )
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text}>
         Yo React Native View 1 Here!!
        </Text>
        {this._renderButton()}
        {this.state.alertResponse &&
          <Text style={styles.text}>
            Ya selected {this.state.alertResponse}!!
          </Text>
        }
      </View>
    )
  }
}

View1.displayName = 'View1'

module.exports = View1