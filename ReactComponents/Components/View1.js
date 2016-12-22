'use strict'

import React, { Component } from 'react'
import {
  StyleSheet,
  View,
  Text
} from 'react-native'

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
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text}>
         Yo React Native Here!!
        </Text>
      </View>
    )
  }
}

module.exports = View1