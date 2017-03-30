import React, { Component } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  NativeModules,
} from 'react-native';
const { RNImageMatrix } = NativeModules;

class RNImageMatrix extends Component {
	constructor(props, context) {
		super(props, context);
		// this.passUrl().then(imagesMatrix => {
			// console.log(imagesMatrix)
			// this.props.getImagesMatrix = imagesMatrix;
			// {() => this.props.getImagesMatrix(imagesMatrix)}()
		// });
		this.passPath();
	}

		async passPath() {
			let imagePath   = this.props.imagePath;
			let rows        = this.props.rows;
			let columns     = this.props.columns;
			 try {
				const images = await  RNImageMatrix.getImageUrl(this.props.imagePath, rows, columns);
				this.props.getImagesMatrix(images)
				//return images;
			} catch(e) {
				console.error(e);
			}
		}

		render() {
			return (
				<View style={{flex: 1}}>
					<Text>Image is Downloaded Successfuly, Image Path : </Text>
					<Text>{this.props.imagePath}</Text>
				</View>
			);
		}
		
  }

export default RNImageMatrix;