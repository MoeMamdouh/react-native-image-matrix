import React, { Component } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  NativeModules,
  Platform,
} from 'react-native';
const { RNImageMatrix } = NativeModules;

class ImageMatrix extends Component {
	constructor(props, context) {
		super(props, context);
		// this.passUrl().then(imagesMatrix => {
			// console.log(imagesMatrix)
			// this.props.getImagesMatrix = imagesMatrix;
			// {() => this.props.getImagesMatrix(imagesMatrix)}()
		// });
		if(Platform.OS === 'ios')
			this.passPathIos();
		else
			this.passPathAndroid();
	}

	passPathAndroid() {
		RNImageMatrix.getImageUrl(this.props.imagePath, 3, 3,
			(images) => {
				console.log('Result ',images);
			});
	}
    async passPathIos() {
        let imagePath   = this.props.imagePath;
        let rows        = this.props.rows;
        let columns     = this.props.columns;
            try {
            const images = await RNImageMatrix.getImageUrl(this.props.imagePath, rows, columns);
            // const images = await RNImageMatrix.getName();
            console.log('images ', images)
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
				<TouchableOpacity onPress={() => this.handleAnd()}>
					<Text>{this.props.imagePath}</Text>
				</TouchableOpacity>
            </View>
        );
    }
  }

export default ImageMatrix;