using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Com.Reactlibrary.RNImageMatrix
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNImageMatrixModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNImageMatrixModule"/>.
        /// </summary>
        internal RNImageMatrixModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNImageMatrix";
            }
        }
    }
}
