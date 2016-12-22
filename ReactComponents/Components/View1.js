'use strict'

import React, { Component } from 'react'
import {
  StyleSheet,
  View,
  Text,
  Button,
  NativeModules
} from 'react-native'

const { TabViewManager } = NativeModules

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'green'
  },
  text: {
    fontSize: 24,
    color: 'black'
  }
})

class View1 extends Component {

  constructor(props) {
    super(props)
    this._renderButton = this._renderButton.bind(this)
    this._onButtonPress = this._onButtonPress.bind(this)
  }

  _onButtonPress() {
    TabViewManager.showAlert(this.props.rootTag, this.constructor.displayName)
  }

  _renderButton() {
    return <Button onPress={this._onButtonPress}
      title='Show Alert'
      color='#841584'
      accessibilityLabel='Click here to show native alert'/>
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text}>
         Yo React Native Here!!
        </Text>
        {this._renderButton()}
      </View>
    )
  }
}

View1.displayName = 'View1'

module.exports = View1