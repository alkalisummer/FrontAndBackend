import React, { Component } from 'react';
import './App.css';
import Movie from './Movie';

 
class App extends Component { // 모든 컴포넌트는 render function(출력하는 기능) 을 가지고 있다.
 //  Render: 실행순서 :  1. componentWillMount() -> 2. render() -> 3. componentDidMount()
 // 컴포넌트가 존재하기 시작할때 위의 순서대로 작동함 .

 // Update componentWillReceiveProps() -> shouldComponentUpdate()-> componentWillUpdate() -> render() -> componentDidUpdate()
 
state={}

componentDidMount(){
   this._getMovies();
}
  _renderMovies = ()=>{
   const movies = this.state.movies.map( movie =>{
    
      return <Movie 
       title = {movie.title_english}
       poster={movie.medium_cover_image} 
       key={movie.id}
       genres={movie.genres}
       synopsis={movie.synopsis}

       
       />
     })
      return movies
  }
 _getMovies=  async ()=>{
    const movies = await this._callApi()
    this.setState({
      movies
    })
  }
  _callApi = ()=>{
   return fetch('https://yts.am/api/v2/list_movies.json?sort_by=rating')
 .then(response => response.json())
 .then(json => json.data.movies)
 .catch(err =>console.log(err))
  }
  
  render() {
       const{movies} = this.state;
    return (
      <div className={movies ? "App":"App--loading"}>
      {movies ? this._renderMovies(): 'Loading'}
        
      </div>
    );
  }
}
 
export default App;
