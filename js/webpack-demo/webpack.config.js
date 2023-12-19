// webpack 配置文件
const path = require('path'); // node.js 的路径模块
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  mode: 'development', // 'development' | 'production'
  devtool: 'eval-cheap-module-source-map', // development
  // entry: './src/index.js', // 入口文件（简写形式）
  entry: {
    main: './src/index.js',
  },
  module:{
    rules: [
        {
            test: /\.s?css$/i,
            use: [
                "style-loader", 
                
                {
                   loader: "css-loader",
                   options: {
                      importLoaders: 2,
                      modules: true
                   }
                },
                "postcss-loader",
                "sass-loader",
                
            ]
        }
    ],
    
  },
  plugins: [
      new HtmlWebpackPlugin({
        template: "./src/index.html",  // 模板文件
      })
    ],
  output: {
    clean: true, // clean the output directory before emit.
    path: path.resolve(__dirname, 'dist'), // 打包后的路径
    filename: 'bundle.js', // 打包后的文件名
  }
}
